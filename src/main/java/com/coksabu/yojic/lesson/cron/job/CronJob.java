package com.coksabu.yojic.lesson.cron.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.coksabu.yojic.lesson.cron.service.CronService;

@Component
public class CronJob {

	private static final  Logger logger = LoggerFactory.getLogger(CronJob.class);
	
	
	//선생님 수업 지원횟수 초기화와 로그인 실패 횟수 초기화
	@Scheduled(cron = "00 00 00 * * *")
    public void resetApplyCount1(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount1");
    }
	
	// 04시 00분 00초
	@Scheduled(cron = "00 00 04 * * *")
    public void resetApplyCount2(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service2();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount2");
    }
	
	@Scheduled(cron = "00 00 05 * * *")
    public void resetApplyCount3(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.service3();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetApplyCount3");
	}
	
	//결제완료 서비스완료로 바꾸기 0시 5분
	@Scheduled(cron = "00 05 00 * * *")
    public void resetEndDateService(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.resetEndDateService();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetEndDateService");
    }
	
	//입금대기 주문취소로 바꾸기 0시 10분
	@Scheduled(cron = "00 10 00 * * *")
    public void orderCancel(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.orderCancel();
		ctx.close();
		logger.info("스케쥴 테스트:" +"orderCancel");
    }
	
	//채팅거래 결제완료 서비스완료로 바꾸기
	@Scheduled(cron = "00 15 00 * * *")
	public void resetProposalEndDateService(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.resetProposalEndDateService();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetProposalEndDateService");
	}
		
	//채팅거래 입금대기 주문취소로 바꾸기
	@Scheduled(cron = "00 20 00 * * *")
	public void orderProposalCancel(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.orderProposalCancel();
		ctx.close();
		logger.info("스케쥴 테스트:" +"orderProposalCancel");
	}
	
	//로그인 실패 횟수, 실패시간, enabled 초기화
	@Scheduled(cron = "00 00 06 * * *")
	public void resetLoginFailCount(){
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		CronService cronService = ctx.getBean("cronService", CronService.class );
		cronService.resetLoginFailCount();
		ctx.close();
		logger.info("스케쥴 테스트:" +"resetLoginFailCount");
	}
		
}
