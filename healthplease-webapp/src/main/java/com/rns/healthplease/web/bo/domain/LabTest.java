package com.rns.healthplease.web.bo.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LabTest {
	
	private Integer id;
	private String name;
	private String description;
	private String longDescription;
	private Integer price;
	private String category;
	private boolean isTestPackage;
	private String abbrevation;
	private String fastingInfo;
	private List<LabTest> childTests;
	private List<TestParameter> parameters;
	private String reportSent;
	private Integer discount;
	private Integer srNo;
	private Integer deliveryDays;
	private String testDisplayType;
	private String fileLocation;
	private MultipartFile report;
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public List<LabTest> getChildTests() {
		if(childTests == null) {
			childTests = new ArrayList<LabTest>();
		}
		return childTests;
	}
	public void setChildTests(List<LabTest> childTests) {
		this.childTests = childTests;
	}
	public String getAbbrevation() {
		return abbrevation;
	}
	public void setAbbrevation(String abbrevation) {
		this.abbrevation = abbrevation;
	}
	public String getFastingInfo() {
		return fastingInfo;
	}
	public void setFastingInfo(String fastingInfo) {
		this.fastingInfo = fastingInfo;
	}
	public boolean isTestPackage() {
		return isTestPackage;
	}
	public void setTestPackage(boolean isTestPackage) {
		this.isTestPackage = isTestPackage;
	}
	public List<TestParameter> getParameters() {
		return parameters;
	}
	public void setParameters(List<TestParameter> parameters) {
		this.parameters = parameters;
	}
	public String getReportSent() {
		return reportSent;
	}
	public void setReportSent(String reportSent) {
		this.reportSent = reportSent;
	}
	public Integer getSrNo() {
		return srNo;
	}
	public void setSrNo(Integer srNo) {
		this.srNo = srNo;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getDeliveryDays() {
		return deliveryDays;
	}
	public void setDeliveryDays(Integer deliveryDays) {
		this.deliveryDays = deliveryDays;
	}
	public String getLongDescription() {
		return longDescription;
	}
	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}
	public String getTestDisplayType() {
		return testDisplayType;
	}
	public void setTestDisplayType(String testDisplayType) {
		this.testDisplayType = testDisplayType;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	

}
