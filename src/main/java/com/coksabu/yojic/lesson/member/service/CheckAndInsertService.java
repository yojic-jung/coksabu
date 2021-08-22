package com.coksabu.yojic.lesson.member.service;

import java.math.BigInteger;
import java.security.SecureRandom;
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
				memberInfo.setNickname(memberInfo.getName().substring(0, 1)+"사부");
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
				memberInfo.setNickname(memberInfo.getName().substring(0, 1)+"사부");
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
	
	
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, String> socialLogin(String email){
		HashMap<String, String> map = new  HashMap<String, String>();
		int emailCheck = memberDao.checkEmail(email);
		if(emailCheck==0) {
			MemberInfo memberInfo = new MemberInfo();
			memberInfo.setEmail(email);
			memberInfo.setBirth("000000");
			memberInfo.setName("미인증회원");
			memberInfo.setNickname("미인증회원");
			memberInfo.setPhone("00000000000");
			
			SecureRandom random = new SecureRandom();
			String password = new BigInteger(130, random).toString(32);
			String encodPassword=passwordEncoder.encode(password);
			
			memberInfo.setPassword(encodPassword);
			memberDao.preUserSignUp(memberInfo);
			map.put("status", "signUp");
			map.put("authority", "pre-user");
			map.put("password", encodPassword);
			return map;
		}else {
			//수정필요 만약 apple이메일이 naver로 되어있는 경우, naver로 가입한 아이디가 있을시 naver로 로그인 처리되는 문제
			MemberInfo memberInfo = memberDao.takeRollAndPassword(email);
			map.put("status", "goLogin");
			map.put("password", memberInfo.getPassword());
			map.put("authority", memberInfo.getAuthority());
			return map;
		}
	}
	@Transactional(rollbackFor= {Exception.class})
	public String takeAuthority(String email){
		return memberDao.takeAuthority(email);
	}
	
	
}
