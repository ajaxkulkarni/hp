package com.rns.healthplease.web.bo.api;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.HPCalendar;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.User;

public interface HPSessionManager {
	
	User getUser();
	Appointment getCurrentAppointment();
	void setCurrentAppointment(Appointment appointment);
	void setResult(String result);
	String getResult();
	void setUser(User user);
	HPCalendar getHpCalendar();
	void setLab(Lab lab);
	Lab getLab();

}
