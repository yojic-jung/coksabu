package com.coksabu.yojic.lesson.apply.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.apply.dao.ApplyDao;
import com.coksabu.yojic.lesson.apply.model.ApplyForm;

@Service
public class ApplyService {
	
	@Autowired
	private ApplyDao applyDao;
	
	
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
