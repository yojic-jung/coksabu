package test.webconfig;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.messaging.converter.MessageConverter;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
import org.springframework.web.socket.handler.WebSocketHandlerDecorator;
import org.springframework.web.socket.handler.WebSocketHandlerDecoratorFactory;

import com.dywlr.jsonxssfilter.HtmlEscapingObjectMapperFactory.HTMLCharacterEscapes;
import com.fasterxml.jackson.databind.ObjectMapper;

import lesson.cron.job.CronJob;
import test.service.ChattingService;

@Configuration
@EnableScheduling
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer implements SchedulingConfigurer  {

	private static final  Logger logger = LoggerFactory.getLogger(WebSocketConfig.class);
	
    public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
    	String[] origins = {"https://www.coksabu.com", "https://m.coksabu.com", "https://coksabu.com"};
        stompEndpointRegistry.addEndpoint("/hello", "/chatmemberlist").setAllowedOrigins(origins).withSockJS()
        .setClientLibraryUrl("https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js");
    }

    @Override
    public void configureWebSocketTransport(final WebSocketTransportRegistration registration) {
        registration.addDecoratorFactory(new WebSocketHandlerDecoratorFactory() {
            @Override
            public WebSocketHandler decorate(final WebSocketHandler handler) {
                return new WebSocketHandlerDecorator(handler) {
                	@Override
                	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
                		logger.warn("소켓 연결 성공");
                		String st = session.getUri().toString();
                		String roomnumber;
                		int length = st.length();
                		
                		// 채팅방에서 생성된 소켓만 실행하는 코드, 대화방목록에서는 실행안되게 하기 위해
                		if(st.indexOf("chatroom_id=")!=-1) {
                			logger.warn("채팅방 접속");
                			st =  st.substring(st.lastIndexOf("chatroom_id=")+12, length);
                    		String[] s = st.split("&username=");
                    		roomnumber = s[0];
                    		String email= s[1];
                    		int andIndex = email.lastIndexOf("&");
                    		if(andIndex==-1) {
                    		}else {
                    			email = email.substring(0, andIndex);
                    		}
                    		
                    		String configLocation = "classpath:applicationContext.xml";
                    		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
                    				configLocation);
                    		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
                    		
                    		chattingService.changeChatStatusToON(roomnumber,email);
                    		ctx.close();
                		}
                		handler.afterConnectionEstablished(session);
                	}
                	
                	@Override
                	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
                		String st = session.getUri().toString();
                		String roomnumber;
                		int length = st.length();
                		
                		// 채팅방에서 생성된 소켓만 실행하는 코드, 대화방목록에서는 실행안되게 하기 위해
                		if(st.indexOf("chatroom_id=")!=-1) {
                			logger.warn("채팅방 나감");
                			st =  st.substring(st.lastIndexOf("chatroom_id=")+12, length);
                    		String[] s = st.split("&username=");
                    		roomnumber = s[0];
                    		String email= s[1];
                    		int andIndex = email.lastIndexOf("&");
                    		if(andIndex==-1) {
                    		}else {
                    			email = email.substring(0, andIndex);
                    		}
                    		logger.warn("소켓 연결 종료");
                    		logger.warn( "내 roomnumber "+roomnumber );
                    		logger.warn( "내 email "+email );
                    		
                    		String configLocation = "classpath:applicationContext.xml";
                    		AbstractApplicationContext ctx = new GenericXmlApplicationContext(
                    				configLocation);
                    		ChattingService chattingService = ctx.getBean("chattingService", ChattingService.class );
                    		
                    		HashMap<String, String> map = new HashMap<>();
                    		
                    		map.put("user", email);
                    		map.put("roomnumber", roomnumber);
                    		                		
                    		chattingService.changeChatMemberStatus(map);
                    		ctx.close();
                		}
                		
                	}
                };
            }
        });
        super.configureWebSocketTransport(registration);
    }
    
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/topic", "/queue");
        registry.setApplicationDestinationPrefixes("/app");
        registry.setUserDestinationPrefix("/user");
    }
    
    
    @Bean
    public CronJob timedThingy()
    {
       return new CronJob();
    }

   @Bean()
   public ThreadPoolTaskScheduler taskScheduler() {
      return new ThreadPoolTaskScheduler();
   }

    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar)
    {
        taskRegistrar.setTaskScheduler(taskScheduler());
        taskRegistrar.addFixedRateTask(new Runnable()
        {
           public void run()
           {
              timedThingy();
           }
        }, 1000);
    }
    
    // 웹소켓에서도 메세지 컨버터 설정
    @Override
	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
    	messageConverters.add(escapingConverter());
        return true;
    }

    private MessageConverter escapingConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

        MappingJackson2MessageConverter escapingConverter =
                new MappingJackson2MessageConverter();
        escapingConverter.setObjectMapper(objectMapper);

        return escapingConverter;
    }
    

}
