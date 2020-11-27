package lesson.cron.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface CronDao {

	public int deleteOldWish();
	
	public void resetLoginFailCount();
	
	public int deleteOldLessonApply();
	
	public int deleteOldLessonApplyList();
	
	public int deleteOldCunsult();
	
	public int deleteOldPurchase();
	
	public int resetApplyCount();
	
	public int resetCunsultCount();
	
	public int resetMembership();
	
	public int resetEndDateService(HashMap<String, Object> map);
	
	public int orderCancel(HashMap<String, Object> map);
	
	public int resetProposalEndDateService(HashMap<String, Object> map);
	
	public int orderProposalCancel(HashMap<String, Object> map);
	
}
