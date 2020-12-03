package lesson.deal.service;

import lesson.deal.dao.DealDao;

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
	
	

}
