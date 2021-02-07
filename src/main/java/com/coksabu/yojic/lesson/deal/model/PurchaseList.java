package com.coksabu.yojic.lesson.deal.model;

import java.util.Collections;
import java.util.List;

import com.coksabu.yojic.lesson.board.model.PurchaseHistory;

public class PurchaseList {
	
	private List<PurchaseHistory> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public PurchaseList() {
		this(Collections.<PurchaseHistory>emptyList(),0,0,0,0);
	}
	
	public PurchaseList(List<PurchaseHistory> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<PurchaseHistory> getList() {
		return list;
	}
	public boolean isHasList() {
		return !list.isEmpty();
	}
	public int getRequestPage() {
		return requestPage;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getEndRow() {
		return endRow;
	}
}
