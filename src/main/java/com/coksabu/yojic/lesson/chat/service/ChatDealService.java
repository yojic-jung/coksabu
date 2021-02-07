package com.coksabu.yojic.lesson.chat.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.chat.dao.ChatDao;
import com.coksabu.yojic.lesson.chat.model.ChatDeal;
import com.coksabu.yojic.lesson.chat.model.ChatPurchase;
import com.coksabu.yojic.lesson.deal.model.PurchaseListSearch;

@Service
public class ChatDealService {
	
	@Autowired
	private ChatDao chatDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(ChatDealService.class);
	
	public int countChatDeal(String chatroom_id) {
		return chatDao.chatDealCount(chatroom_id);
	}
	
	public ChatDeal takeMyChatDeal(String chatroom_id) {
		ChatDeal deal = chatDao.takeMyChatDeal(chatroom_id);
		String name = chatDao.takeName(deal.getEmail());
		deal.setName(name);
		return deal;
	}
	
	public void putChatDeal(ChatDeal deal) throws ParseException {
		int myDeal = chatDao.chatDealCount(deal.getChatroom_id());
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date end = transFormat.parse(deal.getEndDate().trim().replaceAll(" ", ""));
		deal.setEndDay(end);
		Date start = transFormat.parse(deal.getStartDate().trim().replaceAll(" ", ""));
		deal.setStartDay(start);
		
		if(myDeal==1) {
			chatDao.updateChatDeal(deal);;
		}else if(myDeal==0){
			chatDao.putChatDeal(deal);	
		}
	}
	
	
	public int acceptPurchase(String id,String email) {
		HashMap<String,String> map = new HashMap<>();
		map.put("chatroom_id", id);
		map.put("email", email);
		int count = chatDao.countMyChatDeal(map);
		if(count==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	public void makeAcceptPurchase(String id, String email) {
		HashMap<String,String> map = new HashMap<>();
		map.put("chatroom_id", id);
		map.put("email", email);
		map.put("customer", "판매자");
		chatDao.makeAcceptPurchase(map);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public String chatTransaction(int proposal_id, String buyerEmail, String bank, String depositor) {
		ChatPurchase purchase = chatDao.takeChatDealByOrd(proposal_id);
		String sellerEmail = purchase.getEmail();
		purchase.setSeller(sellerEmail);
		purchase.setBuyer(buyerEmail);
		purchase.setProposal_id(proposal_id);
		
		//판매자가 자신의 서비스를 사는경우
		if(sellerEmail.equals(buyerEmail)) {
			logger.info("실패 거래");
			return "fail";
		//구매자가 사는 경우
		}else {
			String sellerName = chatDao.takeName(sellerEmail);
			String buyerName = chatDao.takeName(buyerEmail);
			
			purchase.setSellerName(sellerName);
			purchase.setBuyerName(buyerName);
			purchase.setBank(bank);
			purchase.setDepositor(depositor);
			purchase.setOrderstatus("입금대기");
			chatDao.purchaseChatTransaction(purchase);
			logger.info("성공 거래");
			return "success";
		}
	}
	
	
	public List<ChatPurchase> myPurchaseProposal(String email) {
		List<ChatPurchase> purchase = chatDao.myPurchaseProposal(email);
		
		if(purchase.size()==0) {
			return purchase;
		}
		
		List<String> list = new ArrayList<>();
		ChatPurchase pur;
		for(Iterator<ChatPurchase> itr = purchase.iterator(); itr.hasNext();) {
			pur = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
			
			list.add(pur.getSeller());
		}
		
		List<String> nicknameList = chatDao.takeNicknameList(list);
		
		for(int i=0; i<list.size(); i++) {
			purchase.get(i).setSeller(nicknameList.get(i));
		}
		
		
		return purchase;
	}
	
	public List<ChatPurchase> myPurchaseProposal2(PurchaseListSearch search, String email) {
		String firstDate = search.getFirstDateJ().trim().replace(".", "-");
		String lastDate = search.getLastDateJ().trim().replace(".", "-");
		
		search.setFirstDateJ(firstDate );
		search.setLastDateJ(lastDate);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("email",email);
		map.put("orderStatus",search.getOrderStatus());
		map.put("firstDate",search.getFirstDateJ());
		map.put("lastDate",search.getLastDateJ());
		
		List<ChatPurchase> purchase = chatDao.myPurchaseProposalSearch(map);
		
		if(purchase.size()==0) {
			return purchase;
		}
		
		List<String> list = new ArrayList<>();
		ChatPurchase pur;
		for(Iterator<ChatPurchase> itr = purchase.iterator(); itr.hasNext();) {
			pur = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
			
			list.add(pur.getSeller());
		}
		
		List<String> nameList = chatDao.takeNicknameList(list);
		
		for(int i=0; i<list.size(); i++) {
			purchase.get(i).setSeller(nameList.get(i));
		}
		
		
		return purchase;
	}

	
	public List<ChatPurchase> mySaleProposal(String email) {
		List<ChatPurchase> purchase = chatDao.mySaleProposal(email);
		
		if(purchase.size()==0) {
			return purchase;
		}
		List<String> list = new ArrayList<>();
		ChatPurchase pur;
		for(Iterator<ChatPurchase> itr = purchase.iterator(); itr.hasNext();) {
			pur = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
			
			list.add(pur.getBuyer());
		}
		
		List<String> nameList = chatDao.takeNicknameList(list);
		
		for(int i=0; i<list.size(); i++) {
			purchase.get(i).setBuyer(nameList.get(i));
		}
		
		return purchase;
	}
	
	public ChatPurchase myProposal(String id, String email) {
		HashMap<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		
		ChatPurchase pur;
		if(email.equals("dywlr74")) {
			pur =  chatDao.myProposalByAdmin(map);
		}else {
			pur =  chatDao.myProposal(map);
		}
		
		if(pur !=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			pur.setPurchase_dayS(sdf.format(pur.getPurchase_day()));
			String buyer = chatDao.takeName(pur.getBuyer());
			String seller = chatDao.takeName(pur.getSeller());
			pur.setBuyer(buyer);
			pur.setSeller(seller);
		}
		
		return pur;
	}
	
}
