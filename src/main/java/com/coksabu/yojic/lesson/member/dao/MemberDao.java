package com.coksabu.yojic.lesson.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.coksabu.yojic.lesson.member.model.CertifyDB;
import com.coksabu.yojic.lesson.member.model.EmailInfo;
import com.coksabu.yojic.lesson.member.model.LessonCertify;
import com.coksabu.yojic.lesson.member.model.Login;
import com.coksabu.yojic.lesson.member.model.MemberInfo;
import com.coksabu.yojic.lesson.member.model.MyAccount;
import com.coksabu.yojic.lesson.member.model.Password;
import com.coksabu.yojic.lesson.member.model.Profile;
import com.coksabu.yojic.lesson.member.model.Qna;
import com.coksabu.yojic.lesson.member.model.TeacherDB;

@Repository
public interface MemberDao {
	
	public int checkEmail(String email);
	
	public int checkPhone(String phone);
	
	public String checkPassword(Login log);
	
	public int signUp(MemberInfo memberInfo); 
	
	public int checkImgPath(String email);
	
	public String takeImgPath(String email);
	
	public Profile takeImgUniv(String email); 
	
	public int confirmCertify(String email);
	
	public int updateCertify(String email);
	
	public void writeProfile(TeacherDB tea);
	
	public void updateMembersImgpath(HashMap<String, String> map);
	
	public void updateProfile(TeacherDB tea);
	
	public Profile takeProfile(String email);

	public List<Profile> takeProfileList(List<String> item);
	
	public List<String> univSearch(HashMap<String, Object> map);
	
	public int univCount(String universe);
	
	public TeacherDB takeTeacherDB(String email);
	
	public int updateImgCertify(CertifyDB cer);
	
	public CertifyDB tekeCertify(String email);
	
	public MemberInfo readMemberInfo(String email);
	
	public String takePassword(String email);
	
	public int updatePhone(MemberInfo member);
	
	public int updatePassword(Password password);
	
	public int updatePassword2(Password password);
	
	public int insertQna(Qna qna);
	
	public int insertLessonCertify(LessonCertify certify);
	
	public int countLessonCertify(String email);
	
	public int updateLessonCertify(LessonCertify certify);
	
	public LessonCertify readLessonCertify(String email);
	
	public String readName(String email);
	
	public int countEmail(EmailInfo info);
	
	public String takeEmail(EmailInfo info);
	
	public void updateLoginTime(HashMap<String, Object> map);
	
	public void insertApplyCount(String email);
	
	public int countMyQna(String email);
	
	public List<Qna> myQnaList(HashMap<String, Object> map);
	
	public int takeHumanStatus(String email);
	
	public int takeFailCount(String email);
	
	public void loginDisabled(String email);
	
	public Date takeFailTime(String email);
	
	public void addFailCount(String email);
	
	public void failReset(String email);
	
	public void addFailTime(String email);
	
	public void giveMembersipToZero(String email);
	
	public int registerAndroidToken(HashMap<String, String> map);
	
	public int deleteAndroidToken(HashMap<String, String> map);
	
	public int takeUnReadCount(String email);
	
	public String takeNickName(String email);
	
	public int updateNickName(MemberInfo mem);
	
	public int takePurchaseCount(String email);
	
	public int takeChatTranCount(String email);
	
	public MyAccount takeMyAccount(String email);
	
	public int updateMyAccount(MyAccount account);
	
}
