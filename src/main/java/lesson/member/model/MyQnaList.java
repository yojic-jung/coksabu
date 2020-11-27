package lesson.member.model;

import java.util.Collections;
import java.util.List;

public class MyQnaList {
	private List<Qna> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public MyQnaList() {
		this(Collections.<Qna>emptyList(),0,0,0,0);
	}
	public MyQnaList(List<Qna> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<Qna> getList() {
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
