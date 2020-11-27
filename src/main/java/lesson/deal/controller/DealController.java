package lesson.deal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import DeviceSwitcher.DeviceSwitcherController;
import lesson.board.model.PostView;
import lesson.board.model.PurchaseHistory;
import lesson.deal.model.PurchaseListSearch;
import lesson.deal.model.RefundComplete;
import lesson.deal.model.RefundContent;
import lesson.deal.service.DealPurchaseService;
import lesson.deal.service.DealRefundService;
import lesson.deal.service.DealSaleService;
import test.model.ChatPurchase;
import test.service.ChatDealService;

@Controller
public class DealController extends DeviceSwitcherController {

	private static final  Logger logger = LoggerFactory.getLogger(DealController.class);
	
	@RequestMapping(value="purchaselist", method=RequestMethod.GET)
	public String purchaselist(HttpServletRequest request, Model model, HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String email = (String)session.getAttribute("email");
		List<PurchaseHistory> list = dealService.myPurchaseList(email);
		ctx.close();
		request.setAttribute("listModel", list);
		model.addAttribute("size", list.size());
		return forward("deal/myPurchaseList");
	}
	
	@RequestMapping(value="purchaselist", method=RequestMethod.POST)
	public String purchaselist2(PurchaseListSearch search, HttpServletRequest request, Model model ,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String email = (String)session.getAttribute("email");
		List<PurchaseHistory> list = dealService.myPurchaseList2(search, email);
		ctx.close();
		request.setAttribute("listModel", list);
		model.addAttribute("size", list.size());
		
		model.addAttribute("orderStatus", search.getOrderStatus());
		model.addAttribute("firstDate", search.getFirstDateJ());
		model.addAttribute("lastDate", search.getLastDateJ());
		return forward("deal/myPurchaseList");
	}
	
	@RequestMapping(value="orderInfo", method=RequestMethod.GET)
	public String orderInfo(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("id"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		String email = (String)session.getAttribute("email");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		PurchaseHistory pur = dealService.orderInfo(orderId, email);
		ctx.close();
		request.setAttribute("pur", pur);
		return forward("deal/orderInfo");
	}
	
	@RequestMapping(value="proposalOrderInfo", method=RequestMethod.GET)
	public String proposalOrderInfo(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("id"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		String email = (String)session.getAttribute("email");
		
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		ChatPurchase pur = dealService.proposalOrderInfo(orderId, email);
		ctx.close();
		request.setAttribute("pur", pur);
		return forward("deal/proposalOrderInfo");
	}	
	
	@RequestMapping(value="sellerorderInfo", method=RequestMethod.GET)
	public String sellerorderInfo(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("id"));
		String email = (String)session.getAttribute("email");
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		PurchaseHistory pur = dealService.orderInfo(orderId, email);
		ctx.close();
		request.setAttribute("pur", pur);
		return forward("deal/sellerorderInfo");
	}

	@RequestMapping(value="sellerProposalOrderInfo", method=RequestMethod.GET)
	public String sellerProposalOrderInfo(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("id"));
		String email = (String)session.getAttribute("email");
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		ChatPurchase pur = dealService.sellerProposalOrderInfo(orderId, email);
		ctx.close();
		request.setAttribute("pur", pur);
		return forward("deal/proposalSellerOrderInfo");
	}
	
	//데스크탑에서는 window.open사용하기 때문에
	@RequestMapping(value="refund", method=RequestMethod.GET)
	public String applyrefund(HttpServletRequest request, Model model, HttpSession session) {
		
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundContent content = dealRefundService.myRefundContent(orderId, email);
		ctx.close();
		int size;
		if(content==null) {
			size=0;
		}else {
			size=1;
		}
		model.addAttribute("content", content);
		model.addAttribute("size", size);
		model.addAttribute("orderId", orderId);
		return forward("deal/myRefund");
	}
	
	//데스크탑에서는 window.open사용하기 때문에
	@RequestMapping(value="refund", method=RequestMethod.POST)
	public String applyrefund2(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		content.setApplicant(email);
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		dealRefundService.writeRefund(content);
		ctx.close();
		return forward("deal/refundSuccess");
	}
	
	//모바일에서는 a.href사용하기 때문에
	@RequestMapping(value="refundM", method=RequestMethod.GET)
	public String applyrefundM(HttpServletRequest request, Model model, HttpSession session) {
		
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundContent content = dealRefundService.myRefundContent(orderId, email);
		ctx.close();
		int size;
		if(content==null) {
			size=0;
		}else {
			size=1;
		}
		model.addAttribute("content", content);
		model.addAttribute("size", size);
		model.addAttribute("orderId", orderId);
		return forward("deal/myRefund");
	}
	
	//모바일에서는 a.href사용하기 때문에
	@RequestMapping(value="refundM", method=RequestMethod.POST)
	public String applyrefund2M(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		content.setApplicant(email);
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		dealRefundService.writeRefund(content);
		ctx.close();
		return "redirect:purchaselist";
	}
	
