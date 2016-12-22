package com.rns.healthplease.web.bo.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.multipart.MultipartFile;

import com.rns.healthplease.web.bo.api.LabBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.ReportConfigurations;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.api.LabDao;
import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.AppFileLocations;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentTestResults;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.Groups;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.LabLocations;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.LocationWiseLabCharges;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;
import com.rns.healthplease.web.dao.impl.LabDaoImpl;
import com.rns.healthplease.web.dao.impl.UserDaoImpl;
import com.rns.healthplease.web.util.BusinessConverters;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.DataConverters;
import com.rns.healthplease.web.util.LoggingUtil;
import com.rns.healthplease.web.util.MailUtil;
import com.rns.healthplease.web.util.SMSUtil;

public class LabBoImpl implements LabBo, Constants {

	private static final String ERROR_UPLOADING_REPORT = "Error uploading your report!";
	private ThreadPoolTaskExecutor threadPoolTaskExecutor;

	public void setThreadPoolTaskExecutor(ThreadPoolTaskExecutor threadPoolTaskExecutor) {
		this.threadPoolTaskExecutor = threadPoolTaskExecutor;
	}

	public ThreadPoolTaskExecutor getThreadPoolTaskExecutor() {
		return threadPoolTaskExecutor;
	}

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void blockDates(List<Date> dates, Lab lab) {
		if (CollectionUtils.isEmpty(dates) || lab == null) {
			return;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		LabDao labDao = new LabDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return;
		}
		for (Date date : dates) {
			LabActiveDaysStatus status = labDao.getLabActiveDayStatus(labs.getId(), date, session);
			if (status == null) {
				status = BusinessConverters.getLabActiveDaysStatus(labs, date);
				status.setIsActive(INACTIVE_DAY);
				Transaction transaction = session.beginTransaction();
				labDao.addActiveDays(status, session);
				transaction.commit();
			} else {
				setStatus(status);
				Transaction transaction = session.beginTransaction();
				labDao.updateActiveDays(status, session);
				transaction.commit();
			}

		}
		session.close();
	}

	private void setStatus(LabActiveDaysStatus status) {
		if (status.getIsActive() == ACTIVE_DAY) {
			status.setIsActive(INACTIVE_DAY);
		} else {
			status.setIsActive(ACTIVE_DAY);
		}
	}

	public void blockSlots(List<Slot> slots, Lab lab, Date date, String slotType) {
		if (lab == null || date == null) {
			return;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		LabDao labDao = new LabDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return;
		}
		Transaction tx = session.beginTransaction();
		//Activate the slots if blocked
		if (CollectionUtils.isNotEmpty(labs.getBlockedSlots())) {
			for (LabBlockedSlots slot : labs.getBlockedSlots()) {
				if (DateUtils.isSameDay(date, slot.getDate()) & CollectionUtils.isNotEmpty(slots)) {
					for (Slot activateSlot : slots) {
						if (slot.getSlots().getId().intValue() == activateSlot.getId().intValue() && CommonUtils.isSameSlotType(slot, activateSlot)) {
							activateSlot(session, labDao, slot);
							break;
						}
					}
				}

			}
		}
		//Block the slots if not blocked
		List<Slots> allSlots = appointmentDao.getAllSlots(session, labs.getId());
		for (Slots generalSlot : allSlots) {
			boolean activeFound = false;
			if (CollectionUtils.isNotEmpty(slots)) {
				for (Slot activateSlot : slots) {
					if (generalSlot.getId().intValue() == activateSlot.getId().intValue()) {
						activeFound = true;
						break;
					}
				}
			}
			if(!activeFound) {
				LabBlockedSlots blockedSlots = new LabBlockedSlots();
				blockedSlots.setLab(labs);
				blockedSlots.setDate(date);
				blockedSlots.setSlots(generalSlot);
				blockedSlots.setSlotType(slotType);
				Slot slot = new Slot();
				slot.setType(slotType);
				blockSlot(session, labDao, blockedSlots);
			}
		}
		tx.commit();
		session.close();
	}


