package com.rns.healthplease.web.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;

import com.rns.healthplease.web.bo.domain.Address;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
import com.rns.healthplease.web.bo.domain.ReportConfigurations;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.bo.domain.UserGroup;
import com.rns.healthplease.web.dao.domain.AppFileLocations;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentStatus;
import com.rns.healthplease.web.dao.domain.AppointmentTestResults;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.Groups;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.Tests;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;

public class BusinessConverters {

	public static Users1 getUsers1(User user, Byte active) {
		if (user == null) {
			return null;
		}
		Users1 users1 = new Users1();
		users1.setName(user.getFirstName());
		users1.setUsername(user.getEmail());
		users1.setPassword(CommonUtils.getEncryptedPassword(user.getPassword()));
		users1.setJoined(new Date());
		users1.setGroup(getGroup(user.getGroup()));
		if (user.getLab() != null) {
			users1.setLabId(user.getLab().getId());
		}
		users1.setActive(active);
		users1.setVerificationCode(String.valueOf(System.currentTimeMillis()));
		return users1;
	}

	public static Groups getGroup(UserGroup group) {
		if (group == null) {
			return null;
		}
		Groups groups = new Groups();
		groups.setId(group.getId());
		return groups;
	}

	public static Users getUsers(User user) {
		if (user == null) {
			return null;
		}
		Users users = new Users();
		if (user.getId() != null) {
			users.setId(user.getId());
		}
		users.setFname(user.getFirstName());
		extractAddress(user, users);
		users.setContact(user.getPhone());
		users.setLname(user.getLastName());
		users.setMname(user.getMiddleName());
		if (StringUtils.isNotEmpty(user.getGender())) {
			users.setGender(user.getGender().charAt(0));
		}
		if (user.getDob() != null) {
			users.setDob(user.getDob().toString());
		}
		Users1 users1 = prepareLoginDetails(user);
		users.setLoginDetails(users1);
		return users;
	}

	private static Users1 prepareLoginDetails(User user) {
		Users1 users1 = new Users1();
		if (user.getLoginId() != null) {
			users1.setId(user.getLoginId());
		}
		users1.setUsername(user.getEmail());
		users1.setPassword(user.getPassword());
		users1.setGroup(getGroup(user.getGroup()));
		users1.setName(user.getFirstName());
		users1.setJoined(new Date());
		if (user.getLab() != null) {
			users1.setLabId(user.getLab().getId());
		}
		users1.setPasswordRecover(false);
		return users1;
	}

	private static void extractAddress(User user, Users users) {
		Address address = user.getAddress();
		if (address == null) {
			return;
		}
		users.setAddArea(address.getArea());
		users.setAddCity(address.getCity());
		users.setAddLandmark(address.getLandmark());
		users.setAddress(address.getStreet());
		users.setAddStreet(address.getStreet());
		users.setAddZipcode(address.getZipCode());
	}

	public static Labs getLab(Lab lab) {
		if (lab == null) {
			return null;
		}
		Labs labs = new Labs();
		getLabs(lab, labs);
		return labs;
	}

	public static void getLabs(Lab lab, Labs labs) {
		labs.setId(lab.getId());
		if (StringUtils.isNotEmpty(lab.getName())) {
			labs.setLabName(lab.getName());
		}
		if (StringUtils.isNotEmpty(lab.getAddress())) {
			labs.setAddress(lab.getAddress());
		}
		labs.setMobileNo(CommonUtils.getStringValue(lab.getContact()));
		labs.setLabEmail(CommonUtils.getStringValue(lab.getEmail()));
		if (lab.getAppointmentsPerSlot() != null) {
			labs.setBookAppPerSlot(Byte.valueOf(lab.getAppointmentsPerSlot().toString()));
		}
		if (lab.getArea() != null && lab.getArea().getId() != null) {
			labs.setLocation(getLocation(lab.getArea()));
		}
		labs.setLabDiscount(lab.getDiscount());
	}

