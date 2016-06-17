package com.rns.healthplease.web.bo.impl;

import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.HPCalendar;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.User;

public class HPSessionManagerImpl implements HPSessionManager {

	private User user;
	private Appointment currentAppointment;
	private String result;
	private HPCalendar hpCalendar;
	private Lab lab;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		if(user == null) {
			user = new User();
		}
		return user;
	}

	public Appointment getCurrentAppointment() {
		if(currentAppointment == null) {
			currentAppointment = new Appointment();
		}
		return currentAppointment;
	}
	
	public void setCurrentAppointment(Appointment appointment) {
		this.currentAppointment = appointment;
	}

	public HPCalendar getHpCalendar() {
		if(hpCalendar == null) {
			hpCalendar = new HPCalendar();
		}
		return hpCalendar;
	}

	public Lab getLab() {
		return lab;
	}

	public void setLab(Lab lab) {
		this.lab = lab;
	}

}
