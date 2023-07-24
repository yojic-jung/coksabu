package com.coksabu.yojic.lesson.member.controller;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.SecureRandom;
import java.security.interfaces.RSAPublicKey;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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

import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
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
import com.coksabu.yojic.lesson.apply.service.ApplyService;
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
import com.coksabu.yojic.lesson.member.model.Qna;
import com.coksabu.yojic.lesson.member.model.TeacherDB;
import com.coksabu.yojic.lesson.member.model.TeacherInfo;
import com.coksabu.yojic.lesson.member.model.UnivList;
import com.coksabu.yojic.lesson.member.service.CertifyService;
import com.coksabu.yojic.lesson.member.service.CheckAndInsertService;
import com.coksabu.yojic.lesson.member.service.EmailPassFindService;
import com.coksabu.yojic.lesson.member.service.MemberService;
import com.coksabu.yojic.lesson.member.service.ReadProfileService;
import com.coksabu.yojic.lesson.member.service.TokenRegisterService;
import com.coksabu.yojic.lesson.member.service.UnivSearchService;
import com.coksabu.yojic.lesson.member.service.WriteProfileService;
import com.coksabu.yojic.loginhandler.LoginCommonFunction;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.RSASSAVerifier;
import com.nimbusds.jose.jwk.JWK;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

