package com.coksabu.yojic.lesson.member.service;

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
	public String signUp(MemberInfo memberInfo){
		int emailCheck = memberDao.checkEmail(memberInfo.getEmail());
		if(emailCheck==0) {
			int phoneCheck = memberDao.checkPhone(memberInfo.getPhone());
			if(phoneCheck==0) {
				String encodPassword=passwordEncoder.encode(memberInfo.getPassword());
				memberInfo.setPassword(encodPassword);
				memberDao.signUp(memberInfo);
				return "success";
			}else {
				return "phoneDuplicate";
			}
		}else {
			return "emailDuplicate";
		}
	}
}
