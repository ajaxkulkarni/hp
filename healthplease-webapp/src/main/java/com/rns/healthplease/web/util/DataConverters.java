package com.rns.healthplease.web.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;

import com.rns.healthplease.web.bo.domain.Address;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
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
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentTestResults;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.LabLocations;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.RequestCollections;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.TestFactorsMap;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.TestPackages;
import com.rns.healthplease.web.dao.domain.Tests;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;

public class DataConverters {

	public static void getUser(Users users, User user) {
		if (users == null) {
			return;
		}
		if (user == null) {
			user = new User();
		}
		user.setId(users.getId());
		user.setFirstName(users.getFname());
		user.setMiddleName(users.getMname());
		user.setLastName(users.getLname());
		user.setDob(CommonUtils.convertDate(users.getDob()));
		user.setGender(CommonUtils.getGender(users.getGender()));
		user.setPhone(users.getContact());
		if (users.getLoginDetails() != null) {
			user.setEmail(users.getLoginDetails().getUsername());
			user.setRegisteredEmail(users.getLoginDetails().getUsername());
			user.setPassword(users.getLoginDetails().getPassword());
			user.setLoginId(users.getLoginDetails().getId());
			user.setPasswordRecovery(users.getLoginDetails().isPasswordRecover());
			user.setGroup(new UserGroup(users.getLoginDetails().getGroup().getId()));
		}
		prepareAddress(user, users);
	}

	private static void prepareAddress(User user, Users users) {
		Address address = new Address();
		address.setArea(users.getAddArea());
		address.setCity(users.getAddCity());
		address.setLandmark(users.getAddLandmark());
		address.setStreet(users.getAddStreet());
		address.setZipCode(users.getAddZipcode());
		user.setAddress(address);
	}

	public static Lab getLab(Labs labs) {
		if (labs == null) {
			return null;
		}
		Lab lab = new Lab();
		lab.setName(labs.getLabName());
		lab.setContact(labs.getMobileNo());
		lab.setId(labs.getId());
		lab.setEmail(labs.getLabEmail());
		lab.setAppointmentsPerSlot(Integer.valueOf(labs.getBookAppPerSlot()));
		lab.setPrice(Integer.valueOf(labs.getPickCharge()));
		lab.setAddress(labs.getAddress());
		lab.setArea(getLocation(labs.getLocation()));
		prepareLocations(lab, labs.getLabses());
		lab.setDiscount(labs.getLabDiscount());
		lab.setLogo(labs.getLabLogo());
		return lab;
	}

	private static void prepareLocations(Lab lab, Set<LabLocations> set) {
		if (CollectionUtils.isEmpty(set)) {
			return;
		}
		List<LabLocation> labLocations = new ArrayList<LabLocation>();
		for (LabLocations labLoc : set) {
			LabLocation labLocation = getLocation(labLoc.getLocations());
			if (labLocation != null) {
				labLocations.add(labLocation);
			}
		}
		lab.setLocation(labLocations);
	}

	public static LabLocation getLocation(Locations locations) {
		if (locations == null) {
			return null;
		}
		LabLocation labLocation = new LabLocation();
		labLocation.setId(locations.getId());
		labLocation.setName(locations.getLocationName());
		return labLocation;
	}

	public static Slot getSlot(Slots slots) {
		if (slots == null || slots.getId() == null) {
			return null;
		}
		Slot slot = new Slot();
		slot.setId(slots.getId());
		slot.setStartTime(slots.getStartTime());
		slot.setEndTime(slots.getEndTime());
		return slot;
	}

	public static Address getAppointmentAddress(AppoinAddresses appointmentAddress) {
		if (appointmentAddress == null) {
			return null;
		}
		Address address = new Address();
		address.setId(appointmentAddress.getId());
		address.setArea(appointmentAddress.getAddArea());
		address.setLandmark(appointmentAddress.getAddLandmark());
		address.setZipCode(appointmentAddress.getAddZipcode());
		address.setStreet(appointmentAddress.getAddStreet());
		return address;
	}

	public static Payment getPayment(PaymentStatus paymentStatus) {
		if (paymentStatus == null) {
			return null;
		}
		Payment payment = new Payment();
		payment.setPaymentId(paymentStatus.getId());
		payment.setDate(paymentStatus.getCreatedDate());
		payment.setAmount(paymentStatus.getPaymentAmount());
		payment.setType(CommonUtils.getPaymentType(paymentStatus.getPaymentType()));
		payment.setStatus(CommonUtils.getPaymentStatus(paymentStatus.getStatus()));
		payment.setDiscount(paymentStatus.getDiscount());
		return payment;
	}

