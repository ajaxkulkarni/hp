package com.rns.healthplease.web.dao.domain;

// Generated 1 May, 2016 3:04:07 AM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Times generated by hbm2java
 */
@Entity
@Table(name = "times")
public class Times implements java.io.Serializable {

	private Integer id;
	private String time;

	public Times() {
	}

	public Times(String time) {
		this.time = time;
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

	@Column(name = "time", nullable = false, length = 25)
	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
