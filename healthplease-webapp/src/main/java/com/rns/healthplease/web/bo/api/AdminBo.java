package com.rns.healthplease.web.bo.api;

import java.util.Date;
import java.util.List;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.domain.TestCategories;

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

}
