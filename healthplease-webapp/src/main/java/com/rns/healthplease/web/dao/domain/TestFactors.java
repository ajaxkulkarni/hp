package com.rns.healthplease.web.dao.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "test_factors")
public class TestFactors implements java.io.Serializable {
	
	private Integer id;
	private String name;
	private String unit;
	private String method;
	private String normalVal;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "unit")
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Column(name = "method")
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	
	@Column(name = "normal_val")
	public String getNormalVal() {
		return normalVal;
	}
	public void setNormalVal(String normalVal) {
		this.normalVal = normalVal;
	}

}
