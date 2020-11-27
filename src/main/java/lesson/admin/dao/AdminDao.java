package lesson.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import lesson.admin.model.DelWaiting;
import lesson.admin.model.ImgList;
import lesson.admin.model.OrderStatusRecord;
import lesson.admin.model.RefundComplete;
import lesson.admin.model.RefundSearch;
import lesson.admin.model.TranSearch;
import lesson.board.model.LessonCardDB;
import lesson.board.model.PurchaseHistory;
import lesson.deal.model.RefundContent;
import lesson.member.model.Qna;
import test.model.ChatPurchase;

@Repository
public interface AdminDao {
	
	public int checkId(String id);
	
	public int checkPassword(String password);
	
	public List<ImgList> imgList();
	
	public void inspectComplete(String email);
	
	public void inspectFail(String email);
	
	public void qualifyMembership(String email);
	
	public int certifyCount();
	
	public int countQna();
	
	public List<Qna> listQna(HashMap<String, Object> map);
	
	public int visibleQna(String id);

	public void qnaAnswer(Qna qna);
	
	public List<PurchaseHistory> adminTransaction(String status);

	public List<PurchaseHistory> adminTransaction2(TranSearch search);
	
	public List<ChatPurchase> adminChatTransaction(String status);
	
	public List<ChatPurchase> adminChatTransaction2(TranSearch search);
	
	public void updateOrderStatus(OrderStatusRecord statusRecord);
	
	public void updateOrderStatusPro(OrderStatusRecord statusRecord);
	
	public void updateProposalOrderStatus(OrderStatusRecord statusRecord);
	
	public void updateRefundOrderStatus(OrderStatusRecord statusRecord);
	
	public void updateRefundOrderStatusPro(OrderStatusRecord statusRecord);
	
	public void insertOrderStatusRecord(OrderStatusRecord statusRecord);
	
	public void insertProposalOrderStatusRecord(OrderStatusRecord statusRecord);
	
	public List<OrderStatusRecord> depositConfirmRecord();
	
	public List<OrderStatusRecord> depositConfirmRecord2(TranSearch search);
	
	public List<OrderStatusRecord> depositConfirmProposalRecord();
	
	public List<OrderStatusRecord> depositConfirmProposalRecord2(TranSearch search);
	
	public List<RefundContent> adminRefund(String orderstatus);
	
	public List<RefundContent> adminRefundSearch(RefundSearch search);
	
	public List<RefundComplete> adminRefundConfirm();
	
	public List<RefundComplete> adminRefundConfirm2(RefundSearch search);
	
	public List<RefundComplete> adminRefundConfirmPro();
	
	public List<RefundComplete> adminRefundConfirmPro2(RefundSearch search);
	
	public PurchaseHistory orderInfo(String id);
	
	public String takeOrderStatus(int orderId);
	
	public String takeOrderStatusProposal(int id);
	
	public void cancelDepositStatus(HashMap<String, Object> map);
	
	public void cancelDepositStatusProposal(HashMap<String, Object> map);
	
	public RefundContent refundContent(HashMap<String, Object> map);
	
	public int refundComplete(RefundComplete refund);
	
	public int refundCompletePro(RefundComplete refund);
	
	public List<String> takeBirthList(List<String> item);
	
	public RefundComplete refundCompleteInfo(String orderId);
	
	public RefundComplete refundProCompleteInfo(String orderId);
	
	public RefundContent refundListById(String orderId);
	
	public RefundContent refundProListById(String orderId);
	
	public void insertRefundCancel(RefundContent refund);
	
	public void deleteRefundList(String orderId);
	
	public void insertRefundProCancel(RefundContent refund);
	
	public void deleteRefundProList(String orderId);
	
	public List<RefundContent> adminRefundCancelList();
	
	public List<RefundContent> adminRefundProCancelList();
	
	public List<RefundContent> adminProRefund(String orderstatus);
	
	public List<RefundContent> adminProRefundSearch(RefundSearch search);
	
	public ChatPurchase orderInfoPro(String id);
	
	public RefundContent refundContentPro(HashMap<String, Object> map);
	
	public List<DelWaiting> delWaitingList();
	
	public List<PurchaseHistory> takePurchaseList(int postId);
	
	
	
	
	public LessonCardDB takeLesson(int postId);

	public void putDelLesson(LessonCardDB card);
	
	public int confirmApplyWish(int postId);
	
	public void deleteWishList(int postId);
	
	public void removeDelWaitingList(int id);
	
	public int deleteLesson(int postId);
	
}
