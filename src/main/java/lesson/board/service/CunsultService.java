package lesson.board.service;

import java.util.List;

import lesson.board.dao.BoardDao;
import lesson.board.model.PostView;

public class CunsultService {

	BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
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
