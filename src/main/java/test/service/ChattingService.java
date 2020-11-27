package test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import test.dao.ChatDao;
import test.model.Message;
import test.model.MyRoom;

public class ChattingService {
	
	ChatDao chatDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(ChattingService.class);
	
	public void setChatDao(ChatDao chatDao) {
		this.chatDao=chatDao;
	}
	
	public List<String> userList(String id){
		List<String> user = chatDao.userList(id);
		return user;
	}
	
	public List<MyRoom> takeMyRoom(String email) {
		return chatDao.takeMyRoom(email);
	}
	
	public List<Integer> takeUnReadCountList(List<String> item, String receiveremail) {
		List<HashMap<String, String>> list = new ArrayList<>();
		for(int i=0; i< item.size(); i++) {
			HashMap<String, String> map = new HashMap<>();
			map.put("receiver", receiveremail);
			map.put("sender", item.get(i));	
			
			list.add(map);
			
		}
		return chatDao.takeUnReadCountList(list);
	}
	
	
	public int takeUnReadCount(String sender, String receiver) {
		HashMap<String, String> map = new HashMap<>();
		map.put("receiver", receiver);
		map.put("sender", sender);
		return chatDao.takeUnReadCount(map);
	}
	
	public String takeMyName(String email) {
		return chatDao.takeName(email);
	}
	
	
	public int checkRoom(String sender, String receiver) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		int a = chatDao.checkRoom(map);
		logger.info("체크룸"+a);
		if(a==0) {
			return a;
		}else {
			int b = chatDao.takeRoomNum(map);
			return b;
		}
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public int makeRoom(String sender, String receiver) {

		String user =sender+","+receiver;
		
		logger.info(user);
		
		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("user",user);
		
		chatDao.makeRoom(map1);
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		int a = chatDao.takeRoomNum(map);
		
		List<HashMap<String, Object>> list = new ArrayList<>();
		
		map.put("user", sender);
		map.put("roomnumber", a);
		list.add(map);
		
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("user", receiver);
		map2.put("roomnumber", a);
		list.add(map2);
		
		chatDao.insertChatMemberStatus(list);
		
		return a;
	}
	@Transactional(rollbackFor= {Exception.class})
	public String insertMessage(Message mes) {
		chatDao.updateLastTime(mes.getChatroom_id());
		
		String status = chatDao.takeChatMemberStatus(mes);
		
		if(status.equals("ON")) {
			chatDao.insertChatMessageRead(mes);
		}else {
			chatDao.insertChatMessageReadNot(mes);
		}
		return status;
	}
	
	public List<Message> takeMessage( int chatroom_id, String email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("chatroom_id", String.valueOf(chatroom_id));
		map.put("email", email);
		chatDao.changeReadOrNot(map);
		List<Message> mesList = chatDao.takeMessage(chatroom_id);
		return mesList;
	}
	
	public List<Message> takeMyChat(String id, String email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("chatroom_id", id);
		map.put("email", email);
		chatDao.changeReadOrNot(map);
		int a = Integer.parseInt(id);
		List<Message> mesList = chatDao.takeMessage(a);
		return mesList;
	}
	
	public String takeReceiver(String id) {
		int a = Integer.parseInt(id);
		return chatDao.takeChatEmail(a);
	}
	
	public String takeName(String email) {
		return chatDao.takeName(email);
	}
	
	public String takeReceiverEmail(String id) {
		int id2 = Integer.parseInt(id);
		return chatDao.takeReceiverEmail(id2);
	}
	
	public Message takeMessage(Message mes) {
		logger.info(String.valueOf(mes.getChatroom_id()));
		String email = chatDao.takeChatEmail(mes.getChatroom_id());
		email = email.replace(mes.getMessage_sender(), "").replace(",","").trim();
		logger.info(email);
		mes.setMessage_receiver(email);
		return mes;
	}
	
	public void changeChatMemberStatus(HashMap<String, String> map) {
		int a = chatDao.changeChatMemberStatus(map);
		logger.warn( " 변화된 칼럼 "+a );
		logger.warn( "내 user "+map.get("user") );
		logger.warn( "내 roomnumber "+map.get("roomnumber") );
	}
	
	public void changeChatStatusToON(String chatroom_id, String email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("chatroom_id", chatroom_id);
		map.put("email", email);
		
		chatDao.changeChatStatusToON(map);
	}
	
}
