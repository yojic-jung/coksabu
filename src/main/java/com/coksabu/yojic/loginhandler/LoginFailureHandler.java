package com.coksabu.yojic.loginhandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.coksabu.yojic.lesson.member.service.LoginCheckService;

//테스트 완료
public class LoginFailureHandler implements AuthenticationFailureHandler {
    
    private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
 
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
    	
    	String username = request.getParameter(loginidname);
        
        String errormsg = null;
        
        if(exception instanceof BadCredentialsException) {
            String configLocation = "classpath:applicationContext.xml";
    		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
    				configLocation);
    		LoginCheckService loginCheckService = ctx.getBean("loginCheckService", LoginCheckService.class );
    		boolean existUser = loginCheckService.emailCheck(username);
    		
    		if(existUser==true) {
    			loginCheckService.addFailCount(username);
    		}
    		ctx.close();
        	
    		 errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
    		 
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = "계정이 비활성화되었습니다.";
            
            
        } else if(exception instanceof DisabledException) {
        	
        	String configLocation = "classpath:applicationContext.xml";
     		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
     				configLocation);
     		LoginCheckService loginCheckService = ctx.getBean("loginCheckService", LoginCheckService.class );
     		int count = loginCheckService.addFailCount(username);
     		ctx.close();
         	
         	if(count==5) {
         		errormsg = "계정 잠금이 풀렸습니다. 다시 시도해주세요. ";
         	}else {
         		errormsg = "해당 계정이 잠금되었습니다. 15분 후 다시 시도해주세요.";
         	}
        	
            
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = "계정이 만료되었습니다.";
        }

        request.setAttribute(errormsgname, errormsg);

        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    }
 
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getLoginpwdname() {
        return loginpwdname;
    }
 
    public void setLoginpwdname(String loginpwdname) {
        this.loginpwdname = loginpwdname;
    }
 
    public String getErrormsgname() {
        return errormsgname;
    }
 
    public void setErrormsgname(String errormsgname) {
        this.errormsgname = errormsgname;
    }
 
    public String getDefaultFailureUrl() {
        return defaultFailureUrl;
    }
 
    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }
 
}


