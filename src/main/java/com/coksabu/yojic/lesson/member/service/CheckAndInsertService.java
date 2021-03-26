package com.coksabu.yojic.lesson.member.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.member.dao.MemberDao;
import com.coksabu.yojic.lesson.member.model.MemberInfo;

//통과
@Service
public class CheckAndInsertService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, String> signUp(MemberInfo memberInfo){
		HashMap<String, String> map = new  HashMap<String, String>();
		int emailCheck = memberDao.checkEmail(memberInfo.getEmail());
		if(emailCheck==0) {
			int phoneCheck = memberDao.checkPhone(memberInfo.getPhone());
			if(phoneCheck==0) {
				String encodPassword=passwordEncoder.encode(memberInfo.getPassword());
				memberInfo.setPassword(encodPassword);
				memberDao.signUp(memberInfo);
				map.put("password", encodPassword);
				map.put("signupStatus", "success");
				return map;
			}else {
				map.put("signupStatus", "phoneDuplicate");
				return map;
			}
		}else {
			map.put("signupStatus", "emailDuplicate");
			return map;
		}
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, String> naverLogin(MemberInfo memberInfo){
		int emailCheck = memberDao.checkEmail(memberInfo.getEmail());
		
		HashMap<String, String> map = new  HashMap<String, String>();
		
		//네이버 아이디가 없는 경우
		if(emailCheck==0) {
			String phone = memberInfo.getPhone().replaceAll("-","");
			memberInfo.setPhone(phone);
			
			int phoneCheck = memberDao.checkPhone(phone);
			
			//휴대폰번호가 없는경우
			if(phoneCheck==0) {
				memberInfo.setBirth(memberInfo.getBirth().replace("-","").substring(2));
				String encodePassword=passwordEncoder.encode(memberInfo.getPassword());
				memberInfo.setPassword(encodePassword);
				memberDao.naverSignUp(memberInfo);
				
				map.put("status", "success");
				map.put("password", encodePassword);
				return map;
			//휴대폰 번호 있는 경우
			}else {
				map.put("status", "phoneDuplicate");
				return map;
			}
		//네이버 아이디가 있는경우
		}else {
			String encryptedPW = memberDao.takeEncryptedPW(memberInfo.getEmail());
			map.put("status", "goLogin");
			map.put("password", encryptedPW);
			return map;
		}
	}
	
}
