package com.dywlr.handler;

import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class AutoLoginSuccessHandler implements AuthenticationSuccessHandler  {
	
	 private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		if(authentication.getName()!=null) {
			session.setAttribute("email", authentication.getName());
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
