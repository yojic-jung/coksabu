package com.coksabu.yojic.lesson.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coksabu.yojic.DeviceSwitcher.DeviceSwitcherController;
import com.coksabu.yojic.iamport.IamportClient;
import com.coksabu.yojic.lesson.board.model.PostView;
import com.coksabu.yojic.lesson.board.service.ReadLessonService;
import com.coksabu.yojic.lesson.board.service.ReadPostService;
import com.coksabu.yojic.lesson.member.model.Certify;
import com.coksabu.yojic.lesson.member.model.CertifyDB;
import com.coksabu.yojic.lesson.member.model.EmailInfo;
import com.coksabu.yojic.lesson.member.model.MemberInfo;
import com.coksabu.yojic.lesson.member.model.MyAccount;
import com.coksabu.yojic.lesson.member.model.MyQnaList;
import com.coksabu.yojic.lesson.member.model.PassFind;
import com.coksabu.yojic.lesson.member.model.Password;
import com.coksabu.yojic.lesson.member.model.Profile;
import com.coksabu.yojic.lesson.member.model.Promotion;
import com.coksabu.yojic.lesson.member.model.Qna;
import com.coksabu.yojic.lesson.member.model.TeacherDB;
import com.coksabu.yojic.lesson.member.model.TeacherInfo;
import com.coksabu.yojic.lesson.member.model.UnivList;
import com.coksabu.yojic.lesson.member.service.CertifyService;
import com.coksabu.yojic.lesson.member.service.CheckAndInsertService;
import com.coksabu.yojic.lesson.member.service.EmailPassFindService;
import com.coksabu.yojic.lesson.member.service.MemberService;
import com.coksabu.yojic.lesson.member.service.PromotionService;
import com.coksabu.yojic.lesson.member.service.ReadProfileService;
import com.coksabu.yojic.lesson.member.service.TokenRegisterService;
import com.coksabu.yojic.lesson.member.service.UnivSearchService;
import com.coksabu.yojic.lesson.member.service.WriteProfileService;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

