package lesson.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.board.dao.BoardDao;
import lesson.board.model.LessonCardDB2;
import lesson.board.model.PostView;

public class ReadLessonService {
	
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao=boardDao;
	}
	
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
