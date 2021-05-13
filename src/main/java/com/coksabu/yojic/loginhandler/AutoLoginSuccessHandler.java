package com.coksabu.yojic.loginhandler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.coksabu.yojic.lesson.member.service.LoginCheckService;
import com.coksabu.yojic.lesson.member.service.MemberService;


//테스트 완료
public class AutoLoginSuccessHandler implements AuthenticationSuccessHandler  {
	
	 private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	 private static final Logger logger = LoggerFactory.getLogger(AutoLoginSuccessHandler.class);
	 
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		if(authentication.getName()!=null) {
			String email = authentication.getName();
			session.setAttribute("email", email);
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			LoginCheckService loginCheckService = ctx.getBean("loginCheckService", LoginCheckService.class );
			MemberService memberService = ctx.getBean("memberService", MemberService.class );
			loginCheckService.updateLoginTime2(email);
			int messageCount = memberService.takeUnreadMessageCount(authentication.getName());
			ctx.close();
			
			String messageStatus;
			if(messageCount==0) {
				messageStatus="none";
			}else {
				messageStatus="exist";
			}
			
			Cookie cookie = new Cookie("userInputEmail",email);
	        cookie.setPath("/");
	        cookie.setMaxAge(14515200);
	        response.addCookie(cookie);
	        
			session.setAttribute("messageStatus", messageStatus);
		}else {
			session.setAttribute("email", null);
		}
		
		
		logger.warn("오토로그인 잘 작동함");
		
        
       
		
		
		String uri = request.getRequestURI();
		if(uri!=null) {
            Enumeration<String> param = request.getParameterNames();
            String strParam = "";
            while(param.hasMoreElements()) {
                  String name = (String)param.nextElement();
                  String value = request.getParameter(name);
                  strParam += name + "=" + value + "&";
            }
            if(!strParam.equals("")) {
            	strParam = "?"+strParam;
            }
            uri=uri+strParam;
            
            redirectStratgy.sendRedirect(request, response, uri);
        } else {
            redirectStratgy.sendRedirect(request, response, "/");
        }
		
	}
	
}
