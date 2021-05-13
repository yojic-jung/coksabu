package com.coksabu.yojic.lesson.admin.model;

import org.springframework.web.multipart.MultipartFile;

public class UnivCertiUpdate {
	
	private String email;
	private String agoCertiImg;
	private MultipartFile certifyimg2;
	private MultipartFile certifyimg3;
	
	public void setEmail(String email) {
		this.email =email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setAgoCertiImg(String agoCertiImg) {
		this.agoCertiImg =agoCertiImg;
	}
	
	public String getAgoCertiImg() {
		return agoCertiImg;
	}
	
	public void setCertifyimg2(MultipartFile certifyimg2) {
		this.certifyimg2 = certifyimg2;
	}
	
	public MultipartFile getCertifyimg2() {
		return certifyimg2;
	}
	
	public void setCertifyimg3(MultipartFile certifyimg3) {
		this.certifyimg3 =certifyimg3;
	}
	
	public MultipartFile getCertifyimg3() {
		return certifyimg3;
	}

}
