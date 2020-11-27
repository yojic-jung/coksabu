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
	public int insertPurchaseHistory(PurchaseHistory pur, String buyerEmail, String postId) {
		
		String sellerEmail = boardDao.readEmail(postId);
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", sellerEmail);
		map.put("id", postId);
		map.put("subcate", pur.getSubcateIdx());
		PurchaseRead purchaseRead = boardDao.purchaseRead(map);
		pur.setSellerEmail(sellerEmail);
		pur.setSellerName(purchaseRead.getName());
		pur.setSellerPhone(purchaseRead.getPhone());
		
		String buyerName = boardDao.readBuyerName(buyerEmail);
		
		pur.setBuyerEmail(buyerEmail);
		pur.setBuyerName(buyerName);
		pur.setOrderDate(new Date());
		pur.setOrderstatus("입금대기");
		
		return boardDao.insertPurchaseHistory(pur);
	}
	
	public String success(String postId){
		String email = boardDao.readEmail(postId);
		return boardDao.takeSellerImg(email);
	}
	
}
