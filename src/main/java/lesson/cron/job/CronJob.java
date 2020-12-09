package lesson.cron.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CronJob {

	private static final  Logger logger = LoggerFactory.getLogger(CronJob.class);
	
	//UTC 런던시각 기준으로
	@Scheduled(cron = "00 00 15 * * *")
    public void resetApplyCount1(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount1");
    }
	
	@Scheduled(cron = "00 00 16 * * *")
    public void resetApplyCount2(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service2();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount2");
    }
	
	//삭제 고민
	@Scheduled(cron = "00 10 16 * * *")
    public void resetApplyCount3(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service3();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount3");
	}
	
	//결제완료 서비스완료로 바꾸기 0시 4분
	@Scheduled(cron = "00 03 15 * * *")
    public void resetEndDateService(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.resetEndDateService();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetEndDateService");
    }
	
	//입금대기 주문취소로 바꾸기 0시 6분
	@Scheduled(cron = "00 06 15 * * *")
    public void orderCancel(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.orderCancel();
		ctx.close();
		logger.info("스케쥴 테스트:" +"orderCancel");
    }
	
	//채팅거래 결제완료 서비스완료로 바꾸기
		@Scheduled(cron = "00 09 15 * * *")
	    public void resetProposalEndDateService(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.resetProposalEndDateService();
			ctx.close();
			logger.info("스케쥴 테스트:" +"resetProposalEndDateService");
	    }
		
		//채팅거래 입금대기 주문취소로 바꾸기
		@Scheduled(cron = "00 12 15 * * *")
	    public void orderProposalCancel(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.orderProposalCancel();
			ctx.close();
			logger.info("스케쥴 테스트:" +"orderProposalCancel");
	    }
	
		
		
		//로그인 실패 카운드 0으로 리셋
		@Scheduled(cron = "00 15 15 * * *")
	    public void resetLoginFailCount(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.resetLoginFailCount();
			ctx.close();
			logger.info("스케쥴 테스트:" +"resetLoginFailCount");
		}
		
		
}
