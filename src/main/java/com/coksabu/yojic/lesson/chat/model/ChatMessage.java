package com.coksabu.yojic.lesson.chat.model;

import java.io.Serializable;
import java.util.Date;

import com.coksabu.yojic.lesson.chat.util.UnixEpochDateTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ChatMessage implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 651235421598L;
	
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
	
	String message_type;
	
	String topic;
	
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
	public void setMessage_type(String message_type) {
		this.message_type=message_type;
	}
	
	public void setTopic(String topic) {
		this.topic=topic;
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
	public String getMessage_type() {
		return this.message_type;
	}
	public String getTopic() {
		return this.topic;
	}
	
	public static ChatMessage convertMessage(String source) {
		ChatMessage message = new ChatMessage();
		final Gson gson = new GsonBuilder()
		        .registerTypeAdapter(Date.class, UnixEpochDateTypeAdapter.getUnixEpochDateTypeAdapter())
		        .create();
		message = gson.fromJson(source,  ChatMessage.class);
		return message;
	}
	
	@Override
    public String toString() {
        return String.format("ChatMessage{message_id='%s', chatroom_id='%s', message_sender='%s', message_receiver='%s', message_content='%s', "
        		+ "message_time='%s', message_time2='%s', message_read='%s', message_read2='%s',"
        		+ "unReadCount='%s', message_type='%s', message_type='%s'}"
        		,
        		message_id, chatroom_id, message_sender, message_receiver, message_content,
        		message_time, message_time2, message_read, message_read2,
        		unReadCount, message_type, message_type);
    }
	
}
