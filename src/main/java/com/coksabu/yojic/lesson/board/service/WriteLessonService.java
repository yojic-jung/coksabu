package com.coksabu.yojic.lesson.board.service;

import java.io.File;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.board.dao.BoardDao;
import com.coksabu.yojic.lesson.board.model.ImgFileName;
import com.coksabu.yojic.lesson.board.model.LessonCardDB;

@Service
public class WriteLessonService {
	
	@Autowired
	private BoardDao boardDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(WriteLessonService.class);
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public int write(LessonCardDB card) {
		
		if(boardDao.countLesson(card) >= 3) {
			return 0;
		}
		card.setPostingdate(new Date());
		card.setReadCount(0);
		
		if(card.getSubCate1().equals("nonevalue")) {
			card.setOpt1price3("0");
		}
		if(card.getSubCate2().equals("nonevalue")) {
			card.setOpt2price3("0");
		}
		return boardDao.write(card);	
						
		}
	
	//수정필요
	@Transactional(rollbackFor= {Exception.class})
	public int update(LessonCardDB card, String path) {
			int id = card.getId();
			//imgPath는 대표이미지와 미디어이미지
			ImgFileName imgPath = boardDao.takeImgName(id);
			
			String represent = imgPath.getRepresent();
			String agoContentImg = imgPath.getContentimg();
			
			if(agoContentImg != null) {
				//db에 저장된 이미지가 있고 새로 추가된경우
				if(!agoContentImg.equals("") && !card.getContentimg().equals("")) {
					logger.info("db에 저장된 이미지가 있고 새로 추가된경우");
					agoContentImg = agoContentImg.concat("*"+card.getContentimg());
					card.setContentimg(agoContentImg);
					
				//db에 저장된 이미지가 없고 새롭게 추가하는 경우
				}else if(agoContentImg.equals("") && !card.getContentimg().equals(""))  {
					logger.info("db에 저장된 이미지가 없고 새롭게 추가하는 경우");
					
				//db에 저장된 이미지가 있고 새롭게 추가하지 않는경우
				}else if(!agoContentImg.equals("") && card.getContentimg().equals("")) {
					card.setContentimg(agoContentImg);
					logger.info("db에 저장된 이미지가 있고 새롭게 추가하지 않는경우");
					
				//db에 저장된 이미지가 없고 새롭게 추가도 하지 않는 경우
				}else {
					logger.info("db에 저장된 이미지가 없고 새롭게 추가도 하지 않는 경우");
				}
			}
			
			
					
			if(represent.equals("pro.png")) {
				return boardDao.update(card);
			}else {
				if(card.getRepresent().equals("pro.png")) {
					card.setRepresent(represent);
					return boardDao.update(card);
				}
				else {
					File file = new File(path+"/representImg/"+represent);
					file.delete();
					return boardDao.update(card);
				}
			}
			
			
	}
}
