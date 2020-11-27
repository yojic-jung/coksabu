package lesson.apply.model;

import java.util.Collections;
import java.util.List;

public class ApplyList {
	
	private List<ApplyForm> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public ApplyList() {
		this(Collections.<ApplyForm>emptyList(),0,0,0,0);
	}
	public ApplyList(List<ApplyForm> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<ApplyForm> getList() {
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
