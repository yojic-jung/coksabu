package com.coksabu.yojic.lesson.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.board.dao.BoardDao;
import com.coksabu.yojic.lesson.board.model.PostView;

@Service
public class CunsultService {

	@Autowired
	private BoardDao boardDao;
	
	//통과
	public PostView takeTeacher(int id) {
		String email = boardDao.takeTeachEmail(id);
		
		PostView post = new PostView();
		post.setId(id);
		post.setEmail(email);
		
		return boardDao.takeTeacher(post);
	}
	
	//통과
	public List<String> takeBuyer(String email) {
		return boardDao.takeNamePhone(email);
	}
	
	
}
