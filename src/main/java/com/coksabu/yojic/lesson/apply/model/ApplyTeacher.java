package com.coksabu.yojic.lesson.apply.model;

import java.util.Calendar;
import java.util.Date;

public class ApplyTeacher {
	
	private int apply_id;
	private int teacher_id;
	private String imgPath;
	
	private String name;
	private String nickname;
	private String birth;
	private String universe;
	private String univsub;
	private String academy;
	private String academyd;
	private String sexual;
	private String career;
	private String locales;
	private String teacherEmail;
	private String applicantEmail;
	private int certify;
	private Date applyDate;
	
	private String message;
	
	public void setApply_id(int apply_id) {
		this.apply_id=apply_id;
	}
	public int getApply_id() {
		return apply_id;
	}
	
	public void setTeacher_id(int teacher_id) {
		this.teacher_id=teacher_id;
	}
	public int getTeacher_id() {
		return teacher_id;
	}
	
	public void setMessage(String message) {
		this.message=message;
	}
	public String getMessage() {
		return message;
	}
	
	public void setName(String name) {
		this.name= name;
	}
	public String getName() {
		return name;
	}

	public void setNickname(String nickname) {
		this.nickname=nickname;
	}
	public String getNickname() {
		return nickname;
	}
	
	public void setImgPath(String imgPath) {
		this.imgPath= imgPath;
	}
	public String getImgPath() {
		return imgPath;
	}
	
	public void setLocales(String locales) {
		this.locales= locales;
	}
	public String getLocales() {
		return locales;
	}
	
	public void setCertify(int certify) {
		this.certify= certify;
	}
	public int getCertify() {
		return certify;
	}
	
	
	public void setBirth(String birth) {
		int bi = Integer.valueOf(birth.substring(0, 2));
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String years = Integer.toString(year);
		years=years.substring(years.length()-2, years.length());
		year = Integer.parseInt(years);
		if(bi>year) {
			this.birth= String.valueOf(year+101-bi).substring(0,1)+"0대";
		}else {
			this.birth= String.valueOf(year-bi+1).substring(0,1)+"0대";
		}
		
	}
	public String getbirth() {
		return birth;
	}
	
	public void setUnivsub(String univsub) {
		this.univsub= univsub;
	}
	public String getUnivsub() {
		return univsub;
	}
	
	public void setUniverse(String universe) {
		this.universe= universe;
	}
	public String getUniverse() {
		return universe;
	}
	
	public void setAcademy(String academy) {
		this.academy= academy;
	}
	public String getAcademy() {
		return academy;
	}
	
	public void setAcademyd(String academyd) {
		this.academyd= academyd;
	}
	public String getAcademyd() {
		return academyd;
	}
	
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getSexual() {
		return sexual;
	}
	
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCareer() {
		return career;
	}
	
	
	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail=teacherEmail;
	}
	
	public String getTeacherEmail() {
		return teacherEmail;
	}
	
	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail=applicantEmail;
	}
	
	public String getApplicantEmail() {
		return applicantEmail;
	}
	
	public void setApplyDate(Date applyDate) {
		this.applyDate=applyDate;
	}
	
	public Date getApplyDate() {
		return applyDate;
	}
}
