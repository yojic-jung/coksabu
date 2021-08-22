package com.coksabu.yojic.loginhandler;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.transaction.annotation.Transactional;

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
    	
    	LoginCommonFunction loginCommonFunction = new LoginCommonFunction();
    	HashMap<String, Object> map = loginCommonFunction.loginCommonMethod(email, true, false);
    	String messageStatus= (String)map.get("messageStatus");
		String humanStatus = (String)map.get("humanStatus");
		Cookie cookie = (Cookie)map.get("cookie");
    	
    	
		session.setAttribute("messageStatus", messageStatus);
		
        response.addCookie(cookie);
        
		if(humanStatus.equals("human_user")) {
			 redirectStratgy.sendRedirect(request, response, "/passwordsetting");
		}else {
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


