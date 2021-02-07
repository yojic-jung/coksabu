package com.coksabu.yojic.lesson.deal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.deal.dao.DealDao;

@Service
public class MyCunsultListService {
	
	@Autowired
	private DealDao dealDao;
	
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
