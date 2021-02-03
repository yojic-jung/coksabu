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
	public String apply(ApplyForm apply) {
		apply.setPostingdate(new Date());
		
		int myApply = applyDao.countMyApply(apply.getEmail());
		if(myApply >= 3) {
			return "limit";
		}
		int changeStatus = applyDao.apply(apply);
		if(changeStatus==0) {
			return "none";
		}
		//바꾸면 안됨, 링크에 사용할 id값
		return String.valueOf(apply.getId());
		
	}
}
