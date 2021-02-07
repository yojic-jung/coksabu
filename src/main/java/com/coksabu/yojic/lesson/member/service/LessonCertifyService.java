package com.coksabu.yojic.lesson.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.member.dao.MemberDao;
import com.coksabu.yojic.lesson.member.model.LessonCertify;

//통과
@Service
public class LessonCertifyService {
	
	@Autowired
	private MemberDao memberDao;
	
	public LessonCertify certifyRead(String email) {
		return memberDao.readLessonCertify(email);
	}
	
	public int lessonCertify(LessonCertify certify) {
		if(!certify.getName().equals(memberDao.readName(certify.getEmail()))){
			return -1;
		}else {
			int exist = memberDao.countLessonCertify(certify.getEmail());
			if(exist==0) {
				return memberDao.insertLessonCertify(certify);
			}else {
				return 1;
			}
		}
	}
}
