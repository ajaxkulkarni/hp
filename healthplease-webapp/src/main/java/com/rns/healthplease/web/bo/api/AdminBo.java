package com.rns.healthplease.web.bo.api;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.dao.domain.TestLabs;

public interface AdminBo {
	
	void getAllAppointments(User user);

	List<Appointment> getAppointmentsBetween(Date convertDate, Date convertDate2);

	List<TestCategories> getAllTestCategories();

	String editCategory(TestCategories category);

	String deleteCategory(TestCategories category);
	
	String editTest(LabTest test);

	String deleteTest(LabTest test);

	List<Lab> getAllLabs();
	
	String editLab(Lab lab);
	
	String updateLabUsers(Lab lab);

	List<User> getAllUsers();

	String editLocation(LabLocation location);
	
	String deleteLocation(LabLocation location);

	List<TestParameter> getAllTestParemeters();

	String uploadParameters(List<TestParameter> parameters);

	String uploadTestLabs(List<TestLabs> testLabs);

	String uploadTestParameterMaps(String[] mappings);

	Lab getLab(Lab lab);

	List<LabLocation> getUnmappedLocations(Lab lab);

	String updateLabLocation(LabLocation location, Lab lab);

	String deleteLabLocation(LabLocation labLocation, Lab lab);

	List<LabTest> getUnmappedTests(Lab lab);
	
	String updateLabTest(LabTest test, Lab lab);

	String deleteLabTest(LabTest test, Lab lab);
	
	TestParameter getTestParameter(TestParameter parameter);

	InputStream downloadReport(Appointment appointment);

	String editParameter(TestParameter parameter);

	String deleteParameter(TestParameter parameter);

}
