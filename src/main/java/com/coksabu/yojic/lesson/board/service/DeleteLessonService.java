package com.coksabu.yojic.lesson.board.service;

import java.io.File;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.board.dao.BoardDao;

@Service
public class DeleteLessonService {
	
	@Autowired
	private BoardDao boardDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(DeleteLessonService.class);
	
	
	@Transactional(rollbackFor= {Exception.class})
	public int deleteLesson(String id, String path, String email) {
		int purchaseCount = boardDao.checkPurchaseHistory(id);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		
		if(purchaseCount==0) {
			String represent = boardDao.takeRepresent(map);
			logger.info(path+"/representImg/"+represent);
			if(!represent.equals("pro.png")) {
				File file = new File(path+"/representImg/"+represent);
				file.delete();
			}
			
			String imgPath = boardDao.takeImgPath(map);
			if(imgPath!=null && !imgPath.equals("")) {
				String img[] = imgPath.split("\\*");
				for(int i=0; i<img.length; i++) {
					File file = new File(path+"/mediaImg/"+img[i]);
					file.delete();
				}
			}
			
			int a = boardDao.confirmApplyWish(id);
			logger.info(String.valueOf(a));
			if(a>=1) {
				boardDao.deleteWishList(id);
			}
			
			return boardDao.deleteLesson(map);
		}else {
			boardDao.giveVisibleZero(id);
			//관리자 알수 있게끔 코드짜기
			boardDao.addDelWatinglist(map);
			return 1;
		}
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public int deleteImg(String id, String name, String path, String email) {
			HashMap<String, Object> map2 = new HashMap<>();
			map2.put("id", id);
			map2.put("email", email);	
		
			File file = new File(path+"/"+name);
			file.delete();
			
			
			logger.info(id+"아이디");
			//
			String imgPath = boardDao.takeImgPath(map2);
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
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("newname", newName);
			
			return boardDao.updateImgUpload(map);
			//
	}
}
