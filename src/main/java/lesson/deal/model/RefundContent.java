package lesson.deal.model;

import java.util.Date;

public class RefundContent {
	private int orderId;
	
	private String applicant;
	private String applicantname;
	private Date recordtime;
	private String recordtimeS;
	private String orderStatus;
	private String birth;
	private int processCount;
	private int remainCount;
	
	private String content;
	private String phone;
	private String account;
	
	
	public void setOrderId(int orderId) {
		this.orderId=orderId;
	}
	public int getOrderId() {
		return orderId;
	}
	
	
	public void setApplicant(String applicant) {
		this.applicant=applicant;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicantname(String applicantname) {
		this.applicantname=applicantname;
	}
	public String getApplicantname() {
		return applicantname;
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
	public void setOrderStatus(String orderStatus) {
		this.orderStatus=orderStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	
	public void setBirth(String birth) {
		this.birth=birth;
	}
	public String getBirth() {
		return birth;
	}
	
	public void setProcessCount (int processCount ) {
		this.processCount =processCount ;
	}
	public int getProcessCount () {
		return processCount ;
	}
	
	
	public void setRemainCount(int remainCount) {
		this.remainCount=remainCount;
	}
	public int getRemainCount() {
		return remainCount;
	}
	
	public void setContent(String content) {
		this.content=content;
	}
	public String getContent() {
		return content;
	}
	
	public void setPhone(String phone) {
		this.phone=phone;
	}
	public String getPhone() {
		return phone;
	}
	
	public void setAccount (String account ) {
		this.account =account;
	}
	public String getAccount () {
		return account ;
	}
}
