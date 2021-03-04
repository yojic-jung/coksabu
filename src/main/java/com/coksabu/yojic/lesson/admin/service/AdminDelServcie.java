package com.coksabu.yojic.lesson.admin.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.admin.dao.AdminDao;
import com.coksabu.yojic.lesson.member.model.CertifyDB;

@Service
public class AdminDelServcie {
	@Autowired
	private AdminDao adminDao;
	
	
	@Transactional(rollbackFor= {Exception.class})
	public String delUser(String email, String path){
		String profileImg= adminDao.takeProfileImage(email);
		if( profileImg !=null) {
			if(!profileImg.equals("pro.png")) {
				File file = new File(path+"/profileImg/"+profileImg);
				file.delete();
			}
			
		}
		
		
		List<String> representImg= adminDao.takeRepresentImg(email);
		for(String rep : representImg) {
			if( rep !=null) {
				if(!rep.equals("pro.png")){
					File file = new File(path+"/representImg/"+rep);
					file.delete();
				}
				
			}
		}
		
		List<CertifyDB> certifyImg= adminDao.takeCertifyImg(email);
		for(CertifyDB cer : certifyImg) {
			String cer1 = cer.getCertifyimg1();
			String cer2 = cer.getCertifyimg2();
			String cer3 = cer.getCertifyimg3();
			if(cer1 !=null) {
				File file = new File(path+"/certifyImg/"+cer1);
				file.delete();
			}
			if(cer2 !=null) {
				File file = new File(path+"/certifyImg/"+cer2);
				file.delete();
			}
			if(cer3 !=null) {
				File file = new File(path+"/certifyImg/"+cer3);
				file.delete();
			}
			
		}
		
		List<String> mediaImg= adminDao.takeMediaImg(email);
		for(String media : mediaImg) {
			if(media !=null) {
				if(!media.equals("")) {
					String mediaList[] = media.split("\\*");
					for(String img : mediaList) {
						File file = new File(path+"/mediaImg/"+img);
						file.delete();
					}
				
				}
			}
		}
		
		List<Integer> chatRoomId = adminDao.takeChatRoomId(email);
		if(!chatRoomId.isEmpty()) {
			adminDao.delChatRoomById(chatRoomId);
		}
		
		
		return "success";
	}
}
