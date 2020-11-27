package lesson.apply.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import lesson.apply.model.ApplyForm;
import lesson.apply.model.ApplyTeacher;

@Repository
public interface ApplyDao {

	public String takeApplyEmail(int applyId);
	
	public int apply(ApplyForm apply);
	
	public int countApply();
	
	public int confirmProfileExist(String email);
	
	public String takeEmail(String teacher_id);
	
	public int countMyApply(String email);
	
	public int teacherApply(ApplyTeacher teacher);
	
	public ApplyForm studentInfo(int id);

	public int deleteApply(HashMap<String, Object> map);
	
	public int deleteApplylist(HashMap<String, Object> map);
	
	public List<ApplyForm> listApplyForm(HashMap<String, Object> map);
	
	public int countSearchApply(HashMap<String, Object> map);
	
	public List<ApplyForm> listSearchApplyForm(HashMap<String, Object> map);
	
	public List<ApplyForm> myApplyList(String email);
	
	public List<ApplyTeacher> myTeacherEmail(HashMap<String, Object> map);
	
	public List<ApplyTeacher> myLessonList(List<HashMap<String,String>> item);
	
	public int setVisible(int id);
	
	
	public void increaseApplyCount(String email);
	
	public int teacherApplyCount(String email);
	
	public List<Integer> takeApplyService(HashMap<String, Object> map);
}