	//모바일에서는 a.href사용하기 때문에
	@RequestMapping(value="sellerrefundM", method=RequestMethod.GET)
	public String sellerrefund(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundContent content = dealRefundService.myRefundContent(orderId, email);
		ctx.close();
		int size;
		if(content==null) {
			size=0;
		}else {
			size=1;
		}
		model.addAttribute("content", content);
		model.addAttribute("size", size);
		model.addAttribute("orderId", orderId);
		return forward("deal/myRefund");
	}
	
	//모바일에서는 a.href사용하기 때문에
	@RequestMapping(value="sellerrefundM", method=RequestMethod.POST)
	public String sellerrefund2(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		content.setApplicant(email);
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		dealRefundService.writeRefund(content);
		ctx.close();
		return "redirect:saleslist";
	}
	
	
	
	//데스크탑에서는 window.open사용하기 때문에
		@RequestMapping(value="refundproposal", method=RequestMethod.GET)
		public String refundproposal(HttpServletRequest request, Model model, HttpSession session) {
			
			String email = (String)session.getAttribute("email");
			int orderId = Integer.parseInt((String)request.getParameter("orderid"));
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			RefundContent content = dealRefundService.proMyRefundContent(orderId, email);
			ctx.close();
			int size;
			if(content==null) {
				size=0;
			}else {
				size=1;
			}
			model.addAttribute("content", content);
			model.addAttribute("size", size);
			model.addAttribute("orderId", orderId);
			return forward("deal/myRefund");
		}
		
		//데스크탑에서는 window.open사용하기 때문에
		@RequestMapping(value="refundproposal", method=RequestMethod.POST)
		public String refundproposal2(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
			String email = (String)session.getAttribute("email");
			content.setApplicant(email);
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			dealRefundService.proWriteRefund(content);
			ctx.close();
			return forward("deal/refundSuccess");
		}
		
		
		@RequestMapping(value="refundProM", method=RequestMethod.GET)
		public String refundProM(HttpServletRequest request, Model model, HttpSession session) {
			
			String email = (String)session.getAttribute("email");
			int orderId = Integer.parseInt((String)request.getParameter("orderid"));
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			RefundContent content = dealRefundService.proMyRefundContent(orderId, email);
			ctx.close();
			int size;
			if(content==null) {
				size=0;
			}else {
				size=1;
			}
			model.addAttribute("content", content);
			model.addAttribute("size", size);
			model.addAttribute("orderId", orderId);
			return forward("deal/myRefund");
		}
		
		//모바일에서는 a.href사용하기 때문에
		@RequestMapping(value="refundProM", method=RequestMethod.POST)
		public String refundProM2(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
			String email = (String)session.getAttribute("email");
			content.setApplicant(email);
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			dealRefundService.proWriteRefund(content);
			ctx.close();
			return "redirect:proposalpurchase";
		}
		//모바일에서는 a.href사용하기 때문에
		@RequestMapping(value="sellerRefundProM", method=RequestMethod.GET)
		public String sellerRefundProM(HttpServletRequest request, Model model, HttpSession session) {
			String email = (String)session.getAttribute("email");
			int orderId = Integer.parseInt((String)request.getParameter("orderid"));
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			RefundContent content = dealRefundService.proMyRefundContent(orderId, email);
			ctx.close();
			int size;
			if(content==null) {
				size=0;
			}else {
				size=1;
			}
			model.addAttribute("content", content);
			model.addAttribute("size", size);
			model.addAttribute("orderId", orderId);
			return forward("deal/myRefund");
			
		}
		
		//모바일에서는 a.href사용하기 때문에
		@RequestMapping(value="sellerRefundProM", method=RequestMethod.POST)
		public String sellerRefundProM(RefundContent content, HttpServletRequest request, Model model, HttpSession session) {
			String email = (String)session.getAttribute("email");
			content.setApplicant(email);
			GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
			DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
			dealRefundService.proWriteRefund(content);
			ctx.close();
			return "redirect:proposalsell";
		}
		
		
	@RequestMapping(value="buyerRefundCompleteInfo", method=RequestMethod.GET)
	public String refundCompleteInfo(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundComplete refund = dealRefundService.buyerRefundCompleteInfo(orderId, email);
		ctx.close();
		model.addAttribute("refund", refund);	
		
		return forward("deal/buyerRefundCompleteInfo");
	}
	
	@RequestMapping(value="sellerRefundCompleteInfo", method=RequestMethod.GET)
	public String sellerRefundCompleteInfo(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundComplete refund = dealRefundService.sellerRefundCompleteInfo(orderId, email);
		ctx.close();
		model.addAttribute("refund", refund);	
		
		return forward("deal/sellerRefundCompleteInfo");
	}
	
	
	@RequestMapping(value="buyerRefundCompletePro", method=RequestMethod.GET)
	public String buyerRefundCompletePro(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundComplete refund = dealRefundService.buyerRefundCompletePro(orderId, email);
		ctx.close();
		model.addAttribute("refund", refund);	
		
		return forward("deal/buyerRefundCompleteInfo");
	}
	
