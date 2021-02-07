package com.coksabu.yojic.lesson.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.member.dao.MemberDao;
import com.coksabu.yojic.lesson.member.model.EmailInfo;
import com.coksabu.yojic.lesson.member.model.PassFind;
import com.coksabu.yojic.lesson.member.model.Password;

//수정필요
@Service
public class EmailPassFindService {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//통과
	public String emailFind(EmailInfo info) {
		int a = memberDao.countEmail(info);
		String  email;
		if(a==1) {
			email = memberDao.takeEmail(info);
		}else {
			email=null;
		}
		return email;
	}
	
	//수정필요
	public String passFind(PassFind pass) {
		
		int a = memberDao.checkEmail(pass.getEmail());
		if(a==1) {
			int b = memberDao.checkPhone(pass.getPhone());
			if(b==1) {
				String password = randomPw();
				//인코딩
				String passwordEncod = passwordEncoder.encode(password);
				
				Password pass1= new Password();
				pass1.setEmail(pass.getEmail());
				pass1.setPassword2(passwordEncod);
				
				//dao.xml에서 human_status칼럼은 임시비밀번호 발급 받았는지 여부, 로그인시 비밀번호 변경페이지 redirect하기 위함
				memberDao.updatePassword2(pass1);
				return password;
			}else {
				return "";
			}
 
		}else {
			return "";
		}
	}
	
	
	  public static String randomPw(){
	      char pwCollection[] = new char[] {
	                        '1','2','3','4','5','6','7','8','9','0',
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	                        '!','@','#','$','%','^','&','*','(',')'};//배열에 선언

	      String ranPw = "";

	      for (int i = 0; i < 15; i++) {
	        int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
	        ranPw += pwCollection[selectRandomPw];
	      }
	    return ranPw;
	  }

	
}
