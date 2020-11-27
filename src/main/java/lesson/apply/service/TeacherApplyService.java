package lesson.apply.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyTeacher;

public class TeacherApplyService {
	ApplyDao applyDao;
	
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public String teacherApply(ApplyTeacher form) {
		
		form.setApplyDate(new Date());
		
		//프로필 존재유무
		int proExist = applyDao.confirmProfileExist(form.getTeacherEmail());
		
		if(proExist==0) {
			return "noProfile";
		}
		
		int applyCount = applyDao.teacherApplyCount(form.getTeacherEmail());
		
		//하루최대 지원횟수 3회 확인
		if(applyCount>=3) {
			return "teacherlimit";
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("email", form.getTeacherEmail());
			map.put("apply_id", form.getApply_id());
			map.put("message", form.getMessage());
			
			List<Integer> list = applyDao.takeApplyService(map);
			int membership = list.get(0);
			int duplicate = list.get(1);
			int count = list.get(2);
			
			//멤버쉽 가입 유무 확인
			if(membership == 0) {
				return "noMembership";
			}
			
			//중복 지원 확인
			if(duplicate != 0){
				return "duplicate";
			}else {
				
				//지원 선생님 10명 확인
				if(count >= 10) {
					return "limit";
				}else if(count==9){
					form.setApplicantEmail(applyDao.takeApplyEmail(form.getApply_id()));
					
					applyDao.teacherApply(form);
					applyDao.setVisible(form.getApply_id());
					applyDao.increaseApplyCount(form.getTeacherEmail());
					return "true";
				}else {
					form.setApplicantEmail(applyDao.takeApplyEmail(form.getApply_id()));
					applyDao.teacherApply(form);
					applyDao.increaseApplyCount(form.getTeacherEmail());
					return "true";
				}
			}
		}
	}
}
