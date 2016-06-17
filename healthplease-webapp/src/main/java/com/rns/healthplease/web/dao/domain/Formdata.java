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
 * Formdata generated by hbm2java
 */
@Entity
@Table(name = "formdata")
public class Formdata implements java.io.Serializable {

	private Integer id;
	private String formid;
	private String fieldname;
	private String fieldvalue;
	private Date submittedOn;
	private String ip;
	private int deleteStatus;

	public Formdata() {
	}

	public Formdata(String formid, String fieldname, String fieldvalue, Date submittedOn, String ip, int deleteStatus) {
		this.formid = formid;
		this.fieldname = fieldname;
		this.fieldvalue = fieldvalue;
		this.submittedOn = submittedOn;
		this.ip = ip;
		this.deleteStatus = deleteStatus;
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

	@Column(name = "formid", nullable = false, length = 1000)
	public String getFormid() {
		return this.formid;
	}

	public void setFormid(String formid) {
		this.formid = formid;
	}

	@Column(name = "fieldname", nullable = false, length = 5000)
	public String getFieldname() {
		return this.fieldname;
	}

	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	@Column(name = "fieldvalue", nullable = false, length = 5000)
	public String getFieldvalue() {
		return this.fieldvalue;
	}

	public void setFieldvalue(String fieldvalue) {
		this.fieldvalue = fieldvalue;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "submitted_on", nullable = false, length = 19)
	public Date getSubmittedOn() {
		return this.submittedOn;
	}

	public void setSubmittedOn(Date submittedOn) {
		this.submittedOn = submittedOn;
	}

	@Column(name = "ip", nullable = false, length = 1000)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "delete_status", nullable = false)
	public int getDeleteStatus() {
		return this.deleteStatus;
	}

	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
