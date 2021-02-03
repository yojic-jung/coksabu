package lesson.member.service;

import lesson.member.dao.MemberDao;
import lesson.member.model.LessonCertify;

//통과
public class LessonCertifyService {
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
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
