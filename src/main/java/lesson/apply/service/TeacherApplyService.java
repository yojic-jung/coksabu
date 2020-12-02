package lesson.apply.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.google.firebase.messaging.FirebaseMessagingException;

import fcm.dywlr.util.FcmUtil;
import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyTeacher;

public class TeacherApplyService {
	
	private static final  Logger logger = LoggerFactory.getLogger(TeacherApplyService.class);
	
	ApplyDao applyDao;
	
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public String teacherApply(ApplyTeacher form) {
		
		form.setApplyDate(new Date());
		
		//프로필 존재유무
		int proExist = applyDao.confirmProfileExist(form.getTeacherEmail());
		
		if(proExist==0) {
			return "noProfile";
		}
		
		int applyCount = applyDao.teacherApplyCount(form.getTeacherEmail());
		
		//하루최대 지원횟수 3회 확인
		if(applyCount>=3) {
			return "teacherlimit";
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("email", form.getTeacherEmail());
			map.put("apply_id", form.getApply_id());
			map.put("message", form.getMessage());
			
			List<Integer> list = applyDao.takeApplyService(map);
			int membership = list.get(0);
			int duplicate = list.get(1);
			int count = list.get(2);
			
			//멤버쉽 가입 유무 확인
			if(membership == 0) {
				return "noMembership";
			}
			
			//중복 지원 확인
			if(duplicate != 0){
				return "duplicate";
			}else {
				
				//지원 선생님 10명 확인
				if(count >= 10) {
					return "limit";
				}else if(count==9){
					form.setApplicantEmail(applyDao.takeApplyEmail(form.getApply_id()));
					
					applyDao.teacherApply(form);
					applyDao.setVisible(form.getApply_id());
					applyDao.increaseApplyCount(form.getTeacherEmail());
					return "true";
				}else {
					form.setApplicantEmail(applyDao.takeApplyEmail(form.getApply_id()));
					applyDao.teacherApply(form);
					applyDao.increaseApplyCount(form.getTeacherEmail());
					return "true";
				}
			}
		}
	}
	
	
	
	public void sendPushNotificationTarget(String locale, String cate, String link) {
		HashMap<String, String> map = new HashMap<>();
		map.put("locale",locale);
		map.put("cate",cate);
		List<String> emailList = applyDao.takeEmailForPushTarget(map);
		List<String> registrationTokens = applyDao.takeTokenForPushTarget(emailList);
		if(registrationTokens.size()!=0) {
			FcmUtil fcm = new FcmUtil();
			String title= "\""+cate+"\""+"수업에 지원하세요";
			String content = "\""+locale+"\""+"에  "+"\""+cate+"\""+"수업 요청 학생이 있습니다";
			try {
				fcm.send_Multi_FCMtoken(registrationTokens, title, content, link);
			}catch(Exception e) {}
		}
	}
	
	public void sendPushForOneTarget(int id) throws FirebaseMessagingException, IOException {
		String email = applyDao.takeApplyEmail(id);
		
		String token = applyDao.takePushForOneTarget(email);
		if(token !=null) {
			FcmUtil fcm = new FcmUtil();
			
			logger.warn("이메일 : "+email+" , 아이디 : "+id);
			
			
			String title = "선생님 지원서가 도착하였습니다.";
			String content = "문의하신 수업에 대한 지원서가 도착하였습니다.";
			String link = "https://m.coksabu.com/teacherForm?id="+id;
			fcm.send_FCMtoken(token, title, content, link);
		}else {
			logger.warn("토큰 : "+token);
		}
		
	}
	
}