	public static Locations getLocation(LabLocation location) {
		if (location == null || location.getId() == null) {
			return null;
		}
		Locations locations = new Locations();
		locations.setId(location.getId());
		if (StringUtils.isNotEmpty(location.getName())) {
			locations.setLocationName(location.getName());
		}
		return locations;
	}

	public static Slots getSlots(Slot slot) {
		if (slot == null) {
			return null;
		}
		Slots slots = new Slots();
		slots.setId(slot.getId());
		return slots;
	}

	public static AppointmentStatus getStatus(com.rns.healthplease.web.bo.domain.AppointmentStatus status) {
		if (status == null) {
			return null;
		}
		AppointmentStatus appointmentStatus = new AppointmentStatus();
		appointmentStatus.setId(status.getId());
		return appointmentStatus;
	}

	public static AppoinAddresses getAppoinAddresses(Address address) {
		if (address == null) {
			return null;
		}
		AppoinAddresses appoinAddresses = new AppoinAddresses();
		getAppointmentAddresses(address, appoinAddresses);
		return appoinAddresses;
	}

	public static void getAppointmentAddresses(Address address, AppoinAddresses appoinAddresses) {
		if (StringUtils.isNotEmpty(address.getArea())) {
			appoinAddresses.setAddArea(address.getArea());
		}
		if (StringUtils.isNotEmpty(address.getLandmark())) {
			appoinAddresses.setAddLandmark(address.getLandmark());
		}
		if (StringUtils.isNotEmpty(address.getStreet())) {
			appoinAddresses.setAddStreet(address.getStreet());
		}
		if (StringUtils.isNotEmpty(address.getZipCode())) {
			appoinAddresses.setAddZipcode(address.getZipCode());
		}
	}

	public static PaymentStatus getPaymentStatus(Payment payment) {
		if (payment == null) {
			return null;
		}
		PaymentStatus status = new PaymentStatus();
		status.setPaymentAmount(payment.getAmount());
		if (payment.getType() != null) {
			status.setPaymentType(payment.getType().name());
		}
		if (payment.getStatus() != null) {
			status.setStatus(payment.getStatus().name());
		}
		status.setCreatedDate(new Date());
		// TODO: PayU or Self
		status.setPaymentBy("self");
		status.setPaymentId("");
		status.setRemark("");
		status.setDiscount(payment.getDiscount());
		return status;
	}

	public static Appointments getAppointments(Appointment appointment) {
		Appointments appointments = new Appointments();
		if (appointment.getId() != null) {
			appointments.setId(appointment.getId());
		}
		getAppointments(appointment, appointments);

		return appointments;
	}

	public static void getAppointments(Appointment appointment, Appointments appointments) {
		appointments.setLab(BusinessConverters.getLab(appointment.getLab()));
		appointments.setDate(appointment.getDate());
		appointments.setDoctorName(appointment.getDoctorName());
		appointments.setEmail(appointment.getUser().getEmail());
		Locations location = BusinessConverters.getLocation(appointment.getLocation());
		if (location != null) {
			appointments.setLocations(location);
		} /*else {
			Locations locations = new Locations();
			locations.setId(0);
			appointments.setLocations(locations);
		}*/
		appointments.setMobileNo(appointment.getUser().getPhone());
		appointments.setName(appointment.getUser().getFirstName());
		appointments.setAge(appointment.getUser().getAge());
		appointments.setGender(appointment.getUser().getGender());
		appointments.setSlots(BusinessConverters.getSlots(appointment.getSlot()));
		AppointmentStatus status = BusinessConverters.getStatus(appointment.getStatus());
		if (status != null) {
			appointments.setStatus(status);
		}
		if (appointment.getUser().getId() != null) {
			appointments.setUser(BusinessConverters.getUsers(appointment.getUser()));
		}
		Set<AppointmentTests> appointmentTests = prepareTests(appointment, appointments);
		if (CollectionUtils.isNotEmpty(appointmentTests)) {
			appointments.setTests(appointmentTests);
		}
		appointments.setBookedBy("HP");
		if (appointment.getPrintRequired() != null) {
			appointments.setIsRequirePrint(appointment.getPrintRequired());
		}
		appointments.setType(appointment.getType());
		// TODO: Why are these fields not nullable??
		appointments.setCancelledAuthority("");
		appointments.setCancelledDate(new Date());
		appointments.setCancelledLabRemark("");
		appointments.setCreatedDate(new Date());
		appointments.setCreatedBy(1);
		appointments.setSummary("");
		appointments.setUpdatedDate(new Date());
		appointments.setUpdatedBy(1);
	}

