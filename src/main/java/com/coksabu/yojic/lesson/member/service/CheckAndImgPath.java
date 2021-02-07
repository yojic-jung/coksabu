package com.coksabu.yojic.lesson.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.member.dao.MemberDao;

@Service
public class CheckAndImgPath {
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional(rollbackFor= {Exception.class})
	public String checkImgPath(String email) {
		int imgLength = memberDao.checkImgPath(email);
		if(imgLength==0) {
			return null;
		}else {
			return memberDao.takeImgPath(email);
		}
	}
}
