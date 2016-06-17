package com.rns.healthplease.web.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Session;

import com.rns.healthplease.web.bo.domain.Address;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
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
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.TestFactorsMap;
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
		prepareLocations(lab, labs.getLabses());
		return lab;
	}

	private static void prepareLocations(Lab lab, Set<LabLocations> set) {
		if (CollectionUtils.isEmpty(set)) {
			return;
		}
		List<LabLocation> labLocations = new ArrayList<LabLocation>();
		for (LabLocations labLoc : set) {
			LabLocation labLocation = getLocation(labLoc.getLocations());
			labLocations.add(labLocation);
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
		return payment;
	}

	public static LabTest getTest(Tests test) {
		if (test == null) {
			return null;
		}
		LabTest labTest = new LabTest();
		labTest.setId(test.getId());
		labTest.setName(test.getTestName());
		labTest.setDescription(test.getLongDesc());
		labTest.setAbbrevation(test.getTestAbvr());
		labTest.setFastingInfo(test.getIsFastRequired());
		if (test.getTestCategory() != null) {
			labTest.setCategory(test.getTestCategory().getCategoryName());
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
		appointment.getUser().setFirstName(appointments.getName());
		appointment.getUser().setEmail(appointments.getEmail());
		appointment.getUser().setPhone(appointments.getMobileNo());
		appointment.setDate(appointments.getDate());
		appointment.setDoctorName(appointments.getDoctorName());
		appointment.setTests(getTests(appointments, appointmentDao, session));
		appointment.setStatus(DataConverters.getStatus(appointments.getStatus()));
		appointment.setPayment(DataConverters.getPayment(appointmentDao.getPaymentStatusByAppointmentId(appointments.getId(), session)));
		appointment.setPrintRequired(appointments.getIsRequirePrint());
		return appointment;
	}

	private static List<LabTest> getTests(Appointments appointments, AppointmentDao appointmentDao, Session session) {
		if (CollectionUtils.isEmpty(appointments.getTests())) {
			return null;
		}
		List<LabTest> labTests = new ArrayList<LabTest>();
		for (AppointmentTests appointmentTests : appointments.getTests()) {
			LabTest labTest = getTest(appointmentTests.getTests());
			if (labTest != null) {
				labTests.add(labTest);
				List<TestPackages> packages = appointmentDao.getTestPackage(labTest.getId(), session);
				if (CollectionUtils.isNotEmpty(packages)) {
					labTest.setTestPackage(true);
					addChildTests(labTest, packages);
				}
				labTest.setParameters(getTestParameters(appointmentTests.getTests().getTestFactors(), appointments,session));
				labTest.setReportSent(appointmentTests.getReportSent());
			}
		}
		return labTests;
	}
	
	private static List<TestParameter> getTestParameters(Set<TestFactorsMap> testFactors, Appointments appointments, Session session) {
		if(CollectionUtils.isEmpty(testFactors)) {
			return null;
		}
		List<TestParameter> parameters = new ArrayList<TestParameter>();
		for(TestFactorsMap factors:testFactors) {
			TestParameter parameter = new TestParameter();
			TestFactors factor = factors.getTestFactors();
			parameter.setId(factor.getId());
			parameter.setName(factor.getName());
			parameter.setUnit(factor.getUnit());
			parameter.setNormalValue(factor.getNormalVal());
			AppointmentTestResults results = new AppointmentDaoImpl().getAppointmentTestResult(appointments.getId(), factors.getTest().getId(), factors.getId(), session);
			if(results != null) {
				parameter.setActualValue(results.getActualValue());
			}
			parameters.add(parameter);
		}
		return parameters;
	}

	public static void addChildTests(LabTest labTest, List<TestPackages> packages) {
		for (TestPackages testPackages : packages) {
			labTest.getChildTests().add(DataConverters.getTest(testPackages.getChildTest()));
		}
	}

}
