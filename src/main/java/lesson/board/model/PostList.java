package lesson.board.model;

import java.util.Collections;
import java.util.List;

public class PostList {
	
	private List<PostView> list;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public PostList() {
		this(Collections.<PostView>emptyList(),0,0,0,0);
	}
	public PostList(List<PostView> list, int requestPage, int totalPageCount, int startRow, int endRow) {
		this.list=list;
		this.requestPage=requestPage;
		this.totalPageCount=totalPageCount;
		this.startRow=startRow;
		this.endRow=endRow;
	}
	public List<PostView> getList() {
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
