package com.rns.healthplease.web.bo.domain;

import java.util.Date;

public class Slot {

	private Integer id;
	private String startTime;
	private String endTime;
	private Slab slab;
	private Date blockedDate;
	private String isBooked;
	private boolean isBlocked;
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Slab getSlab() {
		return slab;
	}
	public void setSlab(Slab slab) {
		this.slab = slab;
	}
	public Date getBlockedDate() {
		return blockedDate;
	}
	public void setBlockedDate(Date blockedDate) {
		this.blockedDate = blockedDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIsBooked() {
		return isBooked;
	}
	public void setIsBooked(String isBooked) {
		this.isBooked = isBooked;
	}
	public boolean isBlocked() {
		return isBlocked;
	}
	public void setBlocked(boolean isBlocked) {
		this.isBlocked = isBlocked;
	}
}
