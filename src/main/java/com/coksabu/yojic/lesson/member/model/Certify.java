package com.coksabu.yojic.lesson.member.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Certify {
	private String email;
	
	private MultipartFile certifyimg1;
	private MultipartFile certifyimg2;
	private MultipartFile certifyimg3;
	
	private Date certifydate;
	
	public void setEmail(String email) {
		this.email= email;
	}
	public String getEmail() {
		return email;
	}
	
	
	public void setCertifyimg1(MultipartFile certifyimg1) {
		this.certifyimg1= certifyimg1;
	}
	public MultipartFile getCertifyimg1() {
		return certifyimg1;
	}
	
	public void setCertifyimg2(MultipartFile certifyimg2) {
		this.certifyimg2= certifyimg2;
	}
	public MultipartFile getCertifyimg2() {
		return certifyimg2;
	}
	
	public void setCertifyimg3(MultipartFile certifyimg3) {
		this.certifyimg3= certifyimg3;
	}
	public MultipartFile getCertifyimg3() {
		return certifyimg3;
	}
	
	
	public void setCertifydate(Date certifydate) {
		this.certifydate = certifydate;
	}
	public Date getCertifydate() {
		return certifydate;
	}
}
