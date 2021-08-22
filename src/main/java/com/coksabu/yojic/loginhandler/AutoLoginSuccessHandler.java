package com.coksabu.yojic.loginhandler;

import java.io.IOException;
import java.util.Enumeration;
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
	        
	        LoginCommonFunction loginCommonFunction = new LoginCommonFunction();
			
	        HashMap<String, Object> map = loginCommonFunction.loginCommonMethod(email, true, true);
			String messageStatus= (String)map.get("messageStatus");
			Cookie cookie = (Cookie)map.get("cookie");
			
			session.setAttribute("messageStatus", messageStatus);
			response.addCookie(cookie);
			
		}else {
			session.setAttribute("email", null);
		}
		
		
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
