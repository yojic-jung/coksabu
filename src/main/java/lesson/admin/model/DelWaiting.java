package lesson.admin.model;

import java.util.Date;

public class DelWaiting {
	private int id;
	private int postId;
	private String email;
	private Date recordtime;
	private String recordtimeS;
	
	public void setId(int id) {
		this.id=id;
	}
	public int getId() {
		return id;
	}
	
	public void setPostId(int postId) {
		this.postId=postId;
	}
	public int getPostId() {
		return postId;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	public String getEmail() {
		return email;
	}
	
	public void setRecordtime(Date recordtime) {
		this.recordtime=recordtime;
	}
	public Date getRecordtime() {
		return recordtime;
	}
	
	public void setRecordtimeS(String recordtimeS) {
		this.recordtimeS=recordtimeS;
	}
	public String getRecordtimeS() {
		return recordtimeS;
	}
}
