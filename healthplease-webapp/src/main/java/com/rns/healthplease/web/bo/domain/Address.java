package com.rns.healthplease.web.bo.domain;

import org.apache.commons.lang3.StringUtils;

public class Address {
	
	private Integer id;
	private String city;
	private String country;
	private String area;
	private String zipCode;
	private String landmark;
	private String street;
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(StringUtils.isBlank(this.getStreet()) ? "" : StringUtils.appendIfMissing(this.getStreet(), ","));
		builder.append(StringUtils.isBlank(this.getLandmark()) ? "" : StringUtils.appendIfMissing(this.getLandmark(), ","));
		builder.append(StringUtils.isBlank(this.getArea()) ? "" : StringUtils.appendIfMissing(this.getArea(), ","));
		builder.append(StringUtils.isBlank(this.getCity()) ? "" : StringUtils.appendIfMissing(this.getCity(), ","));
		builder.append(StringUtils.isBlank(this.getZipCode()) ? "" : StringUtils.appendIfMissing(this.getZipCode(), ","));
		return StringUtils.removeEnd(builder.toString(), ",");
	}
	
}