import http.communication.HttpClientUtils;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import social.login.apple.model.Key;
import social.login.apple.model.Keys;

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
		for(Iterator<PostView> itr = list.iterator(); itr.hasNext();) {
			PostView post = itr.next();
			post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
			if(post.getOpt1price3()!=null && !post.getOpt1price3().equals("")) {
				post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
			}
			if(post.getOpt2price3()!=null && !post.getOpt2price3().equals("")) {
				post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
			}
			if(post.getOpt3price3()!=null && !post.getOpt3price3().equals("")) {
				post.setOpt3price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt3price3())));
			}
			if(post.getOpt4price3()!=null && !post.getOpt4price3().equals("")) {
				post.setOpt4price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt4price3())));
			}
		}
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
		//애플로 로그인의 nonce값
		//애플로 로그인 state값
		String state = new BigInteger(130, new SecureRandom()).toString(32);
		ctx.close();
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("client_nonce", "75dbac00-b326-42fa-86b4-dde6b38c7201");
		model.addAttribute("state", state);
		return forward("main/index");
	}
	
	
	//테스트 완료
	@RequestMapping("accessDenied")
	public String accessDenied(HttpSession session, Model model){
		String email = (String)session.getAttribute("email");
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CheckAndInsertService checkAndInsertService = ctx.getBean("checkAndInsertService", CheckAndInsertService.class );
		String authority = checkAndInsertService.takeAuthority(email);
		ctx.close();
		model.addAttribute("iamport", "imp48047014");
		model.addAttribute("merchant_uid", "ORD20180131-0000011");
		model.addAttribute("authority", authority);
		
		return forward("main/accessDenied");
	}
	
	
	//테스트 완료
	@RequestMapping("useGuide")
	public String useGuide() throws Exception{
		return forward("main/useGuide");
	}
	
	
	//테스트 완료
	@RequestMapping("tutorUseGuide")
	public String tutorUseGuide() throws Exception{
		
		return forward("main/tutorUseGuide");
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
		email= email.replaceAll("\"", "");
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
		String nickName = memberSerivce.takeNickName((String)session.getAttribute("email"));
		ctx.close();
		model.addAttribute("nickName", nickName);
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
	public String signUp(MemberInfo mem, HttpSession session, Model model) {	
		//애플로 로그인 state값
		String state = new BigInteger(130, new SecureRandom()).toString(32);
		model.addAttribute("client_nonce", "75dbac00-b326-42fa-86b4-dde6b38c7201");
		model.addAttribute("state", state);
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
	
	@ResponseBody	
	@RequestMapping(value="idCertifyOnlyPreUser/{imp_uid}", method=RequestMethod.POST)
	public Object certificationsPreUser(@PathVariable String imp_uid, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		IamportClient iam = new IamportClient("2626730431329357", "jm37bnUp381Ov6hQjE8fXJZry3Tj53NopRwAeq0hz1548nVr14HYNGqmKjGPntdMlJnzanRKpXOykK0m");
		IamportResponse<Certification> cer = iam.certificationByImpUid(imp_uid);
		
		SimpleDateFormat date = new SimpleDateFormat("yyMMdd");
		
		Certification cer1 = cer.getResponse();
		cer1.getPhone();
		MemberInfo mem = new MemberInfo();
		String email = (String)session.getAttribute("email");
		mem.setEmail(email);
		mem.setName( cer.getResponse().getName());
		mem.setBirth(date.format(cer.getResponse().getBirth()));
		mem.setPhone(cer.getResponse().getPhone());
		HashMap<String, String> map = new HashMap<>();
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		MemberService memberSerivce = ctx.getBean("memberService", MemberService.class);
		HashMap<String, String> memStatus = memberSerivce.updateMemberforPreUser(mem);
		String status = memStatus.get("status");
		map.put("status", status);
		ctx.close();
		if(status.equals("success")) {
			SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority("user");
			List<SimpleGrantedAuthority> collection = new ArrayList<>();
			collection.add(simpleGrantedAuthority);
			UserDetails customUserDetails = new User(email,memStatus.get("password"), collection);
			
		    Authentication authentication = new UsernamePasswordAuthenticationToken(customUserDetails,memStatus.get("password"), customUserDetails.getAuthorities());

		    SecurityContext securityContext = SecurityContextHolder.getContext();
		    securityContext.setAuthentication(authentication);
		    session = request.getSession(true);
		    session.setAttribute("email", mem.getEmail());
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		}
		
	    
	    
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
			
			
			
			String email = mem.getEmail();
			LoginCommonFunction loginCommonFunction = new LoginCommonFunction();
			
			HashMap<String, Object> loginMap = loginCommonFunction.loginCommonMethod(email, false, false);
			HashMap<String, Object> loginMap2 = loginCommonFunction.makeRememberMeCookie(email, signupMap.get("password"), "user");
			
			Cookie cookie = (Cookie)loginMap.get("cookie");
			
			response.addCookie(cookie);
			
	        session = request.getSession(true);
		    session.setAttribute("email", email);
		    session.setAttribute("SPRING_SECURITY_CONTEXT", (SecurityContext)loginMap2.get("securityContext"));
		    
		    Cookie rememberMeCookie = (Cookie)loginMap2.get("rememberMeCookie");
		    
		    //pc 모바일 리멤버미 구분
		    Device device = DeviceUtils.getCurrentDevice(request);
		    if(device.isMobile() || device.isTablet()) {
		    	response.addCookie(rememberMeCookie);
		    }
		    
		    return forward("member/signupSuccess");
		}
	}
	
	
	//테스트 완료
	@RequestMapping(value="login")
	public String login(HttpSession session, HttpServletRequest request, Model model) {
		String referer = (String)request.getHeader("REFERER");
		session.setAttribute("referer", referer);
		//애플로 로그인 state값
		String state = new BigInteger(130, new SecureRandom()).toString(32);
		model.addAttribute("client_nonce", "75dbac00-b326-42fa-86b4-dde6b38c7201");
		model.addAttribute("state", state);
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
	@RequestMapping(value="profile",method=RequestMethod.POST)
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
	
		String firstProfile = request.getParameter("cok_tutorial");
		if(firstProfile!=null) {
			if(firstProfile.equals("first_profile")) {
				return "redirect:/tutorpage?cok_tutorial=first_lesson";
			}
		}
		
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
				post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
				post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
				post.setOpt3price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt3price3())));
				post.setOpt4price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt4price3())));
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
	
	/* 프로모션 일단 없앰
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
	*/
	
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
		String nickName = memberSerivce.takeNickName(email);
		ctx.close();
		model.addAttribute("nickName", nickName);
		if(status==-1) {
			model.addAttribute("status", "existPurchase");
		}else {
			model.addAttribute("status", "success");
		}
		ctx.close();
		
		return forward("member/nicknameUpdate");
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
	
	@ResponseBody	
	@RequestMapping(value="secessionApply")
	public String secession(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		MemberService memberService  = ctx.getBean("memberService", MemberService.class);
		String email = (String)session.getAttribute("email");
		String status = memberService.secessionApply(email);
		ctx.close();
		
		return status;
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
		SecureRandom random = new SecureRandom();
		String password = new BigInteger(130, random).toString(32);
		
		mem.setPassword(password);
		HashMap<String,String> status = checkAndInsertService.naverLogin(mem);
		ctx.close();
			
		HashMap<String, String> map = new HashMap<String, String>();
		
		if( status.get("status").equals("phoneDuplicate") ) {
			map.put("status", "phoneDuplicate");
			return map;
		}else {
			String email = mem.getEmail();
			
			LoginCommonFunction loginCommonFunction = new LoginCommonFunction();
			
			HashMap<String, Object> loginMap = loginCommonFunction.loginCommonMethod(email, true, true);
			HashMap<String, Object> loginMap2 = loginCommonFunction.makeRememberMeCookie(email, status.get("password"), "user");
			
			String messageStatus= (String)loginMap.get("messageStatus");
			Cookie cookie = (Cookie)loginMap.get("cookie");
			
			session.setAttribute("messageStatus", messageStatus);
			response.addCookie(cookie);
			
	        session = request.getSession(true);
		    session.setAttribute("email", email);
		    session.setAttribute("SPRING_SECURITY_CONTEXT", (SecurityContext)loginMap2.get("securityContext"));
		    
		    Cookie rememberMeCookie = (Cookie)loginMap2.get("rememberMeCookie");
		    
		    //pc 모바일 리멤버미 구분
		    Device device = DeviceUtils.getCurrentDevice(request);
		    if(device.isMobile() || device.isTablet()) {
		    	response.addCookie(rememberMeCookie);
		    }
		    
		    RequestCache requestCache = new HttpSessionRequestCache();
		    SavedRequest savedRequest = requestCache.getRequest(request, response);
	        
	        if(savedRequest!=null) {
	        	//로그인 화면 접속 전 방문했던 url
	            String targetUrl = savedRequest.getRedirectUrl();
	            map.put("targetUrl", targetUrl);
	        }
	       
	        map.put("status", status.get("status"));
	      
			return map;
		}
	}
	
	@RequestMapping(value="loginCallBackApple")
	public String appleLoginCallBack(@RequestBody String apple_data, HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) throws java.text.ParseException, JsonParseException, JsonMappingException, IOException, JOSEException, ParseException  {	
		String[] datas = apple_data.split("[&]");
		String code = "";
		String id_token = "";
		for(String data : datas ) {
			if(data.contains("code=")) {
				code = data.replace("code=", "");
			}
			if(data.contains("id_token=")) {
				id_token = data.replace("id_token=", "");
			}
		}
		
		SignedJWT signedJWT = SignedJWT.parse(id_token);
		JWTClaimsSet payload = signedJWT.getJWTClaimsSet();
		
		String publicKeys = HttpClientUtils.doGet("https://appleid.apple.com/auth/keys");
        ObjectMapper objectMapper = new ObjectMapper();
        Keys keys = objectMapper.readValue(publicKeys, Keys.class);
        
        boolean signature=false;
        for (Key key : keys.getKeys()) {
        	 RSAKey rsaKey = (RSAKey) JWK.parse(objectMapper.writeValueAsString(key));
             RSAPublicKey publicKey = rsaKey.toRSAPublicKey();
             JWSVerifier verifier = new RSASSAVerifier(publicKey);
             if (signedJWT.verify(verifier)) {
            	 signature=true;
             }
        }
        
        if(signature == false) {
        	model.addAttribute("appleCerity", "fail");
        	logger.warn("복호화실패 오류");
        	return forward("member/appleLoginCallBack");
        }
        
        Date currentTime = new Date(System.currentTimeMillis());
       
        String aud = payload.getAudience().get(0);
        String iss = payload.getIssuer();
        String nonce =(String)payload.getClaim("nonce");
        if (!currentTime.before(payload.getExpirationTime())) {
        	model.addAttribute("appleCerity", "fail");
        	 logger.warn("토큰만료 오류");
        	return forward("member/appleLoginCallBack");
        }
        if (!aud.equals("com.coksabu.coksabu")) {
        	model.addAttribute("appleCerity", "fail");
        	logger.warn("aud 오류");
        	return forward("member/appleLoginCallBack");
        }
        if (!iss.contains("https://appleid.apple.com")) {
        	model.addAttribute("appleCerity", "fail");
        	logger.warn("iss 오류");
        	return forward("member/appleLoginCallBack");
        }
        if (!nonce.equals("75dbac00-b326-42fa-86b4-dde6b38c7201")) {
        	model.addAttribute("appleCerity", "fail");
        	logger.warn("nonce 오류");
        	return forward("member/appleLoginCallBack");
        }
        
        //client_secret생성 
        ClassPathResource resource = new ClassPathResource("AuthKey_6GLL8F2426.p8");
        String privateKey = new String(Files.readAllBytes(Paths.get(resource.getURI())));
        Reader pemReader = new StringReader(privateKey);
        PEMParser pemParser = new PEMParser(pemReader);
        JcaPEMKeyConverter converter = new JcaPEMKeyConverter();
        PrivateKeyInfo object = (PrivateKeyInfo) pemParser.readObject();
        
       
        Date expirationDate = Date.from(LocalDateTime.now().plusDays(30).atZone(ZoneId.systemDefault()).toInstant());
        String clientSecret = Jwts.builder()
                   .setHeaderParam("kid", "6GLL8F2426")
                   .setHeaderParam("alg", "ES256")
                   .setIssuer("6GR3L5NV8P")
                   .setIssuedAt(new Date(System.currentTimeMillis()))
                   .setExpiration(expirationDate)
                   .setAudience("https://appleid.apple.com")
                   .setSubject("com.coksabu.coksabu")
                   .signWith(SignatureAlgorithm.ES256, converter.getPrivateKey(object))
                   .compact();
                
        
        Map<String, String> tokenRequest = new HashMap<>();

        StringBuffer now_url =request.getRequestURL();
        String current_url = now_url.toString();
        String redirect_url="";
        if(current_url.contains("www.coksabu")) {
        	redirect_url="https://www.coksabu.com/loginCallBackApple";
        }else if(current_url.contains("m.coksabu")) {
        	redirect_url="https://m.coksabu.com/loginCallBackApple";
        }else {
        	redirect_url="https://coksabu.com/loginCallBackApple";
        }
        tokenRequest.put("client_id", "com.coksabu.coksabu");
        tokenRequest.put("client_secret", clientSecret);
        tokenRequest.put("code", code);
        tokenRequest.put("grant_type", "authorization_code");
        tokenRequest.put("redirect_uri", redirect_url);

        String apple_response = HttpClientUtils.doPost("https://appleid.apple.com/auth/token", tokenRequest);
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apple_response);
        JSONObject jsonObj = (JSONObject) obj;
        String valid_id_token = (String) jsonObj.get("id_token");
        String[] valid_id_tokens = valid_id_token.split("[.]");
        Decoder decoder = Base64.getDecoder(); 
        byte[] decodedBytes = decoder.decode(valid_id_tokens[1]);
        String payLoad = new String(decodedBytes);
        Object obj2 = parser.parse(payLoad);
        JSONObject jsonObj2 = (JSONObject) obj2;
        String apple_email2 = (String) jsonObj2.get("email");
        //로그인 및 회원가입 처리 시작
        String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		CheckAndInsertService checkAndInsertService = ctx.getBean("checkAndInsertService", CheckAndInsertService.class );
		HashMap<String,String> status = checkAndInsertService.socialLogin(apple_email2);
        ctx.close();
        
		
		LoginCommonFunction loginCommonFunction = new LoginCommonFunction();
		
		HashMap<String, Object> loginMap = loginCommonFunction.loginCommonMethod(apple_email2, true, true);
		HashMap<String, Object> loginMap2 = loginCommonFunction.makeRememberMeCookie(apple_email2, status.get("password"), status.get("authority"));
		
		String messageStatus= (String)loginMap.get("messageStatus");
		Cookie cookie = (Cookie)loginMap.get("cookie");
		
		session.setAttribute("messageStatus", messageStatus);
		response.addCookie(cookie);
		
        session = request.getSession(true);
	    session.setAttribute("email", apple_email2);
	    session.setAttribute("SPRING_SECURITY_CONTEXT", (SecurityContext)loginMap2.get("securityContext"));
	    
	    Cookie rememberMeCookie = (Cookie)loginMap2.get("rememberMeCookie");
	    
	    //pc 모바일 리멤버미 구분
	    Device device = DeviceUtils.getCurrentDevice(request);
	    if(device.isMobile() || device.isTablet()) {
	    	response.addCookie(rememberMeCookie);
	    }
	    
	    RequestCache requestCache = new HttpSessionRequestCache();
	    SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        if(savedRequest!=null) {
        	//로그인 화면 접속 전 방문했던 url
            String targetUrl = savedRequest.getRedirectUrl();
            model.addAttribute("targetUrl", targetUrl);
        }
        
        
        model.addAttribute("status", status.get("status"));
        return forward("member/appleLoginCallBack");
	}

	/*
	public void go1(String id_token) throws java.text.ParseException, JsonParseException, JsonMappingException, IOException, NoSuchAlgorithmException, InvalidKeySpecException, ParseException {
        String[] tokens = id_token.split("[.]");
        Decoder decoder = Base64.getDecoder(); 
        byte[] decodedBytes = decoder.decode(tokens[0]);
        String header = new String(decodedBytes);
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(header);
        JSONObject jsonObj = (JSONObject) obj;

        String kid = (String) jsonObj.get("kid");
        String alg = (String) jsonObj.get("alg");
        
		String publicKeys = HttpClientUtils.doGet("https://appleid.apple.com/auth/keys");
        ObjectMapper objectMapper = new ObjectMapper();
        Keys keys = objectMapper.readValue(publicKeys, Keys.class);
        for (Key key : keys.getKeys()) {
        	if(kid.equals(key.getKid()) && alg.equals(key.getAlg()) ) {
        		
        		byte[] nBytes = Base64.getUrlDecoder().decode(key.getN());
                byte[] eBytes = Base64.getUrlDecoder().decode(key.getE());

                BigInteger n = new BigInteger(1, nBytes);
                BigInteger e = new BigInteger(1, eBytes);

                RSAPublicKeySpec publicKeySpec = new RSAPublicKeySpec(n, e);
                KeyFactory keyFactory = KeyFactory.getInstance(key.getKty());
                PublicKey publicKey = keyFactory.generatePublic(publicKeySpec);
                Claims claims = Jwts.parser().setSigningKey(publicKey).parseClaimsJws(id_token).getBody();
        	}

        }
	}
	
	
public void go2(String id_token) throws java.text.ParseException, JsonParseException, JsonMappingException, IOException, JOSEException {
		SignedJWT signedJWT = SignedJWT.parse(id_token);
		String publicKeys = HttpClientUtils.doGet("https://appleid.apple.com/auth/keys");
        ObjectMapper objectMapper = new ObjectMapper();
        Keys keys = objectMapper.readValue(publicKeys, Keys.class);
        for (Key key : keys.getKeys()) {
        	 RSAKey rsaKey = (RSAKey) JWK.parse(objectMapper.writeValueAsString(key));
             RSAPublicKey publicKey = rsaKey.toRSAPublicKey();
             JWSVerifier verifier = new RSASSAVerifier(publicKey);

             if (signedJWT.verify(verifier)) {
            	 System.out.println("복호화 성공");
             }

        }
	}
 */
	
}
