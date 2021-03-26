package com.coksabu.yojic.loginhandler;

import java.io.IOException;


import javax.servlet.ServletException;
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
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.member.controller.MemberController;
import com.coksabu.yojic.lesson.member.service.LoginCheckService;
import com.coksabu.yojic.lesson.member.service.MemberService;

//테스트 완료
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    
    private String loginidname;
    private String defaultUrl;
 
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

    private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
    
    @Transactional(rollbackFor= {Exception.class})
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	HttpSession session = request.getSession(true);
    	String email = authentication.getName();
    	session.setAttribute("email", email);
    	String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
				configLocation);
		LoginCheckService loginCheckService = ctx.getBean("loginCheckService", LoginCheckService.class );
		int humanStatus = loginCheckService.updateLoginTime(email);
		
		
		logger.warn("로그인 잘 작동함");
		
		//메세지 카운
		MemberService memberService = ctx.getBean("memberService", MemberService.class );
		int messageCount = memberService.takeUnreadMessageCount(authentication.getName());
		
		String messageStatus;
		if(messageCount==0) {
			messageStatus="none";
		}else {
			messageStatus="exist";
		}
		
		session.setAttribute("messageStatus", messageStatus);
		
		if(humanStatus==1) {
			ctx.close();
			 redirectStratgy.sendRedirect(request, response, "/passwordsetting");
		}else {
			ctx.close();
	    	 resultRedirectStrategy(request, response, authentication);
		}
    	
    }
 
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getDefaultUrl() {
        return defaultUrl;
    }
 
    public void setDefaultUrl(String defaultUrl) {
        this.defaultUrl = defaultUrl;
    }
    protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        
        if(savedRequest!=null) {
        	//로그인 화면 접속 전 방문했던 url
            String targetUrl = savedRequest.getRedirectUrl();
            
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {
            redirectStratgy.sendRedirect(request, response, defaultUrl);
        }
        
    }

}


