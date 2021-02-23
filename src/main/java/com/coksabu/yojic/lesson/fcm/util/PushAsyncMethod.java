package com.coksabu.yojic.lesson.fcm.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@EnableAsync
@Service
public class PushAsyncMethod {
	
	public static final  Logger logger = LoggerFactory.getLogger(PushAsyncMethod.class);
	
	@Async
	public void pushNotification(String device, String token, String title, String content, String link) {
		if(device.equals("android")) {
			try {
				FcmUtil fcm = new FcmUtil();
				fcm.send_FCMtoken(token, title, content, link);
			}catch(Exception e){
			}
			
		}else if(device.equals("ios")) {
			try {
			FcmUtil fcm = new FcmUtil();
			fcm.sendApnFcmtoken(token, content, link);
			}catch(Exception e){
			}
		}
	}
	
	@Async
	public void pushForMessageNotification(String device, String token, String title, String content, String link) {
		if(device.equals("android")) {
			try {
				FcmUtil fcm = new FcmUtil();
				fcm.send_FCMtoken(token, title, content, link);
			}catch(Exception e){
			}
			
		}else if(device.equals("ios")) {
			try {
			FcmUtil fcm = new FcmUtil();
			fcm.sendApnFcmtoken(token, "메세지 : "+content, link);
			}catch(Exception e){
			}
		}
	}
	
	@Async
	public void multiPushNotification(List<String> androidToken, List<String> iosTokenList, String title, String content, String link) {
		FcmUtil fcm = new FcmUtil();
		//파이어베이스 회원들에게 푸시 보내기
		if(!androidToken.isEmpty()) {
			try {
				fcm.send_Multi_FCMtoken(androidToken, title, content, link);
			}catch(Exception e) {
			}
		}
		
		//ios 회원들에게 푸시 보내기
		if(!iosTokenList.isEmpty()) {
			try {
				//APNs 한번에 여러명한테 보내는 메서드 찾기
				fcm.sendMultiApnFcmtoken(iosTokenList, content, link);
			}catch(Exception e) {
			}
		}
	}

}
