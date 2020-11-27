package lesson.board.service;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.board.dao.BoardDao;
import lesson.board.model.LessonCardDB2;
import lesson.board.model.PostView;
import lesson.member.model.Profile;

public class ReadPostService {

	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao=boardDao;
	}
	
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
		 
		 for(Iterator<PostView> itr = list2.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
			}
		 
		 return list2;
	}
		
}