	private void activateSlot(Session session, LabDao labDao, LabBlockedSlots labSlot) {
		LabBlockedSlots labBlockedSlots = labDao.getBlockedSlot(labSlot, session);
		if (labBlockedSlots == null) {
			return;
		}
		labDao.removeBlockedSlot(labBlockedSlots, session);
	}

	private void blockSlot(Session session, LabDao labDao, LabBlockedSlots labSlot) {
		LabBlockedSlots labBlockedSlots = labDao.getBlockedSlot(labSlot, session);
		if (labBlockedSlots != null) {
			return;
		}
		labDao.addBlockedSlot(labSlot, session);
	}

	public void activateSlots(List<Slot> slots, Lab lab) {
		if (CollectionUtils.isEmpty(slots) || lab == null) {
			return;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		LabDao labDao = new LabDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return;
		}
		for (Slot slot : slots) {
			LabBlockedSlots blockedSlots = BusinessConverters.getBlockedSlot(slot, labs);
			if (blockedSlots == null) {
				continue;
			}
			blockedSlots = labDao.getBlockedSlot(blockedSlots, session);
			if (blockedSlots == null) {
				session.close();
				return;
			}
			Transaction transaction = session.beginTransaction();
			labDao.removeBlockedSlot(blockedSlots, session);
			transaction.commit();
		}
		session.close();
	}

