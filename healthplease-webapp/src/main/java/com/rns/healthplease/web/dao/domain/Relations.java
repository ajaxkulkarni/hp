package com.rns.healthplease.web.dao.domain;

// Generated 1 May, 2016 3:04:07 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Relations generated by hbm2java
 */
@Entity
@Table(name = "relations")
public class Relations implements java.io.Serializable {

	private Integer id;
	private int appointmentId;
	private String relation;
	private String RName;
	private String REmail;
	private String RPhone;
	private String RGender;
	private String RDoctor;
	private String RAddress;
	private String addStreet;
	private String addArea;
	private String addLandmark;
	private String addCity;
	private String addZipcode;
	private String RDob;
	private Short RAge;
	private Integer isValid;
	private Integer createdBy;
	private Date createdDate;
	private Integer updtedBy;
	private Date updatedDate;

	public Relations() {
	}

	public Relations(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Relations(int appointmentId, String relation, String RName, String REmail, String RPhone, String RGender, String RDoctor, String RAddress, String addStreet,
			String addArea, String addLandmark, String addCity, String addZipcode, String RDob, Short RAge, Integer isValid, Integer createdBy, Date createdDate, Integer updtedBy,
			Date updatedDate) {
		this.appointmentId = appointmentId;
		this.relation = relation;
		this.RName = RName;
		this.REmail = REmail;
		this.RPhone = RPhone;
		this.RGender = RGender;
		this.RDoctor = RDoctor;
		this.RAddress = RAddress;
		this.addStreet = addStreet;
		this.addArea = addArea;
		this.addLandmark = addLandmark;
		this.addCity = addCity;
		this.addZipcode = addZipcode;
		this.RDob = RDob;
		this.RAge = RAge;
		this.isValid = isValid;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.updtedBy = updtedBy;
		this.updatedDate = updatedDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "appointment_id", nullable = false)
	public int getAppointmentId() {
		return this.appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	@Column(name = "relation", length = 50)
	public String getRelation() {
		return this.relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	@Column(name = "r_name", length = 100)
	public String getRName() {
		return this.RName;
	}

	public void setRName(String RName) {
		this.RName = RName;
	}

	@Column(name = "r_email", length = 50)
	public String getREmail() {
		return this.REmail;
	}

	public void setREmail(String REmail) {
		this.REmail = REmail;
	}

	@Column(name = "r_phone", length = 20)
	public String getRPhone() {
		return this.RPhone;
	}

	public void setRPhone(String RPhone) {
		this.RPhone = RPhone;
	}

	@Column(name = "r_gender", length = 2)
	public String getRGender() {
		return this.RGender;
	}

	public void setRGender(String RGender) {
		this.RGender = RGender;
	}

	@Column(name = "r_doctor", length = 250)
	public String getRDoctor() {
		return this.RDoctor;
	}

	public void setRDoctor(String RDoctor) {
		this.RDoctor = RDoctor;
	}

	@Column(name = "r_address", length = 500)
	public String getRAddress() {
		return this.RAddress;
	}

	public void setRAddress(String RAddress) {
		this.RAddress = RAddress;
	}

	@Column(name = "add_street", length = 250)
	public String getAddStreet() {
		return this.addStreet;
	}

	public void setAddStreet(String addStreet) {
		this.addStreet = addStreet;
	}

	@Column(name = "add_area", length = 250)
	public String getAddArea() {
		return this.addArea;
	}

	public void setAddArea(String addArea) {
		this.addArea = addArea;
	}

	@Column(name = "add_landmark", length = 250)
	public String getAddLandmark() {
		return this.addLandmark;
	}

	public void setAddLandmark(String addLandmark) {
		this.addLandmark = addLandmark;
	}

	@Column(name = "add_city", length = 50)
	public String getAddCity() {
		return this.addCity;
	}

	public void setAddCity(String addCity) {
		this.addCity = addCity;
	}

	@Column(name = "add_zipcode", length = 10)
	public String getAddZipcode() {
		return this.addZipcode;
	}

	public void setAddZipcode(String addZipcode) {
		this.addZipcode = addZipcode;
	}

	@Column(name = "r_dob", length = 10)
	public String getRDob() {
		return this.RDob;
	}

	public void setRDob(String RDob) {
		this.RDob = RDob;
	}

	@Column(name = "r_age")
	public Short getRAge() {
		return this.RAge;
	}

	public void setRAge(Short RAge) {
		this.RAge = RAge;
	}

	@Column(name = "is_valid")
	public Integer getIsValid() {
		return this.isValid;
	}

	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}

	@Column(name = "created_by")
	public Integer getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", length = 19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "updted_by")
	public Integer getUpdtedBy() {
		return this.updtedBy;
	}

	public void setUpdtedBy(Integer updtedBy) {
		this.updtedBy = updtedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_date", length = 19)
	public Date getUpdatedDate() {
		return this.updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

}
