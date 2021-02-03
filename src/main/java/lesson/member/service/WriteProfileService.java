package lesson.member.service;

import java.io.File;
import java.util.HashMap;

import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;
import lesson.member.model.Profile;
import lesson.member.model.TeacherDB;
//통과
public class WriteProfileService {
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void writeProfile(TeacherDB tea, String path) {
		//학과명 공백제거
		tea.setUnivsub(tea.getUnivsub().replace(" ", ""));
		
		int profileExist = memberDao.checkImgPath(tea.getEmail());
		if(profileExist !=0) {
			Profile profile = memberDao.takeImgUniv(tea.getEmail());
			
			String imgPath = profile.getImgPath();
			String univName = profile.getUniverse();
			String univSub = profile.getUnivsub();
			
			boolean a = univName.equals(tea.getUniverse()) && univSub.equals(tea.getUnivsub());
			
			if(!a) {
				memberDao.giveMembersipToZero(tea.getEmail());
				memberDao.updateCertify(tea.getEmail());
			}
			
			if(imgPath.equals("pro.png")) {
				memberDao.updateProfile(tea);
			}else {
				//DB에 저장되어 있는 이미지가 있고 이를  사용자가 수정하지 않은경우
				if(tea.getImgPath().equals("pro.png")) {
					tea.setImgPath(imgPath);
					memberDao.updateProfile(tea);
				}
				else {
					File file = new File(path+"/"+imgPath);
					file.delete();
					memberDao.updateProfile(tea);
				}
			}
		}else {
			memberDao.insertApplyCount(tea.getEmail());
			memberDao.writeProfile(tea);
			HashMap<String, String> map = new HashMap<String, String>();
						
			map.put("email", tea.getEmail());
			map.put("imgpath", tea.getImgPath());
						
			memberDao.updateMembersImgpath(map);
		}
	}
	
}
