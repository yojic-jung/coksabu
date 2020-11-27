package lesson.cron.job;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.cron.dao.CronDao;

public class CronService {
	
	private CronDao cronDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(CronService.class);
	
	public void setCronDao(CronDao cronDao) {
		this.cronDao = cronDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void service() {
		int a = cronDao.resetApplyCount();
		int b = cronDao.resetCunsultCount();
		cronDao.resetMembership();
		logger.info("하루 레슨지원 횟수 리셋="+a+"개, "+"하루 상담지원 횟수 리셋="+b+"개");
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void service2() {
		int a = cronDao.deleteOldWish();
		int b = cronDao.deleteOldCunsult();
		logger.info("일주일 지난 장바구니 삭제 갯수="+a+"개, "+"1년 지난 상담내역 삭제 갯수="+b+"개");
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void service3() {
		int a = cronDao.deleteOldLessonApply();
		int b = cronDao.deleteOldLessonApplyList();
		logger.info("1년 지난 레슨요청 내역 삭제 갯수="+a+"개, "+"1년 지난 레슨지원 내역 삭제 갯수="+b+"개");
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public void resetEndDateService() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("val", "서비스완료");
		map.put("condition", "결제완료");
		
		int a = cronDao.resetEndDateService(map);
		logger.info("수업 종료 날짜 지난 후 서비스완료로 수정된 거래내역 ="+a+"개, ");
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void orderCancel() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("val", "주문취소");
		map.put("condition", "입금대기");
		
		int a = cronDao.orderCancel(map);
		logger.info("수업 시작 날짜 지난 입금대기 내역 주문취소로 바꾼갯수 ="+a+"개, ");
	}
	
	
	@Transactional(rollbackFor= {Exception.class})
	public void resetProposalEndDateService() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("val", "서비스완료");
		map.put("condition", "결제완료");
		
		int a = cronDao.resetProposalEndDateService(map);
		logger.info("수업 종료 날짜 6일 지난 후 서비스완료로 수정된 거래내역 ="+a+"개, ");
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void orderProposalCancel() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("val", "주문취소");
		map.put("condition", "입금대기");
		
		int a = cronDao.orderProposalCancel(map);
		logger.info("수업 시작 날짜 지난 입금대기 내역 주문취소로 바꾼갯수 ="+a+"개, ");
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void resetLoginFailCount() {
		cronDao.resetLoginFailCount();
	}
	
}
