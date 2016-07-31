package com.rns.healthplease.web.bo.api;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.ReportConfigurations;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.dao.domain.TestLabs;

public interface LabBo {
	
	void blockDates(List<Date> dates, Lab lab);
	
	void blockSlots(List<Slot> slots, Lab lab, Date date);
	
	void activateSlots(List<Slot> slots, Lab lab);
	
	String bookForHomeCollection(Appointment appointment);

	String uploadReport(Appointment appointment);
	
	List<LabTest> getAvailableLabTests(Lab lab);
	
	List<LabLocation> getAvailableLabLocations(Lab lab);
	
	List<Slot> getAllLabSlotsForDay(Lab lab, Date date);
	
	List<Appointment> getAppointmentsBetween(Lab lab,Date date1, Date date2);

	String updateTestResults(Appointment appointment);
	
	Appointment getAppointment(Appointment appointment);

	String getLocationCharges(Lab lab, LabLocation location, List<LabTest> tests);
	
	ReportConfigurations getReportConfigurations(Lab lab);
	
	String updateReportConfigurations(Lab lab);

	InputStream downloadSignatureFile(Lab lab);
	
}
