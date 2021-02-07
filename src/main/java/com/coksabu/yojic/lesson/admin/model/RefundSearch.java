package com.coksabu.yojic.lesson.admin.model;

public class RefundSearch {

	private String applicantName;
	private String orderStatus;
	
	private String startDate;
	private String endDate;
	
	public void setApplicantName(String applicantName) {
		this.applicantName=applicantName;
	}
	public String getApplicantName() {
		return applicantName;
	}
	
	public void setOrderStatus(String orderStatus) {
		this.orderStatus=orderStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	
	public void setStartDate(String startDate) {
		this.startDate=startDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate=endDate;
	}
	public String getEndDate() {
		return endDate;
	}
	
}
