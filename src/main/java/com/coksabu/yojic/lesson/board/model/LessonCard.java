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
	
	private String cate0;
	private String subCate0;
	private String price1;
	private String price2;
	private String price3;
	
	private String cate1;
	private String subCate1;
	private String opt1price1;
	private String opt1price2;
	private String opt1price3;
	
	private String cate2;
	private String subCate2;
	private String opt2price1;
	private String opt2price2;
	private String opt2price3;
	
	private String cate3;
	private String subCate3;
	private String opt3price1;
	private String opt3price2;
	private String opt3price3;
	
	private String cate4;
	private String subCate4;
	private String opt4price1;
	private String opt4price2;
	private String opt4price3;
	
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
	
	
	public void setCate0(String cate0) {
		this.cate0=cate0;
	}
	public String getCate0() {
		return cate0;
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
	
	
	public void setCate1(String cate1) {
		this.cate1=cate1;
	}
	public String getCate1() {
		return cate1;
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
	
	
	public void setCate2(String cate2) {
		this.cate2=cate2;
	}
	public String getCate2() {
		return cate2;
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
	
	
	
	
	public void setCate3(String cate3) {
		this.cate3=cate3;
	}
	public String getCate3() {
		return cate3;
	}
	public void setSubCate3(String subCate3) {
		this.subCate3=subCate3;
	}
	public String getSubCate3() {
		return subCate3;
	}
	public void setOpt3price1(String opt3price1) {
		this.opt3price1=opt3price1;
	}
	public String getOpt3price1() {
		return opt3price1;
	}
	
	public void setOpt3price2(String opt3price2) {
		this.opt3price2=opt3price2;
	}
	public String getOpt3price2() {
		return opt3price2;
	}
	
	public void setOpt3price3(String opt3price3) {
		this.opt3price3=opt3price3;
	}
	public String getOpt3price3() {
		return opt3price3;
	}
	

	public void setCate4(String cate4) {
		this.cate4=cate4;
	}
	public String getCate4() {
		return cate4;
	}
	public void setSubCate4(String subCate4) {
		this.subCate4=subCate4;
	}
	public String getSubCate4() {
		return subCate4;
	}
	public void setOpt4price1(String opt4price1) {
		this.opt4price1=opt4price1;
	}
	public String getOpt4price1() {
		return opt4price1;
	}
	
	public void setOpt4price2(String opt4price2) {
		this.opt4price2=opt4price2;
	}
	public String getOpt4price2() {
		return opt4price2;
	}
	
	public void setOpt4price3(String opt4price3) {
		this.opt4price3=opt4price3;
	}
	public String getOpt4price3() {
		return opt4price3;
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
