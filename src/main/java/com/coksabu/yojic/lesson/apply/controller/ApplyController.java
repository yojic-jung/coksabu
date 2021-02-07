package com.coksabu.yojic.lesson.apply.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
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

import com.coksabu.yojic.DeviceSwitcher.DeviceSwitcherController;
import com.coksabu.yojic.lesson.apply.model.ApplyForm;
import com.coksabu.yojic.lesson.apply.model.ApplyList;
import com.coksabu.yojic.lesson.apply.model.ApplySearchForm;
import com.coksabu.yojic.lesson.apply.model.ApplyTeacher;
import com.coksabu.yojic.lesson.apply.service.ApplyService;
import com.coksabu.yojic.lesson.apply.service.ApplyShowService;
import com.coksabu.yojic.lesson.apply.service.ListApplyService;
import com.coksabu.yojic.lesson.apply.service.MyApplyListService;
import com.coksabu.yojic.lesson.apply.service.TeacherApplyService;

@Controller
public class ApplyController extends DeviceSwitcherController{
	
	private static final  Logger logger = LoggerFactory.getLogger(ApplyController.class);
	
	//테스트 완료
	@RequestMapping(value="lessonapply", method = RequestMethod.GET)
	public String lessonApply() {
		return forward("apply/goApply");
	}
	
	//테스트 완료
	@RequestMapping(value="apply", method = RequestMethod.GET)
	public String apply(Model model,HttpSession session) {
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		return forward("apply/lessonapply");
	}
	
	//테스트 완료
	@Transactional(rollbackFor= {Exception.class})
	@RequestMapping(value="apply", method = RequestMethod.POST)
	public String apply2(ApplyForm apply, Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ApplyService applyService = ctx.getBean("applyService", ApplyService.class );
		if(apply.getLocale2()==null) {
			apply.setLocale2(" ");//공백 지우면 안됨.
		}
		apply.setLocale(apply.getLocale1()+" "+apply.getLocale2());
		String applyStatus = applyService.apply(apply);
		String email = (String)session.getAttribute("email");
		if(applyStatus.equals("limit")) {
			ctx.close();
			model.addAttribute("limit","limit");
			return forward("apply/lessonapply");
		}else if(applyStatus.equals("none")) {
			ctx.close();
			model.addAttribute("error", "error");
			model.addAttribute("email", email);
			return forward("apply/lessonapply");
		//학생요청 성공
		}else {
			TeacherApplyService teacherApplyService = ctx.getBean("teacherApplyService", TeacherApplyService.class );
			String locale= apply.getLocale1()+" "+apply.getLocale2();
			String link = "https://m.coksabu.com/teacherApply?id="+applyStatus;
			teacherApplyService.sendPushNotificationTarget(locale,apply.getCate(), link);
			ctx.close();
			return "redirect:applysuccess";
		}
		
	}
	
	//테스트 완료
	@RequestMapping(value="applysuccess")
	public String apply3() {
		return forward("apply/applySuccess");
	}
	
