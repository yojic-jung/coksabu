package lesson.member.model;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

public class CertifyDB {
	
	private String email;
	private String certifyimg;
	private Date certifydate;
	
	//기본생성자 없이 불러오면 no such method 익셉션
	public CertifyDB() {
		
	}
	
	public CertifyDB(Certify cer, String path) throws IllegalStateException, IOException {
		this.email = cer.getEmail();
		
		this.certifyimg="";
		int start = 0;
		for(int i=0; i<cer.getImg().length; i++) {
			Random random = new Random();
			long currentTime = System.currentTimeMillis();
			int randomValue = random.nextInt(50);
			
			if(!cer.getImg()[i].getOriginalFilename().equals("")) {
				start++;
				String imgPath = Long.toString(currentTime) + "_"+randomValue+"_"+cer.getImg()[i].getOriginalFilename();
				
				File file = new File(path , imgPath);
				cer.getImg()[i].transferTo(file);
				if(start==1) {
					this.certifyimg=file.getName();
				}else {
					this.certifyimg=this.certifyimg.concat("*"+file.getName());
				}
				}
			}
	}
	
	public void setEmail(String email) {
		this.email= email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setCertifyimg(String certifyimg) {
		this.certifyimg= certifyimg;
	}
	public String getCertifyimg() {
		return certifyimg;
	}
	
	public void setCertifydate(Date certifydate) {
		this.certifydate = certifydate;
	}
	public Date getCertifydate() {
		return certifydate;
	}
}
