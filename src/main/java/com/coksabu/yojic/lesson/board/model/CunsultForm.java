package com.coksabu.yojic.lesson.board.model;

import java.util.Date;

public class CunsultForm {
	
	private int lessonid;
	private String cate;
	private String subcate;
	private String title;
	private String teachername;
	private String teacheremail;
	private String buyername;
	private String buyeremail;
	private String buyerphone;
	private String message;
	private int cunsultid;
	private Date date;
	private String dateJ;
	
	public void setLessonid(int lessonid) {
		this.lessonid=lessonid;
	}
	public int getLessonid() {
		return this.lessonid;
	}
	
	public void setCate(String cate) {
		this.cate=cate;
	}
	public String getCate() {
		return this.cate;
	}
	
	public void setSubcate(String subcate) {
		this.subcate=subcate;
	}
	public String getSubcate() {
		return this.subcate;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	public String getTitle() {
		return this.title;
	}
	
	public void setTeachername(String teachername) {
		this.teachername=teachername;
	}
	public String getTeachername() {
		return this.teachername;
	}
	
	public void setTeacheremail(String teacheremail) {
		this.teacheremail=teacheremail;
	}
	public String getTeacheremail() {
		return this.teacheremail;
	}
	
	public void setBuyername(String buyername) {
		this.buyername=buyername;
	}
	public String getBuyername() {
		return this.buyername;
	}
	
	public void setBuyeremail(String buyeremail) {
		this.buyeremail=buyeremail;
	}
	public String getBuyeremail() {
		return this.buyeremail;
	}
	
	public void setBuyerphone(String buyerphone) {
		this.buyerphone=buyerphone;
	}
	public String getBuyerphone() {
		return this.buyerphone;
	}
	
	public void setMessage(String message) {
		this.message=message;
	}
	public String getMessage() {
		return this.message;
	}
	
	public void setCunsultid(int cunsultid) {
		this.cunsultid=cunsultid;
	}
	public int getCunsultid() {
		return this.cunsultid;
	}
	
	public void setDate(Date date) {
		this.date=date;
	}
	public Date getDate() {
		return this.date;
	}
	
	public void setDateJ(String dateJ) {
		this.dateJ=dateJ;
	}
	public String getDateJ() {
		return this.dateJ;
	}
	
}
