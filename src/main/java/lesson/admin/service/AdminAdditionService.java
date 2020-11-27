package lesson.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import lesson.admin.dao.AdminDao;
import lesson.admin.model.DelWaiting;
import lesson.board.model.LessonCardDB;
import lesson.board.model.PurchaseHistory;

public class AdminAdditionService {
	
	AdminDao adminDao;
	
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
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
		List<PurchaseHistory> list = adminDao.takePurchaseList(postId);
		return list;
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
