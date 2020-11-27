package lesson.apply.service;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyForm;

public class ApplyService {
	
	ApplyDao applyDao;
	
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public int apply(ApplyForm apply) {
		apply.setPostingdate(new Date());
		
		int myApply = applyDao.countMyApply(apply.getEmail());
		if(myApply >= 3) {
			return myApply;
		}else {
			return applyDao.apply(apply);
		}
	}
}
