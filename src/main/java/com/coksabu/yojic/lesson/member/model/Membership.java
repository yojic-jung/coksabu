package com.coksabu.yojic.lesson.member.model;

import java.util.Date;

public class Membership {
	private int membership;
	private Date startDate;
	private Date endDate;
	private String startDateS;
	private String endDateS;
	private long period;
	private int day;
	
	
	public void setMembership(int membership) {
		this.membership=membership;
	}
	public int getMembership() {
		return membership;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate=startDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate=endDate;
	}
	public Date getEndDate() {
		return endDate;
	}

	public void setStartDateS(String startDateS) {
		this.startDateS=startDateS;
	}
	public String getStartDateS() {
		return startDateS;
	}
	
	public void setEndDateS(String endDateS) {
		this.endDateS=endDateS;
	}
	public String getEndDateS() {
		return endDateS;
	}
	
	public void setPeriod(long period) {
		this.period=period;
	}
	public long getPeriod() {
		return period;
	}
	
	public void setDay(int day) {
		this.day = day;
	}
	public int getDay() {
		return day;
	}
}
