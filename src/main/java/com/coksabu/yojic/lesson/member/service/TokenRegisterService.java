package com.coksabu.yojic.lesson.member.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.member.dao.MemberDao;

@Service
public class TokenRegisterService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional(rollbackFor= {Exception.class})
	public String registerPushToken(String email, String token, String device) {
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("token", token);
		map.put("device", device);
		//다른사람이 내기기에서 로그인했다면 내 기기가 등록되어있는 사용자에게서 토큰 지우기
		//토큰을 고유한 사용자가 가지게끔하기 위해서
		//그러나 다른사람이 내기기에서 로그인하고 로그아웃했을때 내가 다시 로그인하지 않으면 여전히 다른사람 토큰정보가 내 기기에 남아있음
		memberDao.deletePushToken(map);
		int changeCount = memberDao.registerPushToken(map);
		
		if(changeCount==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	public int takeBadgeCount(String email) {
		return memberDao.takeUnReadCount(email);
	}
	
}
