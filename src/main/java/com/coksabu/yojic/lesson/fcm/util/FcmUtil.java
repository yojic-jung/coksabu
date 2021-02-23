package com.coksabu.yojic.lesson.fcm.util;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.MulticastMessage;
import com.google.firebase.messaging.SendResponse;

import javapns.Push;
import javapns.communication.exceptions.CommunicationException;
import javapns.communication.exceptions.KeystoreException;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;
import javapns.notification.ResponsePacket;

public class FcmUtil {
	
	private static final  Logger logger = LoggerFactory.getLogger(FcmUtil.class);
	
	//주제구독 방식으로 같은 topic을 구독한 사용자에 여러기기에 푸시알림 전송
	public void send_FCMtopic(String title, String content) throws IOException, FirebaseMessagingException {
		
				FileInputStream serviceAccount = new FileInputStream("/home/ec2-user/coksabu-firebase-firebase-adminsdk-agbhe-29ab472828.json");
				
				FirebaseOptions options = FirebaseOptions.builder()
				  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
				  .setDatabaseUrl("https://coksabu-firebase.firebaseio.com")
				  .build();
				
				if(FirebaseApp.getApps().isEmpty()) {
					FirebaseApp.initializeApp(options);
				}
				
				String topic = "dywlr%naver.com";

				// See documentation on defining a message payload.
				Message message = Message.builder()
					.putData("title", title)
					.putData("content", content)
				    .setTopic(topic)
				    .build();

				// Send a message to the devices subscribed to the provided topic.
				String response = FirebaseMessaging.getInstance().send(message);
				// Response is a message ID string.
				logger.warn("Successfully sent message: " + response);

				
				
	}
		
	//해당 토큰 사용자 1명에게 전송
	public void send_FCMtoken(String tokenId, String title, String content, String link) throws IOException, FirebaseMessagingException {
		
		//비공개 키 저장파일, 상대경로로 바꾸기
		FileInputStream serviceAccount = new FileInputStream("/home/ec2-user/coksabu-firebase-firebase-adminsdk-agbhe-29ab472828.json");
		
		FirebaseOptions options = FirebaseOptions.builder()
		  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
		  .setDatabaseUrl("https://coksabu-firebase.firebaseio.com")
		  .build();
		
		if(FirebaseApp.getApps().isEmpty()) {
			FirebaseApp.initializeApp(options);
		}
		String registrationToken = tokenId;
		
		Message msg = Message.builder()
				.setAndroidConfig(AndroidConfig.builder()
						.setTtl(3600*1000)
						.setPriority(AndroidConfig.Priority.NORMAL)
		//				.setNotification(AndroidNotification.builder()
		//						.setTitle(title)
		//						.setBody(content)
		//						.build())
						.build())
				.putData("title", title)
				.putData("content", content)
				.putData("link", link)
				.setToken(registrationToken)
				.build();
		
		String response = FirebaseMessaging.getInstance().send(msg);
		
		logger.info("Successfully sent message: "+ response);
	}
	
	
	
	
	public void send_Multi_FCMtoken(List<String> registrationTokens, String title, String content,String link) throws IOException, FirebaseMessagingException {
		FileInputStream serviceAccount = new FileInputStream("/home/ec2-user/coksabu-firebase-firebase-adminsdk-agbhe-29ab472828.json");
		
		FirebaseOptions options = FirebaseOptions.builder()
		  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
		  .setDatabaseUrl("https://coksabu-firebase.firebaseio.com")
		  .build();
		
		if(FirebaseApp.getApps().isEmpty()) {
			FirebaseApp.initializeApp(options);
		}
		
		for(String token : registrationTokens) {
			logger.warn("푸시알림 타겟 토큰"+token);
		}
		MulticastMessage message = MulticastMessage.builder()
			    .putData("title", title)
			    .putData("content",content)
			    .putData("link",link)
			    .addAllTokens(registrationTokens)
			    .build();
			
				BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);	
				