	private static Set<AppointmentTests> prepareTests(Appointment appointment, Appointments appointments) {
		Set<AppointmentTests> appointmentTests = new HashSet<AppointmentTests>();
		for (LabTest test : appointment.getTests()) {
			AppointmentTests appointmentTest = getAppointmentTest(test, appointments);
			if (appointmentTests != null) {
				appointmentTests.add(appointmentTest);
			}
		}
		return appointmentTests;
	}


	private static AppointmentTests getAppointmentTest(LabTest test, Appointments appointments) {
		if (test == null || appointments == null) {
			return null;
		}
		AppointmentTests appointmentTests = new AppointmentTests();
		appointmentTests.setAppointments(appointments);
		appointmentTests.setTests(getTest(test));
		return appointmentTests;
	}

	public static Tests getTest(LabTest test) {
		Tests tests = new Tests();
		tests.setId(test.getId());
		setTestDetails(test, tests);
		return tests;
	}

	public static void setTestDetails(LabTest test, Tests tests) {
		tests.setIsFastRequired("N");
		tests.setTestAbvr("");
		tests.setShortDesc("");
		tests.setLongDesc("");
		if (StringUtils.isNotEmpty(test.getName())) {
			tests.setTestName(test.getName());
		}
		if (StringUtils.isNotEmpty(test.getAbbrevation())) {
			tests.setTestAbvr(test.getAbbrevation());
		}
		if (StringUtils.isNotEmpty(test.getDescription())) {
			tests.setShortDesc(test.getDescription());
		}
		if (StringUtils.isNotEmpty(test.getLongDescription())) {
			tests.setLongDesc(test.getLongDescription());
		}
		if (StringUtils.isNotEmpty(test.getFastingInfo())) {
			tests.setIsFastRequired(test.getFastingInfo());
		}
		if (test.getDeliveryDays() != null) {
			tests.setDeliveryDays(Short.valueOf(test.getDeliveryDays().toString()));
		}
		if (StringUtils.isNotEmpty(test.getFastingInfo())) {
			tests.setIsFastRequired(test.getFastingInfo());
		}
		if (StringUtils.isNotEmpty(test.getTestDisplayType())) {
			tests.setTestSingleShow(test.getTestDisplayType());
		}
		tests.setRemark(test.getComment());
	}

	public static LabActiveDaysStatus getLabActiveDaysStatus(Labs labs, Date date) {
		if (date == null || labs == null) {
			return null;
		}
		LabActiveDaysStatus status = new LabActiveDaysStatus();
		status.setLabs(labs);
		status.setDate(date);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		status.setDay(cal.get(Calendar.DAY_OF_MONTH));
		status.setMonth(cal.get(Calendar.MONTH));
		status.setYear(cal.get(Calendar.YEAR));
		status.setCreatedBy(labs.getId());
		status.setCreatedTime(new Date());
		status.setUpdatedBy(labs.getId());
		status.setUpdatedTime(new Date());
		return status;
	}

	public static LabBlockedSlots getBlockedSlot(Slot slot, Labs labs) {
		if (slot == null) {
			return null;
		}
		LabBlockedSlots labBlockedSlots = new LabBlockedSlots();
		labBlockedSlots.setDate(slot.getBlockedDate());
		labBlockedSlots.setLab(labs);
		labBlockedSlots.setSlots(getSlots(slot));
		return labBlockedSlots;
	}