	public static LabTest getTest(Tests test) {
		if (test == null) {
			return null;
		}
		LabTest labTest = new LabTest();
		labTest.setId(test.getId());
		labTest.setName(test.getTestName());
		labTest.setDescription(test.getShortDesc());
		labTest.setLongDescription(test.getLongDesc());
		labTest.setAbbrevation(test.getTestAbvr());
		labTest.setFastingInfo(test.getIsFastRequired());
		labTest.setDeliveryDays(Integer.valueOf(test.getDeliveryDays()));
		if (test.getTestCategory() != null) {
			labTest.setCategory(test.getTestCategory().getCategoryName());
		}
		labTest.setTestDisplayType(test.getTestSingleShow());
		return labTest;

	}
	
	public static LabTest getTest(Tests tests,Appointments appointments,Session session) {
		LabTest labTest = getTest(tests);
		if(labTest == null) {
			return labTest;
		}
		List<TestPackages> packages = new AppointmentDaoImpl().getTestPackage(labTest.getId(), session);
		if (CollectionUtils.isNotEmpty(packages)) {
			labTest.setTestPackage(true);
		}
		labTest.setParameters(getTestParameters(tests.getTestFactors(), appointments, session));
		if (CollectionUtils.isNotEmpty(packages)) {
			labTest.setTestPackage(true);
			addChildTests(labTest, packages);
		}
		return labTest;
	}

	public static AppointmentStatus getStatus(com.rns.healthplease.web.dao.domain.AppointmentStatus status) {
		if (status == null) {
			return null;
		}
		AppointmentStatus appointmentStatus = new AppointmentStatus(status.getId());
		appointmentStatus.setName(status.getName());
		return appointmentStatus;
	}

	public static Appointment getAppointment(Session session, AppointmentDao appointmentDao, Appointments appointments) {
		Appointment appointment = new Appointment();
		appointment.setId(appointments.getId());
		appointment.setLab(DataConverters.getLab(appointments.getLab()));
		appointment.setLocation(DataConverters.getLocation(appointments.getLocations()));
		appointment.setSlot(DataConverters.getSlot(appointments.getSlots()));
		appointment.setAddress(DataConverters.getAppointmentAddress(appointmentDao.getAddressByAppointmentId(appointment.getId(), session)));
		User user = new User();
		getUser(appointments.getUser(), user);
		appointment.setUser(user);
		appointment.setAccountHolder(user);
		appointment.getUser().setFirstName(appointments.getName());
		appointment.getUser().setEmail(appointments.getEmail());
		appointment.getUser().setPhone(appointments.getMobileNo());
		appointment.getUser().setAge(appointments.getAge());
		appointment.getUser().setGender(appointments.getGender());
		appointment.setDate(appointments.getDate());
		appointment.setDoctorName(appointments.getDoctorName());
		appointment.setTests(getTests(appointments, appointmentDao, session));
		appointment.setStatus(DataConverters.getStatus(appointments.getStatus()));
		appointment.setPayment(DataConverters.getPayment(appointmentDao.getPaymentStatusByAppointmentId(appointments.getId(), session)));
		appointment.setPrintRequired(appointments.getIsRequirePrint());
		appointment.setType(appointments.getType());
		if(appointment.getAddress() != null) {
			appointment.setHomeCollection(true);
		}
		return appointment;
	}

	private static List<LabTest> getTests(Appointments appointments, AppointmentDao appointmentDao, Session session) {
		if (CollectionUtils.isEmpty(appointments.getTests())) {
			return null;
		}
		List<LabTest> labTests = new ArrayList<LabTest>();
		for (AppointmentTests appointmentTests : appointments.getTests()) {
			LabTest labTest = getTest(appointmentTests.getTests(),appointments, session);
			if (labTest != null) {
				labTests.add(labTest);
				/*List<TestPackages> packages = appointmentDao.getTestPackage(labTest.getId(), session);
				if (CollectionUtils.isNotEmpty(packages)) {
					labTest.setTestPackage(true);
					addChildTests(labTest, packages);
				}
				labTest.setParameters(getTestParameters(appointmentTests.getTests().getTestFactors(), appointments, session));*/
				labTest.setReportSent(appointmentTests.getReportSent());
				labTest.setRemark(appointmentTests.getRemark());
				if(appointmentTests.getFileLocation() != null) {
					labTest.setFileLocation(appointmentTests.getFileLocation().getFilePath());
				}
			}
		}
		return labTests;
	}

