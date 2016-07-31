package com.rns.healthplease.web.bo.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import com.rns.healthplease.web.bo.api.UserBo;
import com.rns.healthplease.web.bo.domain.Address;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.bo.domain.UserGroup;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.api.LabDao;
import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.AppFileLocations;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.CancelReasons;
import com.rns.healthplease.web.dao.domain.Groups;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.LabLocations;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestLabs;
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
import com.rns.healthplease.web.util.JasperUtil;
import com.rns.healthplease.web.util.MailUtil;
import com.rns.healthplease.web.util.SMSUtil;

public class UserBoImpl implements UserBo, Constants {

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

	public String activateUser(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}
		user.setGroup(new UserGroup(1));
		user.setMiddleName("");
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		Users1 existingLogin = userDao.getUsers1ByEmail(user.getEmail(), session);
		if (existingLogin != null) {
			session.close();
			return ERROR_REGISTRATION;
		}
		Transaction tx = session.beginTransaction();
		Users1 users1 = BusinessConverters.getUsers1(user, new Byte("0"));
		Users users = BusinessConverters.getUsers(user);
		if (users == null) {
			session.close();
			return ERROR_INVALID_USER;
		}
		users.setLoginDetails(users1);
		userDao.addNewuser(users, session);
		user.setActivationCode(users1.getVerificationCode());
		Appointment appointment = new Appointment();
		appointment.setUser(user);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_ACTIVATION));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_ACTIVATION);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String registerUser(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		Users1 existingLogin = userDao.getUsers1ByEmail(user.getEmail(), session);
		if (existingLogin == null) {
			session.close();
			return ERROR_INVALID_USER;
		}
		if (!StringUtils.equals(user.getActivationCode(), existingLogin.getVerificationCode())) {
			session.close();
			return ERROR_INVALID_USER;
		}
		Transaction tx = session.beginTransaction();
		existingLogin.setActive(new Byte("1"));
		Appointment appointment = new Appointment();
		appointment.setUser(user);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_REGISTRATION));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_REGISTRATION);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String loginUser(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}

		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		Users1 users1 = userDao.getUsers1ByEmail(user.getEmail(), session);
		if (users1 == null || !StringUtils.equals(users1.getPassword(), getEncytptedPassword(user, users1))) {
			session.close();
			return ERROR_INVALID_USER_CREDENTIALS;
		}
		if(users1.getActive().intValue() == 0) {
			session.close();
			return ERROR_NOT_ACTIVE;
		}
		Groups groups = users1.getGroup();
		session.close();
		user.setLoginId(users1.getId());
		String validUserResult = populateUserDetails(user);
		if (!RESPONSE_OK.equals(validUserResult)) {
			return validUserResult;
		}
		if (groups.getId() < 3) {
		} else if (groups.getId() == 3) {
			populateLabDetails(user, users1.getLabId());
		}
		return RESPONSE_OK;
	}

	private String getEncytptedPassword(User user, Users1 users1) {
		return CommonUtils.getEncryptedPassword(StringUtils.join(user.getPassword(),users1.getSalt()));
	}

	public void populateLabDetails(User user, int labId) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		Labs labs = appointmentDao.getLabById(labId, session);
		Lab lab = DataConverters.getLab(labs);
		ReportConfig config = new LabDaoImpl().getReportConfig(labs.getId(), session);
		lab.setReportConfig(DataConverters.getReportConfigurations(config));
		user.setLab(lab);
		user.setAppointments(new ArrayList<Appointment>());
		user.setPendingAppointments(new ArrayList<Appointment>());
		user.setCancelledAppointments(new ArrayList<Appointment>());
		user.setTodaysAppointments(new ArrayList<Appointment>());
		if (CollectionUtils.isEmpty(labs.getAppointments())) {
			session.close();
			return;
		}
		for (Appointments appointments : labs.getAppointments()) {
			Appointment appointment = DataConverters.getAppointment(session, appointmentDao, appointments);
			user.getAppointments().add(appointment);
			CommonUtils.setAppointments(user, appointment);
		}
		session.close();
	}

	public String populateUserDetails(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return RESPONSE_OK;
		}
		user.setPendingAppointments(new ArrayList<Appointment>());
		user.setAppointments(new ArrayList<Appointment>());
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		Users users = userDao.getUsersByUsername(user.getEmail(), session);
		if (users == null) {
			session.close();
			return ERROR_INVALID_USER_CREDENTIALS;
		}
		DataConverters.getUser(users, user);
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Appointments> userAppointments = appointmentDao.getUserAppointments(user.getId(), session);
		if (CollectionUtils.isEmpty(userAppointments)) {
			session.close();
			return RESPONSE_OK;
		}
		for (Appointments appointments : userAppointments) {
			Appointment appointment = DataConverters.getAppointment(session, appointmentDao, appointments);
			user.getAppointments().add(appointment);
			if (appointment.getStatus() != null && appointment.getStatus().getId() == 1) {
				user.getPendingAppointments().add(appointment);
			}
			CommonUtils.calculatePrice(appointment.getLab(), appointment, appointmentDao, session);
		}
		session.close();
		return RESPONSE_OK;
	}

	public List<LabTest> getAvailableTests(String testType) {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Tests> tests = appointmentDao.getAllTests(session, testType);
		if (CollectionUtils.isEmpty(tests)) {
			session.close();
			return null;
		}
		List<LabTest> labTests = new ArrayList<LabTest>();
		for (Tests test : tests) {
			LabTest labTest = DataConverters.getTest(test,null,session);
			if (labTest != null) {
				labTests.add(labTest);
			}
		}
		session.close();
		return labTests;
	}

	public List<LabLocation> getAllLocations() {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Locations> locations = appointmentDao.getAllLabLocations(session);
		if (CollectionUtils.isEmpty(locations)) {
			session.close();
			return null;
		}
		List<LabLocation> labLocations = new ArrayList<LabLocation>();
		for (Locations loc : locations) {
			LabLocation location = DataConverters.getLocation(loc);
			if (location != null) {
				labLocations.add(location);
			}
		}
		session.close();
		return labLocations;
	}

	public List<Lab> getAvailableLabs(Appointment appointment) {
		if (appointment == null || appointment.getLocation() == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Lab> labs = new ArrayList<Lab>();
		Locations locations = appointmentDao.getLocationsById(appointment.getLocation().getId(), session);
		if (locations == null || CollectionUtils.isEmpty(locations.getLabses())) {
			session.close();
			return null;
		}
		for (LabLocations labLocation : locations.getLabses()) {
			List<TestLabs> testLabs = getLabsForTests(appointment, session, appointmentDao, labLocation);
			if (CollectionUtils.isEmpty(testLabs)) {
				continue;
			}
			for (TestLabs testLab : testLabs) {
				Lab lab = DataConverters.getLab(testLab.getLab());
				lab.setPrice(Integer.valueOf(testLab.getLabPrice()));
				if (lab != null) {
					CommonUtils.calculatePrice(lab, appointment, appointmentDao, session);
					labs.add(lab);
				}
			}
		}

		session.close();
		return labs;
	}

	private List<TestLabs> getLabsForTests(Appointment appointment, Session session, AppointmentDao appointmentDao, LabLocations labLocation) {
		if (CollectionUtils.isEmpty(appointment.getTests()) || labLocation.getLabs() == null) {
			return null;
		}
		List<TestLabs> testLabs = new ArrayList<TestLabs>();
		for (LabTest test : appointment.getTests()) {
			List<TestLabs> labsForTest = appointmentDao.getLabsForTest(test.getId(), labLocation.getLabs().getId(), session);
			if (CollectionUtils.isNotEmpty(labsForTest)) {
				testLabs.addAll(labsForTest);
			}
		}
		return filterLabs(testLabs, appointment.getTests().size());
		// return testLabs;
	}

	private List<TestLabs> filterLabs(List<TestLabs> testLabs, int noOfTests) {
		List<TestLabs> filteredTestLabs = new ArrayList<TestLabs>();
		Map<Integer, Integer> labTests = new HashMap<Integer, Integer>();
		for (TestLabs testLab : testLabs) {
			Integer count = labTests.get(testLab.getLab().getId());
			if (count == null) {
				count = 0;
			}
			count++;
			if (count == noOfTests) {
				filteredTestLabs.add(testLab);
			} else {
				labTests.put(testLab.getLab().getId(), count);
			}
		}
		return filteredTestLabs;
	}

	public List<Slot> getAvailableSlots(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null || appointment.getDate() == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		Labs labs = appointmentDao.getLabById(appointment.getLab().getId(), session);
		if (labs == null) {
			session.close();
			return null;
		}
		List<Slots> allSlots = appointmentDao.getAllSlots(session, appointment.getLab().getId());
		if (CollectionUtils.isEmpty(allSlots)) {
			session.close();
			return null;
		}
		List<Slot> availableSlots = new ArrayList<Slot>();
		for (Slots slots : allSlots) {
			if (checkIfSlotAvailable(labs, slots, appointment.getDate(), session, appointment)) {
				Slot availSlot = DataConverters.getSlot(slots);
				availableSlots.add(availSlot);
			}
		}
		session.close();
		return availableSlots;
	}

	private boolean checkIfSlotAvailable(Labs labs, Slots slots, Date date, Session session, Appointment appointment) {
		if (slots == null) {
			return false;
		}
		if (CollectionUtils.isEmpty(labs.getBlockedSlots())) {
			return true;
		}
		for (LabBlockedSlots labBlockedSlots : labs.getBlockedSlots()) {
			if (slots.getId() == labBlockedSlots.getSlots().getId() && DateUtils.isSameDay(labBlockedSlots.getDate(), date)) {
				return false;
			}
		}
		if (!appointment.isHomeCollection()) {
			return true;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		List<Appointments> appointments = appointmentDao.getAppointmentsForLabSlot(slots.getId(), labs.getId(), date, session);
		if (CollectionUtils.isEmpty(appointments)) {
			return true;
		}
		for (Appointments app : appointments) {
			if (null != appointmentDao.getAddressByAppointmentId(app.getId(), session)) {
				return false;
			}
		}
		return true;
	}

	public List<Date> getBlockedDates(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		Labs labs = appointmentDao.getLabById(appointment.getLab().getId(), session);
		List<LabActiveDaysStatus> labActiveDaysStatusList = appointmentDao.getLabInactiveDays(labs.getId(), session);
		if (labs == null || CollectionUtils.isEmpty(labActiveDaysStatusList)) {
			session.close();
			return null;
		}
		List<Date> blockedDates = new ArrayList<Date>();
		for (LabActiveDaysStatus labActiveDaysStatus : labActiveDaysStatusList) {
			blockedDates.add(labActiveDaysStatus.getDate());
		}
		session.close();
		return blockedDates;
	}

	public String bookAppointment(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null || appointment.getAddress() == null || CollectionUtils.isEmpty(appointment.getTests())
				|| appointment.getSlot() == null || appointment.getUser() == null || appointment.getLocation() == null) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		appointment.setStatus(new AppointmentStatus(1));
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		Appointments appointments = BusinessConverters.getAppointments(appointment);
		AppoinAddresses appoinAddresses = BusinessConverters.getAppoinAddresses(appointment.getAddress());
		PaymentStatus paymentStatus = BusinessConverters.getPaymentStatus(appointment.getPayment());
		Transaction tx = session.beginTransaction();
		appointmentDao.addNewAppointment(appointments, appoinAddresses, paymentStatus, session);
		appointment.setId(appointments.getId());
		CommonUtils.populateLabUsers(appointment, session);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_USER));
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_LAB));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_USER);
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_LAB);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String bookForOther(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null || appointment.getAddress() == null || CollectionUtils.isEmpty(appointment.getTests())
				|| appointment.getSlot() == null || appointment.getUser() == null || appointment.getLocation() == null) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		appointment.setStatus(new AppointmentStatus(1));
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		// UserDao userDao = new UserDaoImpl();
		Session session = this.sessionFactory.openSession();
		Appointments appointments = BusinessConverters.getAppointments(appointment);
		AppoinAddresses appoinAddresses = BusinessConverters.getAppoinAddresses(appointment.getAddress());
		PaymentStatus paymentStatus = BusinessConverters.getPaymentStatus(appointment.getPayment());
		Transaction tx = session.beginTransaction();
		appointmentDao.addNewAppointment(appointments, appoinAddresses, paymentStatus, session);
		appointment.setId(appointments.getId());
		CommonUtils.populateLabUsers(appointment, session);
		// TODO: prepareUserDetails(appointment);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_USER));
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_LAB));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_USER);
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_LAB);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private void prepareUserDetails(Appointment appointment) {
		User user = appointment.getUser();
		user.setAddress(appointment.getAddress());
		user.setPassword(user.getEmail().charAt(0) + "" + Math.random());
		user.setPasswordRecovery(true);
	}

	public void populateAppointment(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null || CollectionUtils.isEmpty(appointment.getTests()) || appointment.getSlot() == null
				|| appointment.getUser() == null || appointment.getLocation() == null) {
			return;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		appointment.setLab(DataConverters.getLab(appointmentDao.getLabById(appointment.getLab().getId(), session)));
		CommonUtils.calculatePrice(appointment.getLab(), appointment, appointmentDao, session);
		appointment.setSlot(DataConverters.getSlot(appointmentDao.getSlotById(appointment.getSlot().getId(), session)));
		if(appointment.getLocation().getId() != null) {
			appointment.setLocation(DataConverters.getLocation(appointmentDao.getLocationsById(appointment.getLocation().getId(), session)));
		}
		session.close();
	}

	public String updateUser(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}
		Session session = this.sessionFactory.openSession();
		UserDao userDao = new UserDaoImpl();
		Users users = userDao.getUsersByUsername(user.getEmail(), session);
		if (users == null) {
			session.close();
			return ERROR_INVALID_USER;
		}
		Transaction tx = session.beginTransaction();
		users.setFname(user.getFirstName());
		users.setLname(user.getLastName());
		users.setContact(user.getPhone());
		Address address = user.getAddress();
		if (address != null) {
			users.setAddLandmark(address.getLandmark());
			users.setAddArea(address.getArea());
			users.setAddStreet(address.getStreet());
			users.setAddZipcode(address.getZipCode());
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String updateAppointment(Appointment appointment) {
		if (appointment == null || appointment.getId() == null) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if (appointments == null) {
			session.close();
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		Transaction tx = session.beginTransaction();
		appointmentDao.editAppointment(BusinessConverters.getAppointments(appointment), session);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String cancelAppointment(Appointment appointment) {
		if (appointment == null || appointment.getId() == null) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if (appointments == null) {
			session.close();
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		Transaction tx = session.beginTransaction();
		appointments.setStatus(BusinessConverters.getStatus(appointment.getStatus()));
		appointments.setCancelledAuthority("");
		if (appointment.getUser() != null) {
			appointments.setCancelledBy(Short.valueOf(appointment.getUser().getId().toString()));
			appointments.setUpdatedBy(appointment.getUser().getId());
		}
		appointments.setCancelledReasonId(Short.valueOf(appointment.getStatus().getCancelId().toString()));
		appointments.setCancelledLabRemark(CommonUtils.getStringValue(appointment.getStatus().getCancellationReason()));
		appointments.setCancelledDate(new Date());
		appointments.setUpdatedDate(new Date());
		CommonUtils.populateLabUsers(appointment, session);
		Appointment currentAppointment = DataConverters.getAppointment(session, appointmentDao, appointments);
		currentAppointment.setStatus(appointment.getStatus());
		CancelReasons reasons = appointmentDao.getCancelReason(appointment.getStatus().getCancelId(), session);
		if (reasons != null && StringUtils.isNotEmpty(reasons.getFullText())) {
			currentAppointment.getStatus().setCancellationReason(reasons.getFullText());
			currentAppointment.getStatus().setName("Cancelled");
		}
		threadPoolTaskExecutor.execute(new MailUtil(currentAppointment, MAIL_TYPE_CANCEL_APP));
		SMSUtil.sendSMS(currentAppointment, MAIL_TYPE_CANCEL_APP);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public InputStream downloadReport(Appointment appointment) {
		if (appointment == null || appointment.getId() == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if(appointments == null || CollectionUtils.isEmpty(appointments.getTests())) {
			session.close();
			return null;
		}
		//AppFileLocations locations = appointmentDao.getAppFileLocationByAppointmentId(appointment.getId(), session);
		AppFileLocations locations = null;
		InputStream is = null;
		for(AppointmentTests appTest : appointments.getTests()) {
			if(appTest.getTests() != null && appTest.getTests().getId().intValue() == appointment.getTests().get(0).getId().intValue() && appTest.getFileLocation()!=null) {
				locations = appTest.getFileLocation();
			}
		}
		try {
			if (locations == null) {
				Appointment currentAppointment = DataConverters.getAppointment(session, appointmentDao, appointments);
				CommonUtils.filterTests(currentAppointment, appointment);
				JasperUtil.getReport(currentAppointment);
				is = new ByteArrayInputStream(currentAppointment.getReportData());
			} else
				is = new FileInputStream(new File(locations.getFilePath()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (JRException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		session.close();
		return is;

	}

	public List<Lab> getAllLabs() {
		LabDao labDao = new LabDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Labs> labsList = labDao.getAllLabs(session);
		if (CollectionUtils.isEmpty(labsList)) {
			session.close();
			return null;
		}
		List<Lab> labs = new ArrayList<Lab>();
		for (Labs lab : labsList) {
			Lab currLab = new Lab();
			currLab = DataConverters.getLab(lab);
			if (currLab != null) {
				labs.add(currLab);
			}
		}
		session.close();
		return labs;
	}
	

	public String requestCollection(RequestForm form) {
		if (form == null) {
			return null;
		}
		UserDao userDao = new UserDaoImpl();
		Session session = this.sessionFactory.openSession();
		RequestCollections collections = BusinessConverters.getRequestCollections(form);
		Transaction tx = session.beginTransaction();
		addAdmins(form, userDao, session);
		userDao.addRequestCollection(collections, session);
		threadPoolTaskExecutor.execute(new MailUtil(form, form.getUserMail()));
		threadPoolTaskExecutor.execute(new MailUtil(form, form.getAdminMail()));
		SMSUtil.sendSMS(form, form.getUserMail());
		SMSUtil.sendSMS(form, form.getAdminMail());
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private void addAdmins(RequestForm form, UserDao userDao, Session session) {
		List<Users> users = userDao.getAdmins(session);
		if (CollectionUtils.isNotEmpty(users)) {
			for (Users user : users) {
				User currentUser = new User();
				DataConverters.getUser(user, currentUser);
				form.getAdmins().add(currentUser);
			}
		}
	}

	public LabTest getTestWithPackages(LabTest test) {
		if (test == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		Tests tests = appointmentDao.getTestById(test.getId(), session);
		if (tests == null) {
			session.close();
			return null;
		}
		LabTest labTest = DataConverters.getTest(tests,null, session);
		/*List<TestPackages> packages = appointmentDao.getTestPackage(test.getId(), session);
		if (CollectionUtils.isNotEmpty(packages)) {
			DataConverters.addChildTests(labTest, packages);
		}*/
		session.close();
		return labTest;
	}

	public String forgotPassword(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}
		UserDao userDao = new UserDaoImpl();
		Session session = this.sessionFactory.openSession();
		Users1 users1 = userDao.getUsers1ByEmail(user.getEmail(), session);
		if (users1 == null) {
			session.close();
			return ERROR_FORGOT_PWD_NO_USER;
		}
		Transaction tx = session.beginTransaction();
		users1.setPasswordRecover(true);
		String generatedPassword = CommonUtils.generatePasswordForuser(users1);
		user.setPassword(generatedPassword);
		users1.setPassword(getEncytptedPassword(user, users1));
		Appointment appointment = new Appointment();
		appointment.setUser(user);
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_FORGOT_PASSWORD));
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public String changePassword(User user) {
		if (user == null || StringUtils.isEmpty(user.getEmail())) {
			return ERROR_INVALID_USER;
		}
		UserDao userDao = new UserDaoImpl();
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Users1 users1 = userDao.getUsers1ByEmail(user.getEmail(), session);
		if (users1 == null) {
			session.close();
			return ERROR_FORGOT_PWD_NO_USER;
		}
		users1.setPasswordRecover(false);
		users1.setPassword(getEncytptedPassword(user, users1));
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}
	
	@Override
	public String requestCorporatePackage(RequestForm form) {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		form.setAdmins(CommonUtils.prepareContactUsers(ADMIN_MAILS, "mail"));
		form.getAdmins().addAll(CommonUtils.prepareContactUsers(ADMIN_PHONES, "phone"));
		RequestCollections requestCollections = BusinessConverters.getRequestCollections(form);
		requestCollections.setRequestedFor(Short.valueOf("2"));
		session.persist(requestCollections);
		tx.commit();
		session.close();
		threadPoolTaskExecutor.execute(new MailUtil(form, MAIL_TYPE_CORPORATE_REQUEST));
		threadPoolTaskExecutor.execute(new MailUtil(form, MAIL_TYPE_CORPORATE_REQUEST_ADMIN));
		SMSUtil.sendSMS(form, MAIL_TYPE_CORPORATE_REQUEST);
		SMSUtil.sendSMS(form, MAIL_TYPE_CORPORATE_REQUEST_ADMIN);
		return RESPONSE_OK;
	}
	
	@Override
	public List<Lab> getAllCorporateLabs() {
		LabDao labDao = new LabDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Labs> labsList = labDao.getAllLabs(session);
		if (CollectionUtils.isEmpty(labsList)) {
			session.close();
			return null;
		}
		List<Lab> labs = new ArrayList<Lab>();
		for (Labs lab : labsList) {
			Lab currLab = new Lab();
			currLab = DataConverters.getLab(lab);
			if (currLab == null) {
				continue;
			}
			boolean corporateTestFound = false;
			for(TestLabs testLab: lab.getTestLabs()) {
				if(testLab.getTest() != null && "C".equals(testLab.getTest().getTestSingleShow())) {
					corporateTestFound = true;
					break;
				}
			}
			if(corporateTestFound) {
				labs.add(currLab);
			}
		}
		session.close();
		return labs;
	}
	
	@Override
	public List<LabTest> getCorporatePackages() {
		Session session = this.sessionFactory.openSession();
		List<Tests> tests = new AppointmentDaoImpl().getAllTests(session, "C");
		if(CollectionUtils.isEmpty(tests)) {
			session.close();
			return null;
		}
		List<LabTest> labTests = new ArrayList<LabTest>();
		for(Tests test: tests) {
			LabTest labTest = DataConverters.getTest(test,null,session);
			if(labTest != null) {
				Short minPriceLab = new LabDaoImpl().getMinTestLabs(test.getId(), session);
				if(minPriceLab != null) {
					labTest.setPrice(minPriceLab.intValue());
				}
				labTests.add(labTest);
			}
		}
		session.close();
		return labTests;
	}
	
	@Override
	public String editAppointment(Appointment appointment) {
		if(appointment == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if(appointments == null) {
			session.close();
			return null;
		}
		if(CollectionUtils.isNotEmpty(appointments.getTests())) {
			for(AppointmentTests appTest: appointments.getTests()) {
				session.delete(appTest);
			}
		}
		BusinessConverters.getAppointments(appointment, appointments);
		AppoinAddresses appoinAddresses = appointmentDao.getAddressByAppointmentId(appointment.getId(), session);
		PaymentStatus payment = appointmentDao.getPaymentStatusByAppointmentId(appointment.getId(), session);
		CommonUtils.calculatePrice(appointment.getLab(), appointment, appointmentDao, session);
		if(appointment.getLab().getPrice() != null) {
			payment.setPaymentAmount(appointment.getLab().getPrice());
		}
		BusinessConverters.getAppointmentAddresses(appointment.getAddress(), appoinAddresses);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

}
