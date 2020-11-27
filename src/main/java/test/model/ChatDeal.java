package test.model;

import java.util.Date;

public class ChatDeal {
	
	private int id;
	
	private String email;
	private String name;
	private String chatroom_id;
	private String customer;
	private String cate;
	private int lessonCount;
	private String lessonTime;
	private int price;
	private Date startDay;
	private Date endDay;
	private String startDate;
	private String endDate;
	private String moreDetail;
	private String permit;
	
	
	public int getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	public String getName() {
		return name;
	}
	public String getChatroom_id() {
		return chatroom_id;
	}
	public String getCustomer() {
		return customer;
		
	}
	public String getCate() {
		return cate;
	}
	public int getLessonCount() {
		return lessonCount;
	}
	public String getLessonTime() {
		return lessonTime;
	}
	public int getPrice() {
		return price;
	}
	public Date getStartDay() {
		return startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public String getStartDate() {
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getMoreDetail() {
		return moreDetail;
	}
	public String getPermit() {
		return permit;
	}
	
	
	
	public void setId(int id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public void setLessonCount(int lessonCount) {
		this.lessonCount = lessonCount;
	}
	public void setLessonTime(String lessonTime) {
		this.lessonTime = lessonTime;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setMoreDetail(String moreDetail){
		this.moreDetail= moreDetail;
	}
	public void setPermit(String permit){
		this.permit= permit;
	}
	
	
}
