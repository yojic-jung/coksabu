package lesson.member.service;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;
import lesson.member.model.CertifyDB;

public class CertifyService {

	private MemberDao memberDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(CertifyService.class);
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public int certify(CertifyDB cer) {
		String imgPath =  memberDao.tekeCertify(cer.getEmail());
			if(!imgPath.equals("") && !cer.getCertifyimg().equals("")) {
				cer.setCertifyimg(imgPath.concat("*"+cer.getCertifyimg()));
				return memberDao.updateImgUpload(cer);
			}else if(imgPath.equals("") && !cer.getCertifyimg().equals("")) {
				return memberDao.updateImgUpload(cer);
			}else if(!imgPath.equals("") && cer.getCertifyimg().equals("")) {
				return memberDao.updateCertify(cer.getEmail());
			}else {
				return -1;
			}
			
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public void delImgPath(String name, String email, String path) {
		File file = new File(path+"/"+name);
		file.delete();
		
		String imgPath = memberDao.tekeCertify(email);
		logger.info(imgPath);
		String img[] = imgPath.split("\\*");
		
		String newName="";
		for(int i=0; i<img.length; i++) {
			if(!img[i].equals(name)) {
				newName = newName.concat(img[i]+"*");
			}
		}
		if(newName.length()!=0) {
			newName = newName.substring(0, newName.length()-1);
		}
		logger.info(newName);
		CertifyDB db = new CertifyDB();
		db.setCertifyimg(newName);
		db.setEmail(email);
		memberDao.updateImgUpload(db);
		
	}
	
	//통과
	public String tekeCertify(String email) {
		return memberDao.tekeCertify(email);
	}
	
}
