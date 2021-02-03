package lesson.member.model;

import java.util.Calendar;

public class Profile {
	private String email;
	private String birth;
	private String id;
	private String name;
	private String nickname;
	
	private String sexual;
	private String imgPath;
	private String locales;
	private String universe;
	private String univsub;
	private String universer;
	private String career;
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
	private int certify;
	
	private String lasttime;
	private int unReadCount;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		int bi = Integer.valueOf(birth.substring(0, 2));
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String years = Integer.toString(year);
		years=years.substring(years.length()-2, years.length());
		year = Integer.parseInt(years);
		if(bi>year) {
			this.birth= String.valueOf(year+101-bi).substring(0,1)+"0대";
		}else {
			this.birth= String.valueOf(year-bi+1).substring(0,1)+"0대";
		}
		
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	

	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
	
	public void setNickname(String nickname) {
		this.nickname=nickname;
	}
	public String getNickname() {
		return nickname;
	}
	
	
	public String getSexual() {
		return sexual;
	}
	public void setSexua(String sexual) {
		this.sexual=sexual;
	}
	
	
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgPath() {
		return imgPath;
	}
	
	public void setLocales(String locales) {
		this.locales=locales;
	}
	
	public String getLocales() {
		return locales;
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
	
	public void setCertifyr(int certify) {
		this.certify=certify;
	}
	public int getCertify() {
		return certify;
	}
	
	public void setLasttime(String lasttime) {
		this.lasttime=lasttime;
	}
	public String getLasttime() {
		return lasttime;
	}
	
	public void setUnReadCount(int unReadCount) {
		this.unReadCount=unReadCount;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	
}
