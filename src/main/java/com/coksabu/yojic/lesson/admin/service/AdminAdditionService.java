package com.coksabu.yojic.lesson.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coksabu.yojic.lesson.admin.dao.AdminDao;
import com.coksabu.yojic.lesson.admin.model.DelWaiting;
import com.coksabu.yojic.lesson.admin.model.NotificationLight;
import com.coksabu.yojic.lesson.board.model.LessonCardDB;
import com.coksabu.yojic.lesson.board.model.PurchaseHistory;

@Service
public class AdminAdditionService {
	
	@Autowired
	private AdminDao adminDao;
	
	
	public NotificationLight notificationLight(){
		NotificationLight notify = new NotificationLight();
		notify.setCertifyCount(adminDao.certifyCount());
		notify.setDelLessonCount(adminDao.delLessonCount());
		notify.setQnaCount(adminDao.countQna());
		
		List<String> list = new ArrayList<>();
		
		list.add("입금대기");
		list.add("환불대기");
		
		List<Integer> lessonNotify =adminDao.takeLessonCount(list);
		List<Integer> chatNotify =adminDao.takeChatCount(list);
		
		notify.setLessonTranCount(lessonNotify.get(0));
		notify.setLessonRefundCount(lessonNotify.get(1));
		
		notify.setChatTranCount(chatNotify.get(0));
		notify.setChatRefundCount(chatNotify.get(1));
		
		
		return notify;
	}
	
	public List<DelWaiting> delWaitingList() {
		List<DelWaiting> list = adminDao.delWaitingList();
		for(Iterator<DelWaiting> itr = list.iterator(); itr.hasNext();) {
			DelWaiting del = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			del.setRecordtimeS(sdf.format(del.getRecordtime()));
		}
		
		return list;
	}
	
	public List<DelWaiting> delWaitingList2() {
		List<DelWaiting> list = adminDao.delWaitingList();
		for(Iterator<DelWaiting> itr = list.iterator(); itr.hasNext();) {
			DelWaiting del = itr.next();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			del.setRecordtimeS(sdf.format(del.getRecordtime()));
		}
		
		return list;
	}
	
	public List<PurchaseHistory> takePurchaseList(int postId) {
		return  adminDao.takePurchaseList(postId);
	}
	
	@Transactional(rollbackFor= {Exception.class})
	public int adminDelLesson(int postId, int id, String path) {
		
		LessonCardDB card = adminDao.takeLesson(postId);
		adminDao.putDelLesson(card);
		
		String represent = card.getRepresent();
		
		if(!represent.equals("pro.png")) {
			File file = new File(path+"/representImg/"+represent);
			file.delete();
				
		}
		
		String imgPath = card.getContentimg();
		if(imgPath!=null && !imgPath.equals("")) {
			String img[] = imgPath.split("\\*");
			
			for(int i=0; i<img.length; i++) {
				File file = new File(path+"/mediaImg/"+img[i]);
				file.delete();
			}
		}
		
		int a = adminDao.confirmApplyWish(postId);
		if(a>=1) {
			adminDao.deleteWishList(postId);
		}
		adminDao.removeDelWaitingList(id);
		
		return adminDao.deleteLesson(postId);
	}
	
}
