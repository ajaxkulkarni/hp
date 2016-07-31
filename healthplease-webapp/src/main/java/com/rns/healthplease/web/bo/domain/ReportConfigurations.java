package com.rns.healthplease.web.bo.domain;

import org.springframework.web.multipart.MultipartFile;

public class ReportConfigurations {
	
	private Integer id;
	private String isHeader;
	private String isFooter;
	private String name;
	private String designation;
	private String signaturePath;
	private MultipartFile signatureFile;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIsHeader() {
		return isHeader;
	}
	public void setIsHeader(String isHeader) {
		this.isHeader = isHeader;
	}
	public String getIsFooter() {
		return isFooter;
	}
	public void setIsFooter(String isFooter) {
		this.isFooter = isFooter;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getSignaturePath() {
		return signaturePath;
	}
	public void setSignaturePath(String signaturePath) {
		this.signaturePath = signaturePath;
	}
	public MultipartFile getSignatureFile() {
		return signatureFile;
	}
	public void setSignatureFile(MultipartFile signatureFile) {
		this.signatureFile = signatureFile;
	}
	

}
