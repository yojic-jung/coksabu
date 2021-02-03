package lesson.apply.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyForm;
import lesson.apply.model.ApplyList;
import lesson.apply.model.ApplySearchForm;

public class ListApplyService {
	
	ApplyDao applyDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(ListApplyService.class);
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	public static final int COUNT_PER_PAGE = 16;
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public ApplyList listPost(int pageNumber){
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}
			
			int totalPostCount = applyDao.countApply();
			if(totalPostCount == 0)
				return new ApplyList();
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
		
			List<ApplyForm> applyList = applyDao.listApplyForm(map);
			String name;
			for(ApplyForm apply : applyList ) {
				name = apply.getName().substring(0,1)+" O O";
				apply.setName(name);
			}
			
			ApplyList applyListView = new ApplyList(
					applyList, pageNumber, totalPageCount, firstRow, endRow);
			
			return applyListView;
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public ApplyList searchListPost(int pageNumber, ApplySearchForm form){
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}
			HashMap<String, Object> map = new HashMap<>();
			
			map.put("locale", form.getLocale());
			map.put("cate", form.getCate());
			map.put("grade", form.getGrade());
			map.put("sexual", form.getSexual());
		
			int totalPostCount = applyDao.countSearchApply(map);
			logger.info("지역"+form.getLocale()+"성별"+form.getSexual());
			logger.info("카테"+form.getCate()+"학년"+form.getGrade());
			if(totalPostCount == 0)
				return new ApplyList();
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
		
			List<ApplyForm> applyList = applyDao.listSearchApplyForm(map);
			String name;
			for(ApplyForm apply : applyList ) {
				name = apply.getName().substring(0,1)+" O O";
				apply.setName(name);
			}
			
			ApplyList applyListView = new ApplyList(
					applyList, pageNumber, totalPageCount, firstRow, endRow);
			
			return applyListView;
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
