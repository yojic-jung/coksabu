package lesson.member.service;

import org.springframework.security.crypto.password.PasswordEncoder;

import lesson.member.dao.MemberDao;
import lesson.member.model.MemberInfo;

//통과
public class CheckAndInsertService {

	private MemberDao memberDao;
	private PasswordEncoder passwordEncoder;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	public String singUp(MemberInfo memberInfo){
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
