package lesson.deal.service;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import lesson.board.model.PostView;
import lesson.board.model.PurchaseHistory;
import lesson.deal.dao.DealDao;
import lesson.deal.model.PurchaseListSearch;
import test.model.ChatPurchase;
import test.model.ImgUploadDB;

public class DealPurchaseService {
	private DealDao dealDao;
	
	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}
	
	
	public List<PurchaseHistory> myPurchaseList(String email) {
		List<PurchaseHistory> list = dealDao.myPurchaseList(email);
		
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setOrderDateJ(sdf.format(purchase.getOrderDate()));
			purchase.setStartDateS(sdf.format(purchase.getStartDate()));
			purchase.setEndDateS(sdf.format(purchase.getEndDate()));
		}
		
		
		return list;
	}
	
public List<PurchaseHistory> myPurchaseList2(PurchaseListSearch search, String email) {
		String firstDate = search.getFirstDateJ().trim().replace(".", "-");
		String lastDate = search.getLastDateJ().trim().replace(".", "-");
		
		search.setFirstDateJ(firstDate );
		search.setLastDateJ(lastDate);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("email",email);
		map.put("orderStatus",search.getOrderStatus());
		map.put("firstDate",search.getFirstDateJ());
		map.put("lastDate",search.getLastDateJ());
		
		List<PurchaseHistory> list = dealDao.myPurchaseListSearch(map);
		
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setOrderDateJ(sdf.format(purchase.getOrderDate()));
			purchase.setStartDateS(sdf.format(purchase.getStartDate()));
			purchase.setEndDateS(sdf.format(purchase.getEndDate()));
		}
		
		return list;
	}
	
public int wishlist(String email, String postId) {
	HashMap<String, Object> map = new HashMap<>();
	map.put("email", email);
	map.put("postId", postId);
	int count = dealDao.confirmWishList(email);
	int wish = dealDao.takeWish(map);
	
	if(wish==1) {
		return 1;
	}else {
		if(count==8) {
			return count;
		}else {
			map.put("wishdate", new Date() );
			dealDao.insertWishList(map);
			return 0;
		}
	}
	
	
	
}

public List<PostView> myWishList(String email){
	 List<Integer> postId = dealDao.myWishId(email);
	 
	 if(postId.size()==0) {
		 List<PostView> list = new ArrayList<>();
		 return list;
	 }else {
		 List<PostView> list =  dealDao.myWishList(postId);	 
		 
		 for(Iterator<PostView> itr = list.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
			}
		 
		 return list;
	 }
	
}
	
	public PurchaseHistory orderInfo(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		
		PurchaseHistory pur = dealDao.orderInfo(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		pur.setOrderDateJ(sdf.format(pur.getOrderDate()));
		pur.setStartDateS(sdf.format(pur.getStartDate()));
		pur.setEndDateS(sdf.format(pur.getEndDate()));
		return pur;
	}

	public ChatPurchase sellerProposalOrderInfo(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		
		ChatPurchase pur = dealDao.sellerProposalOrderInfo(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
		return pur;
	}
	
	public ChatPurchase proposalOrderInfo(int orderId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("orderId", orderId);
		map.put("email", email);
		
		ChatPurchase pur = dealDao.proposalOrderInfo(map);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
		return pur;
	}
	
	public int deleteWish(String postId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("postId", postId);
		map.put("email", email);
		int wishId = dealDao.takeWishId(map);
		return dealDao.deleteWish(wishId);
	}

	public void testImgUpload(ImgUploadDB img) {
		dealDao.testImgUpload(img);
	}
	
	public String takeImgPath() {
		return dealDao.takeImgPath();
	}
	
}
