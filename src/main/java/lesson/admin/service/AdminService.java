package lesson.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.admin.dao.AdminDao;
import lesson.admin.model.ImgList;
import lesson.admin.model.OrderStatusRecord;
import lesson.admin.model.QnaList;
import lesson.admin.model.RefundComplete;
import lesson.admin.model.RefundSearch;
import lesson.admin.model.TranSearch;
import lesson.board.model.PurchaseHistory;
import lesson.deal.model.RefundContent;
import lesson.member.model.Qna;
import test.model.ChatPurchase;

public class AdminService {
	
	AdminDao adminDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(AdminService.class);
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public List<ImgList> imgList() {
		return adminDao.imgList();
	}
	public void inspectComplete(String email) {
		
		adminDao.qualifyMembership(email);
		
		adminDao.inspectComplete(email);
	}
	
	public void inspectFail(String email) {
		adminDao.inspectFail(email);
	}
	public int certifyCount() {
		return adminDao.certifyCount();
	}
	
	public static final int COUNT_PER_PAGE = 4;
	
	@Transactional(rollbackFor= {Exception.class})
	public QnaList list(int pageNumber, String id) {
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}
			
		if(id!=null) {
			adminDao.visibleQna(id);
		}
			
			int totalPostCount = adminDao.countQna();
			if(totalPostCount == 0)
				return new QnaList();
			
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			HashMap<String, Object> map = new HashMap<>();
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
			
			List<Qna> qna = adminDao.listQna(map);
			
			QnaList qnaListView = new QnaList(qna, pageNumber, totalPageCount, firstRow, endRow);
			
