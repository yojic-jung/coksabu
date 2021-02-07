package com.coksabu.yojic.lesson.chat.model;

import java.util.Date;

import com.google.gson.Gson;

public class Message {
	int message_id;
	int chatroom_id;
	
	String message_sender;
	String message_receiver;
	String message_content;
	Date message_time;
	String message_time2;
	
	int message_read;
	String message_read2;
	
	int unReadCount;
	
	public void setMessage_id(int message_id) {
		this.message_id= message_id;
	}
	
	public void setMessage_sender(String message_sender) {
		this.message_sender=message_sender;
	}
	public void setMessage_content(String message_content) {
		this.message_content=message_content;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver=message_receiver;
	}
	public void setChatroom_id(int chatroom_id) {
		this.chatroom_id=chatroom_id;
	}
	public void setMessage_time(Date message_time) {
		this.message_time=message_time;
	}
	public void setMessage_time2(String message_time2) {
		this.message_time2=message_time2;
	}
	public void setMessage_read(int message_read) {
		this.message_read=message_read;
	}
	public void setMessage_read2(String message_read2) {
		this.message_read2=message_read2;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount=unReadCount;
	}
	
	
	public String getMessage_sender() {
		return message_sender;
	}
	public String getMessage_content() {
		return message_content;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public int getChatroom_id() {
		return chatroom_id;
	}
	public int getMessage_id() {
		return message_id;
	}
	public Date getMessage_time() {
		return message_time;
	}
	public String getMessage_time2() {
		return message_time2;
	}
	public int getMessage_read() {
		return this.message_read;
	}
	public String getMessage_read2() {
		return this.message_read2;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
		
	public static Message convertMessage(String source) {
		Message message = new Message();
		Gson gson = new Gson();
		message = gson.fromJson(source,  Message.class);
		return message;
	}
}
