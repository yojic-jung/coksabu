package com.coksabu.yojic.lesson.contents.model;

import org.springframework.web.multipart.MultipartFile;

public class SummerNote {
	private String content;
	private MultipartFile img;
	
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public MultipartFile getImg() {
		return img;
	}
}