	public String bookForHomeCollection(Appointment appointment) {
		if (appointment == null || appointment.getLab() == null || appointment.getAddress() == null || CollectionUtils.isEmpty(appointment.getTests())
				|| appointment.getSlot() == null || appointment.getUser() == null || appointment.getLocation() == null) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		appointment.setStatus(new AppointmentStatus(1));
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		UserDao userDao = new UserDaoImpl();
		Session session = this.sessionFactory.openSession();
		Appointments appointments = BusinessConverters.getAppointments(appointment);
		AppoinAddresses appoinAddresses = null;
		if (appointment.getAddress() != null && StringUtils.isNotEmpty(appointment.getAddress().getStreet())) {
			appoinAddresses = BusinessConverters.getAppoinAddresses(appointment.getAddress());
		}
		PaymentStatus paymentStatus = BusinessConverters.getPaymentStatus(appointment.getPayment());
		Users users = userDao.getUsersByUsername(appointment.getUser().getEmail(), session);
		Transaction tx = session.beginTransaction();
		if (users == null) {
			prepareUserDetails(appointments, appoinAddresses);
			userDao.addNewuser(appointments.getUser(), session);
		} else {
			appointments.setUser(users);
		}
		appointmentDao.addNewAppointment(appointments, appoinAddresses, paymentStatus, session);
		// Appointment currentAppointment =
		// DataConverters.getAppointment(session, appointmentDao, appointments);
		CommonUtils.populateLabUsers(appointment, session);
		appointment.setId(appointments.getId());
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_USER));
		threadPoolTaskExecutor.execute(new MailUtil(appointment, MAIL_TYPE_BOOK_APP_LAB));
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_USER);
		SMSUtil.sendSMS(appointment, MAIL_TYPE_BOOK_APP_LAB);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private void prepareUserDetails(Appointments appointments, AppoinAddresses appoinAddresses) {
		if (appointments.getUser() == null) {
			return;
		}
		Users users = appointments.getUser();
		Groups groups = new Groups();
		groups.setId(1);
		Users1 loginDetails = users.getLoginDetails();
		loginDetails.setGroup(groups);
		loginDetails.setJoined(new Date());
		loginDetails.setPassword(CommonUtils.generatePasswordForuser(loginDetails));
		loginDetails.setPasswordRecover(true);
		loginDetails.setActive(new Byte("0"));
		users.setCreatedBy(appointments.getLab().getId());
		users.setCreatedDate(new Date().toString());
		users.setUpdatedBy(appointments.getLab().getId());
		users.setUpdatedDate(new Date().toString());
		users.setDob("");
		users.setMname("");
		users.setLname("");
		if (appoinAddresses == null) {
			users.setAddress("");
			return;
		}
		users.setAddArea(appoinAddresses.getAddArea());
		users.setAddCity(appoinAddresses.getAddCity());
		users.setAddLandmark(appoinAddresses.getAddLandmark());
		users.setAddress(appoinAddresses.getAddStreet());
		users.setAddStreet(appoinAddresses.getAddStreet());
		users.setAddZipcode(appoinAddresses.getAddZipcode());

	}

	public String uploadReport(Appointment appointment) {
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if (appointments == null) {
			session.close();
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		byte[] bytes = null;
		MultipartFile uploadedReport = null;
		LabTest test = getUploadedReportTest(appointment);
		if (test != null) {
			uploadedReport = test.getReport();
		}
		try {
			// bytes = report.getBytes();
			if (uploadedReport != null) {
				bytes = uploadedReport.getBytes();
			} else if (appointment.getReportData() != null) {
				// bytes =
				// FileUtils.readFileToByteArray(appointment.getPrepareReport());
				bytes = appointment.getReportData();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (bytes == null || bytes.length == 0) {
			session.close();
			return ERROR_UPLOADING_REPORT;
		}
		String filePath = CommonUtils.convertDate(appointments.getDate()) + "/" + appointments.getId() + "/";
		String actualFilePath = ROOT_DOCS_PATH + filePath;
		File dir = new File(actualFilePath);
		dir.mkdirs();
		String documentPath = actualFilePath + BusinessConverters.getReportName(appointment);
		File document = new File(documentPath);
		// AppFileLocations appFileLocations =
		// BusinessConverters.getAppFileLocation(appointment, documentPath);
		Transaction transaction = session.beginTransaction();
		if(appointments.getStatus() != null && appointment.getStatus() != null) {
			appointments.setStatus(appointmentDao.getAppointmentStatusById(appointment.getStatus().getId(), session));
		} else {
			appointments.setStatus(BusinessConverters.getStatus(appointment.getStatus()));
		}
		appointments.setCancelledAuthority("");
		if (appointment.getUser() != null && appointment.getUser().getId() != null) {
			appointments.setCancelledBy(appointment.getUser().getId().shortValue());
			appointments.setUpdatedBy(appointment.getUser().getId());
		}
		appointments.setCancelledDate(new Date());
		appointments.setUpdatedDate(new Date());
		/*
		 * if(uploadedReport != null) {
		 * appointmentDao.addReport(appFileLocations, session); }
		 */
		addAppointmentResults(session, appointment);
		updateMailStatus(appointment, appointments, documentPath, session);
		updateStatus(appointments, session);
		BufferedOutputStream stream = null;
		try {
			stream = new BufferedOutputStream(new FileOutputStream(document));
			stream.write(bytes);
			stream.close();
			Appointment appointmentDetails = DataConverters.getAppointment(session, appointmentDao, appointments);
			appointmentDetails.setReport(uploadedReport);
			appointmentDetails.setPrepareReport(document);
			CommonUtils.filterTests(appointmentDetails, appointment);
			threadPoolTaskExecutor.execute(new MailUtil(appointmentDetails, MAIL_TYPE_REPORT_UPLOAD));
			SMSUtil.sendSMS(appointmentDetails, MAIL_TYPE_REPORT_UPLOAD);
			transaction.commit();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(e));
		} catch (IOException e) {
			e.printStackTrace();
			LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(e));
		}
		session.close();
		return RESPONSE_OK;
	}


	private LabTest getUploadedReportTest(Appointment appointment) {
		if (CollectionUtils.isEmpty(appointment.getTests())) {
			return null;
		}
		for (LabTest test : appointment.getTests()) {
			if (test.getReport() != null) {
				return test;
			}
		}
		return null;
	}

	private void updateStatus(Appointments appointments, Session session) {
		if (CollectionUtils.isEmpty(appointments.getTests())) {
			return;
		}
		int completedTestsCount = 0;
		for (AppointmentTests test : appointments.getTests()) {
			if (StringUtils.equals("Y", test.getReportSent())) {
				completedTestsCount++;
			}
		}
		for (AppointmentTests test : appointments.getTests()) {
			if (test.getFileLocation() != null && test.getFileLocation().getId() != null) {
				completedTestsCount++;
			}
		}
		if (completedTestsCount >= appointments.getTests().size()) {
			if(appointments.getStatus() != null ) {
				appointments.setStatus(new AppointmentDaoImpl().getAppointmentStatusById(3, session));
			} else {
				com.rns.healthplease.web.dao.domain.AppointmentStatus status = new com.rns.healthplease.web.dao.domain.AppointmentStatus();
				status.setId(3);
				appointments.setStatus(status);
			}
		}
	}

	private void updateMailStatus(Appointment appointment, Appointments appointments, String documentPath, Session session) {
		if (CollectionUtils.isEmpty(appointment.getTests()) || CollectionUtils.isEmpty(appointments.getTests())) {
			return;
		}
		for (LabTest labTest : appointment.getTests()) {
			for (AppointmentTests test : appointments.getTests()) {
				if (labTest.getId() != null && labTest.getId().intValue() == test.getTests().getId().intValue()) {
					if (labTest.getReport() != null) {
						prepareFileLocation(test, documentPath, appointment, session);
					} else {
						test.setReportSent("Y");
						//test.setReportDate(new Date());
					}
					break;
				}
			}
		}

	}

	private void prepareFileLocation(AppointmentTests test, String documentPath, Appointment appointment, Session session) {
		AppFileLocations locations = test.getFileLocation();
		if (locations == null) {
			locations = BusinessConverters.getAppFileLocation(appointment, documentPath);
			session.persist(locations);
			test.setFileLocation(locations);
		} else {
			locations.setFilePath(documentPath);
		}
	}

	private void addAppointmentResults(Session session, Appointment appointment) {
		if (appointment == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return;
		}
		for (LabTest test : appointment.getTests()) {
			AppointmentTests tests = new AppointmentDaoImpl().getAppointmentTest(test.getId(), appointment.getId(), session);
			tests.setRemark(test.getRemark());
			List<AppointmentTestResults> results = BusinessConverters.getAppointmentResults(test.getParameters(), appointment.getId(), test.getId(), session);
			if (CollectionUtils.isEmpty(results)) {
				continue;
			}
			for (AppointmentTestResults result : results) {
				if (result.getId() == null || result.getId().intValue() == 0) {
					session.persist(result);
				}
			}
		}
	}

	public List<LabLocation> getAvailableLabLocations(Lab lab) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null || CollectionUtils.isEmpty(labs.getLabses())) {
			session.close();
			return null;
		}
		List<LabLocation> locations = new ArrayList<LabLocation>();
		for (LabLocations labLocation : labs.getLabses()) {
			locations.add(DataConverters.getLocation(labLocation.getLocations()));
		}
		session.close();
		return locations;
	}

	public List<LabTest> getAvailableLabTests(Lab lab) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null || CollectionUtils.isEmpty(labs.getTestLabs())) {
			session.close();
			return null;
		}
		List<LabTest> labTests = DataConverters.getLabTests(session, appointmentDao, labs);
		session.close();
		return labTests;
	}

	public List<Slot> getAllLabSlotsForDay(Lab lab, Date date, String slotType) {
		if (lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Labs labs = appointmentDao.getLabById(lab.getId(), session);
		if (labs == null) {
			session.close();
			return null;
		}
		List<Slots> allSlots = appointmentDao.getAllSlots(session, labs.getId());
		if (CollectionUtils.isEmpty(allSlots)) {
			session.close();
			return null;
		}
		List<Slot> labSlots = new ArrayList<Slot>();
		for (Slots slots : allSlots) {
			Slot availSlot = DataConverters.getSlot(slots);
			availSlot.setType(slotType);
			checkIfSlotAvailable(labs, availSlot, date, appointmentDao, session);
			availSlot.setBlockedDate(date);
			labSlots.add(availSlot);
		}
		session.close();
		return labSlots;
	}

	private void checkIfSlotAvailable(Labs labs, Slot availSlot, Date date, AppointmentDao appointmentDao, Session session) {
		if (availSlot == null) {
			return;
		}
		if (CollectionUtils.isNotEmpty(labs.getBlockedSlots())) {
			for (LabBlockedSlots labBlockedSlots : labs.getBlockedSlots()) {
				if (availSlot.getId().intValue() == labBlockedSlots.getSlots().getId().intValue() && DateUtils.isSameDay(labBlockedSlots.getDate(), date) && CommonUtils.isSameSlotType(labBlockedSlots, availSlot)) {
					availSlot.setBlocked(true);
					break;
				}
			}
		}
		List<Appointments> appointments = appointmentDao.getAppointmentsForLabSlot(availSlot.getId(), labs.getId(), date, session);
		if (CollectionUtils.isEmpty(appointments)) {
			availSlot.setIsBooked("No");
		} else {
			availSlot.setIsBooked("Yes");
		}
	}

	public List<Appointment> getAppointmentsBetween(Lab lab, Date date1, Date date2) {
		if (lab == null || date1 == null || date2 == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Appointments> appointments = appointmentDao.getAppointmentsForDateRange(lab.getId(), date1, date2, session);
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

	public String getLocationCharges(Lab lab, LabLocation location, List<LabTest> tests) {
		if (lab == null || location == null || location.getId() == null) {
			return null;
		}
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		LocationWiseLabCharges locationWiseLabCharges = appointmentDao.getLocationCharges(lab.getId(), location.getId(), session);
		session.close();
		if (locationWiseLabCharges == null) {
			return null;
		}
		Integer multiplier = 1;
		if (CollectionUtils.isNotEmpty(tests)) {
			for (LabTest test : tests) {
				if (ArrayUtils.contains(DOUBLE_TEST_CHARGE, test.getId().intValue())) {
					multiplier = 2;
				}
			}
		}
		return String.valueOf(multiplier * locationWiseLabCharges.getPickUpCharge());
	}

	public String updateTestResults(Appointment appointment) {
		if (appointment == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return ERROR_INVALID_APPOINTMENT_DETAILS;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		addAppointmentResults(session, appointment);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	public Appointment getAppointment(Appointment appointment) {
		if (appointment == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Appointments appointments = appointmentDao.getAppointmentById(appointment.getId(), session);
		if (appointments == null) {
			session.close();
			return null;
		}
		Appointment currentAppointment = DataConverters.getAppointment(session, appointmentDao, appointments);
		CommonUtils.calculatePrice(currentAppointment.getLab(), currentAppointment, appointmentDao, session);
		session.close();
		return currentAppointment;
	}
	
	public String confirmAppointment(Appointment appointment) {
		if (appointment == null) {
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
		com.rns.healthplease.web.dao.domain.AppointmentStatus status = new com.rns.healthplease.web.dao.domain.AppointmentStatus();
		status.setId(1);
		appointments.setStatus(status);
		Appointment currentAppointment = DataConverters.getAppointment(session, appointmentDao, appointments);
		CommonUtils.calculatePrice(currentAppointment.getLab(), currentAppointment, appointmentDao, session);
		MailUtil mailer = new MailUtil(currentAppointment, MAIL_TYPE_CONFIRM_APP_USER);
		threadPoolTaskExecutor.execute(mailer);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}
	
	@Override
	public ReportConfigurations getReportConfigurations(Lab lab) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		ReportConfig config = new LabDaoImpl().getReportConfig(lab.getId(), session);
		ReportConfigurations configurations = DataConverters.getReportConfigurations(config);
		session.close();
		return configurations;
	}
	
	@Override
	public String updateReportConfigurations(Lab lab) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		ReportConfig config = new LabDaoImpl().getReportConfig(lab.getId(), session);
		if(config == null) {
			config = new ReportConfig();
		}
		BusinessConverters.getReportConfig(lab.getReportConfig(), lab, config);
		config.setSignatureFileLocation(storeSignature(lab, lab.getReportConfig().getSignatureFile()));
		config.setInvoiceSignatureFileLocation(storeSignature(lab, lab.getReportConfig().getInvoiceSignatureFile()));
		config.setLogoHeader(storeSignature(lab, lab.getReportConfig().getHeaderFile()));
		config.setLogoFooter(storeSignature(lab, lab.getReportConfig().getFooterFile()));
		if(config.getId() == null) {
			session.persist(config);
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

	private String storeSignature(Lab lab, MultipartFile signatureFile) {
		if(signatureFile != null && !signatureFile.isEmpty()) {
			try {
				String directory = ROOT_DOCS_PATH + "lab-data/" + lab.getId() + "/signature/";
				String path = directory + signatureFile.getOriginalFilename();
				File dir = new File(directory);
				dir.mkdirs();
				File document = new File(path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(document));
				stream.write(signatureFile.getBytes());
				stream.close();
				//config.setSignatureFileLocation(path);
				return path;
			} catch (IOException e) {
				e.printStackTrace();
				LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(e));
			}
		}
		return null;
	}
	
	@Override
	public InputStream downloadSignatureFile(Lab lab) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		ReportConfig config = new LabDaoImpl().getReportConfig(lab.getId(), session);
		session.close();
		if(config == null || StringUtils.isEmpty(config.getSignatureFileLocation())) {
			return null;
		}
		try {
			InputStream is = new FileInputStream(new File(config.getSignatureFileLocation()));
			return is;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(e));
		}
		return null;
	}
	
	@Override
	public String uploadLogo(Lab lab, MultipartFile file) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Labs labs = new AppointmentDaoImpl().getLabById(lab.getId(), session);
		if(labs == null) {
			session.close();
			return null;
		}
		if(file != null && !file.isEmpty()) {
			try {
				String directory = ROOT_DOCS_PATH + "lab-data/" + lab.getId() + "/logo/";
				String path = directory + file.getOriginalFilename();
				File dir = new File(directory);
				dir.mkdirs();
				File document = new File(path);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(document));
				stream.write(file.getBytes());
				stream.close();
				labs.setLabLogo(path);

			} catch (IOException e) {
				e.printStackTrace();
				LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(e));
			}
			
		}
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}
	
	@Override
	public List<User> getAllUsers(Lab lab) {
		if(lab == null || lab.getId() == null) {
			return null;
		}
		Session session = this.sessionFactory.openSession();
		LabDao labDao = new LabDaoImpl();
		List<Appointments> appointments = labDao.getAllAppointmentsByUsers(lab.getId(), session);
		if (CollectionUtils.isEmpty(appointments)) {
			session.close();
			return null;
		}
		Set<User> users = new HashSet<User>();
		for (Appointments app : appointments) {
			User user = new User();
			if(app.getUser() == null) {
				continue;
			}
			DataConverters.getUser(app.getUser(), user);
			users.add(user);
			if(!StringUtils.equals(app.getEmail(), user.getEmail())) {
				User otherUser = new User();
				otherUser.setEmail(app.getEmail());
				otherUser.setFirstName(app.getName());
				otherUser.setPhone(app.getMobileNo());
				otherUser.setAddress(DataConverters.getAppointmentAddress(new AppointmentDaoImpl().getAddressByAppointmentId(app.getId(), session)));
				otherUser.setGender(app.getGender());
				users.add(otherUser);
			}
		}
		session.close();
		if(CollectionUtils.isEmpty(users)) {
			return null;
		}
		return new ArrayList<User>(users);
	}

	@Override
	public String completeAppointment(Appointment appointment) {
		if (appointment == null) {
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
		com.rns.healthplease.web.dao.domain.AppointmentStatus status = new com.rns.healthplease.web.dao.domain.AppointmentStatus();
		status.setId(3);
		appointments.setStatus(status);
		//Appointment currentAppointment = DataConverters.getAppointment(session, appointmentDao, appointments);
		//CommonUtils.calculatePrice(currentAppointment.getLab(), currentAppointment, appointmentDao, session);
		//MailUtil mailer = new MailUtil(currentAppointment, MAIL_TYPE_CONFIRM_APP_USER);
		//threadPoolTaskExecutor.execute(mailer);
		tx.commit();
		session.close();
		return RESPONSE_OK;
	}

}