	//통과
	@RequestMapping(value="applylist", method=RequestMethod.GET)
	public String applylist(HttpServletRequest request,Model model,HttpSession session) throws UnsupportedEncodingException {
		String pageNumberString = (String)request.getParameter("p");
	
		int pageNumber =1;
		if(pageNumberString!=null && !pageNumberString.equals("")) {
			pageNumber=Integer.parseInt(pageNumberString);
		}
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ListApplyService listApplyService = ctx.getBean(ListApplyService.class);
		
		ApplyList applyList;
		//읿반적인 GET요청
		if(request.getParameter("cateP")==null ||request.getParameter("cateP").equals("")){
			applyList = listApplyService.listPost(pageNumber);
		//POST 검색 후 검색결과 화면에서 페이지 이동 GET요청할때 검색폼값 유지하며 페이지 이동하기 위해
		}else {
			
			String locale1P = (String)request.getParameter("locale1P");
			locale1P = URLDecoder.decode(locale1P, "UTF-8");
			
			String locale2P = (String)request.getParameter("locale2P");
			locale2P = URLDecoder.decode(locale2P, "UTF-8");
			
			String gradeP = (String)request.getParameter("gradeP");
			gradeP = URLDecoder.decode(gradeP, "UTF-8");
			
			String sexualP = (String)request.getParameter("sexualP");
			sexualP = URLDecoder.decode(sexualP, "UTF-8");
			
			String cateP = (String)request.getParameter("cateP");
			cateP = URLDecoder.decode(cateP, "UTF-8");
			
			ApplySearchForm form = new ApplySearchForm();
			
			if(form.getLocale2()==null) {
				form.setLocale2("");
			}
			form.setLocale(locale1P+" "+locale2P);
			form.setLocale1(locale1P);
			form.setLocale2(locale2P);
			form.setGrade(gradeP);
			form.setSexual(sexualP);
			form.setCate(cateP);
			
			applyList = listApplyService.searchListPost(pageNumber, form);
			
			model.addAttribute("form", form);
		}
		
		
		ctx.close();
		request.setAttribute("listModel", applyList);
		if(applyList.getTotalPageCount() > 0){
			int beginPageNumber = (applyList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > applyList.getTotalPageCount()){
				endPageNumber = applyList.getTotalPageCount();
			}
			request.setAttribute("p", pageNumberString);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
		return forward("apply/applyList");
	}
	
	//통과
	@RequestMapping(value="applylist", method=RequestMethod.POST)
	public String applylist2(ApplySearchForm form, HttpServletRequest request,Model model,HttpSession session) {
		int pageNumber =1;
		if(form.getLocale2()==null) {
			form.setLocale2("");
		}
		form.setLocale(form.getLocale1()+" "+form.getLocale2());
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ListApplyService listApplyService = ctx.getBean(ListApplyService.class);
		ApplyList applyList = listApplyService.searchListPost(pageNumber, form);
		ctx.close();
		
		request.setAttribute("listModel", applyList);
		if(applyList.getTotalPageCount() > 0){
			int beginPageNumber = (applyList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > applyList.getTotalPageCount()){
				endPageNumber = applyList.getTotalPageCount();
			}
			request.setAttribute("p", 1);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
		model.addAttribute("form", form);
		
		return forward("apply/applyList");
	}
	
	//테스트 완료
	@RequestMapping(value="teacherApply", method=RequestMethod.GET)
	public String apply5(HttpServletRequest request, Model model,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		ApplyShowService applyShowService = ctx.getBean(ApplyShowService.class);
		String id = (String)request.getParameter("id");
		
		ApplyForm applyForm = applyShowService.list(Integer.parseInt(id));
		String name= applyForm.getName().substring(0,1)+" O O";
		applyForm.setName(name);
		model.addAttribute("apply",applyForm);
		ctx.close();
		return forward("apply/teacherApply");
	}
	//테스트 완료
	@RequestMapping(value="teacherApply", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class})
	public String apply6(ApplyTeacher apply, HttpServletRequest request, Model model,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		TeacherApplyService teacherApplyService = ctx.getBean(TeacherApplyService.class);
		String email = (String)session.getAttribute("email");
		
		apply.setTeacherEmail(email);
		HashMap<String, Object> statusMap = teacherApplyService.teacherApply(apply);
		
		String status = (String)statusMap.get("status");
		String applyEmail = (String)statusMap.get("applyEmail");
		
		model.addAttribute("status", status);
		
		ApplyShowService applyShowService = ctx.getBean(ApplyShowService.class);
		int id = apply.getApply_id();
		ApplyForm applyForm = applyShowService.list(id);
		
		
		//정상적으로 지원이 된 경우, 푸시알림보내기
		if(status.equals("true")) {
			try {
				teacherApplyService.sendPushForOneTarget(id, applyEmail);
			}catch(Exception e) {}
		}
		ctx.close();
		
		
		model.addAttribute("apply",applyForm);
		model.addAttribute("status", status);
		return forward("apply/teacherApply");
	}
	
	//테스트 완료
	@RequestMapping("mypage")
	public String apply9(Model model,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		MyApplyListService myApplyListService = ctx.getBean(MyApplyListService.class);
		String email =(String)session.getAttribute("email");
		List<ApplyForm> list = myApplyListService.myApplyList(email);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("bool",list.isEmpty());
		return forward("apply/mylist");
	}
	
	//테스트 완료
	@RequestMapping("myapply/delete")
	public String apply11(HttpServletRequest request, Model model, HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		MyApplyListService myApplyListService = ctx.getBean(MyApplyListService.class);
		String email = (String)session.getAttribute("email");
		
		myApplyListService.delete(request.getParameter("id"), email);
		ctx.close();
		return "redirect:/mypage";
	}
	
	//테스트 완료
	@RequestMapping("teacherForm")
	public String apply12(HttpServletRequest request, Model model, HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		String applyId= request.getParameter("id");
		
		String email = (String)session.getAttribute("email");
		
		MyApplyListService myApplyListService = ctx.getBean(MyApplyListService.class);
		List<ApplyTeacher> list = myApplyListService.myLessonList(applyId, email);
		ctx.close();
		
		model.addAttribute("size" , list.size());
		model.addAttribute("list" , list);
		return forward("apply/teacherForm");
	}
	
	
}