				if (response.getFailureCount() > 0) {
					  List<SendResponse> responses = response.getResponses();
					  List<String> failedTokens = new ArrayList<>();
					  for (int i = 0; i < responses.size(); i++) {
					    if (!responses.get(i).isSuccessful()) {
					      // The order of responses corresponds to the order of the registration tokens.
					      failedTokens.add(registrationTokens.get(i));
					    }
					  }

					  logger.warn("List of tokens that caused failures: " + failedTokens);
				}
	}
	
	
	
	
	public void sendApnFcmtoken(String token, String content, String link) {
        try {
            PushNotificationPayload payload = PushNotificationPayload.complex();
            payload.addAlert(content);
            payload.addBadge(1);
            payload.addSound("default");
            //cotentAvailable(true)설정해야 ios의 앱델레게이트 didReceiveRemoteNotification메서드 실행됨
            payload.setContentAvailable(true);
            payload.addCustomDictionary("link", link);
            List < PushedNotification > NOTIFICATIONS = Push.payload(payload, "/home/ec2-user/coksabu.p12", "zjavbxj789!", false, token);

            for (PushedNotification NOTIFICATION: NOTIFICATIONS) {
                if (NOTIFICATION.isSuccessful()) {
                    /* APPLE ACCEPTED THE NOTIFICATION AND SHOULD DELIVER IT */
                    /* STILL NEED TO QUERY THE FEEDBACK SERVICE REGULARLY */
                } else {
                    /* ADD CODE HERE TO REMOVE INVALIDTOKEN FROM YOUR DATABASE */

                    /* FIND OUT MORE ABOUT WHAT THE PROBLEM WAS */
                    Exception THEPROBLEM = NOTIFICATION.getException();
                    THEPROBLEM.printStackTrace();

                    /* IF THE PROBLEM WAS AN ERROR-RESPONSE PACKET RETURNED BY APPLE, GET IT */
                    ResponsePacket THEERRORRESPONSE = NOTIFICATION.getResponse();
                    if (THEERRORRESPONSE != null) {
                        System.out.println(THEERRORRESPONSE.getMessage());
                    }
                }
            }
        } catch (CommunicationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (KeystoreException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	
	public void sendMultiApnFcmtoken(List<String> tokenList, String content, String link) {
        try {
            PushNotificationPayload payload = PushNotificationPayload.complex();
            payload.addAlert(content);
            payload.addBadge(1);
            payload.addSound("default");
            //cotentAvailable(true)설정해야 ios의 앱델레게이트 didReceiveRemoteNotification메서드 실행됨
            payload.setContentAvailable(true);
            payload.addCustomDictionary("link", link);
            List < PushedNotification > NOTIFICATIONS = Push.payload(payload, "/home/ec2-user/coksabu.p12", "zjavbxj789!", false, tokenList);

            for (PushedNotification NOTIFICATION: NOTIFICATIONS) {
                if (NOTIFICATION.isSuccessful()) {
                    /* APPLE ACCEPTED THE NOTIFICATION AND SHOULD DELIVER IT */
                    /* STILL NEED TO QUERY THE FEEDBACK SERVICE REGULARLY */
                } else {
                    /* ADD CODE HERE TO REMOVE INVALIDTOKEN FROM YOUR DATABASE */

                    /* FIND OUT MORE ABOUT WHAT THE PROBLEM WAS */
                    Exception THEPROBLEM = NOTIFICATION.getException();
                    THEPROBLEM.printStackTrace();

                    /* IF THE PROBLEM WAS AN ERROR-RESPONSE PACKET RETURNED BY APPLE, GET IT */
                    ResponsePacket THEERRORRESPONSE = NOTIFICATION.getResponse();
                    if (THEERRORRESPONSE != null) {
                        System.out.println(THEERRORRESPONSE.getMessage());
                    }
                }
            }
        } catch (CommunicationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (KeystoreException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	

}
