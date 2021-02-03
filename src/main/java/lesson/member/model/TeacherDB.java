package lesson.member.model;

import java.io.File;
import java.io.IOException;
import java.util.Random;

public class TeacherDB {
	private String email;
	private String imgPath;
	private String locales;
	private String sexual;
	private String universe;
	private String universer;
	private String career;
	private String univsub;
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
	
	public TeacherDB() {
		
	}
	public TeacherDB(TeacherInfo tea, String path) throws IllegalStateException, IOException {
		this.email = tea.getEmail();
		this.locales = tea.getLocales();
		this.universe=tea.getUniverse();
		this.universer = tea.getUniverser();
		this.career = tea.getCareer();
		this.univsub = tea.getUnivsub();
		this.sexual = tea.getSexual();
		
		this.academy=tea.getAcademy();
		this.academyd=tea.getAcademyd();
		this.nation=tea.getNation();
		
		if(tea.getNationy().equals("")) {
			this.nationy=null;
		}else {
			this.nationy=tea.getNationy();
		}
		if(tea.getToeic().equals("")) {
			this.toeic=null;
		}else {
			this.toeic=tea.getToeic();
		}
		if(tea.getTofle().equals("")) {
			this.tofle=null;
		}else {
			this.tofle=tea.getTofle();
		}
		if(tea.getTeps().equals("")) {
			this.teps=null;
		}else {
			this.teps=tea.getTeps();
		}
		if(tea.getHsk().equals("")) {
			this.hsk=null;
		}else {
			this.hsk=tea.getHsk();
		}
		if(tea.getJpt().equals("")) {
			this.jpt=null;
		}else {
			this.jpt=tea.getJpt();
		}
		
		this.singular=tea.getSingular();
		
		
		Random random = new Random();
		long currentTime = System.currentTimeMillis();
		int randomValue = random.nextInt(50);
		
		if(tea.getImg().getOriginalFilename().equals("")) {
			this.imgPath = "pro.png";
		}
		else {
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_"+tea.getImg().getOriginalFilename();
		
		File file = new File(path , fileName);
		tea.getImg().transferTo(file);
		this.imgPath = file.getName();
		}
	}
	
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
	
	public void setImgPath(String imgPath) {
		this.imgPath=imgPath;
	}
	public String getImgPath() {
		return imgPath;
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
