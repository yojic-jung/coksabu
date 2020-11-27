package test.model;

import java.util.Date;

public class ChatPurchase {
	
	private int id;
	
	private String email;
	
	private String orderstatus;
	private int proposal_id;
	
	private String seller;
	private String sellerName;
	private String buyer;
	private String buyerName;
	
	private String name;
	private String chatroom_id;
	private String customer;
	private String cate;
	private String subCate;
	private int lessonCount;
	private String lessonTime;
	private int price;
	private String startDate;
	private String endDate;
	private Date startDay;
	private Date endDay;
	private String moreDetail;
	private String permit;
	private Date purchase_day;
	private String purchase_dayS;
	private String bank;
	private String depositor;
	
	public int getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public int getProposal_id() {
		return proposal_id;
	}
	
	public String getSeller() {
		return seller;
	}
	public String getSellerName() {
		return sellerName;
	}
	public String getBuyer() {
		return buyer;
	}
	public String getBuyerName() {
		return buyerName;
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
	public String getSubCate() {
		return subCate;
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
	public String getStartDate() {
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public Date getStartDay() {
		return startDay;
	}
	public Date getEndDay() {
		return endDay;
	}
	public String getMoreDetail() {
		return moreDetail;
	}
	public String getPermit() {
		return permit;
	}
	public Date getPurchase_day() {
		return purchase_day;
	}
	public String getPurchase_dayS() {
		return purchase_dayS;
	}
	public String getBank() {
		return bank;
	}
	public String getDepositor() {
		return depositor;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public void setProposal_id(int proposal_id) {
		this.proposal_id = proposal_id;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
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
	public void setSubCate(String subCate) {
		this.subCate = subCate;
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
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	public void setMoreDetail(String moreDetail){
		this.moreDetail= moreDetail;
	}
	public void setPermit(String permit){
		this.permit= permit;
	}
	public void setPurchase_day(Date purchase_day){
		this.purchase_day= purchase_day;
	}
	public void setPurchase_dayS(String purchase_dayS){
		this.purchase_dayS= purchase_dayS;
	}
	
	public void setBank(String bank){
		this.bank= bank;
	}
	public void setDepositor(String depositor){
		this.depositor = depositor;
	}
}
