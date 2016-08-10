package com.rns.healthplease.web.bo.domain;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class Appointment {
	
	private Integer id;
	private User user;
	private Lab lab;
	private LabLocation location;
	private Address address;
	private AppointmentStatus status;
	private Payment payment;
	private Slot slot;
	private Date date;
	private List<LabTest> tests;
	private String doctorName;
	private MultipartFile report;
	private File prepareReport;
	private Character printRequired;
	private boolean homeCollection;
	private byte[] reportData;
	private byte[] invoiceData;
	private String remark;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Lab getLab() {
		return lab;
	}
	public void setLab(Lab lab) {
		this.lab = lab;
	}
	public LabLocation getLocation() {
		return location;
	}
	public void setLocation(LabLocation location) {
		this.location = location;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public AppointmentStatus getStatus() {
		return status;
	}
	public void setStatus(AppointmentStatus status) {
		this.status = status;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Slot getSlot() {
		return slot;
	}
	public void setSlot(Slot slot) {
		this.slot = slot;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public List<LabTest> getTests() {
		if(tests == null) {
			tests = new ArrayList<LabTest>();
		}
		return tests;
	}
	public void setTests(List<LabTest> tests) {
		this.tests = tests;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public Character getPrintRequired() {
		return printRequired;
	}
	public void setPrintRequired(Character printRequired) {
		this.printRequired = printRequired;
	}
	public boolean isHomeCollection() {
		return homeCollection;
	}
	public void setHomeCollection(boolean homeCollection) {
		this.homeCollection = homeCollection;
	}
	public File getPrepareReport() {
		return prepareReport;
	}
	public void setPrepareReport(File prepareReport) {
		this.prepareReport = prepareReport;
	}
	public byte[] getReportData() {
		return reportData;
	}
	public void setReportData(byte[] reportData) {
		this.reportData = reportData;
	}
	public byte[] getInvoiceData() {
		return invoiceData;
	}
	public void setInvoiceData(byte[] invoiceData) {
		this.invoiceData = invoiceData;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
