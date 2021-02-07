package com.coksabu.yojic.lesson.deal.service;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.board.model.PurchaseHistory;
import com.coksabu.yojic.lesson.deal.dao.DealDao;

@Service
public class DealSaleService {
	
	@Autowired
	private DealDao dealDao;
	
	public int confirmProfileCount(String email) {
		return dealDao.countProfile(email);
	}
	
	public List<PurchaseHistory> mySaleList(String email) {
		List<PurchaseHistory> list = dealDao.mySaleList(email);
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setOrderDateJ(sdf.format(purchase.getOrderDate()));
			purchase.setStartDateS(sdf.format(purchase.getStartDate()));
			purchase.setEndDateS(sdf.format(purchase.getEndDate()));
		}
		
		return list;
	}


}
