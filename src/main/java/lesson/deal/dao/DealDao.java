package lesson.deal.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import lesson.board.model.PostView;
import lesson.board.model.PurchaseHistory;
import lesson.deal.model.RefundComplete;
import lesson.deal.model.RefundContent;
import test.model.ChatPurchase;
import test.model.ImgUploadDB;

@Repository
public interface DealDao {
	
	public int countProfile(String email);
	
	public int countLesson(String email);
	
	public int countMyPurchaseList(String email);
	
	public List<PurchaseHistory> myPurchaseList(String email);
	
	public int countMyPurchaseListSearch(HashMap<String, Object> map);
	
	public List<PurchaseHistory> myPurchaseListSearch(HashMap<String, Object> map);
	
	public int deleteWish(int wishId);
	
	public int confirmWishList(String email);
	
	public int takeWish(HashMap<String, Object> map);
	
	public int insertWishList(HashMap<String, Object> map);
	
	public List<Integer> myWishId(String email);
	
	public List<PostView> myWishList(List<Integer> item);
	
	public List<Integer> myLessonId(String email);
	
	public int countMySaleList(String email);
	
	public List<PurchaseHistory> mySaleList(String email);
	
	public void testImgUpload(ImgUploadDB img);
	
	public String takeImgPath();
	
	public int countMyRefundContent(HashMap<String, Object> map);
	
	public RefundContent myRefundContent(HashMap<String, Object> map);
	
	public String myName(String email);
	
	public void insertRefund(RefundContent content);
	
	public void updateRefund(RefundContent content);
	
	public void updateOrderstatus(HashMap<String, Object> map);
	
	public PurchaseHistory orderInfo(HashMap<String, Object> map);
	
	public ChatPurchase sellerProposalOrderInfo(HashMap<String, Object> map);
	
	public ChatPurchase proposalOrderInfo(HashMap<String, Object> map);
	
	public int orderCancel(HashMap<String, Object> map);
	
	public int proposalOrderCancel(HashMap<String, Object> map);
	
	public RefundComplete buyerRefundCompleteInfo(HashMap<String, Object> map);
	
	public RefundComplete sellerRefundCompleteInfo(HashMap<String, Object> map);
	
	public RefundComplete buyerRefundCompletePro(HashMap<String, Object> map);
	
	public RefundComplete sellerRefundCompletePro(HashMap<String, Object> map);
	
	public int proCountMyRefundContent(HashMap<String, Object> map);
	
	public RefundContent proMyRefundContent(HashMap<String, Object> map);
	
	public void insertProRefund(RefundContent content);
	
	public void updateProRefund(RefundContent content);
	
	public void updateProOrderstatus(HashMap<String, Object> map);	
	
	public int takeWishId(HashMap<String, Object> map);
	
}
