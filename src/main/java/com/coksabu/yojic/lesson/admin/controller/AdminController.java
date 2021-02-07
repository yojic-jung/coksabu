package com.coksabu.yojic.lesson.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coksabu.yojic.lesson.admin.model.DelWaiting;
import com.coksabu.yojic.lesson.admin.model.ImgList;
import com.coksabu.yojic.lesson.admin.model.NotificationLight;
import com.coksabu.yojic.lesson.admin.model.OrderStatusRecord;
import com.coksabu.yojic.lesson.admin.model.QnaList;
import com.coksabu.yojic.lesson.admin.model.RefundComplete;
import com.coksabu.yojic.lesson.admin.model.RefundSearch;
import com.coksabu.yojic.lesson.admin.model.TranSearch;
import com.coksabu.yojic.lesson.admin.service.AdminAdditionService;
import com.coksabu.yojic.lesson.admin.service.AdminService;
import com.coksabu.yojic.lesson.board.model.PurchaseHistory;
import com.coksabu.yojic.lesson.chat.model.ChatPurchase;
import com.coksabu.yojic.lesson.deal.model.RefundContent;
import com.coksabu.yojic.lesson.member.model.Qna;

@Controller
public class AdminController {
	
	//테스트 완료
	@RequestMapping(value="adminlogout")
	public String adminlogout(HttpSession session) {
		session.invalidate();
			return "redirect:admin";
	}
	
	//테스트 완료
	@RequestMapping("admin")
	public String admin3(Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminAdditionService adminAddService = ctx.getBean(AdminAdditionService.class);
		NotificationLight notify = adminAddService.notificationLight();
		ctx.close();
		model.addAttribute("notify", notify);
		return "admin/adminPage";
	}
	
	@RequestMapping(value="admininspect", method=RequestMethod.GET)
	public String admin4(Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		AdminService adminService = ctx.getBean("adminService", AdminService.class );
		List<ImgList> list = adminService.imgList();
		int count = adminService.certifyCount();
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "admin/inspect";
	}
	
	
	@RequestMapping("complete")
	public String admin5(HttpSession session, HttpServletRequest request) {
		
		String email1 = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email1.equals("dywlr74")) {
			String email = (String)request.getParameter("email");
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			AdminService adminService = ctx.getBean("adminService", AdminService.class );
			adminService.inspectComplete(email);
			ctx.close();
		}
		
