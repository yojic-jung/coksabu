package com.coksabu.yojic.lesson.fcm.util;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import purplebook.solapi.app.SendJsonAlimtalkButton;

@EnableAsync
@Service
public class PushAsyncMethod {
	
	public static final  Logger logger = LoggerFactory.getLogger(PushAsyncMethod.class);
	
	@Async
	public void pushNotification(String device, String token, String title, String content, String link) {
		if(device!=null) {
			if(device.equals("android")) {
				try {
					FcmUtil fcm = new FcmUtil();
					fcm.send_FCMtoken(token, title, content, link);
				}catch(Exception e){
					logger.warn("안드로이드 푸시알림 오류 : "+e);
				}
				
			}else if(device.equals("ios")) {
				try {
				FcmUtil fcm = new FcmUtil();
				fcm.sendApnFcmtoken(token, content, link);
				}catch(Exception e){
					logger.warn("ios 푸시알림 오류 : "+e);
				}
			}
		}
		
	}
	
	@Async
	public void pushForMessageNotification(String device, String token, String title, String content, String link) {
		if(device!=null) {
			if(device.equals("android")) {
				try {
					FcmUtil fcm = new FcmUtil();
					fcm.send_FCMtoken(token, title, content, link);
				}catch(Exception e){
					logger.warn("안드로이드 채팅 푸시알림 오류 : "+e);
				}
				
			}else if(device.equals("ios")) {
				try {
				FcmUtil fcm = new FcmUtil();
				fcm.sendApnFcmtoken(token, "메세지 : "+content, link);
				}catch(Exception e){
					logger.warn("ios 채팅 푸시알림 오류 : "+e);
				}
			}
		}
		
	}
	
	@Async
	public void multiPushNotification(List<String> androidToken, List<String> iosTokenList, String title, String content, String link) {
		FcmUtil fcm = new FcmUtil();
		//파이어베이스 회원들에게 푸시 보내기
		if(androidToken!=null) {
			if(!androidToken.isEmpty()) {
				try {
					fcm.send_Multi_FCMtoken(androidToken, title, content, link);
				}catch(Exception e) {
					logger.warn("안드로이드 멀티 푸시알림 오류 : "+e);
				}
			}
		}
		
		
		if(iosTokenList!=null) {
			//ios 회원들에게 푸시 보내기
			if(!iosTokenList.isEmpty()) {
				try {
					//APNs 한번에 여러명한테 보내는 메서드 찾기
					fcm.sendMultiApnFcmtoken(iosTokenList, content, link);
				}catch(Exception e) {
					logger.warn("ios 채팅 푸시알림 오류 : "+e);
				}
			}
		}
		
	}
	
	
	
	
	@Async
	public void tutorCertifySuccesAlimtalk(String name, String phone) {
		SendJsonAlimtalkButton.sendAlimTalkButtonCertifySuccess(name, phone);
	}

	@Async
	public void tutorCertifyFaiilAlimtalk(String name, String phone) {
		SendJsonAlimtalkButton.sendAlimTalkButtonCertifyFail(name, phone);
	}
}
