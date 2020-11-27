package lesson.board.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import lesson.board.model.CunsultForm;
import lesson.board.model.ImgFileName;
import lesson.board.model.LessonCardDB;
import lesson.board.model.LessonCardDB2;
import lesson.board.model.PostView;
import lesson.board.model.PurchaseHistory;
import lesson.board.model.PurchaseRead;
import lesson.member.model.Profile;
@Repository
public interface BoardDao {
	
	public String takeRepresent(HashMap<String, Object> map);
	
	public ImgFileName takeImgName(String id);
	
	public String readEmail(String id);
	
	public int write(LessonCardDB card);
	
	public int update(LessonCardDB card);
	
	public int readCount(String id);
	
	public int countLesson(LessonCardDB card);
	
	public int checkLesson(String email);

	public int confirmApplyWish(String id);
	
	public int deleteApply(String id);

	public int deleteWishList(String id);
	
	public List<PostView> myLessonList(String email);
	
	public List<PostView> myLessonListFromTutorProfile(String email);
	
	public int deleteLesson(HashMap<String, Object> map);
	
	public int deleteImg(HashMap<String, Object> map);
	

	public LessonCardDB2 read(HashMap<String, Object> map);
	
	public List<PostView> listPost(HashMap<String, Object> map);
	
	public List<PostView> listNewPost(HashMap<String, Object> map);
	
	public int countSubject(HashMap<String, Object> map);
	
	public List<PostView> listSubject(HashMap<String, Object> map);

	public int countForm(HashMap<String, Object> map);
	
	public List<PostView> listForm(HashMap<String, Object> map);
	
	public Profile readProfilePost(String email);
	
	public LessonCardDB2 readLessonPost(String id);
	
	public List<PostView> listMain(List<String> list);
	
	public PurchaseRead purchaseRead(HashMap<String, Object> map);
	
	public String phoneNumber(String email);
	
	public String readBuyerName(String email);
	
	public int insertPurchaseHistory(PurchaseHistory pur);
	
	public String takeSellerImg(String email);
	
	public List<String> takeNamePhone(String email);
	
	public void insertCunsultList(CunsultForm cunsult);
	
	public String takeTeachEmail(int id);
	
	public PostView takeTeacher(PostView post);
	
	public int confirmCunsultCount(String email);
	
	public void increamentCunsultCount(String email);
	
	public String takeImgPath(HashMap<String, Object> map);
	
	public int updateImgUpload(HashMap<String, Object> map);
	
	public int checkPurchaseHistory(String postId);
	
	public int giveVisibleZero(String postId);
	
	public int addDelWatinglist(HashMap<String, Object> map);
}
