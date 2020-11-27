package lesson.deal.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import lesson.board.model.CunsultForm;
import lesson.deal.dao.DealDao;
import lesson.deal.model.CunsultList;

public class MyCunsultListService {
	
	private DealDao dealDao;
	
	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}

	public static final int COUNT_PER_PAGE = 5;
	
	public int confirmProfileLesson(String email) {
		int a= dealDao.countProfile(email);
		if(a==0) {
			return a;
		}else {
			return dealDao.countLesson(email);
		}
		
	}	
	
	
public CunsultList studentCunsultForm(int pageNumber, String email) {
	
	
	if(pageNumber<0) {
		throw new IllegalArgumentException("page number < 0 : "+pageNumber);
	}
	
	int count = dealDao.countStudentCunsultForm(email);
	
	if(count == 0)
		return new CunsultList();
	
	int totalPageCount = calculateTotalPageCount(count);
	
	int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
	int endRow = firstRow + COUNT_PER_PAGE -1;
	
	if(endRow > count)
		endRow = count;
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	map.put("firstRow", firstRow-1);
	map.put("endRow", endRow-firstRow+1);
	map.put("email", email);
	
	List<CunsultForm> list = dealDao.myStudentCunsultForm(email);
	
	for(Iterator<CunsultForm> itr = list.iterator(); itr.hasNext();) {
		CunsultForm cunsult = itr.next();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		cunsult.setDateJ(sdf.format(cunsult.getDate()));
	}
	
	
	CunsultList cunsultList = new CunsultList(list, pageNumber, totalPageCount, firstRow, endRow);
	
	return cunsultList;
}

	private int calculateTotalPageCount(int totalPostCount) {
		
		if(totalPostCount == 0) {
			return 0;
		}
		
		int pageCount = totalPostCount / COUNT_PER_PAGE;
		if(totalPostCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
}

}
