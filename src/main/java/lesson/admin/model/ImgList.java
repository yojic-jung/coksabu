package lesson.admin.model;

public class ImgList {
	private String name;
	private String birth;
	private String email;
	private String certifyimg1;
	private String certifyimg2;
	private String certifyimg3;
	private String universe;
	private String univsub;
	private String academy;
	private String academyd;
	
	
	public void setEmail(String email) {
		this.email= email;
	}
	public String getEmail() {
		return email;
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
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth=birth;
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
}