@Controller
public class MemberController extends DeviceSwitcherController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//테스트 완료
	@RequestMapping("")
	public String main(@RequestParam(value = "status", defaultValue = "nothing") String status, HttpSession session, Model model ) throws Exception{
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ReadPostService readPostService = ctx.getBean("readPostService", ReadPostService.class );
		
		List<PostView> list = readPostService.listMain();
		String email = (String)session.getAttribute("email");
		// 메세지 빨간불 구현
		if(email!=null) {
			MemberService memberService = ctx.getBean("memberService", MemberService.class );
			int messageCount = memberService.takeUnreadMessageCount(email);
			
			String messageStatus;
			if(messageCount==0) {
				messageStatus="none";
			}else {
				messageStatus="exist";
			}
			
			session.setAttribute("messageStatus", messageStatus);
		}
		
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		return forward("main/index");
	}
	
	
	//테스트 완료
	@RequestMapping("useGuide")
	public String useGuide() throws Exception{
		return forward("main/useGuide");
	}
		
		
	
	//미진행
	@RequestMapping("badgecount")
	@ResponseBody
	public Map<String, Integer> badgecount(HttpServletRequest request,HttpSession session) throws Exception{
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		TokenRegisterService tokenRegisterService = ctx.getBean("tokenRegisterService", TokenRegisterService.class );
		String email = (String)session.getAttribute("email");
		int badgecount = tokenRegisterService.takeBadgeCount(email);
		ctx.close();
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("badgecount", badgecount);
		
		return map;
	}
	
	//미진행
	//xss필터링으로 토큰에 com.dywlr.jsonxssfilter.HtmlEscapingObjectMapperFactory에서 필터링 하는 특수문자가 포함되어 있느지 확인하지 못함
	@RequestMapping("giveToAndroidValue")
	@ResponseBody
	public Map<String, String> giveToAndroid(@RequestBody byte buffers[],HttpServletRequest request,HttpSession session) throws Exception{
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		TokenRegisterService tokenRegisterService = ctx.getBean("tokenRegisterService", TokenRegisterService.class );
		String email = (String)session.getAttribute("email");
		
		HashMap<String, String> map = new HashMap<>();
		if(email.equals("") || email==null) {
			logger.warn("로그아웃시 토큰 삭제 안함");
			ctx.close();
			return map;
		}
		
		String token = new String(buffers,"UTF-8");
		token = URLDecoder.decode(token,"UTF-8");
		token = token.substring(0, token.length()-1);
		String status = tokenRegisterService.registerPushToken(email, token, "android");
		ctx.close();
		
		
		map.put("status", status);
		map.put("email", email);
		map.put("token", token);
		logger.info(token);
		
		return map;
	}
	
	
	@RequestMapping("giveToIOS")
	@ResponseBody
	public String giveToIOS(@RequestBody String tokenParam,HttpServletRequest request,HttpSession session) throws ParseException, JSONException{
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		TokenRegisterService tokenRegisterService = ctx.getBean("tokenRegisterService", TokenRegisterService.class );
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(tokenParam);
		JSONObject jsonObj = (JSONObject) obj;
		String email = (String)jsonObj.get("email");
		String token = (String)jsonObj.get("token");
		String change = (String)jsonObj.get("emailTokenChange");
		logger.warn(email);
		logger.warn(token);
		logger.warn(token);
		logger.warn(change);
		
		//ios앱의 이메일또는 토큰이 달라져서 토큰 또는 이메일을 새롭게 등록하는 경우
		if(change.equals("change")) {
			tokenRegisterService.registerPushToken(email, token, "ios");	
		}		
		
		String unreadCount =String.valueOf(tokenRegisterService.takeBadgeCount(email));
		ctx.close();
		return unreadCount;
	}
	
	
	//테스트 완료
	@RequestMapping("myroom")
	public String myroom( HttpSession session, Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		String name = memberSerivce.takeName((String)session.getAttribute("email"));
		ctx.close();
		model.addAttribute("name", name);
		return forward("member/myroom");
	}
	
	
	//테스트 완료
	@RequestMapping("category")
	public String category() {
		return forward("member/category");
	}
	
	
	//테스트 완료
	@RequestMapping("404error")
	public String error404() {
		return forward("main/404error");
	}
	
	
	//테스트 완료
	@RequestMapping("400error")
	public String error400() {
		return forward("main/400error");
	}
	

	
	//테스트 완료
	@RequestMapping("error")
	public String error() {
		return forward("main/500error");
	}

	//테스트 완료
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public String signUp(MemberInfo mem, Model model) {	
		model.addAttribute("iamport", "imp48047014");
		model.addAttribute("merchant_uid", "ORD20180131-0000011");
		return forward("member/signup");
	}
	
	//테스트 완료
	@ResponseBody	
	@RequestMapping(value="certifications/{imp_uid}", method=RequestMethod.POST)
	public Object certifications(@PathVariable String imp_uid, HttpServletRequest request, HttpServletResponse response) throws Exception {

		IamportClient iam = new IamportClient("2626730431329357", "jm37bnUp381Ov6hQjE8fXJZry3Tj53NopRwAeq0hz1548nVr14HYNGqmKjGPntdMlJnzanRKpXOykK0m");
		IamportResponse<Certification> cer = iam.certificationByImpUid(imp_uid);
		
		SimpleDateFormat date = new SimpleDateFormat("yyMMdd");
		
		Certification cer1 = cer.getResponse();
		cer1.getPhone();
		HashMap<String, String> map = new HashMap<>();
		map.put("name", cer.getResponse().getName());
		map.put("birth", date.format(cer.getResponse().getBirth()) );
		map.put("phone", cer.getResponse().getPhone());
		
		return map;
	}
	
	//테스트 완료
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public String signUp2(MemberInfo mem,  Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		mem.setLoginDate(new Date());
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		CheckAndInsertService checkAndInsertService = ctx.getBean("checkAndInsertService", CheckAndInsertService.class );

		if(mem.getPhone().equals("") ) {
			ctx.close();
			//휴대폰 인증하지 않고 서버로 들어온 경우
			model.addAttribute("ex", "certify");
			model.addAttribute("iamport", "imp48047014");
			model.addAttribute("merchant_uid", "ORD20180131-0000011");
			return forward("member/signup");
		}
		HashMap<String, String> signupMap = checkAndInsertService.signUp(mem);
		ctx.close();
		
		String singupStatus = signupMap.get("signupStatus");
		
		if( singupStatus.equals("emailDuplicate") ) {
			model.addAttribute("ex", "exception");
			model.addAttribute("iamport", "imp48047014");
			model.addAttribute("merchant_uid", "ORD20180131-0000011");
			return forward("member/signup");
		}else if( singupStatus.equals("phoneDuplicate") ) {
			model.addAttribute("ex", "phone");
			model.addAttribute("iamport", "imp48047014");
			model.addAttribute("merchant_uid", "ORD20180131-0000011");
			return forward("member/signup");
		}else {
			
			String encryptedPass = signupMap.get("password");
			//자동 로그인 처리
			SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority("user");
			List<SimpleGrantedAuthority> collection = new ArrayList<>();
			collection.add(simpleGrantedAuthority);
			UserDetails customUserDetails = new User(mem.getEmail(),encryptedPass, collection);
			
		    Authentication authentication = new UsernamePasswordAuthenticationToken(customUserDetails,encryptedPass, customUserDetails.getAuthorities());

		    SecurityContext securityContext = SecurityContextHolder.getContext();
		    securityContext.setAuthentication(authentication);
		    session = request.getSession(true);
		    session.setAttribute("email", mem.getEmail());
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		    
		    long tokenValidityTime = 14515200000L;
			long millis = System.currentTimeMillis()+tokenValidityTime;
			
			String target = mem.getEmail() + ":" + millis + ":" +org.apache.commons.codec.digest.DigestUtils.md5Hex(mem.getEmail() + ":" + millis + ":"+encryptedPass + ":" + "wmoskey");
		    byte[] targetBytes = target.getBytes();
	        // Base64 인코딩 /////////
	        Encoder encoder = Base64.getEncoder();
	        
	        // Encoder#encode(byte[] src) :: 바이트배열로 반환
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        
	        String rememberCookie = new String(encodedBytes);
	        String rememberMeCookie = rememberCookie.replace("=", "");
	        
	        Cookie cookie = new Cookie("remember-me",rememberMeCookie);
	        cookie.setPath("/");
	        cookie.setHttpOnly(true);
	        cookie.setMaxAge(14515200);
	        
	        response.addCookie(cookie);
		    return forward("member/signupSuccess");
		}
	}
	
	
	//테스트 완료
	@RequestMapping(value="login")
	public String login(HttpSession session, HttpServletRequest request) {
		String referer = (String)request.getHeader("REFERER");
		session.setAttribute("referer", referer);
		return forward("member/login");
	}
	
	
	//테스트 완료
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 프로필 만들기 전 인증하는 부분 일단 없애놓음
	//테스트 완료
	@RequestMapping(value="lessoncertify", method=RequestMethod.GET)
	public String mycertify( Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		LessonCertifyService lessonCertify  = ctx.getBean("lessonCertifyService", LessonCertifyService.class);
		LessonCertify certify = lessonCertify.certifyRead((String)session.getAttribute("email"));
		ctx.close();
		model.addAttribute("certify", certify);
		return forward("member/lessoncertify");
	}
	
	
	//테스트 완료
	@RequestMapping(value="lessoncertify", method=RequestMethod.POST)
	public String mycertify2(LessonCertify certify,HttpSession session, Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		LessonCertifyService lsessonCertify  = ctx.getBean("lessonCertifyService", LessonCertifyService.class );
		certify.setEmail((String)session.getAttribute("email"));
		if(lsessonCertify.lessonCertify(certify)==-1) {
			ctx.close();
			model.addAttribute("nameDiscord", "nameDiscord");
			return forward("member/lessoncertify");
		}
		ctx.close();
		model.addAttribute("status", "success");
		return forward("member/lessoncertify");
	}
	**/
	
	//테스트완료
	@RequestMapping(value="profile", method=RequestMethod.GET)
	public String profile(TeacherInfo tea, Model model,HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		ReadProfileService readProfileService = ctx.getBean("readProfileService", ReadProfileService.class );
		String email = (String)session.getAttribute("email");
		
		
		
		TeacherDB pro = readProfileService.takeTeacherDB(email);
		model.addAttribute("pro", pro);
		ctx.close();
		
		String locale = pro.getLocales();
		model.addAttribute("locale",locale);
		return forward("member/profile");
	}
	

	//테스트완료
	@RequestMapping(value = "profile",method=RequestMethod.POST)
	public String profile2(TeacherInfo tea, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
	
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		WriteProfileService writeProfileService = ctx.getBean("writeProfileService", WriteProfileService.class );
		String path = request.getServletContext().getRealPath("resources/theme/profileImg");
		logger.info(path);
		TeacherDB tdb = new TeacherDB(tea, path);
		writeProfileService.writeProfile(tdb, path);
		ctx.close();
	
		return "redirect:/tutorpage";
	}
	
	//미진행
	@Transactional(rollbackFor= {Exception.class})
	@RequestMapping(value="tutorpage")
	public String tutorpage(Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ReadProfileService readProfileService = ctx.getBean("readProfileService", ReadProfileService.class );
		ReadLessonService readLessonService = ctx.getBean("readLessonService", ReadLessonService.class );
		
		String email = (String)session.getAttribute("email");
		
		/** 
		  프로필 만들기 전 인증하는 부분 일단 없애놓음
		if(readProfileService.confirmCertify(email)!=1) {
			model.addAttribute("certify", "0");
		}
		**/
		
		Profile pro = readProfileService.readProfile(email);
		if(pro == null) {
			model.addAttribute("pro", pro);
			ctx.close();
		}else {
			model.addAttribute("pro", pro);
			List<PostView> list = readLessonService.readLesson((String)session.getAttribute("email"));
			for(Iterator<PostView> itr = list.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
			}
			ctx.close();
			model.addAttribute("email", email);
			model.addAttribute("list", list);
			model.addAttribute("size", list.size());
		}
		return forward("member/tutorpage");
	}
	//테스트 완료
	@RequestMapping(value="subCheckForm", method=RequestMethod.GET)
	public String subCheckForm(HttpServletRequest request) throws UnsupportedEncodingException{
		String pageNumberString = (String)request.getParameter("p");
		int pageNumber =1;
		if(pageNumberString!=null && !pageNumberString.equals("")) {
			pageNumber=Integer.parseInt(pageNumberString);
		}
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		UnivSearchService univSearchService = ctx.getBean("univSearchService", UnivSearchService.class);
		
		
		
		String univinput = (String)request.getParameter("univ");
		if(univinput!=null) {
			univinput = URLDecoder.decode(univinput, "UTF-8");
		}
		
		HashMap<String, Object> map = univSearchService.list(pageNumber, univinput);
		ctx.close();
		
		
		UnivList univList = (UnivList)map.get("univList");
		
		request.setAttribute("listModel", univList);
		
		if(univList.getTotalPageCount() > 0){
			int beginPageNumber = (univList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > univList.getTotalPageCount()){
				endPageNumber = univList.getTotalPageCount();
			}
			request.setAttribute("p", pageNumberString);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
		request.setAttribute("univ", univinput);
		return forward("member/SubCheckForm");
	}
	
	//테스트 완료
	@RequestMapping(value="subCheckForm", method=RequestMethod.POST)
	public String subCheckForm2(@RequestParam("univinput")String univinput, HttpServletRequest request, Model model) {
		int pageNumber =1;
		
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		UnivSearchService univSearchService = ctx.getBean("univSearchService", UnivSearchService.class);
		HashMap<String, Object> map = univSearchService.list(pageNumber, univinput);
		ctx.close();
		
		UnivList univList = (UnivList)map.get("univList");
		
		request.setAttribute("listModel", univList);
		
		if(univList.getTotalPageCount() > 0){
			int beginPageNumber = (univList.getRequestPage()-1)/5*5 + 1;
			int endPageNumber = beginPageNumber + 4;
			if(endPageNumber > univList.getTotalPageCount()){
				endPageNumber = univList.getTotalPageCount();
			}
			request.setAttribute("p", 1);
			request.setAttribute("beginPage", beginPageNumber);
			request.setAttribute("endPage", endPageNumber);
		}
		
		request.setAttribute("univ", univinput);
		
		return forward("member/SubCheckForm");
	}

	
	//테스트 완료
	@RequestMapping(value="certify", method=RequestMethod.GET)
	public String certify(Model model, HttpSession session) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		CertifyService certifyService = ctx.getBean("certifyService", CertifyService.class);
		String email = (String)session.getAttribute("email");
		
		//수정
		CertifyDB cerDB = certifyService.tekeCertify( email );
		
		ctx.close();
		model.addAttribute("email", email);
		model.addAttribute("cerDB", cerDB);
		return forward("member/certify");
	}
	
	//테스트 완료
	@RequestMapping(value="certify", method=RequestMethod.POST)
	public String certify2(Certify cer, Model model,HttpServletRequest request) throws IllegalStateException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		CertifyService certifyService = ctx.getBean("certifyService", CertifyService.class);
		
		String path = request.getServletContext().getRealPath("resources/theme/certifyImg");
		
		CertifyDB cerDB = new CertifyDB(cer, path);
		
		int a = certifyService.certify(cerDB, path);
		
		model.addAttribute("cerDB", cerDB);
		
		if (a==1) {
			model.addAttribute("status", "success");
		}else {
			model.addAttribute("status", "fail");
		}
		
		ctx.close();
		return forward("member/certify");
		
	}
	
	
	//수정필요
	@RequestMapping(value="promotion", method=RequestMethod.GET)
	public String promotionpage(HttpSession session, Model model) {
		String email = (String)session.getAttribute("email");
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		PromotionService promotionService = ctx.getBean("promotionService", PromotionService.class);
		Promotion promotion = promotionService.myPromotion(email);
		ctx.close();
		model.addAttribute("promotion", promotion);
		return forward("member/promotion");
	}
	
		//수정필요
	@RequestMapping(value="promotion", method=RequestMethod.POST)
	public String promotionpage2(Promotion promotion,HttpSession session, Model model) {
		promotion.setEmail((String)session.getAttribute("email"));
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		PromotionService promotionService = ctx.getBean("promotionService", PromotionService.class);
		String status = promotionService.registerMyPromotion(promotion);
		ctx.close();
		model.addAttribute("status", status);
		
		return forward("member/promotionSuccess");
	}
	
	
	//수정필요
	@RequestMapping("private")
	public String private1() {
		return "member/private";
	}
	
	//수정필요
	@RequestMapping("service")
	public String service() {
		return "member/service";
	}
	
	//테스트 완료
	@RequestMapping(value="usersetting", method=RequestMethod.GET)
	public String usersetting(HttpSession session, Model model) throws IamportResponseException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		MemberInfo member = memberSerivce.read((String)session.getAttribute("email"));
		ctx.close();
		model.addAttribute("member", member);
		model.addAttribute("iamport", "imp48047014");
		model.addAttribute("merchant_uid", "ORD20180131-0000011");
				
		return forward("member/usersetting");
	}
	
	
	//테스트 완료
		@RequestMapping(value="myaccountinfo", method=RequestMethod.GET)
		public String myaccountinfo( Model model, HttpSession session) {
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(
					configLocation);
			MemberService memberService  = ctx.getBean("memberService", MemberService.class);
			MyAccount account = memberService.takeMyAccount((String)session.getAttribute("email"));
			ctx.close();
			model.addAttribute("account", account);
			return forward("member/myaccountinfo");
		}
		
		
		//테스트 완료
		@RequestMapping(value="myaccountinfo", method=RequestMethod.POST)
		public String myaccountinfo2(MyAccount myaccount, Model model, HttpSession session) {
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(
					configLocation);
			MemberService memberService  = ctx.getBean("memberService", MemberService.class);
			String email = (String)session.getAttribute("email");
			myaccount.setEmail(email);
			int a = memberService.updateMyAccount(myaccount);
			if(a==1) {
				model.addAttribute("status", "success");
				MyAccount account = memberService.takeMyAccount(email);
				model.addAttribute("account", account);
			}else {
				model.addAttribute("status", "fail");
			}
			ctx.close();
			return forward("member/myaccountinfo");
		}
	
	@RequestMapping(value="nicknameUpdate", method=RequestMethod.GET)
	public String nicknameUpdate(MemberInfo mem, HttpSession session, Model model) throws IamportResponseException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		String email = (String)session.getAttribute("email");
		String nickName = memberSerivce.takeNickName(email);
		model.addAttribute("nickName", nickName);
		
		ctx.close();
		return forward("member/nicknameUpdate");
	}
	
	@RequestMapping(value="nicknameUpdate", method=RequestMethod.POST)
	public String nicknameUpdate2(MemberInfo mem, HttpSession session, Model model) throws IamportResponseException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		String email = (String)session.getAttribute("email");
		mem.setEmail(email);
		int status = memberSerivce.updateNickName(mem, email);
		if(status==-1) {
			String nickName = memberSerivce.takeNickName(email);
			ctx.close();
			model.addAttribute("nickName", nickName);
			model.addAttribute("status", "existPurchase");
			return forward("member/nicknameUpdate");
		}
		ctx.close();
		return "redirect:/usersetting";
	}
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="usersetting/{imp_uid}", method=RequestMethod.POST)
	public String usersetting2(@PathVariable String imp_uid,  HttpSession session, Model model) throws IamportResponseException, IOException {
		IamportClient iam = new IamportClient("2626730431329357", "jm37bnUp381Ov6hQjE8fXJZry3Tj53NopRwAeq0hz1548nVr14HYNGqmKjGPntdMlJnzanRKpXOykK0m");
		IamportResponse<Certification> cer = iam.certificationByImpUid(imp_uid);
		
		MemberInfo member = new MemberInfo();
		member.setName(cer.getResponse().getName());
		SimpleDateFormat date = new SimpleDateFormat("yyMMdd");
		
		member.setBirth(date.format(cer.getResponse().getBirth()));
		member.setPhone(cer.getResponse().getPhone());
		member.setEmail((String)session.getAttribute("email"));
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		String status = memberSerivce.updatePhone(member);
		ctx.close();
				
		return status;
	}
	
	//테스트 완료
	@RequestMapping(value="passwordsetting", method=RequestMethod.GET)
	public String passsetting(HttpSession session, Model model) {
				
		return forward("member/passwordsetting");
	}
	
	//테스트 완료
	@RequestMapping(value="passwordsetting", method=RequestMethod.POST)
	public String passsetting2(Password password, HttpSession session, Model model) {
		if( !password.getPassword2().equals(password.getPassword3()) ){
			model.addAttribute("error", "error");
			return forward("member/passwordsetting");
		}else {
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(
					configLocation);
			MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
			password.setEmail((String)session.getAttribute("email"));
			int status = memberSerivce.updatePassword(password);
			ctx.close();
			
			if(status==-1) {
				model.addAttribute("status", "error");
				return forward("member/passwordsetting");
			}else {
				model.addAttribute("status", "success");
				return "redirect:/usersetting";
			}
		}
		
		
	}
	
	//개선필요
	@RequestMapping(value="secession", method=RequestMethod.GET)
	public String secession(HttpSession session, Model model) {
				
		return forward("member/secession");
	}
	
	//테스트 완료
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public String qna(HttpSession session, Model model) {
				
		return  forward("main/qna");
	}
	
	//테스트 완료
	@RequestMapping(value="qna", method=RequestMethod.POST)
	public String qna2(Qna qna, HttpSession session, Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		qna.setEmail((String)session.getAttribute("email"));
		memberSerivce.insertQna(qna);
		ctx.close();
		model.addAttribute("success", "success");
		return  forward("main/qna");
	}
	
	//테스트 완료
	@RequestMapping(value="myqna", method=RequestMethod.GET)
	public String myqna(HttpSession session,HttpServletRequest request ,Model model) {
			String pageNumberString = (String)request.getParameter("p");
			int pageNumber =1;
			if(pageNumberString!=null && !pageNumberString.equals("")) {
				pageNumber=Integer.parseInt(pageNumberString);
			}
			
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
			String email = (String)session.getAttribute("email");
			MyQnaList myqnaList = memberSerivce.myqna(email, pageNumber);
			ctx.close();
			model.addAttribute("list", myqnaList);
			
			if(myqnaList.getTotalPageCount() > 0){
				int beginPageNumber = (myqnaList.getRequestPage()-1)/10*10 + 1;
				int endPageNumber = beginPageNumber + 9;
				if(endPageNumber > myqnaList.getTotalPageCount()){
					endPageNumber = myqnaList.getTotalPageCount();
				}
				request.setAttribute("p", pageNumberString);
				request.setAttribute("beginPage", beginPageNumber);
				request.setAttribute("endPage", endPageNumber);
			}
			
			return  forward("main/myqna");
		}
		
	//테스트 완료
	@RequestMapping(value="customer", method=RequestMethod.GET)
	public String customer(HttpSession session, Model model) {
		return  forward("main/customer");
	}
	
	//테스트 완료
	@RequestMapping(value="emailPassFind", method=RequestMethod.GET)
	public String emailPassFind(Model model) {
		model.addAttribute("iamport", "imp48047014");
		model.addAttribute("merchant_uid", "ORD20180131-0000011");
		return forward("member/emailPassFind");
	}
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="emailFind", method=RequestMethod.GET)
	public String emailFind2(HttpServletRequest request, Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		EmailPassFindService emailPassFindService = ctx.getBean("emailPassFindService", EmailPassFindService.class);
		EmailInfo info = new EmailInfo();
		info.setName((String)request.getParameter("name"));
		info.setPhone((String)request.getParameter("phone"));
		String email = emailPassFindService.emailFind(info);
		ctx.close();
		
		return email;
	}
	
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="passwordFind", method=RequestMethod.GET)
	public String passFind2(HttpServletRequest request) throws AddressException, MessagingException {
		PassFind pass = new PassFind();
		pass.setEmail((String)request.getParameter("email"));
		pass.setPhone((String)request.getParameter("phone"));
		System.out.println(pass.getEmail());
		System.out.println(pass.getPhone());
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		EmailPassFindService emailPassFindService = ctx.getBean("emailPassFindService", EmailPassFindService.class);
		String password = emailPassFindService.passFind(pass);
		ctx.close();
		
		if(password.equals("")) {
			return "false";
		}else {
			mailSender(request, pass.getEmail(), password);
			return "success";
		}
		
	}
	
	//테스트 완료
	public static void mailSender(HttpServletRequest request, String email, String userPassword) throws AddressException, MessagingException {
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.gmail.com"; 
		final String username = "coksabubusiness"; 
		//네이버 아이디를 입력해주세요. @naver.com은 입력하지 마시구요. 
		final String password = "zjavbxj789!"; 
		//네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 // 메일 내용 
		String recipient = email; 
		//받는 사람의 메일주소를 입력해주세요. 
		String subject = "[콕사부] 비밀번호 안내"; 
		//메일 제목 입력해주세요. 
		String body ="<div style='width:500px;height:600px; font-family:\"Malgun Gothic\";background: rgb(226, 224, 224);padding:30px 100px;'><div style='width:300px; margin:150px auto;line-height:180%; padding:20px;background:white;'><img style='width:100px' src=\"https://coksabu.com/resources/images/logo.png\" /><br/><br/><div style='color:orange;font-size:25px;'>비밀번호 안내</div><br/><div style='font-size:15px;'>안녕하세요. 회원님,<br/> 회원님의 비밀번호는 <br/><span style='color:gray;'>"+
		userPassword+
		"</span> 입니다.</div><br/><div style='font-weight:bold;background:rgb(236, 250, 106);font-size:13px; padding:10px;'>비밀번호를 확인하셨다면 메일을 삭제하여<br/> 2차 피해를 예방하시기 바랍니다.</div><br/><div style='text-align:center;'><br/><a href='http://coksabu.com/login'><span style='text-decoration:none;font-size:18px;border:none; border-radius:14px; padding:10px; background:orange; color:white;cursor:pointer'>콕사부 로그인하기</span></a></div></div></div>";
				
		//메일 내용 입력해주세요. 
		Properties props = System.getProperties(); 
		// 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); 
		//for debug 
		Message mimeMessage = new MimeMessage(session); 
		//MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("coksabubusiness@gmail.com")); 
		//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); 
		//제목셋팅 
		

		mimeMessage.setContent(body, "text/html; charset=utf-8");

   
		//내용셋팅 
		Transport.send(mimeMessage); 
		//javax.mail.Transport.send() 이용 }
	}
	
	//수정필요
	@RequestMapping(value = "/privateData") 
	public String privateData(){
		return "member/private";
	}
	
	//테스트 완료
	@RequestMapping(value = "/companyInfo") 
	public String companyInfo(){
		return forward("main/companyInfo");
	}
	
	
	//테스트 완료
	@RequestMapping(value="logintest")
	public String logintest(HttpSession session, HttpServletRequest request) {
		return forward("member/logintest");
	}
	
		
	//테스트 완료
	@RequestMapping(value="loginCallBackNaver")
	public String naverLoginCallBack() {	
		return forward("member/naverLoginCallBack");
	}
	
	
		
	@RequestMapping(value="naverSignupSuccess")
	public String naverSignupSuccess(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return forward("member/naverSignupSuccess");
	}
		
		
	//테스트 완료
	@ResponseBody
	@RequestMapping(value="naverLogin", method=RequestMethod.POST)
	public Map<String, String> naverLogin(MemberInfo mem,  Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		mem.setLoginDate(new Date());
		
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		CheckAndInsertService checkAndInsertService = ctx.getBean("checkAndInsertService", CheckAndInsertService.class );
		
		
		//보안을 위해 비밀번호  암호화
		String password = mem.getNaverToken();
		Random random = new Random();
		for(int i=0; i<5; i++) {
			password = password+(char)((Math.random() * 26) + 97)+random.nextInt(10);
			logger.warn("반복문 password : "+password);
		}
		logger.warn("최종 password : "+password);
		
		mem.setPassword(password);
		HashMap<String,String> status = checkAndInsertService.naverLogin(mem);
		ctx.close();
			
		HashMap<String, String> map = new HashMap<String, String>();
		
		if( status.get("status").equals("phoneDuplicate") ) {
			map.put("status", "phoneDuplicate");
			return map;
		}else {
			
			
			SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority("user");
			List<SimpleGrantedAuthority> collection = new ArrayList<>();
			collection.add(simpleGrantedAuthority);
			UserDetails customUserDetails = new User(mem.getEmail(), status.get("password"), collection);
			
		    Authentication authentication = new UsernamePasswordAuthenticationToken(customUserDetails, status.get("password"), customUserDetails.getAuthorities());

		    SecurityContext securityContext = SecurityContextHolder.getContext();
		    securityContext.setAuthentication(authentication);
		    session = request.getSession(true);
		    session.setAttribute("email", mem.getEmail());
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			
		    long tokenValidityTime = 14515200000L;
			long millis = System.currentTimeMillis()+tokenValidityTime;
			
			String target = mem.getEmail() + ":" + millis + ":" +org.apache.commons.codec.digest.DigestUtils.md5Hex(mem.getEmail() + ":" + millis + ":"+status.get("password") + ":" + "wmoskey");
		    byte[] targetBytes = target.getBytes();
	        // Base64 인코딩 ///////////////////////////////////////////////////
	        Encoder encoder = Base64.getEncoder();
	        
	        // Encoder#encode(byte[] src) :: 바이트배열로 반환
	        byte[] encodedBytes = encoder.encode(targetBytes);
	        String rememberCookie = new String(encodedBytes);
	        String rememberMeCookie = rememberCookie.replace("=", "");
	        Cookie cookie = new Cookie("remember-me",rememberMeCookie);
	        cookie.setPath("/");
	        cookie.setHttpOnly(true);
	        cookie.setMaxAge(14515200);
	        
	        response.addCookie(cookie);
	        
	        map.put("status", status.get("status"));
			return map;
		}
	}
	
}
