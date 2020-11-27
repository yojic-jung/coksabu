package lesson.member.model;


import java.util.Collections;
import java.util.List;

public class UnivList {
	
	private List<String> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public UnivList() {
		this(Collections.<String>emptyList(),0,0,0,0);
	}
	public UnivList(List<String> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<String> getList() {
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
