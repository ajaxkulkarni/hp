package com.rns.healthplease.web.bo.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import com.rns.healthplease.web.bo.api.AdminBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
import com.rns.healthplease.web.bo.domain.PaymentStatus;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.Groups;
import com.rns.healthplease.web.dao.domain.LabLocations;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.LocationWiseLabCharges;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.TestFactorsMap;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.TestPackages;
import com.rns.healthplease.web.dao.domain.Tests;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;
import com.rns.healthplease.web.dao.impl.LabDaoImpl;
import com.rns.healthplease.web.dao.impl.UserDaoImpl;
import com.rns.healthplease.web.util.BusinessConverters;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.DataConverters;
import com.rns.healthplease.web.util.MailUtil;
import com.rns.healthplease.web.util.SMSUtil;

public class AdminBoImpl implements AdminBo, Constants {

	private SessionFactory sessionFactory;
	private ThreadPoolTaskExecutor threadPoolTaskExecutor;

	public void setThreadPoolTaskExecutor(ThreadPoolTaskExecutor threadPoolTaskExecutor) {
		this.threadPoolTaskExecutor = threadPoolTaskExecutor;
	}

	public ThreadPoolTaskExecutor getThreadPoolTaskExecutor() {
		return threadPoolTaskExecutor;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void getAllAppointments(User user) {
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Appointments> appointmentsList = appointmentDao.getAllAppointments(session);
		if (CollectionUtils.isEmpty(appointmentsList)) {
			session.close();
			return;
		}
		user.setAppointments(new ArrayList<Appointment>());
		user.setPendingAppointments(new ArrayList<Appointment>());
		user.setCancelledAppointments(new ArrayList<Appointment>());
		user.setTodaysAppointments(new ArrayList<Appointment>());
		for (Appointments appointments : appointmentsList) {
			Appointment appointment = DataConverters.getAppointment(session, appointmentDao, appointments);
			if (appointment.getLab() == null || !CommonUtils.checkAppType(appointment, user.getAppType())) {
				continue;
			}
			CommonUtils.calculatePrice(appointment.getLab(), appointment, appointmentDao, session);
			user.getAppointments().add(appointment);
			CommonUtils.setAppointments(user, appointment);
		}
		session.close();
		return;
	}

	@Override
	public List<Appointment> getAppointmentsBetween(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Appointments> appointments = appointmentDao.getAppointmentsForDateRange(date1, date2, session);
		if (CollectionUtils.isEmpty(appointments)) {
			session.close();
			return null;
		}
		List<Appointment> appointmentsForDateRange = new ArrayList<Appointment>();
		for (Appointments app : appointments) {
			Appointment appointment = DataConverters.getAppointment(session, appointmentDao, app);
			if (appointment.getLab() == null) {
				continue;
			}
			CommonUtils.calculatePrice(appointment.getLab(), appointment, appointmentDao, session);
			appointmentsForDateRange.add(appointment);
		}
		session.close();
		return appointmentsForDateRange;
	}

	@Override
	public List<TestCategories> getAllTestCategories() {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<TestCategories> categories = appointmentDao.getAllTestCategories(session);
		session.close();
		return categories;
	}

	@Override
	public String editCategory(TestCategories category) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		TestCategories categories = null;
		if (category.getId() != null) {
			categories = new AppointmentDaoImpl().getTestCategoryById(category.getId(), session);
		}
		if (categories == null) {
			session.persist(category);
		} else {
			if (StringUtils.isNotEmpty(category.getCategoryName())) {
				categories.setCategoryName(category.getCategoryName());
			}
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteCategory(TestCategories category) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		TestCategories categories = new AppointmentDaoImpl().getTestCategoryById(category.getId(), session);
		if (categories != null) {
			session.delete(categories);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String editTest(LabTest test) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Tests tests = null;
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Tests> allTests = appointmentDao.getAllTests(session, null);
		if(test.getId() == null) {
			for(Tests allTest: allTests) {
				if(StringUtils.equalsIgnoreCase(allTest.getTestName(), test.getName())) {
					session.close();
					return ERROR_TEST_EXISTS;
				}
			}
		}
		if (test.getId() != null && test.getId().intValue() > 0) {
			tests = appointmentDao.getTestById(test.getId(), session);
			if (tests == null) {
				session.close();
				return ERROR_INVALID_TEST_DETAILS;
			}
		} else {
			tests = new Tests();
		}
		BusinessConverters.setTestDetails(test, tests);
		tests.setTestCharge(0);
		tests.setMinDays(Short.valueOf("0"));
		tests.setIsPackage("N");
		if (CollectionUtils.isNotEmpty(test.getChildTests())) {
			tests.setIsPackage("Y");
		}
		tests.setCreatedBy(0);
		tests.setCreatedDate(new Date());
		tests.setUpdatedBy(Short.valueOf("0"));
		tests.setUpdatedDate(new Date());
		tests.setIsDeleted(0);
		TestCategories testCategory = appointmentDao.getTestCategoryByName(test.getCategory(), session);
		tests.setTestCategory(testCategory);
		if (tests.getId() == null) {
			session.persist(tests);
		}
		updateTestPackages(test, session, tests);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private void updateTestPackages(LabTest test, Session session, Tests tests) {
		List<TestPackages> packages = new AppointmentDaoImpl().getTestPackage(tests.getId(), session);
		if (CollectionUtils.isEmpty(packages) && CollectionUtils.isEmpty(test.getChildTests())) {
			return;
		}
		List<TestPackages> currentPackages = new ArrayList<TestPackages>();
		for (LabTest childTest : test.getChildTests()) {
			TestPackages pack = new TestPackages();
			pack.setChildTest(BusinessConverters.getTest(childTest));
			pack.setParentTest(tests);
			currentPackages.add(pack);
		}
		if (CollectionUtils.isNotEmpty(packages)) {
			for (TestPackages oldPack : packages) {
				session.delete(oldPack);
			}
		}
		if (CollectionUtils.isNotEmpty(currentPackages)) {
			for (TestPackages newPack : currentPackages) {
				session.persist(newPack);
			}
		}

	}

	@Override
	public String deleteTest(LabTest test) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Tests tests = new AppointmentDaoImpl().getTestById(test.getId(), session);
		session.delete(tests);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public List<Lab> getAllLabs() {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Labs> labs = appointmentDao.getAllLabs(session);
		List<Lab> labList = new ArrayList<Lab>();
		for (Labs dbLab : labs) {
			Lab lab = DataConverters.getLab(dbLab);
			if (lab != null) {
				Appointment appointment = new Appointment();
				appointment.setLab(lab);
				CommonUtils.getLabUsers(session, lab);
				labList.add(lab);
			}
		}
		session.close();
		return labList;
	}

	@Override
	public String editLab(Lab lab) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Labs labs = null;
		if (lab.getId() != null) {
			labs = new AppointmentDaoImpl().getLabById(lab.getId(), session);
		}
		if (labs == null) {
			labs = new Labs();
		}
		BusinessConverters.getLabs(lab, labs);
		labs.setAssociateLocation("");
		labs.setAssociateUsers("");
		labs.setCreatedBy(0);
		labs.setCreatedDate(new Date());
		labs.setDeletedBy(0);
		labs.setDeletedOn(new Date());
		labs.setIsDeleted(0);
		labs.setLabDetails("");
		labs.setPickCharge(Short.valueOf("0"));
		labs.setUpdatedBy(new Date());
		labs.setUpdatedDate(new Date());
		setLabUsers(lab, session);
		if (labs.getId() == null) {
			session.persist(labs);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String updateLabUsers(Lab lab) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		setLabUsers(lab, session);

		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private void setLabUsers(Lab lab, Session session) {
		if(lab==null||lab.getId()==null){
			return;
		}
		List<Users> oldUsers = new UserDaoImpl().getUsersForLab(lab.getId(), session);
		if (CollectionUtils.isNotEmpty(oldUsers)) {
			for (Users users : oldUsers) {
				if (users.getLoginDetails() == null) {
					continue;
				}
				users.getLoginDetails().setLabId(0);
				Groups group = new Groups();
				group.setId(1);
				users.getLoginDetails().setGroup(group);
			}
		}

		if (CollectionUtils.isNotEmpty(lab.getUsers())) {
			for (User user : lab.getUsers()) {
				Users1 users1 = new UserDaoImpl().getUsers1ByEmail(user.getEmail(), session);
				users1.setLabId(lab.getId());
				Groups group = new Groups();
				group.setId(3);
				users1.setGroup(group);
			}
		}
	}

	@Override
	public List<User> getAllUsers() {
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		List<Users> usersList = userDao.getAllUsers(session);
		if (CollectionUtils.isEmpty(usersList)) {
			session.close();
			return null;
		}
		List<User> users = new ArrayList<User>();
		for (Users u : usersList) {
			User user = new User();
			DataConverters.getUser(u, user);
			users.add(user);
		}
		session.close();
		return users;
	}

	@Override
	public String editLocation(LabLocation location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Locations locations = null;
		if (location.getId() != null) {
			locations = new AppointmentDaoImpl().getLocationsById(location.getId(), session);
		}
		if (locations == null) {
			locations = new Locations();
		}
		if (StringUtils.isNotEmpty(location.getName())) {
			locations.setLocationName(location.getName());
		}
		locations.setUpdatedBy(0);
		locations.setUpdatedDate(new Date());
		if (locations.getId() == null || locations.getId().intValue() == 0) {
			locations.setCreatedBy(0);
			locations.setCreatedDate(new Date());
			locations.setIsValid(1);
			session.persist(locations);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteLocation(LabLocation location) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Locations locations = new AppointmentDaoImpl().getLocationsById(location.getId(), session);
		//Locations locations = (Locations) session.get(Locations.class, location.getId());
		Query query = session.createQuery("delete from Locations where id=:loc_id");
		query.setParameter("loc_id", location.getId());
		query.executeUpdate();
		session.flush();
		//session.delete(locations);
		//session.flush();
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public List<TestParameter> getAllTestParemeters() {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<TestFactors> testFactors = appointmentDao.getAllTestFactors(session);
		if (CollectionUtils.isEmpty(testFactors)) {
			return null;
		}
		List<TestParameter> parameters = new ArrayList<TestParameter>();
		for (TestFactors factors : testFactors) {
			parameters.add(DataConverters.getTestParameter(factors));
		}
		session.close();
		return parameters;
	}

	@Override
	public String uploadParameters(List<TestParameter> parameters) {
		if (CollectionUtils.isEmpty(parameters)) {
			return ERROR_INVALID_TEST_DETAILS;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		for (TestParameter parameter : parameters) {
			TestFactors factors = appointmentDao.getTestFactorByname(parameter.getName(), session);
			if (factors == null) {
				factors = new TestFactors();
			}
			BusinessConverters.getTestFactors(parameter, factors);
			if (factors.getId() == null) {
				session.persist(factors);
			}
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String uploadTestLabs(List<TestLabs> testLabs) {
		if (CollectionUtils.isEmpty(testLabs)) {
			return ERROR_INVALID_TEST_DETAILS;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		for (TestLabs testLab : testLabs) {
			if (testLab.getTest().getId() == null || testLab.getLab().getId() == null) {
				continue;
			}
			TestLabs existingTestLabs = new AppointmentDaoImpl().getTestLabsForTestLab(testLab.getTest().getId(), testLab.getLab().getId(), session);
			if (existingTestLabs == null) {
				testLab.setLabAbbr("");
				testLab.setLabDeliveryDays(Short.valueOf("1"));
				session.persist(testLab);
			} else {
				existingTestLabs.setLabPrice(testLab.getLabPrice());
			}
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String uploadTestParameterMaps(String[] mappings) {
		if (mappings == null || mappings.length == 0) {
			return ERROR_INVALID_TEST_DETAILS;
		}
		List<TestFactorsMap> maps = new ArrayList<TestFactorsMap>();
		for (String mapping : mappings) {
			List<String> values = CommonUtils.getStrings(mapping);
			if (CollectionUtils.isEmpty(values) || values.size() < 2) {
				continue;
			}
			TestFactorsMap map = new TestFactorsMap();
			Tests tests = new Tests();
			tests.setId(Integer.valueOf(values.get(0)));
			map.setTest(tests);
			TestFactors testFactors = new TestFactors();
			testFactors.setId(Integer.valueOf(values.get(1)));
			map.setTestFactors(testFactors);
			maps.add(map);
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		appointmentDao.deleteAllTestFactorMaps(session);
		if (CollectionUtils.isNotEmpty(maps)) {
			for (TestFactorsMap map : maps) {
				session.persist(map);
			}
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public Lab getLab(Lab lab) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		Lab currentLab = DataConverters.getLab(labs);
		if (CollectionUtils.isNotEmpty(currentLab.getLocation())) {
			for (LabLocation loc : currentLab.getLocation()) {
				LocationWiseLabCharges locationWiseLabCharges = appointmentDao.getLocationCharges(lab.getId(), loc.getId(), session);
				if (locationWiseLabCharges != null) {
					loc.setCharge(Integer.valueOf(locationWiseLabCharges.getPickUpCharge()));
				}
			}
		}
		currentLab.setTests(DataConverters.getLabTests(session, appointmentDao, labs));
		session.close();
		return currentLab;
	}

	@Override
	public List<LabLocation> getUnmappedLocations(Lab lab) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		List<LabLocation> locations = new ArrayList<LabLocation>();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Locations> allLocations = appointmentDao.getAllLabLocations(session);
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return null;
		}
		for (Locations loc : allLocations) {
			boolean found = false;
			if (CollectionUtils.isEmpty(labs.getLabses())) {
				locations.add(DataConverters.getLocation(loc));
				continue;
			}
			for (LabLocations labLoc : labs.getLabses()) {
				if (labLoc.getLocations() != null && loc.getId().intValue() == labLoc.getLocations().getId().intValue()) {
					found = true;
					break;
				}
			}
			if (!found) {
				locations.add(DataConverters.getLocation(loc));
			}
		}
		session.close();
		return locations;
	}

	@Override
	public String updateLabLocation(LabLocation location, Lab lab) {
		if (location == null || lab == null || lab.getId() == null || location.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		LabLocations labLocations = null;
		LocationWiseLabCharges charges = null;
		if (CollectionUtils.isNotEmpty(labs.getLabses())) {
			for (LabLocations locations : labs.getLabses()) {
				if (locations.getLocations() != null && location.getId() == locations.getLocations().getId()) {
					labLocations = locations;
					break;
				}
			}
		}
		if (labLocations != null) {
			charges = appointmentDao.getLocationCharges(labs.getId(), labLocations.getLocations().getId(), session);
			if (charges == null) {
				charges = new LocationWiseLabCharges();
				charges.setLabId(labs.getId().shortValue());
				charges.setLocationId(location.getId().shortValue());
			}
			charges.setPickUpCharge(location.getCharge() != null ? location.getCharge().shortValue() : 0);
			if (charges.getId() == null) {
				session.persist(charges);
			}
		} else {
			labLocations = new LabLocations();
			labLocations.setLocations(appointmentDao.getLocationsById(location.getId(), session));
			labLocations.setLabs(labs);
			if (location.getCharge() != null) {
				charges = new LocationWiseLabCharges();
				charges.setLabId(labs.getId().shortValue());
				charges.setLocationId(location.getId().shortValue());
				charges.setPickUpCharge(location.getCharge().shortValue());
				session.persist(charges);
			}
			session.persist(labLocations);
		}

		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteLabLocation(LabLocation location, Lab lab) {
		if (location == null || lab == null || lab.getId() == null || location.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null || CollectionUtils.isEmpty(labs.getLabses())) {
			session.close();
			return null;
		}
		LabLocations labLocations = null;
		for (LabLocations locations : labs.getLabses()) {
			if (locations.getLocations() != null && location.getId() == locations.getLocations().getId()) {
				labLocations = locations;
				break;
			}
		}
		if (labLocations != null) {
			session.delete(labLocations);
		}
		LocationWiseLabCharges charges = appointmentDao.getLocationCharges(lab.getId(), location.getId(), session);
		if (charges != null) {
			session.delete(charges);
		}

		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public List<LabTest> getUnmappedTests(Lab lab) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		List<LabTest> tests = new ArrayList<LabTest>();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Tests> allTests = appointmentDao.getAllTests(session, null);
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return null;
		}
		for (Tests test : allTests) {
			boolean found = false;
			if (CollectionUtils.isNotEmpty(labs.getTestLabs())) {
				for (TestLabs testLabs : labs.getTestLabs()) {
					if (testLabs.getTest() != null && testLabs.getTest().getId().intValue() == test.getId().intValue()) {
						found = true;
						break;
					}

				}
			}
			if (!found) {
				tests.add(DataConverters.getTest(test));
			}
		}
		session.close();
		return tests;
	}

	@Override
	public String updateLabTest(LabTest test, Lab lab) {
		if (lab == null || lab.getId() == null || test == null || test.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		TestLabs testLabs = appointmentDao.getTestLabsForTestLab(test.getId(), lab.getId(), session);
		if (testLabs == null) {
			testLabs = new TestLabs();
			testLabs.setLab(BusinessConverters.getLab(lab));
			testLabs.setLabPrice(test.getPrice() != null ? test.getPrice().shortValue() : 0);
			testLabs.setTest(BusinessConverters.getTest(test));
			testLabs.setLabAbbr("");
			testLabs.setLabDeliveryDays(Short.valueOf("1"));
			session.persist(testLabs);
		} else {
			testLabs.setLabPrice(test.getPrice() != null ? test.getPrice().shortValue() : 0);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteLabTest(LabTest test, Lab lab) {
		if (lab == null || lab.getId() == null || test == null || test.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		TestLabs testLabs = appointmentDao.getTestLabsForTestLab(test.getId(), lab.getId(), session);
		if (testLabs != null) {
			session.delete(testLabs);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public TestParameter getTestParameter(TestParameter parameter) {
		if (parameter == null || parameter.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		TestFactors testFactors = appointmentDao.getTestFactorById(parameter.getId(), session);
		session.close();
		TestParameter testParameter = DataConverters.getTestParameter(testFactors);
		if (StringUtils.isNotEmpty(testParameter.getNormalValueMale())) {
			testParameter.setNormalValue(StringUtils.join(testParameter.getNormalValueMale(), ",", CommonUtils.getStringValue(testParameter.getNormalValueFemale()), ",",
					CommonUtils.getStringValue(testParameter.getNormalValueChild())));
		}
		return testParameter;
	}

	@Override
	public InputStream downloadReport(Appointment appointment) {
		if (appointment == null || appointment.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		String filePath = null;
		for (AppointmentTests appTests : appointments.getTests()) {
			if (appTests.getTests().getId().intValue() == appointment.getTests().get(0).getId().intValue() && appTests.getFileLocation() != null) {
				filePath = appTests.getFileLocation().getFilePath();
			}
		}
		session.close();
		if (filePath == null) {
			return null;
		}
		InputStream is = null;
		try {
			is = new FileInputStream(new File(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		return is;
	}

	@Override
	public String editParameter(TestParameter parameter) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		TestFactors factors = null;
		if (parameter.getId() != null && parameter.getId().intValue() > 0) {
			factors = new AppointmentDaoImpl().getTestFactorById(parameter.getId(), session);
		}
		if (factors == null) {
			factors = new TestFactors();
		}
		BusinessConverters.getTestFactors(parameter, factors);
		if (factors.getId() == null) {
			session.persist(factors);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteParameter(TestParameter parameter) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		TestFactors factors = null;
		if (parameter.getId() != null && parameter.getId().intValue() > 0) {
			factors = new AppointmentDaoImpl().getTestFactorById(parameter.getId(), session);
		}
		if (factors == null) {
			session.close();
			return null;
		}
		session.delete(factors);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public List<RequestForm> getAllCorporateRequests() {
		List<RequestForm> corporateRequestForms = new ArrayList<RequestForm>();
		Session session = this.sessionFactory.openSession();
		List<RequestCollections> collections = new UserDaoImpl().getAllRequestCollections(CORP_PACKAGE, session);
		if (CollectionUtils.isEmpty(collections)) {
			session.close();
			return corporateRequestForms;
		}
		for (RequestCollections collection : collections) {
			RequestForm form = DataConverters.getRequestForm(collection);
			corporateRequestForms.add(form);
		}
		session.close();
		return corporateRequestForms;
	}

	@Override
	public List<Lab> getLabsForTest(List<LabTest> tests) {
		if (CollectionUtils.isEmpty(tests)) {
			return null;
		}
		List<Lab> labs = new ArrayList<Lab>();
		List<Integer> testIds = new ArrayList<Integer>();
		for(LabTest test: tests) {
			testIds.add(test.getId());
		}
		if(CollectionUtils.isEmpty(testIds)) {
			return labs;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Labs> allLabs = appointmentDao.getAllLabs(session);
		for(Labs lab: allLabs) {
			List<TestLabs> testLabs = appointmentDao.getLabsForTest(testIds, lab.getId(), session);
			if(CollectionUtils.isEmpty(testLabs) || testLabs.size() < tests.size()) {
				continue;
			}
			Lab currentLab = DataConverters.getLab(testLabs.get(0).getLab());
			currentLab.setPrice(0);
			for(TestLabs testLab: testLabs) {
				currentLab.setPrice(currentLab.getPrice() + testLab.getLabPrice());
			}
			labs.add(currentLab);
		}
		
		session.close();
		return labs;
	}
	
	@Override
	public String bookCorporateAppointment(Appointment appointment) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		appointment.setStatus(new AppointmentStatus(1));
		Appointments appointments = BusinessConverters.getAppointments(appointment);
		Locations locations = new Locations();
		locations.setId(0);
		appointments.setLocations(locations);
		if(appointments.getUser() == null) {
			appointments.setUser(new Users());
			appointments.getUser().setId(0);
		}
		Payment payment = new Payment();
		payment.setAmount(appointment.getLab().getPrice());
		payment.setDate(new Date());
		payment.setStatus(PaymentStatus.SUCCESS);
		payment.setType(PaymentType.cod);
		com.rns.healthplease.web.dao.domain.PaymentStatus paymentStatus = BusinessConverters.getPaymentStatus(payment);
		appointments.setDoctorName("");
		appointments.setGender("");
		session.persist(appointments);
		appointment.setId(appointments.getId());
		paymentStatus.setAppointment(appointments);
		session.persist(paymentStatus);
		//appointment = DataConverters.getAppointment(session, new AppointmentDaoImpl(), appointments);
		CommonUtils.populateLabUsers(appointment, session);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_USER));
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_LAB));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_USER);
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_LAB);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}
	
	@Override
	public List<RequestForm> getAllCorporatePartnerRequests() {
		List<RequestForm> corporateRequestForms = new ArrayList<RequestForm>();
		Session session = this.sessionFactory.openSession();
		List<RequestCollections> collections = new UserDaoImpl().getAllRequestCollections(CORP_PARTNER, session);
		if (CollectionUtils.isEmpty(collections)) {
			session.close();
			return corporateRequestForms;
		}
		for (RequestCollections collection : collections) {
			RequestForm form = DataConverters.getRequestForm(collection);
			if(StringUtils.contains(form.getName(), ":")) {
				String name = CommonUtils.getFormValue(form.getName(), 0);
				form.setAdminName(CommonUtils.getFormValue(form.getName(), 1));
				form.setName(name);
			}
			corporateRequestForms.add(form);
		}
		session.close();
		return corporateRequestForms;
	}
	
	@Override
	public List<User> getLabusers(Lab lab) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		CommonUtils.getLabUsers(session, lab);
		session.close();
		return lab.getUsers();
	}

}
