package com.rns.healthplease.web.bo.api;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.User;

public interface UserBo {
	
	String activateUser(User user);
	
	String registerUser(User user);
	
	String loginUser(User user);
	
	List<LabTest> getAvailableTests();
	
	List<LabLocation> getAllLocations();
	
	List<Lab> getAvailableLabs(Appointment appointment);
	
	List<Date> getBlockedDates(Appointment appointment);
	
	List<Slot> getAvailableSlots(Appointment appointment);
	
	String bookAppointment(Appointment appointment);
	
	String bookForOther(Appointment appointment);

	void populateAppointment(Appointment currentAppointment);
	
	String populateUserDetails(User user);
	
	String updateUser(User user);
	
	String updateAppointment(Appointment appointment);
	
	String cancelAppointment(Appointment appointment);
	
	void populateLabDetails(User user, int labId);

	InputStream downloadReport(Appointment appointment);

	List<Lab> getAllLabs();

	String requestCollection(RequestForm form);
	
	LabTest getTestWithPackages(LabTest test);

	String forgotPassword(User user);
	
	String changePassword(User user);

}
