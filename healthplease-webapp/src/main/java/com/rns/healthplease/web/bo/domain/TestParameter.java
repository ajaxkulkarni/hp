package com.rns.healthplease.web.bo.domain;

import java.util.List;

public class TestParameter {
	
	private Integer id;
	private String name;
	private String unit;
	private String normalValue;
	private String actualValue;
	private String type;
	private String remark;
	private String normalValueMale;
	private String normalValueFemale;
	private String normalValueChild;
	private List<String> methods;
	private String mapped;
	private String isBold;
	private Integer sequence;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getNormalValue() {
		return normalValue;
	}
	public void setNormalValue(String normalValue) {
		this.normalValue = normalValue;
	}
	public String getActualValue() {
		return actualValue;
	}
	public void setActualValue(String actualValue) {
		this.actualValue = actualValue;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getNormalValueMale() {
		return normalValueMale;
	}
	public void setNormalValueMale(String normalValueMale) {
		this.normalValueMale = normalValueMale;
	}
	public String getNormalValueFemale() {
		return normalValueFemale;
	}
	public void setNormalValueFemale(String normalValueFemale) {
		this.normalValueFemale = normalValueFemale;
	}
	public List<String> getMethods() {
		return methods;
	}
	public void setMethods(List<String> methods) {
		this.methods = methods;
	}
	public String getNormalValueChild() {
		return normalValueChild;
	}
	public void setNormalValueChild(String normalValueChild) {
		this.normalValueChild = normalValueChild;
	}
	public String getMapped() {
		return mapped;
	}
	public void setMapped(String mapped) {
		this.mapped = mapped;
	}
	public String getIsBold() {
		return isBold;
	}
	public void setIsBold(String isBold) {
		this.isBold = isBold;
	}
	public Integer getOrder() {
		return sequence;
	}
	public void setOrder(Integer order) {
		this.sequence = order;
	}
	
}
