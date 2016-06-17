package com.rns.healthplease.web.dao.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "appointment_test_results")
public class AppointmentTestResults {

	private Integer id;
	private String actualValue;
	private TestFactors factor;
	private Integer testId;
	private Integer appointmentId;
	private String remarks;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "actual_value")
	public String getActualValue() {
		return actualValue;
	}

	public void setActualValue(String actualValue) {
		this.actualValue = actualValue;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "factor_id")
	public TestFactors getFactor() {
		return factor;
	}

	public void setFactor(TestFactors factor) {
		this.factor = factor;
	}

	@Column(name = "test_id")
	public Integer getTestId() {
		return testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	@Column(name = "appointment_id")
	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
