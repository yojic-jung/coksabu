package com.coksabu.yojic.lesson.deal.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.board.model.PurchaseHistory;
import com.coksabu.yojic.lesson.chat.model.ChatPurchase;
import com.coksabu.yojic.lesson.deal.dao.DealDao;
import com.coksabu.yojic.lesson.deal.model.RefundComplete;
import com.coksabu.yojic.lesson.deal.model.RefundContent;

@Service
public class DealRefundService {
	
	@Autowired
	private DealDao dealDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(DealRefundService.class);
	
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> myRefundContent(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		
		PurchaseHistory pur = dealDao.takePurchaseEmail(orderId);
		
		
		//환불 당사자들이 아닌 다른 사람들이 url을 변경하여 정보를 볼수 없게 하기 위해서
		if(email.equals(pur.getBuyerEmail()) || email.equals(pur.getSellerEmail()) ) {
		}else {
			map.put("refund", null);
			map.put("applicant", "notAllowAccess");
			return map;
		}
		
		int a = dealDao.countMyRefundContent(map);
				
		
		//내가 신청한 환불내역이 없을때
		if(a==0) {
			
			int b = dealDao.countRefundContent(orderId);
			
			//내가 신청한 환불내역은 없지만 상대방이 환불요청한경우
			if(b==1) {
				//진행한 수업횟수, 남아있는 수업횟수만 가져오기
				RefundContent refund = dealDao.takeRefundContent(orderId);
				map.put("refund", refund);
				map.put("applicant", "counter");
				return map;
			
			//환불내역이 아에 없음
			}else {
				map.put("applicant", "noOne");
				map.put("refund", null);
				return map;
			}
			
		
		//내가 환불신청 당사자일때
		}else {
			RefundContent refund = dealDao.myRefundContent(map);
			map.put("applicant", "me");
			map.put("refund", refund);
			return map;
		}
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void writeRefund(RefundContent content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", content.getOrderId());
		map.put("email", content.getApplicant());
		String orderStatus = dealDao.takeOrderStatus(content.getOrderId());
		if(!orderStatus.equals("결제완료")) {
			return ;
		}
		int a = dealDao.countRefundContent(content.getOrderId());
		
		
		if(a==0) {
			String myName = dealDao.myName(content.getApplicant());
			content.setApplicantname(myName);
			content.setOrderStatus("환불대기");
			dealDao.insertRefund(content);
		}
		
		map.put("orderstatus", "환불대기");
		dealDao.updateOrderstatus(map);
		
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> proMyRefundContent(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		
		ChatPurchase pur = dealDao.takeProposalEmail(orderId);
		
		//환불 당사자들이 아닌 다른 사람들이 url을 변경하여 정보를 볼수 없게 하기 위해서
		if(email.equals(pur.getBuyer()) || email.equals(pur.getSeller()) ) {
		}else {
			map.put("refund", null);
			map.put("applicant", "notAllowAccess");
			return map;
		}
		
		int a = dealDao.proCountMyRefundContent(map);
		
		//내가 신청한 환불내역이 없을때
		if(a==0) {
			int b = dealDao.proCountRefundContent(orderId);
			
			//내가 신청한 환불내역은 없지만 상대방이 환불요청한경우
			if(b==1) {
				//진행한 수업횟수, 남아있는 수업횟수만 가져오기
				RefundContent refund = dealDao.takeProRefundContent(orderId);
				map.put("refund", refund);
				map.put("applicant", "counter");
				return map;
			
			//환불내역이 아에 없음
			}else {
				map.put("applicant", "noOne");
				map.put("refund", null);
				return map;
			}
		//내가 환불신청 당사자일때
		}else {
			RefundContent refund = dealDao.myProRefundContent(map);
			map.put("applicant", "me");
			map.put("refund", refund);
			return map;
		}
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void proWriteRefund(RefundContent content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", content.getOrderId());
		map.put("email", content.getApplicant());
		String orderStatus = dealDao.takeProOrderStatus(content.getOrderId());
		if(!orderStatus.equals("결제완료")) {
			return ;
		}
		
		int a = dealDao.proCountRefundContent(content.getOrderId());
		
		if(a==0) {
			String myName = dealDao.myName(content.getApplicant());
			content.setApplicantname(myName);
			content.setOrderStatus("환불대기");
			dealDao.insertProRefund(content);
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
