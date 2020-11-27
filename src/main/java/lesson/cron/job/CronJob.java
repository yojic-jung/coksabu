package lesson.cron.job;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class CronJob {

	
	@Scheduled(cron = "00 00 00 * * *")
    public void resetApplyCount1(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service();
		ctx.close();
    }
	
	@Scheduled(cron = "00 00 04 * * *")
    public void resetApplyCount2(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service2();
		ctx.close();
    }
	
	
	
	@Scheduled(cron = "00 10 04 * * *")
    public void resetApplyCount3(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service3();
		ctx.close();
		
	}
	
	//결제완료 서비스완료로 바꾸기 0시 4분
	@Scheduled(cron = "00 04 00 * * *")
    public void resetEndDateService(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.resetEndDateService();
		ctx.close();
    }
	
	//입금대기 주문취소로 바꾸기 0시 6분
	@Scheduled(cron = "00 06 00 * * *")
    public void orderCancel(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.orderCancel();
		ctx.close();
    }
	
	//채팅거래 결제완료 서비스완료로 바꾸기
		@Scheduled(cron = "00 8 00 * * *")
	    public void resetProposalEndDateService(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.resetProposalEndDateService();
			ctx.close();
	    }
		
		//채팅거래 입금대기 주문취소로 바꾸기
		@Scheduled(cron = "00 10 00 * * *")
	    public void orderProposalCancel(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.orderProposalCancel();
			ctx.close();
	    }
	
		
		
		//로그인 실패 카운드 0으로 리셋
		@Scheduled(cron = "00 00 02 * * *")
	    public void resetLoginFailCount(){
			String configLocation = "classpath:applicationContext.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
			CronService cronService = ctx.getBean("cronService", CronService.class );
			cronService.resetLoginFailCount();
			ctx.close();
			
		}
}
