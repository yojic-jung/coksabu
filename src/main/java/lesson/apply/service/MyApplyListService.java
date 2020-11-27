package lesson.apply.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.apply.dao.ApplyDao;
import lesson.apply.model.ApplyForm;
import lesson.apply.model.ApplyTeacher;

public class MyApplyListService {

	ApplyDao applyDao;
	
	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}
	
	//통과
	public List<ApplyForm> myApplyList(String email){
		List<ApplyForm> list = applyDao.myApplyList(email);
		List<ApplyForm> applyList2 = new ArrayList<ApplyForm>();
		String name;
		for(Iterator<ApplyForm> itr = list.iterator(); itr.hasNext();) {
			ApplyForm apply = itr.next();
			name = apply.getName().substring(0,1)+" O O";
			apply.setName(name);
			applyList2.add(apply);
			
		}
		return applyList2;
	}
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public int delete(String id, String email){
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		
		applyDao.deleteApplylist(map);
		return applyDao.deleteApply(map);
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public List<ApplyTeacher> myLessonList(String id, String email){
		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("id", id);
		map1.put("email", email);
		List<ApplyTeacher> list = applyDao.myTeacherEmail(map1);
		
		if(list.size()==0) {
			return list;
		}
		
		List<HashMap<String,String>> liset1 = new ArrayList<HashMap<String,String>>();
		for(Iterator<ApplyTeacher> itr = list.iterator(); itr.hasNext();) {
			ApplyTeacher post = itr.next();
			
			HashMap<String, String> map = new HashMap<>();
			map.put("email", post.getTeacherEmail());
			map.put("teacherid", Integer.toString(post.getTeacher_id()));
			liset1.add(map);
		}
		return applyDao.myLessonList(liset1);
	}
	
	public String takeEmail(String teacher_id) {
		return applyDao.takeEmail(teacher_id);
	}
}
