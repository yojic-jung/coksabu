package com.coksabu.yojic.lesson.member.model;

import java.util.Date;

public class Promotion {
	private String email;
	private String title;
	private String content;
	private String code;
	private Date startDate;
	private Date endDate;
	
	private String startDateS;
	private String endDateS;
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode() {
		return code;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	
	public void setStartDateS(String startDateS) {
		this.startDateS = startDateS;
	}
	public String getStartDateS() {
		return startDateS;
	}
	
	public void setEndDateS(String endDateS) {
		this.endDateS = endDateS;
	}
	public String getEndDateS() {
		return endDateS;
	}
	
}
