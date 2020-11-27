package lesson.board.model;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

public class LessonCardDB {
	
	private String id;
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
	
	private String day;
	private String gawe;
	private String trial;
	private int visible;
	
	public LessonCardDB() {
		
	}
	
	public LessonCardDB(LessonCard card, String path) throws IllegalStateException, IOException {
		this.id = card.getId();
		this.email = card.getEmail();
		this.cate=card.getCate();
		
		String a = card.getSubCate0();
		
		if(!card.getSubCate1().equals("nonevalue")) {
			a= a.concat(","+card.getSubCate1());
		}else {
			
		}
		
		if(!card.getSubCate2().equals("nonevalue")) {
			a= a.concat(","+card.getSubCate2());
		}else {
			
		}
		
		this.subCate=a;
		this.title = card.getTitle();
		this.lesson=card.getLesson();
		this.description = card.getDescription();
		
		this.subCate0=card.getSubCate0();
		this.price1=card.getPrice1();
		this.price2=card.getPrice2();
		this.price3=card.getPrice3();
		
		this.subCate1=card.getSubCate1();
		this.opt1price1=card.getOpt1price1();
		this.opt1price2=card.getOpt1price2();
		this.opt1price3=card.getOpt1price3();
		
		this.subCate2=card.getSubCate2();
		this.opt2price1=card.getOpt2price1();
		this.opt2price2=card.getOpt2price2();
		this.opt2price3=card.getOpt2price3();
		
		
		this.day = card.getDay();
		this.gawe=card.getGawe();
		this.trial=card.getTrial();
		
		Random random1 = new Random();
		long currentTime1 = System.currentTimeMillis();
		int randomValue1 = random1.nextInt(50);
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
			int randomValue = random.nextInt(50);
			
			if(!card.getContentimg()[i].getOriginalFilename().equals("")) {
				start++;
				String identity = Long.toString(currentTime) + "_"+randomValue+"_"+card.getContentimg()[i].getOriginalFilename();
				
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
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	
}
