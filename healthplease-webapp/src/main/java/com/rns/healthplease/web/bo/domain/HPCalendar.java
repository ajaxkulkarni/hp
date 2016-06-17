package com.rns.healthplease.web.bo.domain;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class HPCalendar {
	
	private List<HPWeek> weeks;
	private Integer month;
	private String monthName;
	
	public Integer getMonth() {
		if(month == null) {
			month = Calendar.getInstance().get(Calendar.MONTH);
			monthName = new DateFormatSymbols().getMonths()[month];
		}
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
		this.monthName = new DateFormatSymbols().getMonths()[month];
	}

	public String getMonthName() {
		return monthName;
	}

	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}

	public Integer getYear() {
		if(year == null) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	private Integer year;
	
	public List<HPWeek> getWeeks() {
		if(weeks == null) {
			weeks = new ArrayList<HPWeek>();
		}
		return weeks;
	}

	public void setWeeks(List<HPWeek> weeks) {
		this.weeks = weeks;
	}
	
	

}
