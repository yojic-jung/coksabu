package lesson.deal.model;

import java.util.Collections;
import java.util.List;

import lesson.board.model.CunsultForm;

public class CunsultList {
	
	private List<CunsultForm> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public CunsultList() {
		this(Collections.<CunsultForm>emptyList(),0,0,0,0);
	}
	
	public CunsultList(List<CunsultForm> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<CunsultForm> getList() {
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
