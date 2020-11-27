package test.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import DeviceSwitcher.DeviceSwitcherController;
import lesson.apply.service.MyApplyListService;
import lesson.member.model.Profile;
import lesson.member.service.ReadProfileService;
import test.model.ChatDeal;
import test.model.Message;
import test.model.MyRoom;
import test.service.ChatDealService;
import test.service.ChattingService;


@Controller
public class ChatAppController extends DeviceSwitcherController {

	private static final  Logger logger = LoggerFactory.getLogger(ChatAppController.class);
	
	@RequestMapping(value="message", method=RequestMethod.GET)
	public String message(HttpSession session, Model model, HttpServletRequest request) {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
		ReadProfileService readProfileService = ctx.getBean("readProfileService", ReadProfileService.class );
		
		String email = (String)session.getAttribute("email");
		
		List<MyRoom> list = chattingService.takeMyRoom(email);
		
		List<String> emailList = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++){
			String receiverEmail  = list.get(i).getUser();
			receiverEmail = receiverEmail.replace(email,"").replace(",","").trim();	
			emailList.add(receiverEmail);
		}
		
		if(list.size()!=0) {
			List<Profile> pro = readProfileService.readProfileList(emailList);
			List<Integer> unReadCountList = chattingService.takeUnReadCountList(emailList, email);
			for(int i=0; i<list.size(); i++){
				pro.get(i).setId(list.get(i).getId());
				pro.get(i).setLasttime(list.get(i).getLasttime().substring(0, 10));
				pro.get(i).setUnReadCount(unReadCountList.get(i));
				if(pro.get(i).getImgPath().equals("")) {
					pro.get(i).setImgPath("pro.png");
				}
				
				
			}
			model.addAttribute("pro", pro);
		}
		ctx.close();
		request.setAttribute("size", list.size());
		model.addAttribute("email", email);
		return forward("chat/message");
	}
	
	@RequestMapping(value="chatroom", method=RequestMethod.GET)
	@Transactional(rollbackFor= {Exception.class})
	public String chatRoom(Model model, HttpServletRequest request, HttpSession session) {
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
		MyApplyListService myApplyListService = ctx.getBean("myApplyListService", MyApplyListService.class );
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		
		String root = (String)request.getParameter("root");
		
		String sender = (String)session.getAttribute("email");
		String postId = request.getParameter("id");
	
		logger.info(sender+"센더 아이디");
		
		String receiver;
		// 레슨요청내역에서 선생님 지원목록에서 열람하는 경우
		if(root.equals("apply")) {
			receiver = myApplyListService.takeEmail(postId);
		// boardread로 들어온 경우  root=read
		}else {
			receiver = chattingService.takeReceiverEmail(postId);
			
		}
		
		logger.info(receiver+"리시버 아이디");
		String receiverName = chattingService.takeName(receiver);
		
		
		if(sender.equals(receiver)) {
			ctx.close();
			return "chat/chat-error";
		}
		
		// 방이 없으면 0 있으면 방 번호 리턴
		int chatroom_id = chattingService.checkRoom(sender, receiver);
		
		logger.info(chatroom_id+"챗룸아이디");
		
		if(chatroom_id==0) {//대화방이 없는경우
			//대화방 만들고 방번호 리턴
			int roomNum = chattingService.makeRoom(sender, receiver);
			model.addAttribute("chatroom_id",roomNum);
			model.addAttribute("count",0);
		}else {//대화방이 있는 경우
			List<Message> mesList = chattingService.takeMessage(chatroom_id, sender);
			
			for(Iterator<Message> itr = mesList.iterator(); itr.hasNext();) {
				Message msg = itr.next();
				SimpleDateFormat format1 = new SimpleDateFormat ( "MM/dd HH:mm");
		        String time1 = format1.format(msg.getMessage_time());
				msg.setMessage_time2(time1);
			}
			
			model.addAttribute("mesList",mesList);
			model.addAttribute("chatroom_id",chatroom_id);
			int count = chatDealService.countChatDeal( Integer.toString(chatroom_id) );
			if(count!=0) {
				model.addAttribute("count",count);
			}		
		}
		
		ctx.close();
		
		
		model.addAttribute("receiverName",receiverName);
		model.addAttribute("sender",sender);
		
		return forward("chat/chat-ws");
	}
	
	
	@RequestMapping(value="chatmyroom", method=RequestMethod.GET)
	public String chatMyRoom(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String email = (String)session.getAttribute("email");
		String id = request.getParameter("id");
		
		//대화방이 있는 경우
		List<Message> mesList = chattingService.takeMyChat(id, email);
		String receiver = chattingService.takeReceiver(id);
		
		String[] users = receiver.split(",");
		
		if(!email.equals(users[0]) && !email.equals(users[1]) ){
			ctx.close();
			 throw new Exception();	
		}
		
		receiver=receiver.replace(email, "").replace(",", "").trim();
		String receiverName = chattingService.takeName(receiver);
		for(Iterator<Message> itr = mesList.iterator(); itr.hasNext();) {
			Message msg = itr.next();
			SimpleDateFormat format1 = new SimpleDateFormat ( "MM/dd HH:mm");
		    String time1 = format1.format(msg.getMessage_time());
			msg.setMessage_time2(time1);
		}
		
		model.addAttribute("mesList",mesList);
		model.addAttribute("chatroom_id",id);
			
		int count = chatDealService.countChatDeal(id);
		ctx.close();
		
		if(count!=0) {
			model.addAttribute("count",count);
		}
		
		model.addAttribute("receiverName",receiverName);
		model.addAttribute("sender",email);
		return forward("chat/chat-ws");
	}
	
	@ResponseBody
	@RequestMapping(value="newpurchase", method=RequestMethod.POST)
	public String newpurchase2(ChatDeal deal, HttpSession session, Model model, HttpServletRequest request) throws ParseException {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		
		String email = (String)session.getAttribute("email");
		String chatroom_id = request.getParameter("id");
		logger.info(chatroom_id+"포스트 처리");
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		deal.setChatroom_id(chatroom_id);
		deal.setEmail(email);
		chatDealService.putChatDeal(deal);
		ctx.close();
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="proposallist", method=RequestMethod.GET)
	public Map<String, String> proposallist(HttpSession session, Model model, HttpServletRequest request) {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		
		String id = request.getParameter("id");
		ChatDeal deal = chatDealService.takeMyChatDeal(id);
		ctx.close();
		Map<String, String> map = new HashMap<String, String>();

		map.put("proposal_id", Integer.toString(deal.getId()) );
		map.put("cate", deal.getCate() );
		map.put("customer",deal.getCustomer() );
		map.put("lessonCount", Integer.toString(deal.getLessonCount()) );
		map.put("lessonTime", deal.getLessonTime() );
		map.put("price",Integer.toString(deal.getPrice()) );
		map.put("startDate", deal.getStartDate() );
		map.put("endDate",deal.getEndDate() );
		map.put("moreDetail",deal.getMoreDetail() );
		map.put("name", deal.getName() );
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="transactionJudge", method=RequestMethod.GET)
	public String purchaseAccept(HttpSession session, Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String id = request.getParameter("id");
		String email = (String)session.getAttribute("email");
		int count = chatDealService.acceptPurchase(id, email);
		
		//자기 자신의 거래를 승낙한 경우
		if(count==1) {
			ctx.close();
			return "fail";
		}else {
			chatDealService.makeAcceptPurchase(id,email);
			ctx.close();
			return "success";	
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="chatTransaction", method=RequestMethod.GET)
	public String chatTransaction(@RequestParam("bank") String bank, @RequestParam("depositor") String depositor, HttpSession session, Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		
		int proposal_id = Integer.parseInt(request.getParameter("id"));
		String email = (String)session.getAttribute("email");
		String status = chatDealService.chatTransaction(proposal_id, email, bank, depositor);
		ctx.close();
		return status;
	}
	
	@ResponseBody
	@RequestMapping(value="chatmemberstatus", method=RequestMethod.GET)
	public void chatmemberstatus(@RequestParam("id") String chatroom_id, HttpSession session, Model model, HttpServletRequest request) {	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
		
		String email = (String)session.getAttribute("email");
		chattingService.changeChatStatusToON(chatroom_id,email);
		logger.warn("소켓 연결성공");
		ctx.close();
		
	}
	
}




