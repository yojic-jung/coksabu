package com.coksabu.yojic.lesson.admin.model;

import java.util.Date;

public class OrderStatusRecord {
	private int orderId;
	private String postId;
	private String chatTranId;
	
	private String depositor;
	private String buyerName;
	private String bank;
	private String price;
	private String orderstatus;
	
	private Date recordtime;
	private String recordtimeS;
	
	public void setOrderId(int orderId) {
		this.orderId=orderId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setPostId(String postId) {
		this.postId=postId;
	}
	public String getPostId() {
		return postId;
	}
	
	public void setChatTranId(String chatTranId) {
		this.chatTranId=chatTranId;
	}
	public String getChatTranId() {
		return chatTranId;
	}
	
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getDepositor() {
		return depositor;
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
	public void setPrice(String price) {
		this.price=price;
	}
	public String getPrice() {
		return price;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus=orderstatus;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	
	public void setRecordtime(Date recordtime) {
		this.recordtime=recordtime;
	}
	public Date getRecordtime() {
		return recordtime;
	}
	
	public void setRecordtimeS(String recordtimeS) {
		this.recordtimeS=recordtimeS;
	}
	public String getRecordtimeS() {
		return recordtimeS;
	}
	
}
