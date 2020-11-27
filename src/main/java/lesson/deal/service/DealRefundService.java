package lesson.deal.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.deal.dao.DealDao;
import lesson.deal.model.RefundComplete;
import lesson.deal.model.RefundContent;

public class DealRefundService {
	
	private DealDao dealDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(DealRefundService.class);
	
	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public RefundContent myRefundContent(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		int a = dealDao.countMyRefundContent(map);
		if(a==0) {
			return null;
		}
		return dealDao.myRefundContent(map);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void writeRefund(RefundContent content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", content.getOrderId());
		map.put("email", content.getApplicant());
		int a = dealDao.countMyRefundContent(map);
		
		String myName = dealDao.myName(content.getApplicant());
		content.setApplicantname(myName);
		
		content.setOrderStatus("환불대기");
		if(a==0) {
			logger.info("인서트로 들어옴");
			dealDao.insertRefund(content);
		}else {
			logger.info("업데이트로 들어옴");
			dealDao.updateRefund(content);
		}
		map.put("orderstatus", "환불대기");
		dealDao.updateOrderstatus(map);
		
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public RefundContent proMyRefundContent(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		int a = dealDao.proCountMyRefundContent(map);
		if(a==0) {
			return null;
		}
		return dealDao.proMyRefundContent(map);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void proWriteRefund(RefundContent content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", content.getOrderId());
		map.put("email", content.getApplicant());
		int a = dealDao.proCountMyRefundContent(map);
		
		String myName = dealDao.myName(content.getApplicant());
		content.setApplicantname(myName);
		
		content.setOrderStatus("환불대기");
		if(a==0) {
			logger.info("인서트로 들어옴");
			dealDao.insertProRefund(content);
		}else {
			logger.info("업데이트로 들어옴");
			dealDao.updateProRefund(content);
		}
		map.put("orderstatus", "환불대기");
		dealDao.updateProOrderstatus(map);
		
	}
	
	public void orderCancel(int orderId,String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("orderstatus", "주문취소");
		map.put("nowstatus", "입금대기");
		map.put("email", email);
		dealDao.orderCancel(map);
	}
	
	
	public void proposalOrderCancel(int orderId,String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("orderstatus", "주문취소");
		map.put("nowstatus", "입금대기");
		map.put("email", email);
		dealDao.proposalOrderCancel(map);
	}
	
	
	public RefundComplete buyerRefundCompleteInfo(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		RefundComplete content = dealDao.buyerRefundCompleteInfo(map);
		return content;
		
	}
	
	public RefundComplete sellerRefundCompleteInfo(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		RefundComplete content = dealDao.sellerRefundCompleteInfo(map);
		return content;
		
	}
	
	public RefundComplete buyerRefundCompletePro(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		RefundComplete content = dealDao.buyerRefundCompletePro(map);
		return content;
		
	}
	
	public RefundComplete sellerRefundCompletePro(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		RefundComplete content = dealDao.sellerRefundCompletePro(map);
		return content;
		
	}
	
}
