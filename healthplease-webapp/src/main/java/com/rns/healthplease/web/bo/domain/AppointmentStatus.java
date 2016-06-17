package com.rns.healthplease.web.bo.domain;

public class AppointmentStatus {

	private Integer id;
	private String name;
	private String cancellationReason;
	private Integer cancelId;
	
	public AppointmentStatus() {
		
	}
	
	public AppointmentStatus(int i) {
		this.id = i;
	}
	public AppointmentStatus(String status) {
		this.name = status;
	}
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
	public String getCancellationReason() {
		return cancellationReason;
	}
	public void setCancellationReason(String cancellationReason) {
		this.cancellationReason = cancellationReason;
	}
	public Integer getCancelId() {
		return cancelId;
	}
	public void setCancelId(Integer cancelId) {
		this.cancelId = cancelId;
	}
}
