package com.coksabu.yojic.lesson.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.board.dao.BoardDao;
import com.coksabu.yojic.lesson.board.model.LessonCardDB2;
import com.coksabu.yojic.lesson.board.model.PostView;
import com.coksabu.yojic.lesson.member.model.Profile;

@Service
public class ReadPostService {
	
	@Autowired
	private BoardDao boardDao;
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> read(String id) {
		 HashMap<String, Object> map = new  HashMap<String, Object>();
		 String email = boardDao.readEmail(id);
		 Profile profile = boardDao.readProfilePost(email);
		 LessonCardDB2 lessonPost = boardDao.readLessonPost(id);
		 boardDao.readCount(id);
		 map.put("tutorEmail", email);
		 map.put("profile", profile);
		 map.put("lessonPost", lessonPost);
		 return map;
	}
	
	//통과
	public List<PostView> listMain() {
		List<String> list = new  ArrayList<String>();
		 
		list.add("수학");
		list.add("외국어");
		list.add("국어");
		list.add("사회");
		list.add("과학");
		list.add("예체능");
		list.add("자소서/입시");
		 
		 List<PostView> list2 = boardDao.listMain(list);
		 
		 
		 return list2;
	}
	
		
}
