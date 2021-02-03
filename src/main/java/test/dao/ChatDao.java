package test.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import test.model.ChatDeal;
import test.model.ChatPurchase;
import test.model.Message;
import test.model.MyRoom;

@Repository
public interface ChatDao {

	public List<String> userList(String email);
	
	public String takeName(String email);
	
	public String takeNickname(String email);

	public List<String> takeNicknameList(List<String> list);
	
	public int checkRoom(HashMap<String, Object> map);
	
	public int takeRoomNum(HashMap<String, Object> map);
	
	public int makeRoom(HashMap<String, Object> map);
	
	public void insertChatMessageRead(Message message);
	
	public void insertChatMessageReadNot(Message message);
	
	public String takeChatMemberStatus(Message message);
	
	public List<Message> takeMessage(int chatroom_id);
	
	public List<MyRoom> takeMyRoom(String email); 
	
	public List<Integer> takeUnReadCountList(List<HashMap<String, String>> item);
	
	public int takeUnReadCount(HashMap<String, String> map);
	
	public String takeChatEmail(int id); 
	
	public void updateLastTime(int id);
	
	public String takeReceiverEmail(int id);
	
	public void putChatDeal(ChatDeal deal);
	
	public void updateChatDeal(ChatDeal deal);
	
	public int chatDealCount(String chatroom_id);

	public ChatDeal takeMyChatDeal(String chatroom_id);

	public int countMyChatDeal(HashMap<String, String> map);
	
	public void makeAcceptPurchase(HashMap<String, String> map);

	public ChatPurchase takeChatDealByOrd(int proposal_id);
	
	public void purchaseChatTransaction(ChatPurchase deal);
	
	public  List<ChatPurchase> myPurchaseProposal(String email);
	
	public  List<ChatPurchase> myPurchaseProposalSearch(HashMap<String, Object> map);
	
	public  List<ChatPurchase> mySaleProposal(String email);
	
	public ChatPurchase myProposal(HashMap<String, String> map);
	
	public ChatPurchase myProposalByAdmin(HashMap<String, String> map);
	
	public void insertChatMemberStatus(List<HashMap<String, Object>> item);
	
	public int changeChatMemberStatus(HashMap<String, String> map);
	
	public void changeChatStatusToON(HashMap<String, String> map);
	
	public void changeReadOrNot(HashMap<String, String> map);
	
	public String takeTokenForReceiver(String email);
	
	public int takeUnReadCountTotal(String email);
}
