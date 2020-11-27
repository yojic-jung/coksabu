package lesson.member.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Certify {
	private String email;
	private MultipartFile img[];
	private Date certifydate;
	
	public void setEmail(String email) {
		this.email= email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setImg(MultipartFile img[]) {
		this.img= img;
	}
	public MultipartFile[] getImg() {
		return img;
	}
	
	
	public void setCertifydate(Date certifydate) {
		this.certifydate = certifydate;
	}
	public Date getCertifydate() {
		return certifydate;
	}
}
