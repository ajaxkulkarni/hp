package com.rns.healthplease.web.bo.domain;

import org.springframework.web.multipart.MultipartFile;

public class ReportConfigurations {
	
	private Integer id;
	private String isHeader;
	private String isFooter;
	private String name;
	private String designation;
	private String signaturePath;
	private String isSignature;
	private MultipartFile signatureFile;
	private String invoiceDesignation;
	private String invoiceName;
	private String invoiceSignaturePath;
	private String isInvoiceSignature;
	private String isSeparatePage;
	private MultipartFile invoiceSignatureFile;
	private String isDesignation;
	private String isTime;
	private String isColor;
	private MultipartFile headerFile;
	private MultipartFile footerFile;
	private String header;
	private String footer;
	
	public String getInvoiceDesignation() {
		return invoiceDesignation;
	}
	public void setInvoiceDesignation(String invoiceDesignation) {
		this.invoiceDesignation = invoiceDesignation;
	}
	public String getInvoiceName() {
		return invoiceName;
	}
	public void setInvoiceName(String invoiceName) {
		this.invoiceName = invoiceName;
	}
	public String getInvoiceSignaturePath() {
		return invoiceSignaturePath;
	}
	public void setInvoiceSignaturePath(String invoiceSignaturePath) {
		this.invoiceSignaturePath = invoiceSignaturePath;
	}
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
	public String getIsSignature() {
		return isSignature;
	}
	public void setIsSignature(String isSignature) {
		this.isSignature = isSignature;
	}
	public String getIsInvoiceSignature() {
		return isInvoiceSignature;
	}
	public void setIsInvoiceSignature(String isInvoiceSignature) {
		this.isInvoiceSignature = isInvoiceSignature;
	}
	public String getIsSeparatePage() {
		return isSeparatePage;
	}
	public void setIsSeparatePage(String isSeparatePage) {
		this.isSeparatePage = isSeparatePage;
	}
	public MultipartFile getInvoiceSignatureFile() {
		return invoiceSignatureFile;
	}
	public void setInvoiceSignatureFile(MultipartFile invoiceSignatureFile) {
		this.invoiceSignatureFile = invoiceSignatureFile;
	}
	public String getIsDesignation() {
		return isDesignation;
	}
	public void setIsDesignation(String isDesignation) {
		this.isDesignation = isDesignation;
	}
	public String getIsTime() {
		return isTime;
	}
	public void setIsTime(String isTime) {
		this.isTime = isTime;
	}
	public String getIsColor() {
		return isColor;
	}
	public void setIsColor(String isColor) {
		this.isColor = isColor;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
	public MultipartFile getHeaderFile() {
		return headerFile;
	}
	public void setHeaderFile(MultipartFile headerFile) {
		this.headerFile = headerFile;
	}
	public MultipartFile getFooterFile() {
		return footerFile;
	}
	public void setFooterFile(MultipartFile footerFile) {
		this.footerFile = footerFile;
	}
	

}
