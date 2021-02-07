package com.coksabu.yojic.lesson.member.model;

import java.util.Date;

public class Qna {
	private String email;
	private String title;
	private String content;
	private Date date;
	private String dateJ;
	private int visible;
	private int id;
	private String answer;
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	public String getTitle() {
		return title;
	}
	
	public void setContent(String content) {
		this.content=content;
	}
	public String getContent() {
		return content;
	}
	
	public void setDate(Date date) {
		this.date=date;
	}
	public Date getDate() {
		return date;
	}
	
	public void setDateJ(String dateJ) {
		this.dateJ=dateJ;
	}
	public String getDateJ() {
		return dateJ;
	}
	
	public void setVisible(int visible) {
		this.visible=visible;
	}
	public int getVisible() {
		return visible;
	}
	
	public void setId(int id) {
		this.id=id;
	}
	public int getId() {
		return id;
	}
	
	public void setAnswer(String answer) {
		this.answer=answer;
	}
	public String getAnswer() {
		return answer;
	}
	
}

