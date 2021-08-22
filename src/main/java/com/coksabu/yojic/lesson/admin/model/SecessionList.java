package com.coksabu.yojic.lesson.admin.model;

import java.util.Date;

public class SecessionList {

	private String email;
	private Date loginDate;
	private Date secessionapplydate;
	
	private String loginDateS;
	private String secessionapplydateS;
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	
	public void setSecessionapplydate(Date secessionapplydate) {
		this.secessionapplydate = secessionapplydate;
	}
	public Date getSecessionapplydate() {
		return secessionapplydate;
	}
	
	
	public void setLoginDateS(String loginDateS) {
		this.loginDateS = loginDateS;
	}
	public String getLoginDateS() {
		return loginDateS;
	}
	
	public void setSecessionapplydateS(String secessionapplydateS) {
		this.secessionapplydateS = secessionapplydateS;
	}
	public String getSecessionapplydateS() {
		return secessionapplydateS;
	}
	
	
	
}
