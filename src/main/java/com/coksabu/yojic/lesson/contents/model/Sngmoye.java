package com.coksabu.yojic.lesson.contents.model;

import java.util.Date;

public class Sngmoye {

	private String email;
	private String questionIdentity;
	private String questionType;
	private int year;
	private int	month;
	private int	questionNumber;
	private String questionAnswer;
	private Date createDate;
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setQuestionIdentity(String questionIdentity) {
		this.questionIdentity=questionIdentity;
	}
	public String getQuestionIdentity() {
		return questionIdentity;
	}
	
	public void setQuestionType(String questionType) {
		this.questionType=questionType;
	}
	public String getQuestionType() {
		return questionType;
	}
	
	public void setYear(int year) {
		this.year=year;
	}
	public int getYear() {
		return year;
	}
	
	public void setMonth(int month) {
		this.month=month;
	}
	public int getMonth() {
		return month;
	}
	
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber=questionNumber;
	}
	public int getQuestionNumber() {
		return questionNumber;
	}
	
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer=questionAnswer;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate=createDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	
}
