package com.coksabu.yojic.lesson.member.model;

import org.springframework.web.multipart.MultipartFile;

public class TeacherInfo {
	private String email;
	private MultipartFile img;
	private String sexual;
	private String locales;
	private String universe;
	private String univsub;
	private String universer;
	private String career;
	//추가입력
	private String academy;
	private String academyd;
	private String nation;
	private String nationy;
	private String toeic;
	private String tofle;
	private String teps;
	private String hsk;
	private String jpt;
	private String singular;
		
	public void setLocales(String locales) {
		this.locales=locales;
	}
	
	public String getLocales() {
		return locales;
	}
	
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setImg(MultipartFile img) {
		this.img=img;
	}
	public MultipartFile getImg() {
		return img;
	}
	
	public String getSexual() {
		return sexual;
	}
	
	public void setSexual(String sexual) {
		this.sexual=sexual;
	}
	
	public void setUniverse(String universe) {
		this.universe=universe;
	}
	public String getUniverse() {
		return universe;
	}
	
	public void setUnivsub(String univsub) {
		this.univsub=univsub;
	}
	public String getUnivsub() {
		return univsub;
	}
	
	public void setUniverser(String universer) {
		this.universer=universer;
	}
	public String getUniverser() {
		return universer;
	}
	
	public void setCareer(String career) {
		this.career=career;
	}
	public String getCareer() {
		return career;
	}
	
	public void setAcademy(String academy) {
		this.academy=academy;
	}
	public String getAcademy() {
		return academy;
	}
	
	public void setAcademyd(String academyd) {
		this.academyd=academyd;
	}
	public String getAcademyd() {
		return academyd;
	}
	
	public void setNation(String nation) {
		this.nation=nation;
	}
	public String getNation() {
		return nation;
	}
	
	public void setNationy(String nationy) {
		this.nationy=nationy;
	}
	public String getNationy() {
		return nationy;
	}
	
	public void setToeic(String toeic) {
		this.toeic=toeic;
	}
	public String getToeic() {
		return toeic;
	}
	
	public void setTofle(String tofle) {
		this.tofle=tofle;
	}
	public String getTofle() {
		return tofle;
	}
	
	public void setTeps(String teps) {
		this.teps=teps;
	}
	public String getTeps() {
		return teps;
	}
	
	public void setHsk(String hsk) {
		this.hsk=hsk;
	}
	public String getHsk() {
		return hsk;
	}
	
	public void setJpt(String jpt) {
		this.jpt=jpt;
	}
	public String getJpt() {
		return jpt;
	}
	
	public void setSingular(String singular) {
		this.singular=singular;
	}
	public String getSingular() {
		return singular;
	}
}
