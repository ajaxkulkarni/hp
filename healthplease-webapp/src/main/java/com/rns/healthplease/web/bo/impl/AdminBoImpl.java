package com.rns.healthplease.web.bo.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import com.rns.healthplease.web.bo.api.AdminBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.Groups;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.dao.domain.TestPackages;
import com.rns.healthplease.web.dao.domain.Tests;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;
import com.rns.healthplease.web.dao.impl.UserDaoImpl;
import com.rns.healthplease.web.util.BusinessConverters;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.DataConverters;

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
			appointmentsForDateRange.add(DataConverters.getAppointment(session, appointmentDao, app));
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
		if (category.getId() == null || category.getId().intValue() == 0) {
			session.persist(category);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	@Override
	public String deleteCategory(TestCategories category) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(category);
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
		tests.setTestSingleShow("Y");
		if (CollectionUtils.isNotEmpty(test.getChildTests())) {
			tests.setIsPackage("Y");
			tests.setTestSingleShow("N");
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
		Labs labs = BusinessConverters.getLab(lab);
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

		tx.commit();
		session.close();
		return RESPONSE_OK;
	}
	
	@Override
	public List<User> getAllUsers() {
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		List<Users> usersList = userDao.getAllUsers(session);
		if(CollectionUtils.isEmpty(usersList)) {
			return null;
		}
		List<User> users = new ArrayList<User>();
		for(Users u: usersList) {
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
		if(location.getId() != null) {
			locations = new AppointmentDaoImpl().getLocationsById(location.getId(), session);
		}
		if(locations == null) {
			locations = BusinessConverters.getLocation(location);
		}
		if(StringUtils.isNotEmpty(location.getName())) {
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
		Locations locations = new AppointmentDaoImpl().getLocationsById(location.getId(), session);
		session.delete(locations);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

}