	public static List<TestParameter> getTestParameters(Set<TestFactorsMap> testFactors, Appointments appointments, Session session) {
		if (CollectionUtils.isEmpty(testFactors)) {
			return null;
		}
		List<TestParameter> parameters = new ArrayList<TestParameter>();
		for (TestFactorsMap factors : testFactors) {
			TestFactors factor = factors.getTestFactors();
			if (factor == null) {
				continue;
			}
			TestParameter parameter = getTestParameter(factor);
			if (appointments != null) {
				AppointmentTestResults results = new AppointmentDaoImpl().getAppointmentTestResult(appointments.getId(), factors.getTest().getId(), factors.getTestFactors()
						.getId(), session);
				if (results != null) {
					parameter.setActualValue(results.getActualValue());
					if(StringUtils.isNotBlank(results.getNormalValue())) {
						parameter.setNormalValue(results.getNormalValue());
					}
					if(StringUtils.isNotBlank(results.getUnit())) {
						parameter.setUnit(results.getUnit());
					}
					parameter.setRemark(results.getRemarks());
				}
				if(appointments.getAge() != null && appointments.getAge().intValue() <= 10) {
					if(StringUtils.isNotEmpty(parameter.getNormalValueChild())) {
						parameter.setNormalValue(parameter.getNormalValueChild());
					}
				} else if (StringUtils.isNotEmpty(appointments.getGender()) && StringUtils.equalsIgnoreCase(appointments.getGender(), "M")) {
					if(StringUtils.isNotEmpty(parameter.getNormalValueMale())) {
						parameter.setNormalValue(parameter.getNormalValueMale());
					}
				} else if (StringUtils.isNotEmpty(appointments.getGender()) && StringUtils.equalsIgnoreCase(appointments.getGender(), "F")) {
					if(StringUtils.isNotEmpty(parameter.getNormalValueFemale())) {
						parameter.setNormalValue(parameter.getNormalValueFemale());
					}
				}
			}
			parameters.add(parameter);
		}
		return parameters;
	}

	public static TestParameter getTestParameter(TestFactors factor) {
		TestParameter parameter = new TestParameter();
		parameter.setId(factor.getId());
		parameter.setName(factor.getName());
		parameter.setUnit(factor.getUnit());
		parameter.setNormalValue(factor.getNormalVal());
		parameter.setType(factor.getFactorType());
		parameter.setNormalValueMale(CommonUtils.getGenderValue(factor.getGenderValues(), 0));
		parameter.setNormalValueFemale(CommonUtils.getGenderValue(factor.getGenderValues(), 1));
		parameter.setNormalValueChild(CommonUtils.getGenderValue(factor.getGenderValues(), 2));
		parameter.setMethods(CommonUtils.getStrings(factor.getMethod()));
		return parameter;
	}

	public static void addChildTests(LabTest labTest, List<TestPackages> packages) {
		labTest.setChildTests(new ArrayList<LabTest>());
		for (TestPackages testPackages : packages) {
			labTest.getChildTests().add(DataConverters.getTest(testPackages.getChildTest()));
		}
	}

	public static List<LabTest> getLabTests(Session session, AppointmentDao appointmentDao, Labs labs) {
		List<LabTest> labTests = new ArrayList<LabTest>();
		for (TestLabs testLabs : labs.getTestLabs()) {
			LabTest test = DataConverters.getTest(testLabs.getTest());
			if (test == null) {
				continue;
			}
			test.setPrice(Integer.valueOf(testLabs.getLabPrice()));
			List<TestPackages> packages = appointmentDao.getTestPackage(test.getId(), session);
			if (CollectionUtils.isNotEmpty(packages)) {
				test.setTestPackage(true);
			}
			labTests.add(test);
		}
		return labTests;
	}

	public static RequestForm getRequestForm(RequestCollections collection) {
		if(collection == null) {
			return null;
		}
		RequestForm form = new RequestForm();
		form.setName(collection.getName());
		form.setEmail(collection.getEmail());
		form.setPhone(collection.getContactNo());
		//form.setAge(collection.getAge());
		form.setCompanyName(CommonUtils.getFormValue(collection.getRemark(), 2));
		form.setTestName(CommonUtils.getFormValue(collection.getRemark(), 0));
		form.setLabName(CommonUtils.getFormValue(collection.getRemark(), 1));
		form.setLocation(CommonUtils.getFormValue(collection.getRemark(), 3));
		return form;
	}
	
	public static ReportConfigurations getReportConfigurations(ReportConfig reportConfig) {
		if(reportConfig == null) {
			return null;
		}
		ReportConfigurations reportConfigurations = new ReportConfigurations();
		reportConfigurations.setIsHeader(reportConfig.getHeaderRequired());
		reportConfigurations.setIsFooter(reportConfig.getFooterRequired());
		reportConfigurations.setName(reportConfig.getSignatureName());
		reportConfigurations.setDesignation(reportConfig.getSignatureDesignation());
		reportConfigurations.setSignaturePath(reportConfig.getSignatureFileLocation());
		reportConfigurations.setIsSignature(reportConfig.getSignatureRequired());
		reportConfigurations.setInvoiceName(reportConfig.getInvoiceName());
		reportConfigurations.setInvoiceDesignation(reportConfig.getInvoiceDesignation());
		reportConfigurations.setInvoiceSignaturePath(reportConfig.getInvoiceSignatureFileLocation());
		reportConfigurations.setIsInvoiceSignature(reportConfig.getInvoiceSignatureRequired());
		
		return reportConfigurations;
	}

}
