package com.coksabu.yojic.lesson.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coksabu.yojic.DeviceSwitcher.DeviceSwitcherController;
import com.coksabu.yojic.lesson.apply.service.MyApplyListService;
import com.coksabu.yojic.lesson.board.model.LessonCard;
import com.coksabu.yojic.lesson.board.model.LessonCardDB;
import com.coksabu.yojic.lesson.board.model.LessonCardDB2;
import com.coksabu.yojic.lesson.board.model.PostList;
import com.coksabu.yojic.lesson.board.model.PostView;
import com.coksabu.yojic.lesson.board.model.PurchaseHistory;
import com.coksabu.yojic.lesson.board.model.PurchaseRead;
import com.coksabu.yojic.lesson.board.model.SearchForm;
import com.coksabu.yojic.lesson.board.service.DeleteLessonService;
import com.coksabu.yojic.lesson.board.service.ListService;
import com.coksabu.yojic.lesson.board.service.PurchaseService;
import com.coksabu.yojic.lesson.board.service.ReadLessonService;
import com.coksabu.yojic.lesson.board.service.ReadPostService;
import com.coksabu.yojic.lesson.board.service.WriteLessonService;
import com.coksabu.yojic.lesson.chat.service.ChattingService;
import com.coksabu.yojic.lesson.member.model.Profile;
import com.coksabu.yojic.lesson.member.service.ReadProfileService;

@Controller
public class BoardController extends DeviceSwitcherController  {
	
	private static final  Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//테스트 완료
	@RequestMapping(value="lessonWrite", method=RequestMethod.GET)
	public String write(LessonCard card, Model model, HttpSession session) throws IllegalStateException, IOException {
		return forward("boarder/lessonWrite");
	}
	
	//테스트 완료
	@RequestMapping(value="lessonWrite", method=RequestMethod.POST)
	public String write2(LessonCard card, Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		//입시 카테고리 제외하고 수업 1회, 2회, 3회 기준 안되게끔 막기 
		if(card.getCate().contains("입시")==false ){
			if(card.getPrice1().contains("1회분") || card.getOpt1price1().contains("1회분") || card.getOpt2price1().contains("1회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/lessonWrite");
			}
			if(card.getPrice1().contains("2회분") || card.getOpt1price1().contains("2회분") || card.getOpt2price1().contains("2회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/lessonWrite");
			}
			if(card.getPrice1().contains("3회분") || card.getOpt1price1().contains("3회분") || card.getOpt2price1().contains("3회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/lessonWrite");
			}
		}				
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		WriteLessonService writeService = ctx.getBean("writeLessonService", WriteLessonService.class );
		String path = request.getServletContext().getRealPath("resources/theme");
		
		
		
		logger.info(path+"경로");
		LessonCardDB lsc = new LessonCardDB(card, path);
		lsc.setCareerDB(card.getYcareer());
		int write = writeService.write(lsc);
		ctx.close();
		if(write==0) {
			model.addAttribute("error", "error");
			return forward("boarder/lessonWrite");
		}else {
			return forward("boarder/lessonSuccess");
		}
	}
	
