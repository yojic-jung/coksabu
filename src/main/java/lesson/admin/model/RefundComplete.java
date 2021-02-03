package lesson.admin.model;

import java.util.Date;

public class RefundComplete {
	
	private int id;
	private int orderId;
	private int progressLesson;
	private int remainLesson;
	private String price1;
	
	private String buyerEmail;
	private String buyerName;
	private String buyerBank;
	private String buyerAccount;
	private String buyerPrice;
	private String buyerAccountHolder;

	private String sellerEmail;
	private String sellerName;
	private String sellerBank;
	private String sellerAccount;
	private String sellerPrice;
	private String sellerAccountHolder;
	
	private String content;
	
	private String fees;
	private String finalPrice;
	
	private Date recordtime;
	private String recordtimeS;
	
	public void setId(int id){
		this.id=id;
	}
	public int getId() {
		return id;
	}
	
	public void setOrderId(int orderId){
		this.orderId=orderId;
	}
	public int getOrderId() {
		return orderId;
	}
	
	public void setProgressLesson(int progressLesson){
		this.progressLesson=progressLesson;
	}
	public int getProgressLesson() {
		return progressLesson;
	}
	
	public void setRemainLesson(int remainLesson){
		this.remainLesson=remainLesson;
	}
	public int getRemainLesson() {
		return remainLesson;
	}
	
	public void setPrice1(String price1){
		this.price1=price1;
	}
	public String getPrice1() {
		return price1;
	}
	
	
	public void setBuyerEmail(String buyerEmail){
		this.buyerEmail=buyerEmail;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerName(String buyerName){
		this.buyerName=buyerName;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerBank(String buyerBank){
		this.buyerBank=buyerBank;
	}
	public String getBuyerBank() {
		return buyerBank;
	}
	public void setBuyerAccount(String buyerAccount){
		this.buyerAccount=buyerAccount;
	}
	public String getBuyerAccount() {
		return buyerAccount;
	}
	public void setBuyerPrice(String buyerPrice){
		this.buyerPrice=buyerPrice;
	}
	public String getBuyerPrice() {
		return buyerPrice;
	}
	public void setBuyerAccountHolder(String buyerAccountHolder){
		this.buyerAccountHolder=buyerAccountHolder;
	}
	public String getBuyerAccountHolder() {
		return buyerAccountHolder;
	}
	
	
	
	public void setsellerEmail(String sellerEmail){
		this.sellerEmail=sellerEmail;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerName(String sellerName){
		this.sellerName=sellerName;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerBank(String sellerBank){
		this.sellerBank=sellerBank;
	}
	public String getSellerBank() {
		return sellerBank;
	}
	public void setSellerAccount(String sellerAccount){
		this.sellerAccount=sellerAccount;
	}
	public String getSellerAccount() {
		return sellerAccount;
	}
	public void setSellerPrice(String sellerPrice){
		this.sellerPrice=sellerPrice;
	}
	public String getSellerPrice() {
		return sellerPrice;
	}
	public void setSellerAccountHolder(String sellerAccountHolder){
		this.sellerAccountHolder=sellerAccountHolder;
	}
	public String getSellerAccountHolder() {
		return sellerAccountHolder;
	}
	
	
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	
	public void setFees(String fees) {
		this.fees = fees;
	}
	public String getFees() {
		return fees;
	}
	
	public void setFinalPrice(String finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getFinalPrice() {
		return finalPrice;
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
