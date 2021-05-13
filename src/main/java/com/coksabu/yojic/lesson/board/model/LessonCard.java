package com.coksabu.yojic.lesson.board.model;

import org.springframework.web.multipart.MultipartFile;

public class LessonCard {
	
	private int id;
	private String email;
	private MultipartFile represent;
	private String cate;
	private String[] subCate;
	private String title;
	private String lesson;
	private String[] ycareer;
	
	private String description;
	private MultipartFile multi1;
	private MultipartFile multi2;
	private MultipartFile multi3;
	private MultipartFile multi4;
	private MultipartFile contentimg[];
	
	private String subCate0;
	private String price1;
	private String price2;
	private String price3;
	
	private String subCate1;
	private String opt1price1;
	private String opt1price2;
	private String opt1price3;
	
	private String subCate2;
	private String opt2price1;
	private String opt2price2;
	private String opt2price3;
	
	private String day;
	private String gawe;
	private String trial;
	
	private String priNegotiation;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setRepresent(MultipartFile represent) {
		this.represent=represent;
	}
	public MultipartFile getRepresent() {
		return represent;
	}
	
	public void setCate(String cate) {
		this.cate=cate;
	}
	public String getCate() {
		return cate;
	}
	
	public void setSubCate(String[] subCate) {
		this.subCate=subCate;
	}
	public String[] getSubCate() {
		return subCate;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	public String getTitle() {
		return title;
	}
	
	public void setLesson(String lesson) {
		this.lesson=lesson;
	}
	public String getLesson() {
		return lesson;
	}
	
	public void setYcareer(String[] ycareer) {
		this.ycareer=ycareer;
	}
	public String[] getYcareer() {
		return ycareer;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
	}
	
	public void setMulti1(MultipartFile multi1) {
		this.multi1=multi1;
	}
	public MultipartFile getMulti1() {
		return multi1;
	}
	
	public void setMulti2(MultipartFile multi2) {
		this.multi2=multi2;
	}
	public MultipartFile getMulti2() {
		return multi2;
	}
	
	public void setMulti3(MultipartFile multi3) {
		this.multi3=multi3;
	}
	public MultipartFile getMulti3() {
		return multi3;
	}
	
	public void setMulti4(MultipartFile multi4) {
		this.multi4=multi4;
	}
	public MultipartFile getMulti4() {
		return multi4;
	}
	
	public void setContentimg(MultipartFile[] contentimg) {
		this.contentimg=contentimg;
	}
	public MultipartFile[] getContentimg() {
		return contentimg;
	}
	
	
	public void setSubCate0(String subCate0) {
		this.subCate0=subCate0;
	}
	public String getSubCate0() {
		return subCate0;
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
	
	
	public void setSubCate1(String subCate1) {
		this.subCate1=subCate1;
	}
	public String getSubCate1() {
		return subCate1;
	}
	public void setOpt1price1(String opt1price1) {
		this.opt1price1=opt1price1;
	}
	public String getOpt1price1() {
		return opt1price1;
	}
	
	public void setOpt1price2(String opt1price2) {
		this.opt1price2=opt1price2;
	}
	public String getOpt1price2() {
		return opt1price2;
	}
	
	public void setOpt1price3(String opt1price3) {
		this.opt1price3=opt1price3;
	}
	public String getOpt1price3() {
		return opt1price3;
	}
	
	
	public void setSubCate2(String subCate2) {
		this.subCate2=subCate2;
	}
	public String getSubCate2() {
		return subCate2;
	}
	public void setOpt2price1(String opt2price1) {
		this.opt2price1=opt2price1;
	}
	public String getOpt2price1() {
		return opt2price1;
	}
	
	public void setOpt2price2(String opt2price2) {
		this.opt2price2=opt2price2;
	}
	public String getOpt2price2() {
		return opt2price2;
	}
	
	public void setOpt2price3(String opt2price3) {
		this.opt2price3=opt2price3;
	}
	public String getOpt2price3() {
		return opt2price3;
	}
	
	
	public void setDay(String day) {
		this.day=day;
	}
	public String getDay() {
		return day;
	}
	public void setGawe(String gawe) {
		this.gawe=gawe;
	}
	public String getGawe() {
		return gawe;
	}
	public void setTrial(String trial) {
		this.trial=trial;
	}
	public String getTrial() {
		return trial;
	}
	
	public void setPriNegotiation(String priNegotiation) {
		this.priNegotiation=priNegotiation;
	}
	public String getPriNegotiation() {
		return priNegotiation;
	}
}
