package com.coksabu.yojic.lesson.apply.model;

import java.util.Date;

public class ApplyWithSignup {
	private int id;
	private String name;
	private String email;
	private String cate;
	private String subcate;
	private String grade;
	private String sexual;
	private String day;
	private String time;
	private String locale;
	private String locale1;
	private String locale2;
	private String locale3;
	private String month;
	private String gawetime;
	private String price1;
	private String price2;
	private String message;
	private Date postingdate;
	private int visible;
	
	private String password;
	private String birth;
	private String phone;
	
	private Date loginDate;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth=birth;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone=phone;
	}
	
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate=loginDate;
	}
	
	
	
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getCate() {
		return cate;
	}
	
	public void setSubcate(String subcate) {
		this.subcate = subcate;
	}
	public String getSubcate() {
		return subcate;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGrade() {
		return grade;
	}
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getSexual() {
		return sexual;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getDay() {
		return day;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getLocale() {
		return locale;
	}
	
	public void setLocale1(String locale1) {
		this.locale1 = locale1;
	}
	public String getLocale1() {
		return locale1;
	}
	
	public void setLocale2(String locale2) {
		this.locale2 = locale2;
	}
	public String getLocale2() {
		return locale2;
	}
	
	public void setLocale3(String locale3) {
		this.locale3 = locale3;
	}
	public String getLocale3() {
		return locale3;
	}
	
	public void setMonth(String month) {
		this.month = month;
	}
	public String getMonth() {
		return month;
	}
	
	public void setGawetime(String gawetime) {
		this.gawetime = gawetime;
	}
	public String getGawetime() {
		return gawetime;
	}
	
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	public String getPrice1() {
		return price1;
	}
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	public String getPrice2() {
		return price2;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
	public void setPostingdate(Date postingdate) {
		this.postingdate = postingdate;
	}
	public Date getPostingdate(){
		return postingdate;
	}
	
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public int getVisible(){
		return visible;
	}
}
