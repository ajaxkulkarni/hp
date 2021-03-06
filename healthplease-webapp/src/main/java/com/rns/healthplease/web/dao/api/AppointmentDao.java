package com.rns.healthplease.web.dao.api;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.rns.healthplease.web.dao.domain.AppFileLocations;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentStatus;
import com.rns.healthplease.web.dao.domain.AppointmentTestResults;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.CancelReasons;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.LocationWiseLabCharges;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.TestPackages;
import com.rns.healthplease.web.dao.domain.Tests;

public interface AppointmentDao {

	List<Appointments> getUserAppointments(int userId, Session session);

	AppoinAddresses getAddressByAppointmentId(Integer id, Session session);

	PaymentStatus getPaymentStatusByAppointmentId(Integer id, Session session);

	List<Tests> getAllTests(Session session, String testType);

	List<Locations> getAllLabLocations(Session session);

	Locations getLocationsById(Integer id, Session session);

	List<TestLabs> getLabsForTest(Integer id, Integer labId, Session session);

	Labs getLabById(Integer id, Session session);

	List<Slots> getAllSlots(Session session, int labId);

	void addNewAppointment(Appointments appointments, AppoinAddresses appoinAddresses, PaymentStatus paymentStatus, Session session);

	List<LabActiveDaysStatus> getLabInactiveDays(Integer id, Session session);

	Tests getTestById(Integer testId, Session session);

	Slots getSlotById(Integer id, Session session);

	TestLabs getTestLabsForTestLab(Integer testId, Integer labId, Session session);

	Appointments getAppointmentById(Integer id, Session session);

	void editAppointment(Appointments appointments, Session session);

	void addReport(AppFileLocations appFileLocations, Session session);

	AppFileLocations getAppFileLocationByAppointmentId(Integer id, Session session);

	List<Appointments> getAppointmentsForLabSlot(Integer slotId, Integer labId, Date date, Session session);

	List<TestPackages> getTestPackage(Integer id, Session session);

	LocationWiseLabCharges getLocationCharges(Integer labId, Integer locId, Session session);
	
	List<Appointments> getAppointmentsForDateRange(int labId,Date date1,Date date2,Session session);

	List<Appointments> getAllAppointments(Session session);

	CancelReasons getCancelReason(Integer cancelId, Session session);

	AppointmentTestResults getAppointmentTestResult(Integer appointmentId, Integer testId,Integer factorId, Session session);

	List<Appointments> getAppointmentsForDateRange(Date date1, Date date2, Session session);

	List<TestCategories> getAllTestCategories(Session session);

	TestCategories getTestCategoryByName(String category, Session session);

	List<Labs> getAllLabs(Session session);

	List<TestFactors> getAllTestFactors(Session session);

	TestFactors getTestFactorByname(String name, Session session);
	
	TestCategories getTestCategoryById(Integer id, Session session);

	void deleteAllTestFactorMaps(Session session);

	TestFactors getTestFactorById(Integer id, Session session);
	
	List<TestLabs> getLabsForTest(List<Integer> tests,Integer labId, Session session);
	
	AppointmentStatus getAppointmentStatusById(Integer id, Session session);

	AppointmentTests getAppointmentTest(Integer testId, Integer appId, Session session);

}
