package com.rns.healthplease.web.bo.domain;

public class UserGroup {
	
	private Integer id;
	private String role;
	
	public UserGroup(Integer i) {
		this.id = i;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
