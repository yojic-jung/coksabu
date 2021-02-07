package com.coksabu.yojic.lesson.apply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.apply.dao.ApplyDao;
import com.coksabu.yojic.lesson.apply.model.ApplyForm;

@Service
public class ApplyShowService {

	@Autowired
	private ApplyDao applyDao;

	public ApplyForm list(int id) {
		return applyDao.studentInfo(id);
	}
}
