package com.coksabu.yojic.lesson.apply.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.apply.dao.ApplyDao;
import com.coksabu.yojic.lesson.apply.model.ApplyTeacher;
import com.coksabu.yojic.lesson.fcm.util.PushAsyncMethod;
import com.coksabu.yojic.lesson.fcm.util.TokenInfo;
import com.google.firebase.messaging.FirebaseMessagingException;

@Service
public class TeacherApplyService {
	
	@Resource
	private PushAsyncMethod pushAsyncMethod;
	
	@Autowired
	private ApplyDao applyDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(TeacherApplyService.class);
	
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> teacherApply(ApplyTeacher form) {
		
		form.setApplyDate(new Date());
		HashMap<String, Object> map = new HashMap<String, Object>();
		//프로필 존재유무
		int proExist = applyDao.confirmProfileExist(form.getTeacherEmail());
		
		if(proExist==0) {
			map.put("status", "noProfile");
			return map;
		}
		
		int applyCount = applyDao.teacherApplyCount(form.getTeacherEmail());
		
		//하루최대 지원횟수 3회 확인
		if(applyCount>=3) {
			map.put("status", "teacherlimit");
			return map;
		}else {
			
			map.put("email", form.getTeacherEmail());
			map.put("apply_id", form.getApply_id());
			map.put("message", form.getMessage());
			
			List<Integer> list = applyDao.takeApplyService(map);
			int membership = list.get(0);
			int duplicate = list.get(1);
			int count = list.get(2);
			
			//멤버쉽 가입 유무 확인
			if(membership == 0) {
				map.put("status", "noMembership");
				return map;
			}
			
			//중복 지원 확인
			if(duplicate != 0){
				map.put("status", "duplicate");
				return map;
			}else {
				
				//지원 선생님 10명 확인
				if(count >= 10) {
					map.put("status", "limit");
					return map;
				}else if(count==9){
					String applyEmail  = applyDao.takeApplyEmail(form.getApply_id());
					form.setApplicantEmail(applyEmail);
					
					map.put("applyEmail", applyEmail);
					
					applyDao.teacherApply(form);
					applyDao.setVisible(form.getApply_id());
					applyDao.increaseApplyCount(form.getTeacherEmail());
					map.put("status", "true");
					return map;
				}else {
					String applyEmail  = applyDao.takeApplyEmail(form.getApply_id());
					form.setApplicantEmail(applyEmail);
					
					map.put("applyEmail", applyEmail);
					
					applyDao.teacherApply(form);
					applyDao.increaseApplyCount(form.getTeacherEmail());
					map.put("status", "true");
					return map;
				}
			}
		}
	}
	
	
	
	public void sendPushNotificationTarget(String locale, String cate, String link) {
		HashMap<String, String> map = new HashMap<>();
		map.put("locale",locale);
		map.put("cate",cate);
		List<String> emailList = applyDao.takeEmailForPushTarget(map);
		
		if(!emailList.isEmpty()) {
			List<String> androidToken = applyDao.takeTokenForAndroidPushTarget(emailList);
			List<String> iosTokenList = applyDao.takeTokenForIosPushTarget(emailList);
			String title= "\""+cate+"\""+"수업에 지원하세요";
			String content = "\""+locale+"\""+"에  "+"\""+cate+"\""+"수업 요청 학생이 있습니다";
			pushAsyncMethod.multiPushNotification(androidToken, iosTokenList, title, content, link);
		}
		
	}
	
	
	
	//테스트 완료
	public void sendPushForOneTarget(int id, String applyEmail) throws FirebaseMessagingException, IOException {
		logger.warn("학생 이메일 : "+applyEmail);
		TokenInfo tokenInfo = applyDao.takePushForOneTarget(applyEmail);
		if(tokenInfo != null) {
			String device = tokenInfo.getDevice();
			String title = "선생님 지원서가 도착하였습니다.";
			String content = "문의하신 수업에 대한 지원서가 도착하였습니다.";
			String link = "https://m.coksabu.com/teacherForm?id="+id;
			pushAsyncMethod.pushNotification(device, tokenInfo.getToken(), title, content, link);
		}
		
		
		
	}
	
}
