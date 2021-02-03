package lesson.board.model;

import java.util.Calendar;

public class PostView {
	private int id;
	private String email;
	private String phone;
	private String represent;
	private String name;
	private String nickname;
	private String birth;
	private String universe;
	private String univsub;
	private String sexual;
	private String career;
	private String cate;
	private String subcate;
	private String imgpath;
	private String imgpath1;
	private String imgpath2;
	private String imgpath3;
	private String imgpath4;
	private String title;
	
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
	
	private int readcount;
	private String locales;
	private String message;
	private int visible;
	
	public void setId(int id) {
		this.id=id;
	}
	public int getId() {
		return id;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setPhone(String phone) {
		this.phone=phone;
	}
	public String getPhone() {
		return phone;
	}
	
	public void setRepresent(String represent) {
		this.represent= represent;
	}
	public String getRepresent() {
		return represent;
	}
	
	public void setName(String name) {
		this.name= name;
	}
	public String getName() {
		return name;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname=nickname;
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
	public String getbirth() {
		return birth;
	}
	
	public void setUnivsub(String univsub) {
		this.univsub= univsub;
	}
	public String getUnivsub() {
		return univsub;
	}
	
	public void setUniverse(String universe) {
		this.universe= universe;
	}
	public String getUniverse() {
		return universe;
	}
	
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getSexual() {
		return sexual;
	}
	
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCareer() {
		return career;
	}
	
	public void setCate(String cate) {
		this.cate=cate;
	}
	public String getCate() {
		return cate;
	}
	
	public void setSubcate(String Subcate) {
		this.subcate=Subcate;
	}
	public String getSubcate() {
		return subcate;
	}
	
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getImgpath() {
		return imgpath;
	}
	
	public void setImgpath1(String imgpath1) {
		this.imgpath1 = imgpath1;
	}
	public String getImgpath1() {
		return imgpath1;
	}
	
	public void setImgpath2(String imgpath2) {
		this.imgpath2 = imgpath2;
	}
	public String getImgpath2() {
		return imgpath2;
	}
	
	public void setImgpath3(String imgpath3) {
		this.imgpath3 = imgpath3;
	}
	public String getImgpath3() {
		return imgpath3;
	}
	
	public void setImgpath4(String imgpath4) {
		this.imgpath4 = imgpath4;
	}
	public String getImgpath4() {
		return imgpath4;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
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
	
	public void setLocales(String locales) {
		this.locales = locales;
	}
	public String getLocales() {
		return locales;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getReadcount() {
		return readcount;
	}
	
	public void setMessage(String message) {
		this.message=message;
	}
	public String getMessage() {
		return message;
	}
	public void setVisible(int visible) {
		this.visible=visible;
	}
	public int getVisible() {
		return visible;
	}
}
