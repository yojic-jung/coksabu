package com.coksabu.yojic.lesson.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.board.dao.BoardDao;
import com.coksabu.yojic.lesson.board.model.LessonCardDB2;
import com.coksabu.yojic.lesson.board.model.PostView;

@Service
public class ReadLessonService {
	
	@Autowired
	private BoardDao boardDao;
	
	//통과
	public List<PostView> readLesson(String email) {
		return boardDao.myLessonList(email);
	}
	
	public List<PostView> readLessonFromTutorProfile(String email) {
		return boardDao.myLessonListFromTutorProfile(email);
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public LessonCardDB2 read(String id, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		
		return boardDao.read(map);
	}
	
}
