package com.coksabu.yojic.lesson.admin.model;

public class TranSearch {

	String depositor;
	String orderDate;
	String buyerName;
	String bank;
	String orderstatus;
	String startDate;
	String endDate;
	
	
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getDepositor() {
		return depositor;
	}
	
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderDate() {
		return orderDate;
	}
	
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerName() {
		return buyerName;
	}
	
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBank() {
		return bank;
	}
	
	public void setOrderstatus(String orderstatus) {
		this.orderstatus=orderstatus;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartDate() {
		return startDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndDate() {
		return endDate;
	}
	
}
