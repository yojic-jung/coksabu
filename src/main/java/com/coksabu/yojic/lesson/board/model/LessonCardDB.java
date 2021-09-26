package com.coksabu.yojic.lesson.board.model;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

public class LessonCardDB {
	
	private int id;
	private String email;
	private String represent;
	private String cate;
	private String subCate;
	private String title;
	private String lesson;
	private String description;
	private Date postingdate;
	private int readCount;
	
	private String imgpath1;
	private String imgpath2;
	private String imgpath3;
	private String imgpath4;
	private String contentimg;
	
	private String careerDB;
	
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
	private int visible;
	
	private String priNegotiation;
	
	public LessonCardDB() {
		
	}
	
	public LessonCardDB(LessonCard card, String path) throws IllegalStateException, IOException {
		this.id = card.getId();
		this.email = card.getEmail();
		
		String cateString = card.getCate0();
		if(!card.getCate1().equals("nonevalue")) {
			cateString= cateString.concat(","+card.getCate1());
		}
		if(!card.getCate2().equals("nonevalue")) {
			cateString= cateString.concat(","+card.getCate2());
		}
		if(!card.getCate3().equals("nonevalue")) {
			cateString= cateString.concat(","+card.getCate1());
		}
		if(!card.getCate4().equals("nonevalue")) {
			cateString= cateString.concat(","+card.getCate4());
		}
		
		if(card.getSubCate1()==null) {
			card.setSubCate1("nonevalue");
		}
		if(card.getSubCate2()==null) {
			card.setSubCate2("nonevalue");
		}
		if(card.getSubCate3()==null) {
			card.setSubCate3("nonevalue");
		}
		if(card.getSubCate4()==null) {
			card.setSubCate4("nonevalue");
		}
		String subCateString = card.getSubCate0();
		if(!card.getSubCate1().equals("nonevalue")) {
			subCateString= subCateString.concat(","+card.getSubCate1());
		}
		if(!card.getSubCate2().equals("nonevalue")) {
			subCateString= subCateString.concat(","+card.getSubCate2());
		}
		if(!card.getSubCate3().equals("nonevalue")) {
			subCateString= subCateString.concat(","+card.getSubCate1());
		}
		if(!card.getSubCate4().equals("nonevalue")) {
			subCateString= subCateString.concat(","+card.getSubCate4());
		}
		
		
		this.cate=cateString;
		this.subCate=subCateString;
		this.title = card.getTitle();
		this.lesson=card.getLesson();
		this.description = card.getDescription();
		
		this.cate0 = card.getCate0();
		this.subCate0=card.getSubCate0();
		this.price1=card.getPrice1();
		this.price2=card.getPrice2();
		this.price3=card.getPrice3();
		
		this.cate1 = card.getCate1();
		this.subCate1=card.getSubCate1();
		this.opt1price1=card.getOpt1price1();
		this.opt1price2=card.getOpt1price2();
		this.opt1price3=card.getOpt1price3();
		
		this.cate2 = card.getCate2();
		this.subCate2=card.getSubCate2();
		this.opt2price1=card.getOpt2price1();
		this.opt2price2=card.getOpt2price2();
		this.opt2price3=card.getOpt2price3();
		
		this.cate3 = card.getCate3();
		this.subCate3=card.getSubCate3();
		this.opt3price1=card.getOpt3price1();
		this.opt3price2=card.getOpt3price2();
		this.opt3price3=card.getOpt3price3();
		
		this.cate4 = card.getCate4();
		this.subCate4=card.getSubCate4();
		this.opt4price1=card.getOpt4price1();
		this.opt4price2=card.getOpt4price2();
		this.opt4price3=card.getOpt4price3();
		
		this.day = card.getDay();
		this.gawe=card.getGawe();
		this.trial=card.getTrial();
		
		this.priNegotiation=card.getPriNegotiation();
		
		Random random1 = new Random();
		long currentTime1 = System.currentTimeMillis();
		int randomValue1 = random1.nextInt(100);
		if(card.getRepresent().getOriginalFilename().equals("")) {
			this.represent="pro.png";
		}else {
			String fileName = Long.toString(currentTime1) + "_"+randomValue1+"_"+card.getRepresent().getOriginalFilename();
			
			File file = new File(path+"/representImg" , fileName);
			card.getRepresent().transferTo(file);
			this.represent = file.getName();	
		}
		
		
		this.contentimg="";
		int start = 0;
		for(int i=0; i<card.getContentimg().length; i++) {
			Random random = new Random();
			long currentTime = System.currentTimeMillis();
			int randomValue = random.nextInt(100);
			
			if(!card.getContentimg()[i].getOriginalFilename().equals("")) {
				start++;
				String identity = Long.toString(currentTime) + "_"+randomValue+"_"+i+"_"+card.getContentimg()[i].getOriginalFilename();
				
				File file = new File(path+"/mediaImg" , identity);
				card.getContentimg()[i].transferTo(file);
				if(start==1) {
					this.contentimg=file.getName();
				}else {
					this.contentimg=this.contentimg.concat("*"+file.getName());
				}
				
				}
			}
		
	}
	
	public void setCareerDB(String[] ycareer) {
		if(ycareer==null) {
			this.careerDB=null;
		}else {
			String a="";
			for(int i=0; i<ycareer.length; i++) {
				if(i==ycareer.length-1) {
					a=a.concat(ycareer[i]);
				}else {
					a=a.concat(ycareer[i]+"*");
				}
			}
			this.careerDB=a;	
		}
	}
	public String getCareerDB() {
		return careerDB;
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
	
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setRepresent(String represent) {
		this.represent=represent;
	}
	public String getRepresent() {
		return represent;
	}
	
	public void setCate(String cate) {
		this.cate=cate;
	}
	public String getCate() {
		return cate;
	}
	
	public void setSubCate(String subCate) {
		this.subCate=subCate;
	}
	public String getSubCate() {
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
	
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescription() {
		return description;
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
	public void setContentimg(String contentimg) {
		this.contentimg = contentimg;
	}
	public String getContentimg() {
		return contentimg;
	}
	
	public Date getPostingdate() {
		return postingdate;
	}
	public void setPostingdate(Date postingdate) {
		this.postingdate = postingdate;
	}
	
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	public void setVisible(int visible) {
		this.visible=visible;
	}
	public int getVisible() {
		return visible;
	}
	
	public void setPriNegotiation(String priNegotiation) {
		this.priNegotiation=priNegotiation;
	}
	public String getPriNegotiation() {
		return priNegotiation;
	}
}
