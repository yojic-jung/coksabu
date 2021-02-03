package lesson.board.service;

import java.util.Date;
import java.util.HashMap;

import org.springframework.transaction.annotation.Transactional;

import lesson.board.dao.BoardDao;
import lesson.board.model.PurchaseHistory;
import lesson.board.model.PurchaseRead;
//수정필요
public class PurchaseService {

	BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public PurchaseRead purchaseRead(String id, String subcate) {
		String email = boardDao.readEmail(id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("id", id);
		map.put("subcate", subcate);
		return boardDao.purchaseRead(map);
	}
	
	public String phone(String email) {
		return boardDao.phoneNumber(email);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> insertPurchaseHistory(PurchaseHistory pur, String buyerEmail, String postId) {
		
		String sellerEmail = boardDao.readEmail(postId);
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", sellerEmail);
		map.put("id", postId);
		map.put("subcate", pur.getSubcateIdx());
		PurchaseRead purchaseRead = boardDao.purchaseRead(map);
		pur.setSellerEmail(sellerEmail);
		pur.setSellerName(purchaseRead.getName());
		pur.setSellerNickname(purchaseRead.getNickname());
		pur.setSellerPhone(purchaseRead.getPhone());
		
		String buyerName = boardDao.readBuyerName(buyerEmail);
		
		pur.setBuyerEmail(buyerEmail);
		pur.setBuyerName(buyerName);
		pur.setOrderDate(new Date());
		pur.setOrderstatus("입금대기");
		int success = boardDao.insertPurchaseHistory(pur);
		if(success==1) {
			map.put("status","success");
		}else {
			map.put("status","fail");
		}
		return map;
	}
	
	public String success(String email){
		return boardDao.takeSellerImg(email);
	}
	
}
