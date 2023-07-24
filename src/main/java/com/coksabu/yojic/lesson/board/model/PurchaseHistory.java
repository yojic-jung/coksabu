package com.coksabu.yojic.lesson.board.model;

import java.util.Date;

public class PurchaseHistory {

	private int orderId;
	private String buyerEmail;
	private String buyerName;
	private String buyerNickname;
	private String buyerPhone;
	
	private String sellerEmail;
	private String sellerName;
	private String sellerNickname;
	private String sellerPhone;
	
	private Date orderDate;
	//jsp페이지에서 보여주기 위한 스트링 값
	private String orderDateJ;
	
	
	private String postId;
	
	private String price1;
	private String price2;
	private String price3;
	
	private String trial;
	private String gawe;
	
	private Date startDate;
	private Date endDate;
	private String startDateS;
	private String endDateS;
	
	private String orderstatus;
	private String title;
	private String cate;
	private String subcate;
	
	private String subcateIdx;
	
	private String bank;
	private String depositor;
	
	public void setOrderId(int orderId) {
		this.orderId=orderId;
	}
	public int getOrderId() {
		return orderId;
	}
	
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail=buyerEmail;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	
	public void setBuyerName(String buyerName) {
		this.buyerName=buyerName;
	}
	public String getBuyerName() {
		return buyerName;
	}
	
	public void setBuyerNickname(String buyerNickname) {
		this.buyerNickname=buyerNickname;
	}
	public String getBuyerNickname() {
		return buyerNickname;
	}
	
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone=buyerPhone;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	
	
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail=sellerEmail;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	
	
	public void setSellerName(String sellerName) {
		this.sellerName=sellerName;
	}
	public String getSellerName() {
		return sellerName;
	}
	
	public void setSellerNickname(String sellerNickname) {
		this.sellerNickname=sellerNickname;
	}
	public String getSellerNickname() {
		return sellerNickname;
	}
	
	
	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone=sellerPhone;
	}
	public String getSellerPhone() {
		return sellerPhone;
	}
	
	public void setOrderDate(Date orderDate) {
		this.orderDate=orderDate;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	
	public void setOrderDateJ(String orderDateJ) {
		this.orderDateJ=orderDateJ;
	}
	public String getOrderDateJ() {
		return orderDateJ;
	}
	
	
	
	public void setPostId(String postId) {
		this.postId=postId;
	}
	public String getPostId() {
		return postId;
	}
	
	
	public void setPrice1(String price1) {
		this.price1=price1;
	}
	public String getPrice1() {
		return price1;
	}
	
	public void setPrice2(String price2) {
		this.price2=price2;
	}
	public String getPrice2() {
		return price2;
	}
	
	public void setPrice3(String price3) {
		this.price3=price3;
	}
	public String getPrice3() {
		return price3;
	}
	
	public void setTrial(String trial) {
		this.trial=trial;
	}
	public String getTrial() {
		return trial;
	}
	
	public void setGawe(String gawe) {
		this.gawe=gawe;
	}
	public String getGawe() {
		return gawe;
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
	
	
	
	public void setOrderstatus(String orderstatus) {
		this.orderstatus=orderstatus;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	public String getTitle() {
		return title;
	}
	
	
	public void setCate(String cate) {
		this.cate=cate;
	}
	public String getCate() {
		return cate;
	}
	
	public void setSubcate(String subcate) {
		this.subcate=subcate;
	}
	public String getSubcate() {
		return subcate;
	}
	
	public void setSubcateIdx(String subcateIdx) {
		this.subcateIdx=subcateIdx;
	}
	public String getSubcateIdx() {
		return subcateIdx;
	}
	
	public void setBank(String bank) {
		this.bank=bank;
	}
	public String getBank() {
		return bank;
	}
	
	public void setDepositor(String depositor) {
		this.depositor=depositor;
	}
	public String getDepositor() {
		return depositor;
	}
}
