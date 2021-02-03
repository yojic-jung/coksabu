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
	
	@Transactional(rollbackFor= {Exception.class})
	public int certify(CertifyDB cer, String path) {
		CertifyDB existVal =  memberDao.tekeCertify(cer.getEmail());
		
		
		//신분증 이미지가 이미 등록되어있을때
		if(existVal.getCertifyimg1() != null) {
			//신분증 이미지 새로 등록하지 않는 경우
			if(cer.getCertifyimg1() == null) {
				//기존 이미지로 등록
				cer.setCertifyimg1(existVal.getCertifyimg1());
			//이미지 새로 등록할 경우 그 전 이미지 삭제
			}else {
				File file = new File(path+"/"+existVal.getCertifyimg1());
				file.delete();
			}
		}
		
		
		//대학증명서 이미지가 등록되어있을때
		if(existVal.getCertifyimg2()!=null) {
			//대학증명서 이미지 새로 등록하지 않는 경우
			if(cer.getCertifyimg2()== null) {
				//기존 이미지로 등록
				cer.setCertifyimg2(existVal.getCertifyimg2());
				//이미지 새로 등록할 경우 그 전 이미지 삭제
			}else {
				File file = new File(path+"/"+existVal.getCertifyimg2());
				file.delete();
			}
		}
		
		//대학원증명서 이미지가 등록되어있을때
		if(existVal.getCertifyimg3()!=null) {
			//대학원증명서 이미지 새로 등록하지 않는 경우
			if(cer.getCertifyimg3()== null) {
				//기존 이미지로 등록
				cer.setCertifyimg3(existVal.getCertifyimg3());
			//이미지 새로 등록할 경우 그 전 이미지 삭제
			}else {
				File file = new File(path+"/"+existVal.getCertifyimg3());
				file.delete();
			}
						
		}
		
		return memberDao.updateImgCertify(cer);
	}
	
	
	//통과
	public CertifyDB tekeCertify(String email) {
		return memberDao.tekeCertify(email);
	}
	
}
