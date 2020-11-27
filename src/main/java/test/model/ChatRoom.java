package test.model;

public class ChatRoom {
	int chatroom_id;
	
	String user_id;
	String tutor_id;
	
	String class_id;
	
	public void setChatroom_id(int chatroom_id) {
		this.chatroom_id=chatroom_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id=user_id;
	}
	public void setTutor_id(String tutor_id) {
		this.tutor_id=tutor_id;
	}
	public void setClass_id(String class_id) {
		this.class_id=class_id;
	}
	
	public int getChatroom_id() {
		return chatroom_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getTutor_id() {
		return tutor_id;
	}
	public String getClass_id() {
		return class_id;
	}
}
