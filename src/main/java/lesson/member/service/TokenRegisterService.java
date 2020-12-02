package lesson.member.service;

import java.util.HashMap;

import lesson.member.dao.MemberDao;

public class TokenRegisterService {
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public String registerAndroidToken(String email, String token) {
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("token", token);
		
		int changeCount = memberDao.registerAndroidToken(map);
		
		if(changeCount==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
}
