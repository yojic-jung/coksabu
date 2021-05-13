package com.coksabu.yojic.lesson.member.model;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

public class CertifyDB {
	
	private String email;
	
	private String certifyimg;
	
	private int certify;
	private String certifyimg1;
	private String certifyimg2;
	private String certifyimg3;
	
	private String denyReason;
	
	private Date certifydate;
	
	//기본생성자 없이 불러오면 no such method 익셉션
	public CertifyDB() {
		
	}
	
	public CertifyDB(Certify cer, String path) throws IllegalStateException, IOException {
		this.email = cer.getEmail();
		
		Random random = new Random();
		long currentTime = System.currentTimeMillis();
		int randomValue = random.nextInt(50);
		
		if(!cer.getCertifyimg1().getOriginalFilename().equals("")) {
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_"+cer.getCertifyimg1().getOriginalFilename();
		
		File file = new File(path , fileName);
		cer.getCertifyimg1().transferTo(file);
		this.certifyimg1 = file.getName();
		}
		
		
		if(!cer.getCertifyimg2().getOriginalFilename().equals("")) {
			String fileName = Long.toString(currentTime) + "_"+randomValue+"_"+cer.getCertifyimg2().getOriginalFilename();
			
			File file = new File(path , fileName);
			cer.getCertifyimg2().transferTo(file);
			this.certifyimg2 = file.getName();
		}
		
		
		if(!cer.getCertifyimg3().getOriginalFilename().equals("")) {
			String fileName = Long.toString(currentTime) + "_"+randomValue+"_"+cer.getCertifyimg3().getOriginalFilename();
			
			File file = new File(path , fileName);
			cer.getCertifyimg3().transferTo(file);
			this.certifyimg3 = file.getName();
		}
	}
	
	public void setEmail(String email) {
		this.email= email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setCertify(int certify) {
		this.certify= certify;
	}
	public int getCertify() {
		return certify;
	}
	
	
	
	
	
	public void setCertifyimg(String certifyimg) {
		this.certifyimg= certifyimg;
	}
	public String getCertifyimg() {
		return certifyimg;
	}
	
	
	
	
	
	public void setCertifyimg1(String certifyimg1) {
		this.certifyimg1= certifyimg1;
	}
	public String getCertifyimg1() {
		return certifyimg1;
	}
	
	public void setCertifyimg2(String certifyimg2) {
		this.certifyimg2= certifyimg2;
	}
	public String getCertifyimg2() {
		return certifyimg2;
	}
	
	public void setCertifyimg3(String certifyimg3) {
		this.certifyimg3= certifyimg3;
	}
	public String getCertifyimg3() {
		return certifyimg3;
	}
	
	public void setDenyReason(String denyReason) {
		this.denyReason=denyReason;
	}
	
	public String getDenyReason() {
		return denyReason;
	}
	
	
	
	public void setCertifydate(Date certifydate) {
		this.certifydate = certifydate;
	}
	public Date getCertifydate() {
		return certifydate;
	}
}