	@RequestMapping(value="sellerRefundCompletePro", method=RequestMethod.GET)
	public String sellerRefundCompletePro(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		int orderId = Integer.parseInt((String)request.getParameter("orderid"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		RefundComplete refund = dealRefundService.sellerRefundCompletePro(orderId, email);
		ctx.close();
		model.addAttribute("refund", refund);	
		
		return forward("deal/sellerRefundCompleteInfo");
	}
	
	
	@ResponseBody
	@RequestMapping(value="orderCancel", method=RequestMethod.GET)
	public void orderCancel(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("orderId"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		String email = (String)session.getAttribute("email");
		dealRefundService.orderCancel(orderId, email);
		ctx.close();
	}
	
	@ResponseBody
	@RequestMapping(value="proposalOrderCancel", method=RequestMethod.GET)
	public void proposalOrderCancel(HttpServletRequest request, Model model, HttpSession session) {
		int orderId = Integer.parseInt((String)request.getParameter("orderId"));
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealRefundService dealRefundService = ctx.getBean("dealRefundService", DealRefundService.class );
		String email = (String)session.getAttribute("email");
		dealRefundService.proposalOrderCancel(orderId, email);
		ctx.close();
	}
	
	
	@RequestMapping(value="proposalpurchase", method=RequestMethod.GET)
	public String proposalpurchase(HttpSession session, Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String email = (String)session.getAttribute("email");
		List<ChatPurchase> purchase = chatDealService.myPurchaseProposal(email);
		ctx.close();
		model.addAttribute("purchase", purchase);
		model.addAttribute("size", purchase.size());
		return forward("deal/proposalpurchase");
	}
	
	@RequestMapping(value="proposalpurchase", method=RequestMethod.POST)
	public String proposalpurchase2(PurchaseListSearch search, HttpSession session, Model model) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String email = (String)session.getAttribute("email");
		List<ChatPurchase> purchase = chatDealService.myPurchaseProposal2(search,email);
		ctx.close();
		model.addAttribute("purchase", purchase);
		model.addAttribute("size", purchase.size());
		
		model.addAttribute("orderStatus", search.getOrderStatus());
		model.addAttribute("firstDate", search.getFirstDateJ());
		model.addAttribute("lastDate", search.getLastDateJ());
		return forward("deal/proposalpurchase");
	}
	
	@ResponseBody
	@RequestMapping(value="wishApply", method=RequestMethod.GET)
	public String wishApply(HttpServletRequest request, HttpSession session) {
		String postId = (String)request.getParameter("postId");
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String email = (String)session.getAttribute("email");
		int count = dealService.wishlist(email, postId);
		ctx.close();
		logger.info(count+"카운트값");
		if(count==8) {
			return "full";
		}else if(count==1){
			return "count";
		}
		return "success";
		
	}
	
	@RequestMapping(value="wishlist", method=RequestMethod.GET)
	public String wishlist(HttpServletRequest request, Model model ,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String email = (String)session.getAttribute("email");
		List<PostView> list = dealService.myWishList(email);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		return forward("deal/myWishList");
	}
	
	
	@RequestMapping(value="deletewish", method=RequestMethod.GET)
	public String wishlist2(HttpServletRequest request, Model model, HttpSession session) {
		String email = (String)session.getAttribute("email");
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String postId = request.getParameter("postId");
		dealService.deleteWish(postId, email);
		ctx.close();
		return "redirect:wishlist";
	}

	
	@RequestMapping(value="saleslist", method=RequestMethod.GET)
	public String salelist(HttpServletRequest request, Model model ,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealSaleService saleService = ctx.getBean("dealSaleService", DealSaleService.class );
		String email = (String)session.getAttribute("email");
		
		//프로필이 없는 회원의 경우
		if(saleService.confirmProfileCount(email)==0) {
			ctx.close();
			model.addAttribute("none", "none");
			return forward("deal/mySalesList");
		}else {
			List<PurchaseHistory> list = saleService.mySaleList(email);
			ctx.close();
			request.setAttribute("listModel", list);
			return forward("deal/mySalesList");
		}
	}
	
	
	@RequestMapping(value="proposalsell", method=RequestMethod.GET)
	public String proposalsale(HttpServletRequest request, Model model ,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String email = (String)session.getAttribute("email");
		List<ChatPurchase> purchase = chatDealService.mySaleProposal(email);
		ctx.close();
		model.addAttribute("purchase", purchase);
		model.addAttribute("size", purchase.size());
		return forward("deal/proposalsell");
	}	
	
	@RequestMapping(value="myproposal", method=RequestMethod.GET)
	public String myproposal(HttpServletRequest request, Model model ,HttpSession session) {
		String email = (String)session.getAttribute("email");
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ChatDealService chatDealService = ctx.getBean("chatDealService", ChatDealService.class );
		String id = (String)request.getParameter("id");
		ChatPurchase pur = chatDealService.myProposal(id, email);
		ctx.close();
		model.addAttribute("proposal", pur);
		return forward("deal/myProposal");
	}
	
}
