package lesson.deal.service;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import lesson.board.model.PurchaseHistory;
import lesson.deal.dao.DealDao;

public class DealSaleService {
	
	private DealDao dealDao;
	
	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}

	
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
