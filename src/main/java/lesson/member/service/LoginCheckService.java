package lesson.member.service;

import java.util.Date;
import java.util.HashMap;

import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;

//통과
public class LoginCheckService {

	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public int updateLoginTime(String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("date",new Date());
		map.put("email",email);
		memberDao.updateLoginTime(map);
		
		return memberDao.takeHumanStatus(email);
	}	
	
	public boolean emailCheck(String email) {
		//이메일 존재하지 않는경우
		if(memberDao.checkEmail(email)==0) {
			return false;
		}else {
			return true;
		}		
	}
	
	public int addFailCount(String email) {
		int failCount = memberDao.takeFailCount(email);
		if(failCount==4) {
			// enabled=0, fail_count+=1, fail_time=현재시각 +15분
			memberDao.loginDisabled(email);
			return 0;
		}else if(failCount==5){
			Date failTime = memberDao.takeFailTime(email);
			//15분이 지난경우
			Date now = new Date();
			//15분 후에 로그인 시도
			if(failTime.compareTo(now)<0) {
				//enabled=1, fail_count=0, fail_time=0 으로 다시 수정
				memberDao.failReset(email);
				return 5;
				
			//15분 전에 로그인 시도
			}else {
				// fail_time=현재시각 +15분
				memberDao.addFailTime(email);
				return 6;
				
			}
			
		}else {
			//fail_count +=1 
			memberDao.addFailCount(email);
			return 0;
		}
		
	}
}
