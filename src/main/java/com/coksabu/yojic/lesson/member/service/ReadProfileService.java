package com.coksabu.yojic.lesson.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.member.dao.MemberDao;
import com.coksabu.yojic.lesson.member.model.Profile;
import com.coksabu.yojic.lesson.member.model.TeacherDB;

@Service
public class ReadProfileService {
	
	@Autowired
	private MemberDao memberDao;
	
	//통과
	public int confirmCertify(String email) {
		return memberDao.confirmCertify(email);
	}
		
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public Profile readProfile(String email) {
		int imgpath = memberDao.checkImgPath(email);
		if(imgpath !=0) {
			Profile pro = memberDao.takeProfile(email);
			return pro;
		}
		else {
			return null;			
		}
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public List<Profile> readProfileList(List<String> email) {
			List<Profile> pro = memberDao.takeProfileList(email);
			return pro;			
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public TeacherDB takeTeacherDB(String email) {
		int imgpath = memberDao.checkImgPath(email);
		if(imgpath !=0) {
			TeacherDB tea = memberDao.takeTeacherDB(email);
			return tea;
		}
		else {
			TeacherDB tea = new TeacherDB();
			return tea;			
		}
	}
}