			return qnaListView;
	}
	
	public void qnaAnswer(Qna qna) {
		adminDao.qnaAnswer(qna);
	}
	
	private int calculateTotalPageCount(int totalPostCount) {
		if(totalPostCount == 0) {
			return 0;
		}
		int pageCount = totalPostCount / COUNT_PER_PAGE;
		if(totalPostCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
	}
	
	public List<PurchaseHistory> adminTransaction() {
		List<PurchaseHistory> list = adminDao.adminTransaction("입금대기");
		
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setOrderDateJ(sdf.format(purchase.getOrderDate()));
			purchase.setStartDateS(sdf.format(purchase.getStartDate()));
			purchase.setEndDateS(sdf.format(purchase.getEndDate()));
		}
		
		return list;
	}
	
	public List<PurchaseHistory> adminTransaction2(TranSearch search) {
		String startDate = search.getStartDate().trim().replace(".", "-");
		String endDate = search.getEndDate().trim().replace(".", "-");
		
		search.setStartDate(startDate);
		search.setEndDate(endDate);
		
		List<PurchaseHistory> list = adminDao.adminTransaction2(search);
		
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setOrderDateJ(sdf.format(purchase.getOrderDate()));
			purchase.setStartDateS(sdf.format(purchase.getStartDate()));
			purchase.setEndDateS(sdf.format(purchase.getEndDate()));
		}
		
		return list;
	}
	
	
	public List<ChatPurchase> adminChatTransaction() {
		List<ChatPurchase> list = adminDao.adminChatTransaction("입금대기");
		
		for(Iterator<ChatPurchase> itr = list.iterator(); itr.hasNext();) {
			ChatPurchase purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setPurchase_dayS(sdf.format(purchase.getPurchase_day()));
			purchase.setBank(purchase.getBank().substring(0, 4));
		}
		
		return list;
	}
	
	
	public List<ChatPurchase> adminChatTransaction2(TranSearch search) {
		String startDate = search.getStartDate().trim().replace(".", "-");
		String endDate = search.getEndDate().trim().replace(".", "-");
		
		search.setStartDate(startDate);
		search.setEndDate(endDate);
		
		List<ChatPurchase> list = adminDao.adminChatTransaction2(search);
		
		for(Iterator<ChatPurchase> itr = list.iterator(); itr.hasNext();) {
			ChatPurchase purchase = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			purchase.setPurchase_dayS(sdf.format(purchase.getPurchase_day()));
			purchase.setBank(purchase.getBank().substring(0, 4));
		}
		
		return list;
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public void changeOrderStatus(OrderStatusRecord statusRecord) {
		statusRecord.setOrderstatus("결제완료");
		adminDao.updateOrderStatus(statusRecord);
		adminDao.insertOrderStatusRecord(statusRecord);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void changeProposalOrderStatus(OrderStatusRecord statusRecord) {
		statusRecord.setOrderstatus("결제완료");
		adminDao.updateProposalOrderStatus(statusRecord);
		adminDao.insertProposalOrderStatusRecord(statusRecord);
	}
	
	
	public String cancelDepositStatus(int orderId) {
		String orderstatus = (String)adminDao.takeOrderStatus(orderId);
		return orderstatus;
	}
	
	
	public String cancelDepositStatus2(int orderId) {
		String orderstatus = adminDao.takeOrderStatus(orderId);
		
		logger.info(orderstatus);
		if(orderstatus.equals("결제완료")) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("orderId", orderId);
			map.put("orderstatus", "입금대기");
			adminDao.cancelDepositStatus(map);
		}
		return orderstatus;
	}
	
	
	public String cancelStatusProposal(int id) {
		String orderstatus = (String)adminDao.takeOrderStatusProposal(id);
		return orderstatus;
	}
	
	
	public String cancelStatusProposal2(int id) {
		String orderstatus = adminDao.takeOrderStatusProposal(id);
		
		logger.info(orderstatus);
		if(orderstatus.equals("결제완료")) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("orderstatus", "입금대기");
			adminDao.cancelDepositStatusProposal(map);
		}
		return orderstatus;
	}
	
	public List<OrderStatusRecord> depositConfirmRecord() {
		List<OrderStatusRecord> list = adminDao.depositConfirmRecord();
		for(Iterator<OrderStatusRecord> itr = list.iterator(); itr.hasNext();) {
			OrderStatusRecord record = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:MM:SS");
			record.setRecordtimeS(sdf.format(record.getRecordtime()));
		}
		return list;
	}
	
	
	public List<OrderStatusRecord> depositConfirmRecord2(TranSearch search) {
		List<OrderStatusRecord> list = adminDao.depositConfirmRecord2(search);
		for(Iterator<OrderStatusRecord> itr = list.iterator(); itr.hasNext();) {
			OrderStatusRecord record = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:MM:SS");
			record.setRecordtimeS(sdf.format(record.getRecordtime()));
		}
		return list;
	}

	
	public List<OrderStatusRecord> depositConfirmProposalRecord() {
		List<OrderStatusRecord> list = adminDao.depositConfirmProposalRecord();
		for(Iterator<OrderStatusRecord> itr = list.iterator(); itr.hasNext();) {
			OrderStatusRecord record = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:MM:SS");
			record.setRecordtimeS(sdf.format(record.getRecordtime()));
		}
		return list;
	}
	
	public List<OrderStatusRecord> depositConfirmProposalRecord2(TranSearch search) {
		List<OrderStatusRecord> list = adminDao.depositConfirmProposalRecord2(search);
		for(Iterator<OrderStatusRecord> itr = list.iterator(); itr.hasNext();) {
			OrderStatusRecord record = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:MM:SS");
			record.setRecordtimeS(sdf.format(record.getRecordtime()));
		}
		return list;
	}
	
	public List<RefundContent> adminRefund() {
		List<RefundContent> list = adminDao.adminRefund("환불대기");
		
		List<String> emailList = new ArrayList<>();
		String email;
		for(int i=0; i<list.size(); i++) {
			email=list.get(i).getApplicant();
			emailList.add(email);
		}
		
		if(list.size()!=0) {
			List<String> birthList = adminDao.takeBirthList(emailList);
			
			for(int i=0; i<list.size(); i++) {
				list.get(i).setBirth(birthList.get(i));
			}
			
			for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
				RefundContent refund = itr.next();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
			}
		}
		
		
		return list;
	}
	
	
	public List<RefundContent> adminRefundSearch(RefundSearch search) {
		search.setOrderStatus("환불대기");
		List<RefundContent> list = adminDao.adminRefundSearch(search);
		
		if(list.size()!=0) {
			List<String> emailList = new ArrayList<>();
			String email;
			for(int i=0; i<list.size(); i++) {
				email=list.get(i).getApplicant();
				emailList.add(email);
			}
			
			List<String> birthList = adminDao.takeBirthList(emailList);
			
			for(int i=0; i<list.size(); i++) {
				list.get(i).setBirth(birthList.get(i));
			}
			
			for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
				RefundContent refund = itr.next();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
			}
		}
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	public List<RefundContent> adminProRefund() {
		List<RefundContent> list = adminDao.adminProRefund("환불대기");
		
		List<String> emailList = new ArrayList<>();
		String email;
		for(int i=0; i<list.size(); i++) {
			email=list.get(i).getApplicant();
			emailList.add(email);
		}
		
		if(list.size()!=0) {
			List<String> birthList = adminDao.takeBirthList(emailList);
			
			for(int i=0; i<list.size(); i++) {
				list.get(i).setBirth(birthList.get(i));
			}
			
			for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
				RefundContent refund = itr.next();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
			}
		}
		
		
		return list;
	}
	
	
	public List<RefundContent> adminProRefundSearch(RefundSearch search) {
		search.setOrderStatus("환불대기");
		List<RefundContent> list = adminDao.adminProRefundSearch(search);
		
		if(list.size()!=0) {
			List<String> emailList = new ArrayList<>();
			String email;
			for(int i=0; i<list.size(); i++) {
				email=list.get(i).getApplicant();
				emailList.add(email);
			}
			
			List<String> birthList = adminDao.takeBirthList(emailList);
			
			for(int i=0; i<list.size(); i++) {
				list.get(i).setBirth(birthList.get(i));
			}
			
			for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
				RefundContent refund = itr.next();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
			}
		}
		
		
		return list;
	}
	
	
	public List<RefundComplete> adminRefundConfirm() {
		List<RefundComplete> list = adminDao.adminRefundConfirm();
		
		
		for(Iterator<RefundComplete> itr = list.iterator(); itr.hasNext();) {
			RefundComplete refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		return list;
	}
	
	public List<RefundComplete> adminRefundConfirm2(RefundSearch search) {
		String startDate = search.getStartDate().trim().replace(".", "-");
		String endDate = search.getEndDate().trim().replace(".", "-");
		
		search.setStartDate(startDate);
		search.setEndDate(endDate);
		
		
		List<RefundComplete> list = adminDao.adminRefundConfirm2(search);
		
		for(Iterator<RefundComplete> itr = list.iterator(); itr.hasNext();) {
			RefundComplete refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		return list;
	}
	
	
	public List<RefundComplete> adminRefundConfirmPro() {
		List<RefundComplete> list = adminDao.adminRefundConfirmPro();
		
		
		for(Iterator<RefundComplete> itr = list.iterator(); itr.hasNext();) {
			RefundComplete refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		return list;
	}
	
	public List<RefundComplete> adminRefundConfirmPro2(RefundSearch search) {
		String startDate = search.getStartDate().trim().replace(".", "-");
		String endDate = search.getEndDate().trim().replace(".", "-");
		
		search.setStartDate(startDate);
		search.setEndDate(endDate);
		
		List<RefundComplete> list = adminDao.adminRefundConfirmPro2(search);
		
		
		for(Iterator<RefundComplete> itr = list.iterator(); itr.hasNext();) {
			RefundComplete refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		return list;
	}
	
	public HashMap<String, Object> orderInfoAndRefund(String id, String applicant) {
		PurchaseHistory pur = adminDao.orderInfo(id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("id",id);
		map.put("applicant", applicant);
		RefundContent refund = 	adminDao.refundContent(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		pur.setOrderDateJ(sdf.format(pur.getOrderDate()));
		pur.setStartDateS(sdf.format(pur.getStartDate()));
		pur.setEndDateS(sdf.format(pur.getEndDate()));
		refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		map.put("pur", pur);
		map.put("refund", refund);
		
		return map;
	}
	
	public HashMap<String, Object> orderInfoAndRefundPro(String id, String applicant) {
		ChatPurchase pur = adminDao.orderInfoPro(id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("id",id);
		map.put("applicant", applicant);
		RefundContent refund = 	adminDao.refundContentPro(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
		refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		map.put("pur", pur);
		map.put("refund", refund);
		
		return map;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void refundComplete(RefundComplete refund) {
		adminDao.refundComplete(refund);
		OrderStatusRecord statusRecord = new OrderStatusRecord();
		statusRecord.setOrderId(refund.getOrderId());
		statusRecord.setOrderstatus("환불완료");
		adminDao.updateOrderStatus(statusRecord);
		adminDao.updateRefundOrderStatus(statusRecord);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void refundCompletePro(RefundComplete refund) {
		adminDao.refundCompletePro(refund);
		OrderStatusRecord statusRecord = new OrderStatusRecord();
		statusRecord.setOrderId(refund.getOrderId());
		statusRecord.setOrderstatus("환불완료");
		adminDao.updateOrderStatusPro(statusRecord);
		adminDao.updateRefundOrderStatusPro(statusRecord);
	}
	
	
	public RefundComplete refundCompleteInfo(String orderId) {
		RefundComplete refund = adminDao.refundCompleteInfo(orderId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		return refund;
	}

	
	public RefundComplete refundProCompleteInfo(String orderId) {
		RefundComplete refund = adminDao.refundProCompleteInfo(orderId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		return refund;
	}
	
	
	public void refundCancel(String orderId) {
		RefundContent info = adminDao.refundListById(orderId);
		
		adminDao.insertRefundCancel(info);
		adminDao.deleteRefundList(orderId);
		OrderStatusRecord statusRecord = new OrderStatusRecord();
		int id = Integer.parseInt(orderId);
		statusRecord.setOrderId(id);
		statusRecord.setOrderstatus("결제완료");
		adminDao.updateOrderStatus(statusRecord);
	}
	
	public void refundCancelPro(String orderId) {
		RefundContent info = adminDao.refundProListById(orderId);
		
		adminDao.insertRefundProCancel(info);
		adminDao.deleteRefundProList(orderId);
		OrderStatusRecord statusRecord = new OrderStatusRecord();
		int id = Integer.parseInt(orderId);
		statusRecord.setOrderId(id);
		statusRecord.setOrderstatus("결제완료");
		adminDao.updateOrderStatusPro(statusRecord);
	}
	
	public List<RefundContent> adminRefundCancelList() {
		List<RefundContent> list = adminDao.adminRefundCancelList();
		
		for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
			RefundContent refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		
		return list;
	}
	
	public List<RefundContent> adminRefundProCancelList() {
		List<RefundContent> list = adminDao.adminRefundProCancelList();
		
		for(Iterator<RefundContent> itr = list.iterator(); itr.hasNext();) {
			RefundContent refund = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			refund.setRecordtimeS(sdf.format(refund.getRecordtime()));
		}
		
		return list;
	}
	
}
