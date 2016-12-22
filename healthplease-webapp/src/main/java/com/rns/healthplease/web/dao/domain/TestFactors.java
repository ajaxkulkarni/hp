package com.rns.healthplease.web.dao.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

@Entity
@Table(name = "test_factors")
public class TestFactors implements java.io.Serializable, Comparable<TestFactors> {
	
	private Integer id;
	private String name;
	private String unit;
	private String method;
	private String normalVal;
	private String factorType;
	private String genderValues;
	private Integer sequence;
	
	@Column(name = "gender_values")
	public String getGenderValues() {
		return genderValues;
	}
	
	public void setGenderValues(String genderValues) {
		this.genderValues = genderValues;
	}
	
	
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
	
	@Column(name = "factor_type")
	public String getFactorType() {
		return factorType;
	}
	public void setFactorType(String factorType) {
		this.factorType = factorType;
	}

	@Column(name = "order")
	@OrderColumn
	public Integer getSequence() {
		return sequence;
	}
	
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	@Override
	public int compareTo(TestFactors o) {
		if(o.getSequence() == null) {
			return -1;
		}
		if(this.sequence == null) {
			return 1;
		}
		return this.sequence - o.getSequence();
	}

}
