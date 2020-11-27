package lesson.apply.service;

import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyForm;

public class ApplyShowService {

	ApplyDao applyDao;

	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	public ApplyForm list(int id) {
		return applyDao.studentInfo(id);
	}
}