	//테스트 완료
	@SuppressWarnings("unchecked")
	@RequestMapping(value="boarder", method=RequestMethod.GET)
	public String boarder(HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		String pageNumberString = (String)request.getParameter("p");
		String main = (String)request.getParameter("main");
		String subject = (String)request.getParameter("subject");
		String array = (String)request.getParameter("array");

		model.addAttribute("mainR", main);
		model.addAttribute("subjectR", subject);
		model.addAttribute("array", array);
		int pageNumber =1;
		if(pageNumberString!=null && !pageNumberString.equals("")) {
			pageNumber=Integer.parseInt(pageNumberString);
		}
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ListService listService = ctx.getBean(ListService.class);
		HashMap<String, Object> map;
		
		//읿반적인 GET요청
		if(request.getParameter("careerP")==null ||request.getParameter("careerP").equals("")){
			map = listService.listPost(pageNumber,subject, array);
			
		//POST 검색 후 검색결과 화면에서 페이지 이동 GET요청할때 검색폼값 유지하며 페이지 이동하기 위해
		}else {
			
			String locale1P = (String)request.getParameter("locale1P");
			locale1P = URLDecoder.decode(locale1P, "UTF-8");
			String locale2P = (String)request.getParameter("locale2P");
			locale2P = URLDecoder.decode(locale2P, "UTF-8");
			String careerP = (String)request.getParameter("careerP");
			String sexualP = (String)request.getParameter("sexualP");
			sexualP = URLDecoder.decode(sexualP, "UTF-8");
			String arrayP = (String)request.getParameter("arrayP");
			
			SearchForm form = new SearchForm();
			
			form.setArray(arrayP);
			form.setCareer(careerP);
			form.setLocale1(locale1P);
			form.setLocale2(locale2P);
			form.setSexual(sexualP);
			form.setSubject(subject);
			
			map = listService.searchPost(pageNumber, form);
			
			model.addAttribute("form", form);
		}
		
		
		ctx.close();
		PostList postList = (PostList)map.get("postList");
		List<PostView> postNewList = (List<PostView>)map.get("postNewList");
		
		request.setAttribute("listModel", postList);
		request.setAttribute("postNewList", postNewList);
		
		
		if(postList.getTotalPageCount() > 0){
			int beginPageNumber = (postList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > postList.getTotalPageCount()){
				endPageNumber = postList.getTotalPageCount();
			}
			request.setAttribute("p", pageNumberString);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
			main = ListService.switchSubject(main);
			subject = ListService.switchSubject(subject);
			
			model.addAttribute("main", main);
			model.addAttribute("subject", subject);
			return forward("boarder/boarder");
	}
	
	//테스트 완료
	@SuppressWarnings("unchecked") //List<PostView>)map.get("postNewList"); list타입 형변황 위해 사용
	@RequestMapping(value="boarder", method=RequestMethod.POST)
	public String boarder2(SearchForm form, HttpServletRequest request,Model model) {
		String main = (String)request.getParameter("main");
		String subject = (String)request.getParameter("subject");
		model.addAttribute("mainR", main);
		model.addAttribute("subjectR", subject);
		form.setSubject(subject);
		int pageNumber =1;
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ListService listService = ctx.getBean(ListService.class);
		//검색 Get에 추가
		HashMap<String, Object> map = listService.searchPost(pageNumber, form);
		ctx.close();
		PostList postList =(PostList)map.get("postList");
		List<PostView> postNewList = (List<PostView>)map.get("postNewList");
		request.setAttribute("listModel", postList);
		request.setAttribute("postNewList", postNewList);
		
		
		if(postList.getTotalPageCount() > 0){
			int beginPageNumber = (postList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > postList.getTotalPageCount()){
				endPageNumber = postList.getTotalPageCount();
			}
			request.setAttribute("p", 1);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
			main = ListService.switchSubject(main);
			subject = ListService.switchSubject(subject);

			model.addAttribute("main", main);
			model.addAttribute("subject", subject);
			//검색 Get에 추가
			model.addAttribute("form", form);
		
		return forward("boarder/boarder");
	}

	//미진행
	@RequestMapping(value="boardread", method=RequestMethod.GET)
	public String read(HttpServletRequest request,Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		String id = (String)request.getParameter("postId");
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ReadPostService readPostService = ctx.getBean(ReadPostService.class);

		HashMap<String, Object> map = readPostService.read(id);
		ctx.close();
		String tutorEmail= (String)map.get("tutorEmail");
		Profile profile = (Profile)map.get("profile");
		LessonCardDB2 lessonPost = (LessonCardDB2)map.get("lessonPost");
		
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		
		//삭제된 레슨
		if(lessonPost==null) {
			model.addAttribute("notExsist", "notExsist");
		}else {
			lessonPost.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(lessonPost.getPrice3())));
			if(lessonPost.getOpt1price3()!=null && !lessonPost.getOpt1price3().equals("")) {
				lessonPost.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(lessonPost.getOpt1price3())));
			}
			if(lessonPost.getOpt2price3()!=null && !lessonPost.getOpt2price3().equals("")) {
				lessonPost.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(lessonPost.getOpt2price3())));
			}
			
			model.addAttribute("tutorEmail",tutorEmail);
			
			model.addAttribute("postId",id);
			
			model.addAttribute("pro", profile);
			model.addAttribute("lesson", lessonPost);
			
			request.setAttribute("email", email);
			request.setAttribute("postId",id);
			request.setAttribute("name", profile.getName());
			request.setAttribute("lesson", lessonPost);
		}
		return forward("boarder/read");
	}
	
	//테스트 완료
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ReadLessonService readService = ctx.getBean(ReadLessonService.class);
		
		String email = (String)session.getAttribute("email");
		
		LessonCardDB2 lesson = readService.read((String)request.getParameter("id"), email);
		model.addAttribute("lesson", lesson);
		ctx.close();
		return forward("boarder/update");
	}
	
	//테스트 완료
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update2(LessonCard card, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		//입시 카테고리 제외하고 수업 1회, 2회, 3회 기준 안되게끔 막기 
		if(card.getCate().contains("입시")==false ){
			if(card.getPrice1().contains("1회분") || card.getOpt1price1().contains("1회분") || card.getOpt2price1().contains("1회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/update");
			}
			if(card.getPrice1().contains("2회분") || card.getOpt1price1().contains("2회분") || card.getOpt2price1().contains("2회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/update");
			}
			if(card.getPrice1().contains("3회분") || card.getOpt1price1().contains("3회분") || card.getOpt2price1().contains("3회분")) {
				model.addAttribute("error", "notPer1");
				return forward("boarder/update");
			}
		}						
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		WriteLessonService writeService = ctx.getBean("writeLessonService", WriteLessonService.class );
		
		String path = request.getServletContext().getRealPath("resources/theme");
		LessonCardDB lsc = new LessonCardDB(card, path);
		lsc.setCareerDB(card.getYcareer());
		int update = writeService.update(lsc, path);
		if(update !=0) {
			
		}
		ctx.close();
		return forward("boarder/updatesuccess");
	}
	
	//테스트 완료
	@RequestMapping("deletelesson")
	public String deleteLesson(HttpServletRequest request, Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		String id = request.getParameter("id");
		String email = (String)session.getAttribute("email");
		
		DeleteLessonService deleteService = ctx.getBean(DeleteLessonService.class);

		String path = request.getServletContext().getRealPath("resources/theme/");
		int delete = deleteService.deleteLesson(id, path, email);
		ctx.close();
		if(delete == 0) {
			model.addAttribute("delError", "delError");
		}
		return "redirect:tutorpage";
	}
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="delimg", method=RequestMethod.GET)
	public String delImg(HttpServletRequest request, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		String email = (String)session.getAttribute("email");
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		DeleteLessonService deleteService = ctx.getBean(DeleteLessonService.class);
		String path = request.getServletContext().getRealPath("resources/theme/mediaImg");
		deleteService.deleteImg(id, name, path, email);
		ctx.close();
		return "";
	}
	
	//테스트 완료
	@RequestMapping(value="lessonPurchase", method=RequestMethod.GET)
	@Transactional(rollbackFor= {Exception.class})
	public String lessonPurchase(HttpServletRequest request,HttpSession session, Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		PurchaseService purchaseService = ctx.getBean(PurchaseService.class);
		String id = request.getParameter("postId");
		String subcate = request.getParameter("subCate");
		PurchaseRead purchaseRead = purchaseService.purchaseRead(id, subcate);
		
		if(subcate.equals("first")) {
			purchaseRead.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(purchaseRead.getPrice3())));
			purchaseRead.setPubSubcate(purchaseRead.getSubCate0());
			purchaseRead.setPubprice1(purchaseRead.getPrice1());
			purchaseRead.setPubprice2(purchaseRead.getPrice2());
			purchaseRead.setPubprice3(purchaseRead.getPrice3());
		}else if(subcate.equals("second")) {
			purchaseRead.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(purchaseRead.getOpt1price3())));
			purchaseRead.setPubSubcate(purchaseRead.getSubCate1());
			purchaseRead.setPubprice1(purchaseRead.getOpt1price1());
			purchaseRead.setPubprice2(purchaseRead.getOpt1price2());
			purchaseRead.setPubprice3(purchaseRead.getOpt1price3());
		}else if(subcate.equals("third")) {
			purchaseRead.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(purchaseRead.getOpt2price3())));
			purchaseRead.setPubSubcate(purchaseRead.getSubCate2());
			purchaseRead.setPubprice1(purchaseRead.getOpt2price1());
			purchaseRead.setPubprice2(purchaseRead.getOpt2price2());
			purchaseRead.setPubprice3(purchaseRead.getOpt2price3());
		}
		String phone = purchaseService.phone((String)session.getAttribute("email"));
		ctx.close();
		
		model.addAttribute("purchase", purchaseRead);
		//구매자 핸드폰
		model.addAttribute("phone", phone);
		model.addAttribute("postId", id);
		model.addAttribute("subcateIdx", subcate);
		return forward("boarder/lessonPurchase");
	}
	
	//테스트 완료
	@RequestMapping(value="lessonPurchase", method=RequestMethod.POST)
	public String lessonPurchase2(PurchaseHistory pur, HttpServletRequest request,HttpSession session,Model model, RedirectAttributes redirectAttributes) throws ParseException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		PurchaseService purchaseService = ctx.getBean(PurchaseService.class);
		String buyerEmail = (String)session.getAttribute("email");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date end = transFormat.parse(pur.getEndDateS());
		pur.setEndDate(end);
		Date start = transFormat.parse(pur.getStartDateS());
		pur.setStartDate(start);
		HashMap<String, Object> map = purchaseService.insertPurchaseHistory(pur, buyerEmail, pur.getPostId());
		String status = (String)map.get("status");
		if(status.equals("success")) {
			String imgpath = purchaseService.success((String)map.get("email"));
			ctx.close();
			model.addAttribute("postId", pur.getPostId());
			
			model.addAttribute("buyername", pur.getBuyerName());
			model.addAttribute("sellernickname", pur.getSellerNickname());
			
			model.addAttribute("depositDay", pur.getStartDateS());
			model.addAttribute("imgpath", imgpath);
			model.addAttribute("price3", pur.getPrice3());
			model.addAttribute("depositor", pur.getDepositor());
			
			String[] bank1 = pur.getBank().split(" ");
			model.addAttribute("bank1", bank1[0]);
			model.addAttribute("bank2", bank1[1]);
			model.addAttribute("bank3", bank1[2]);
			return forward("boarder/purchaseSuccess");	
		}else {
			ctx.close();
			return forward("boarder/purchaseFail");
		}
		
	}
	
	//테스트 완료
	@Transactional(rollbackFor= {Exception.class})
	@RequestMapping(value="tutorprofile")
	public String tutorpage(Model model, HttpSession session, HttpServletRequest request) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ReadProfileService readProfileService = ctx.getBean("readProfileService", ReadProfileService.class );
		ReadLessonService readLessonService = ctx.getBean("readLessonService", ReadLessonService.class );
		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
		MyApplyListService myApplyListService = ctx.getBean("myApplyListService", MyApplyListService.class );
		
		String id = (String)request.getParameter("id");
		String root = (String)request.getParameter("root");
		String email;
		if(root.equals("apply")) {
			email = myApplyListService.takeEmail(id);
		}else {
			email = chattingService.takeReceiver(id);
			String myEmail = (String)session.getAttribute("email");
			email=email.replace(myEmail,"").replace(",", "").trim();
		}
		
		Profile pro = readProfileService.readProfile(email);
		if(pro == null) {
			model.addAttribute("pro", pro);
			ctx.close();
		}else {
			model.addAttribute("pro", pro);
			List<PostView> list = readLessonService.readLessonFromTutorProfile(email);
			for(Iterator<PostView> itr = list.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
				post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
				post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
			}
			ctx.close();
			model.addAttribute("list", list);
			model.addAttribute("size", list.size());
		}
		return forward("boarder/tutorprofile");
	}
	
}