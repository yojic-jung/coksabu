package lesson.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;
import lesson.member.model.UnivList;
//통과
public class UnivSearchService {
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao=memberDao;
	}
	
	
	public static final int COUNT_PER_PAGE = 12;
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> list(int pageNumber, String univinput) {
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}
		
		int totalcount = memberDao.univCount(univinput);
		List<String> list;
		HashMap<String, Object> map = new HashMap<>();
		
		if(totalcount !=0) {
			int totalPageCount = calculateTotalPageCount(totalcount);
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalcount)
				endRow = totalcount;
			
			map.put("universe", univinput);
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
			
			list = memberDao.univSearch(map);
			
			
			
			UnivList univList = new UnivList(
					list, pageNumber, totalPageCount, firstRow, endRow);

			HashMap<String, Object> map2 = new HashMap<>();
			map2.put("univList", univList);
			return map2;	
			
			
		}else {
			UnivList univList=new UnivList();
			HashMap<String, Object> map3 = new HashMap<>();
			map3.put("univList", univList);
			return map3;
		}
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
