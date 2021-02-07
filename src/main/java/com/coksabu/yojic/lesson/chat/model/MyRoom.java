package com.coksabu.yojic.lesson.chat.model;

public class MyRoom {
	String id;
	String user;
	String name;
	String lasttime;
	
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	
	public void setUser(String user) {
		this.user= user;
	}
	public String getUser() {
		return user;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	public void setLasttime(String lasttime) {
		this.lasttime=lasttime;
	}
	public String getLasttime() {
		return lasttime;
	}
	
}
