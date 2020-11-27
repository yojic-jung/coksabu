package lesson.deal.model;

import java.util.Date;

public class RefundContent {
	private int orderId;
	
	private String applicant;
	private String applicantname;
	private String refunddetail;
	private Date recordtime;
	private String recordtimeS;
	private String orderStatus;
	private String birth;
	
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
	public void setRefunddetail(String refunddetail) {
		this.refunddetail=refunddetail;
	}
	public String getRefunddetail() {
		return refunddetail;
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
	
}
