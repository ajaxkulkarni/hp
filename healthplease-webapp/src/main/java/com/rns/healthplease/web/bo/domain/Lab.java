package com.rns.healthplease.web.bo.domain;

import java.util.ArrayList;
import java.util.List;

public class Lab {
	
	private Integer id;
	private String name;
	private String contact;
	private String address;
	private String email;
	private String password;
	private Integer pickUpCharge;
	private Integer testPrice;
	private Integer price;
	private Integer appointmentsPerSlot;
	private LabLocation area;
	private List<LabLocation> location;
	private List<Slot> currentSlots;
	private List<User> users;
	private List<LabTest> tests;
	private ReportConfigurations reportConfig;
	private Integer discount;
	
	public void setTests(List<LabTest> tests) {
		this.tests = tests;
	}
	
	public List<LabTest> getTests() {
		return tests;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getAppointmentsPerSlot() {
		return appointmentsPerSlot;
	}
	public void setAppointmentsPerSlot(Integer appointmentsPerSlot) {
		this.appointmentsPerSlot = appointmentsPerSlot;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<LabLocation> getLocation() {
		return location;
	}
	public void setLocation(List<LabLocation> location) {
		this.location = location;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Slot> getCurrentSlots() {
		if(currentSlots == null) {
			currentSlots = new ArrayList<Slot>();
		}
		return currentSlots;
	}
	public void setCurrentSlots(List<Slot> currentSlots) {
		this.currentSlots = currentSlots;
	}
	public List<User> getUsers() {
		if(users == null) {
			users = new ArrayList<User>();
		}
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Integer getPickUpCharge() {
		return pickUpCharge;
	}

	public void setPickUpCharge(Integer pickUpCharge) {
		this.pickUpCharge = pickUpCharge;
	}

	public Integer getTestPrice() {
		return testPrice;
	}

	public void setTestPrice(Integer testPrice) {
		this.testPrice = testPrice;
	}

	public LabLocation getArea() {
		return area;
	}

	public void setArea(LabLocation area) {
		this.area = area;
	}

	public ReportConfigurations getReportConfig() {
		return reportConfig;
	}

	public void setReportConfig(ReportConfigurations reportConfig) {
		this.reportConfig = reportConfig;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	

}
