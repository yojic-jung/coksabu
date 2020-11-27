package lesson.deal.model;

import java.util.Date;

public class PurchaseListSearch {
	
	private String orderStatus;
	private Date firstDate;
	private Date lastDate;
	
	private String firstDateJ;
	private String lastDateJ;
	
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	
	public void setFirstDate(Date firstDate) {
		this.firstDate = firstDate;
	}
	public Date getFirstDate() {
		return firstDate;
	}
	
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	
	public void setFirstDateJ(String firstDateJ) {
		this.firstDateJ = firstDateJ;
	}
	public String getFirstDateJ() {
		return firstDateJ;
	}
	
	public void setLastDateJ(String lastDateJ) {
		this.lastDateJ = lastDateJ;
	}
	public String getLastDateJ() {
		return lastDateJ;
	}
}
