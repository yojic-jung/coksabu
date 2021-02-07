package com.coksabu.yojic.loginhandler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.coksabu.yojic.lesson.member.service.MemberService;


//테스트 완료
public class AutoLoginSuccessHandler implements AuthenticationSuccessHandler  {
	
	 private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		if(authentication.getName()!=null) {
			session.setAttribute("email", authentication.getName());
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			MemberService memberService = ctx.getBean("memberService", MemberService.class );
			int messageCount = memberService.takeUnreadMessageCount(authentication.getName());
			ctx.close();
			
			String messageStatus;
			if(messageCount==0) {
				messageStatus="none";
			}else {
				messageStatus="exist";
			}
			
			session.setAttribute("messageStatus", messageStatus);
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