	public static AppFileLocations getAppFileLocation(Appointment appointment, String documentPath) {
		if (appointment == null) {
			return null;
		}
		AppFileLocations appFileLocations = new AppFileLocations();
		appFileLocations.setAppointmentId(appointment.getId());
		appFileLocations.setCreatedBy("");
		appFileLocations.setCreatedOn(new Date());
		appFileLocations.setFileName(getReportName(appointment));
		appFileLocations.setFilePath(documentPath);
		appFileLocations.setRemark("");
		appFileLocations.setUpdatedBy("");
		appFileLocations.setUpdatedOn(new Date());
		return appFileLocations;
	}

	public static String getReportName(Appointment appointment) {
		/*if (appointment.getReport() != null) {
			return StringUtils.appendIfMissing(appointment.getReport().getName(), ".pdf");
		}*/
		return prepareReportName(appointment) + ".pdf";
	}

	private static String prepareReportName(Appointment appointment) {
		StringBuilder builder = new StringBuilder();
		if (appointment.getUser() != null) {
			builder.append(CommonUtils.getStringValue(appointment.getUser().getFirstName())).append("_");
		}
		if(CollectionUtils.isNotEmpty(appointment.getTests())) {
			builder.append(CommonUtils.getStringValue(appointment.getTests().get(0).getName())).append("_");
		}
		if(appointment.getId() != null) {
			builder.append(appointment.getId()).append("_");
		}
		return builder.toString();
	}

	public static RequestCollections getRequestCollections(RequestForm form) {
		if (form == null) {
			return null;
		}
		RequestCollections collections = new RequestCollections();
		collections.setName(form.getName());
		collections.setEmail(form.getEmail());
		collections.setContactNo(form.getPhone());
		collections.setUpdatedTime(new Date());
		collections.setRequestedFor(Short.valueOf("0"));
		collections.setAge(Short.valueOf("0"));
		if (StringUtils.isNotEmpty(form.getAge())) {
			collections.setAge(Short.valueOf(form.getAge()));
			collections.setRequestedFor(Short.valueOf("1"));
		}
		collections.setQuery(form.getQuery());
		if (StringUtils.isEmpty(form.getQuery())) {
			collections.setQuery("");
		}
		collections.setCreatedTime(new Date());
		collections.setRemark(StringUtils.join(form.getTestName(), ":", form.getLabName(), ":", form.getCompanyName(), ":", form.getLocation()));
		collections.setIsProcessed("N");
		return collections;
	}

	public static List<AppointmentTestResults> getAppointmentResults(List<TestParameter> testParameteres, Integer appointmentId, Integer testId, Session session) {
		if (CollectionUtils.isEmpty(testParameteres)) {
			return null;
		}
		List<AppointmentTestResults> results = new ArrayList<AppointmentTestResults>();
		for (TestParameter parameter : testParameteres) {
			AppointmentTestResults result = getAppointmentTestResult(appointmentId, testId, parameter);
			AppointmentTestResults existingResult = new AppointmentDaoImpl().getAppointmentTestResult(appointmentId, testId, parameter.getId(), session);
			if (existingResult != null) {
				existingResult.setActualValue(result.getActualValue());
				existingResult.setRemarks(result.getRemarks());
				if(StringUtils.isNotBlank(result.getNormalValue())) {
					existingResult.setNormalValue(result.getNormalValue());
				}
				if(StringUtils.isNotBlank(result.getUnit())) {
					existingResult.setUnit(result.getUnit());
				}
				existingResult.setIsBold(result.getIsBold());
				results.add(existingResult);
				continue;
			}
			results.add(result);
		}
		return results;
	}

