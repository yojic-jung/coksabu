package com.coksabu.yojic.loginhandler;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64.Encoder;

import javax.servlet.http.Cookie;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import com.coksabu.yojic.lesson.member.service.LoginCheckService;
import com.coksabu.yojic.lesson.member.service.MemberService;

public class LoginCommonFunction {
	
	public HashMap<String, Object> loginCommonMethod(String email, boolean login, boolean social){

		HashMap<String, Object> map = new HashMap<>();
		
		
		//로그인 시도에만 실행, 회원가입은 미실행
		if(login=true) {
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(
					configLocation);
			
			LoginCheckService loginCheckService = ctx.getBean("loginCheckService", LoginCheckService.class );
			
			
			//로그인시간 업데이트, 소셜로그인 아닌 경우에는 humanStatus=1일때 비밀번호 변경페이지
			// 소셜로그인은 비밀번호 변경할 수 없으므로 humanStatus 필요없음
			if(social==true) {
				loginCheckService.updateLoginTime2(email);
			}else {
				int human_Status = loginCheckService.updateLoginTime(email);
				String humanStatus="";
				if(human_Status==1) {
					humanStatus="human_user";
				}else {
					humanStatus="user";
				}
				map.put("humanStatus", humanStatus);
			}
			
			//안읽은 메시지 카운트
			MemberService memberService = ctx.getBean("memberService", MemberService.class );
			int messageCount = memberService.takeUnreadMessageCount(email);
			ctx.close();
			
			String messageStatus;
			if(messageCount==0) {
				messageStatus="none";
			}else {
				messageStatus="exist";
			}
			map.put("messageStatus", messageStatus);
			
		}
		
		
		//userInputEmail( ios앱용 )
		Cookie cookie = new Cookie("userInputEmail",email);
        cookie.setPath("/");
        cookie.setMaxAge(14515200);
        
		map.put("cookie", cookie);
		
		return map;
	}
	
	
	public HashMap<String, Object> makeRememberMeCookie(String email, String password,String authority) {
		SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(authority);
		List<SimpleGrantedAuthority> collection = new ArrayList<>();
		collection.add(simpleGrantedAuthority);
		UserDetails customUserDetails = new User(email, password, collection);
		
	    Authentication authentication = new UsernamePasswordAuthenticationToken(customUserDetails, password, customUserDetails.getAuthorities());

	    SecurityContext securityContext = SecurityContextHolder.getContext();
	    securityContext.setAuthentication(authentication);
	   
		
	    long tokenValidityTime = 14515200000L;
		long millis = System.currentTimeMillis()+tokenValidityTime;
		
		String target = email + ":" + millis + ":" +org.apache.commons.codec.digest.DigestUtils.md5Hex(email + ":" + millis + ":"+password + ":" + "wmoskey");
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
        
        HashMap<String, Object> map = new HashMap<>();
		map.put("securityContext", securityContext);
		map.put("rememberMeCookie", cookie);
        
        return map;
	}
	
	
}
