package lesson.member.service;

import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;

public class CheckAndImgPath {

	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
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
