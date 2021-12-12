package com.coksabu.yojic.lesson.contents.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.contents.dao.ContentsDao;
import com.coksabu.yojic.lesson.contents.model.KichulContents;

@Service
public class ContentsService {

	@Autowired
	private ContentsDao contentsDao;
	
	public ArrayList<KichulContents> takeContentsMenu() {
		ArrayList<KichulContents> contentsMenu = contentsDao.takeContentsMenu();
		return contentsMenu;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public HashMap<String, Object> insertKichulContents(KichulContents contents, String path) throws IllegalStateException, IOException {
		HashMap<String, Object> map = new HashMap<>();
		
		String originName = contents.getContentsFile().getOriginalFilename();
		int contentsCount = contentsDao.countKichulContents(originName);
		
		if(contentsCount>0) {
			map.put("duplicate", "duplicate");
			return map;
		}
		
		
		String contentsName=contents.getYear()+" "+contents.getCity()+" "+contents.getDistrict()+" "+contents.getSchool()+" "
				+contents.getGrade().substring(0,1)+"-"+contents.getSemester().substring(0,1)+" "+contents.getTerm()+" " + contents.getSubject();
		
		int dotIdx = originName.indexOf(".");
		
		Boolean isCorrectFileName = originName.substring(0,dotIdx).equals(contentsName);
		
		
		map.put("isCorrectFileName", isCorrectFileName);
		
		
		
		if(isCorrectFileName) {
			File file = new File(path+"/kichul-contents" , originName);
			
			contents.getContentsFile().transferTo(file);
			contents.setContentsName(file.getName());
			
			contentsDao.insertKichulContents(contents);
			
			return map;
		}else {
			map.put("originFileName", originName.substring(0,dotIdx));
			map.put("userSelectName", contentsName);
			return map;
		}
		
	}
}
