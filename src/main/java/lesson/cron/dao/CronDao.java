package lesson.cron.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface CronDao {

	public int deleteOldWish();
	
	public int resetLoginFailCount();
	
	public List<Integer> takeApplyId();
	
	public int deleteOldLessonApplyList(List<Integer> item);
	
	public int deleteOldLessonApply();

	public int deleteOldPurchase();
	
	public int resetApplyCount();
	
	public int resetMembership();
	
	public int resetEndDateService(HashMap<String, Object> map);
	
	public int orderCancel(HashMap<String, Object> map);
	
	public int resetProposalEndDateService(HashMap<String, Object> map);
	
	public int orderProposalCancel(HashMap<String, Object> map);
	
}