	private static AppointmentTestResults getAppointmentTestResult(Integer appointmentId, Integer testId, TestParameter parameter) {
		AppointmentTestResults result = new AppointmentTestResults();
		result.setActualValue(parameter.getActualValue());
		result.setAppointmentId(appointmentId);
		result.setTestId(testId);
		TestFactors testFactor = new TestFactors();
		testFactor.setId(parameter.getId());
		result.setFactor(testFactor);
		result.setRemarks(parameter.getRemark());
		if(StringUtils.isNotBlank(parameter.getNormalValue())) {
			result.setNormalValue(parameter.getNormalValue());
		}
		if(StringUtils.isNotBlank(parameter.getUnit())) {
			result.setUnit(parameter.getUnit());
		}
		if(StringUtils.isNotBlank(parameter.getIsBold())) {
			result.setIsBold(parameter.getIsBold());
		}
		return result;
	}

	public static void getTestFactors(TestParameter parameter, TestFactors factors) {
		if (StringUtils.isNotEmpty(parameter.getName())) {
			factors.setName(parameter.getName());
		}
		if (StringUtils.isNotEmpty(parameter.getNormalValue())) {
			factors.setNormalVal(parameter.getNormalValue());
		}
		if (CollectionUtils.isNotEmpty(parameter.getMethods())) {
			factors.setMethod(CommonUtils.getAppendedString(parameter.getMethods()));
		}
		if (StringUtils.isNotEmpty(parameter.getNormalValueMale())) {
			StringBuilder genderValues = new StringBuilder();
			genderValues.append(parameter.getNormalValueMale()).append(",").append(parameter.getNormalValueFemale()).append(",").append(parameter.getNormalValueChild());
			factors.setGenderValues(genderValues.toString());
			factors.setNormalVal(parameter.getNormalValueMale());
		}
		if (StringUtils.isNotEmpty(parameter.getName())) {
			factors.setUnit(parameter.getUnit());
		}
		if (StringUtils.isNotEmpty(parameter.getType())) {
			factors.setFactorType(parameter.getType());
		}
	}

	public static ReportConfig getReportConfig(ReportConfigurations reportConfigurations, Lab lab) {
		if(reportConfigurations == null || lab == null) {
			return null;
		}
		ReportConfig reportConfig = new ReportConfig();
		getReportConfig(reportConfigurations, lab, reportConfig);
		return reportConfig;
	}

	public static void getReportConfig(ReportConfigurations reportConfigurations, Lab lab, ReportConfig reportConfig) {
		reportConfig.setHeaderRequired("n");
		reportConfig.setFooterRequired("n");
		if(StringUtils.isNotEmpty(reportConfigurations.getIsHeader())) {
			reportConfig.setHeaderRequired(reportConfigurations.getIsHeader());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getIsFooter())) {
			reportConfig.setFooterRequired(reportConfigurations.getIsFooter());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getName())) {
			reportConfig.setSignatureName(reportConfigurations.getName());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getDesignation())) {
			reportConfig.setSignatureDesignation(reportConfigurations.getDesignation());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getSignaturePath())) {
			reportConfig.setSignatureFileLocation(reportConfigurations.getSignaturePath());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getIsSignature())) {
			reportConfig.setSignatureRequired(reportConfigurations.getIsSignature());
		}
		
		if(StringUtils.isNotEmpty(reportConfigurations.getInvoiceName())) {
			reportConfig.setInvoiceName(reportConfigurations.getInvoiceName());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getInvoiceDesignation())) {
			reportConfig.setInvoiceDesignation(reportConfigurations.getInvoiceDesignation());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getInvoiceSignaturePath())) {
			reportConfig.setInvoiceSignatureFileLocation(reportConfigurations.getInvoiceSignaturePath());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getIsInvoiceSignature())) {
			reportConfig.setInvoiceSignatureRequired(reportConfigurations.getIsInvoiceSignature());
		}
		/*if(StringUtils.isNotEmpty(reportConfigurations.getHeader())) {
			reportConfig.setLogoHeader(reportConfigurations.getHeader());
		}
		if(StringUtils.isNotEmpty(reportConfigurations.getFooter())) {
			reportConfig.setLogoFooter(reportConfigurations.getFooter());
		}*/
		reportConfig.setIsColor(reportConfigurations.getIsColor());
		if(lab.getId() != null) {
			reportConfig.setLabId(lab.getId());
		}
	}
	
}
