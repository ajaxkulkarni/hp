package com.rns.healthplease.web.bo.domain;

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
		builder.append(this.getStreet() == null ? "" : this.getStreet()).append(",");
		builder.append(this.getLandmark() == null ? "" : this.getLandmark()).append(",");
		builder.append(this.getArea() == null ? "" : this.getArea()).append(",");
		builder.append(this.getCity() == null ? "" : this.getCity()).append(",");
		builder.append(this.getZipCode() == null ? "" : this.getZipCode()).append(",");
		return builder.toString();
	}
	
}
