package com.rns.healthplease.web.bo.domain;

public class HPDay {
	
	public HPDay() {
	}
	
	public HPDay(String status) {
		setActive(status);
	}
	
	private String css;
	private String active;
	private String title;
	private String day;
	
	public String getCss() {
		return css;
	}
	public void setCss(String css) {
		this.css = css;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
		if("P".equals(active)) {
			this.css = "past";
			this.title = "";
		} else if ("B".equals(active)) {
			this.css = "past";
			this.title = "Activate this day";
		} else if ("A".equals(active)) {
			this.css = "past";
			this.title = "Please click to view bookings";
		}
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

}
