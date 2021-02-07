package com.coksabu.yojic.lesson.chat.model;

import java.io.File;
import java.io.IOException;
import java.util.Random;

public class ImgUploadDB {
	
	private String img;
	
	public ImgUploadDB() {
	}
	
	public ImgUploadDB(ImgUpload img, String path) throws IllegalStateException, IOException {
		
		
		for(int i=0; i<img.getImg().length; i++) {
			Random random = new Random();
			long currentTime = System.currentTimeMillis();
			int randomValue = random.nextInt(50);
			if(!img.getImg()[i].getOriginalFilename().equals("")) {
				
				String identity = Long.toString(currentTime) + "_"+randomValue+"_"+img.getImg()[i].getOriginalFilename();
				
				File file = new File(path , identity);
				img.getImg()[i].transferTo(file);
				if(i==0) {
					this.img=file.getName();
				}else {
					this.img=this.img.concat("*"+file.getName());
				}
				
				}
			}
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	public String getImg() {
		return img;
	}
}
