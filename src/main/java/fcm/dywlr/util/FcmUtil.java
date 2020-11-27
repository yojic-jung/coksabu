package fcm.dywlr.util;

import java.io.FileInputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;

public class FcmUtil {
	
	private static final  Logger logger = LoggerFactory.getLogger(FcmUtil.class);
	
	//주제구독 방식으로 같은 topic을 구독한 사용자에 여러기기에 푸시알림 전송
	public void send_FCMtopic(String title, String content) throws IOException, FirebaseMessagingException {
		
				FileInputStream serviceAccount = new FileInputStream("/home/ec2-user/lessonwang-android-firebase-adminsdk-shu6p-7f9ad4f830.json");
				
				FirebaseOptions options = new FirebaseOptions.Builder()
				  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
				  .setDatabaseUrl("https://lessonwang-android.firebaseio.com")
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
	public void send_FCMtoken(String tokenId, String title, String content) throws IOException, FirebaseMessagingException {
		
		//비공개 키 저장파일, 상대경로로 바꾸기
		FileInputStream serviceAccount = new FileInputStream("/home/ec2-user/lessonwang-android-firebase-adminsdk-shu6p-7f9ad4f830.json");
		
		FirebaseOptions options = new FirebaseOptions.Builder()
		  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
		  .setDatabaseUrl("https://lessonwang-android.firebaseio.com")
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
				.setToken(registrationToken)
				.build();
		
		String response = FirebaseMessaging.getInstance().send(msg);
		
		logger.warn("Successfully sent message: "+ response);
		
}

}
