package test.webconfig;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.firebase.messaging.FirebaseMessagingException;

import test.model.Greeting;
import test.model.Message;
import test.service.ChattingService;

@Repository
@RestController
public class GreetingController {

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
    
	private static final  Logger logger = LoggerFactory.getLogger(GreetingController.class);
	
    @MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(@Header("atytopic") String topic, @Headers Map<String, Object> headers) {
        return new Greeting("I am a msg from SubscribeMapping('/hello').");
    }

    @MessageMapping("/newconnect")
    public void newConnect(Message message, @Header("atytopic") String topic, @Header("name") String chatroom_id) {
    	//실제 message_receiver와 관계없음, 상대방 연결접속완료를 알려주기위한 용도
    	//안읽음 메세지 읽음처리해주기 위해서
    	message.setMessage_receiver("연결접속완료");
    	this.simpMessagingTemplate.convertAndSend("/queue/message-"+chatroom_id,message);
    }
 
    @MessageMapping("/message")
    public void handleSubscribe(Message message, @Header("name") String chatroom_id,
    	@Headers Map<String, Object> headers,
    	@Header("simpSessionId") String sessionId) throws FirebaseMessagingException, IOException {
    	 String configLocation = "classpath:applicationContext.xml";
  		 AbstractApplicationContext ctx = new GenericXmlApplicationContext(
  				configLocation);
  		 ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
  		 message=chattingService.takeMessage(message);
  		 String status = chattingService.insertMessage(message);
          
         SimpleDateFormat format1 = new SimpleDateFormat ( "MM/dd HH:mm");
          		
         String time1 = format1.format(message.getMessage_time());
         message.setMessage_time2(time1);
         if(status.equals("ON")) {
        	  message.setMessage_read2("");
        	  ctx.close();
         }else {
        	  message.setMessage_read2("안읽음");
        	  int unReadCount = chattingService.takeUnReadCount(message.getMessage_sender(), message.getMessage_receiver());
        	  message.setUnReadCount(unReadCount);
        	  ctx.close();
        	  this.simpMessagingTemplate.convertAndSend("/queue/chatlist-"+message.getMessage_receiver() ,message);
         }
    	 this.simpMessagingTemplate.convertAndSend("/queue/message-"+chatroom_id,message);
    }
    
    
    public void chatdeal(Message message, @Header("name") String name) throws FirebaseMessagingException, IOException {
    	  String configLocation = "classpath:applicationContext.xml";
  		 AbstractApplicationContext ctx = new GenericXmlApplicationContext(
  				configLocation);
  		 ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
  		 message=chattingService.takeMessage(message);
  		 chattingService.insertMessage(message);
          
          ctx.close();
          SimpleDateFormat format1 = new SimpleDateFormat ( "yy-MM-dd HH:mm");
          		
          		
          String time1 = format1.format(message.getMessage_time());
          message.setMessage_time2(time1);
          
    	 this.simpMessagingTemplate.convertAndSend("/queue/message-"+name,message);
    }

   
    @RequestMapping(value="/send", method = RequestMethod.GET)
    public Greeting send() {
        return new Greeting("I am a msg from SubscribeMapping('/send').");
    }

    
}
