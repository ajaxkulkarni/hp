package com.rns.healthplease.web.bo.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {

	private Integer id;
	private String email;
	private String password;
	private String phone;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private Address address;
	private Integer loginId;
	private Date dob;
	private Integer age;
	private List<Appointment> appointments;
	private List<Appointment> pendingAppointments;
	private List<Appointment> cancelledAppointments;
	private List<Appointment> todaysAppointments;
	private List<Appointment> selectedAppointments;
	private boolean passwordRecovery;
	private UserGroup group;
	private Lab lab;
	private String activationCode;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Integer getLoginId() {
		return loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Appointment> getAppointments() {
		if (appointments == null) {
			appointments = new ArrayList<Appointment>();
		}
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public boolean isPasswordRecovery() {
		return passwordRecovery;
	}

	public void setPasswordRecovery(boolean passwordRecovery) {
		this.passwordRecovery = passwordRecovery;
	}

	public UserGroup getGroup() {
		return group;
	}

	public void setGroup(UserGroup group) {
		this.group = group;
	}

	public Lab getLab() {
		return lab;
	}

	public void setLab(Lab lab) {
		this.lab = lab;
	}

	public List<Appointment> getPendingAppointments() {
		if(pendingAppointments == null) {
			pendingAppointments = new ArrayList<Appointment>();
		}
		return pendingAppointments;
	}

	public void setPendingAppointments(List<Appointment> pendingAppointments) {
		this.pendingAppointments = pendingAppointments;
	}

	public List<Appointment> getCancelledAppointments() {
		if(cancelledAppointments == null) {
			cancelledAppointments = new ArrayList<Appointment>();
		}
		return cancelledAppointments;
	}

	public void setCancelledAppointments(List<Appointment> cancelledAppointments) {
		this.cancelledAppointments = cancelledAppointments;
	}

	public List<Appointment> getTodaysAppointments() {
		if(todaysAppointments == null) {
			todaysAppointments = new ArrayList<Appointment>();
		}
		return todaysAppointments;
	}

	public void setTodaysAppointments(List<Appointment> todaysAppointments) {
		this.todaysAppointments = todaysAppointments;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public List<Appointment> getSelectedAppointments() {
		return selectedAppointments;
	}

	public void setSelectedAppointments(List<Appointment> selectedAppointments) {
		this.selectedAppointments = selectedAppointments;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}


}