		return "redirect:admininspect";
	}
	
	
	@RequestMapping("adminCertifyFail")
	public String certifyFail(HttpSession session, HttpServletRequest request) {
		
		String email1 = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email1.equals("dywlr74")) {
			String email = (String)request.getParameter("email");
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			AdminService adminService = ctx.getBean("adminService", AdminService.class );
			adminService.inspectFail(email);
			ctx.close();
		}
		
		return "redirect:admininspect";
	}
	
	@RequestMapping(value="listqna", method=RequestMethod.GET)
	public String qnalist(HttpServletRequest request,Model model) {
		String pageNumberString = (String)request.getParameter("p");
		String id = (String)request.getParameter("id");
		int pageNumber =1;
		if(pageNumberString!=null && !pageNumberString.equals("")) {
			pageNumber=Integer.parseInt(pageNumberString);
		}
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		QnaList list = adminService.list(pageNumber, id);
		ctx.close();
		request.setAttribute("listModel", list);
		if(list.getTotalPageCount() > 0){
			int beginPageNumber = (list.getRequestPage()-1)/10*10 + 1;
			int endPageNumber = beginPageNumber + 9;
			if(endPageNumber > list.getTotalPageCount()){
				endPageNumber = list.getTotalPageCount();
			}
			request.setAttribute("p", pageNumberString);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
			return "admin/qnalist";
	}
	
	@RequestMapping(value="listqna", method=RequestMethod.POST)
	public String qnalist2(HttpSession session, Qna qna, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			adminService.qnaAnswer(qna);
			ctx.close();
		}
			return "redirect:/listqna";
	}
	
	@RequestMapping(value="adminTransaction", method=RequestMethod.GET)
	public String adminTransaction(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<PurchaseHistory> list = adminService.adminTransaction();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminTransaction";
	}
	
	@RequestMapping(value="adminTransaction", method=RequestMethod.POST)
	public String adminTransaction2(TranSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<PurchaseHistory> list = adminService.adminTransaction2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "admin/adminTransaction";
	}
	
	
	@RequestMapping(value="adminChatTransaction", method=RequestMethod.GET)
	public String adminChatTransaction(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<ChatPurchase> list = adminService.adminChatTransaction();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminChatTransaction";
	}
	
	
	@RequestMapping(value="adminChatTransaction", method=RequestMethod.POST)
	public String adminChatTransaction2(TranSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<ChatPurchase> list = adminService.adminChatTransaction2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "admin/adminChatTransaction";
	}
	
	
	@ResponseBody
	@RequestMapping(value="changeOrderStatus", method=RequestMethod.POST)
	public String changeOrderStatus(HttpSession session, OrderStatusRecord statusRecord, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			statusRecord.setRecordtime(new Date());
			adminService.changeOrderStatus(statusRecord);
			ctx.close();
		}
		
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="changeProposalOrderStatus", method=RequestMethod.POST)
	public String changeProposalOrderStatus(HttpSession session, OrderStatusRecord statusRecord, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			statusRecord.setRecordtime(new Date());
			adminService.changeProposalOrderStatus(statusRecord);
			ctx.close();
		}
		
		
		return "success";
	}
	
	@RequestMapping(value="cancelDepositStatus", method=RequestMethod.GET)
	public String cancelDepositStatus(HttpSession session,  HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			String orderStatus = adminService.cancelDepositStatus(orderId);
			ctx.close();
			model.addAttribute("orderStatus", orderStatus);
			model.addAttribute("orderId", orderId);
		}
		
		return "admin/cancelDepositStatus";
	}
	@RequestMapping(value="cancelDepositStatus2", method=RequestMethod.GET)
	public String cancelDepositStatus2(HttpSession session,  HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			String orderStatus = adminService.cancelDepositStatus2(orderId);
			ctx.close();
			model.addAttribute("status", orderStatus);
		}
		
		model.addAttribute("success", "success");
		
		return "admin/cancelDepositStatus";
	}
	
	
	@RequestMapping(value="cancelStatusProposal", method=RequestMethod.GET)
	public String cancelStatusProposal(HttpSession session,  HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			int id = Integer.parseInt(request.getParameter("id"));
			String orderStatus = adminService.cancelStatusProposal(id);
			ctx.close();
			model.addAttribute("orderStatus", orderStatus);
			model.addAttribute("id", id);
		}		
		return "admin/cancelStatusProposal";
	}
	@RequestMapping(value="cancelStatusProposal2", method=RequestMethod.GET)
	public String cancelStatusProposal2(HttpSession session,  HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			int id = Integer.parseInt(request.getParameter("id"));
			String orderStatus = adminService.cancelStatusProposal2(id);
			ctx.close();
			model.addAttribute("status", orderStatus);
		}
		
		model.addAttribute("success", "success");
		
		return "admin/cancelStatusProposal";
	}
	
	
	@RequestMapping(value="depositConfirmRecord", method=RequestMethod.GET)
	public String depositConfirmRecord(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<OrderStatusRecord> list = adminService.depositConfirmRecord();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/depositRecord";
	}
	
	@RequestMapping(value="depositConfirmRecord", method=RequestMethod.POST)
	public String depositConfirmRecord2(TranSearch search,HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<OrderStatusRecord> list = adminService.depositConfirmRecord2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search",search);
		return "admin/depositRecord";
	}
	
	
	@RequestMapping(value="depositConfirmProposalRecord", method=RequestMethod.GET)
	public String depositConfirmProposalRecord(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<OrderStatusRecord> list = adminService.depositConfirmProposalRecord();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/depositProposalRecord";
	}
	
	@RequestMapping(value="depositConfirmProposalRecord", method=RequestMethod.POST)
	public String depositConfirmProposalRecord2(TranSearch search,HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<OrderStatusRecord> list = adminService.depositConfirmProposalRecord2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search",search);
		return "admin/depositProposalRecord";
	}
	
	@RequestMapping(value="adminRefund", method=RequestMethod.GET)
	public String adminRefund(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminRefund();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminRefund";
	}	
	
	@RequestMapping(value="adminRefund", method=RequestMethod.POST)
	public String adminRefund2(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminRefundSearch(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		model.addAttribute("search" , search);
		return "admin/adminRefund";
	}	
	
	@RequestMapping(value="adminProRefund", method=RequestMethod.GET)
	public String adminProRefund(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminProRefund();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminProRefund";
	}	
	
	@RequestMapping(value="adminProRefund", method=RequestMethod.POST)
	public String adminProRefund2(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminProRefundSearch(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		model.addAttribute("search" , search);
		return "admin/adminProRefund";
	}	
	
	
	@RequestMapping(value="adminRefundConfirmList", method=RequestMethod.GET)
	public String adminRefundConfirm(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundComplete> list = adminService.adminRefundConfirm();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminRefundConfirmList";
	}

	
	@RequestMapping(value="adminRefundConfirmList", method=RequestMethod.POST)
	public String adminRefundConfirm2(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundComplete> list = adminService.adminRefundConfirm2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		return "admin/adminRefundConfirmList";
	}
	
	
	@RequestMapping(value="adminRefundProConfirmList", method=RequestMethod.GET)
	public String adminRefundProConfirmList(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundComplete> list = adminService.adminRefundConfirmPro();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminRefundProConfirmList";
	}

	
	@RequestMapping(value="adminRefundProConfirmList", method=RequestMethod.POST)
	public String adminRefundProConfirmList2(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundComplete> list = adminService.adminRefundConfirmPro2(search);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "admin/adminRefundProConfirmList";
	}	
	
	//테스트 완료
	@RequestMapping(value="adminRefundCompleteInfo", method=RequestMethod.GET)
	public String refundCompleteInfo(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		
		String orderId = (String)request.getParameter("orderId");
		
		RefundComplete refund = adminService.refundCompleteInfo(orderId);
		ctx.close();
		model.addAttribute("refund", refund);
		return "admin/refundCompleteInfo";
	}
	
	//테스트 완료
	@RequestMapping(value="adminRefundProCompleteInfo", method=RequestMethod.GET)
	public String refundProCompleteInfo(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		
		String orderId = (String)request.getParameter("orderId");
		
		RefundComplete refund = adminService.refundProCompleteInfo(orderId);
		ctx.close();
		model.addAttribute("refund", refund);
		return "admin/refundCompleteInfo";
	}
	
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="adminRefundCancel", method=RequestMethod.GET)
	public void refundCancel(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		
		String orderId = (String)request.getParameter("orderId");
		
		adminService.refundCancel(orderId);
		ctx.close();
	}
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="adminRefundCancelPro", method=RequestMethod.GET)
	public void adminRefundCancelPro(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		
		String orderId = (String)request.getParameter("orderId");
		
		adminService.refundCancelPro(orderId);
		ctx.close();
	}
	
	//테스트 완료
	@RequestMapping(value="adminOrderInfoAndRefund", method=RequestMethod.GET)
	public String adminOrderInfo(HttpSession session, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			String id = (String)request.getParameter("id");
			String applicant = (String)request.getParameter("applicant");
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			HashMap<String, Object> map = adminService.orderInfoAndRefund(id, applicant);
			ctx.close();
			
			model.addAttribute("pur", (PurchaseHistory)map.get("pur"));
			model.addAttribute("refund", (RefundContent)map.get("refund"));
			model.addAttribute("id", id);
		}
		
		return "admin/orderInfoAndRefund";
	}	
	
	//테스트 완료
	@RequestMapping(value="adminOrderInfoAndRefund", method=RequestMethod.POST)
	public String adminOrderInfo2(RefundComplete refund, HttpSession session, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			adminService.refundComplete(refund);
			
			ctx.close();
			model.addAttribute("success", "success");
		}
		
		return "admin/orderInfoAndRefund";
	}	

	
	//테스트 완료
	@RequestMapping(value="adminOrderInfoAndRefundPro", method=RequestMethod.GET)
	public String adminOrderInfoAndRefundPro(HttpSession session, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			String id = (String)request.getParameter("id");
			String applicant = (String)request.getParameter("applicant");
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			HashMap<String, Object> map = adminService.orderInfoAndRefundPro(id, applicant);
			ctx.close();
			
			model.addAttribute("pur", (ChatPurchase)map.get("pur"));
			model.addAttribute("refund", (RefundContent)map.get("refund"));
			model.addAttribute("id", id);
		}
		
		return "admin/orderInfoAndRefundPro";
	}	
	
	//테스트 완료
	@RequestMapping(value="adminOrderInfoAndRefundPro", method=RequestMethod.POST)
	public String adminOrderInfoAndRefundPro2(RefundComplete refund, HttpSession session, HttpServletRequest request,Model model) {
		String email = (String)session.getAttribute("email");
		//관리자만 수정할수 있게끔, url요청으로 임의적으로 수정되지 않기 위해
		if(email.equals("dywlr74")) {
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			AdminService adminService = ctx.getBean(AdminService.class);
			adminService.refundCompletePro(refund);
			
			ctx.close();
			model.addAttribute("success", "success");
		}
		
		return "admin/orderInfoAndRefundPro";
	}	
	
	@RequestMapping(value="adminRefundCancelList", method=RequestMethod.GET)
	public String adminRefundCancelList(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminRefundCancelList();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminRefundCancelList";
	}
	
	
	@RequestMapping(value="adminRefundProCancelList", method=RequestMethod.GET)
	public String adminRefundProCancelList(RefundSearch search, HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminService adminService = ctx.getBean(AdminService.class);
		List<RefundContent> list = adminService.adminRefundProCancelList();
		ctx.close();
		model.addAttribute("list", list);
		return "admin/adminRefundCancelList";
	}
	
	
	@RequestMapping(value="adminDelWaiting", method=RequestMethod.GET)
	public String adminDelWaiting(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminAdditionService adminAddService = ctx.getBean(AdminAdditionService.class);
		List<DelWaiting> list = adminAddService.delWaitingList();
		ctx.close();
		model.addAttribute("list", list);
		
		return "admin/adminDelWaiting";
	}
	
	@RequestMapping(value="adminDelWaiting2", method=RequestMethod.GET)
	public String adminDelWaitinㅎ2(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminAdditionService adminAddService = ctx.getBean(AdminAdditionService.class);
		List<DelWaiting> list = adminAddService.delWaitingList2();
		ctx.close();
		model.addAttribute("list", list);
		
		return "admin/adminDelWaiting";
	}
	
	
	@RequestMapping(value="adminPurchaseList", method=RequestMethod.GET)
	public String adminPurchaseList(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminAdditionService adminAddService = ctx.getBean(AdminAdditionService.class);
		int postId = Integer.parseInt((String)request.getParameter("postId"));
		int id = Integer.parseInt((String)request.getParameter("id"));
		List<PurchaseHistory> list = adminAddService.takePurchaseList(postId);
		String orderStatus;
		int delCount=0;
		for(Iterator<PurchaseHistory> itr = list.iterator(); itr.hasNext();) {
			PurchaseHistory pur = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			pur.setOrderDateJ(sdf.format(pur.getOrderDate()));
			pur.setEndDateS(sdf.format(pur.getEndDate()));
			orderStatus = pur.getOrderstatus();
			
			if(orderStatus.equals("입금대기") ||orderStatus.equals("결제완료") || orderStatus.equals("환불대기") ) {
				delCount+=1;
			}else {
			}
			
		}
		
		String delStatus;
		
		if(delCount!=0) {
			delStatus="삭제불가";
		}else {
			delStatus="삭제가능";
		}
		
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("delStatus", delStatus);
		model.addAttribute("postId", postId);
		model.addAttribute("id", id);
		return "admin/adminPurchaseList";
	}
	
	@ResponseBody
	@RequestMapping(value="adminDelLesson", method=RequestMethod.GET)
	public String adminDelLesson(HttpServletRequest request,Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		AdminAdditionService adminAddService = ctx.getBean(AdminAdditionService.class);
		String path = request.getServletContext().getRealPath("resources/theme/");
		
		int postId = Integer.parseInt((String)request.getParameter("postId"));
		int id = Integer.parseInt((String)request.getParameter("id"));
		System.out.println("찍힘 확인:"+postId);
		System.out.println("찍힘 확인:"+id);
		adminAddService.adminDelLesson(postId, id, path);
		ctx.close();
		
		return "success";
	}
}
