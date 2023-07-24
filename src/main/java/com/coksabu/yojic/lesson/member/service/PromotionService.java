package com.coksabu.yojic.lesson.member.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coksabu.yojic.lesson.member.dao.MemberDao;
import com.coksabu.yojic.lesson.member.model.Promotion;

@Service
public class PromotionService {

	@Autowired
	private MemberDao memberDao;
	
	public Promotion myPromotion(String email) {
		int myPrmtCount =  memberDao.myPromotionCount(email);
		if(myPrmtCount !=0) {
			Promotion prmt =  memberDao.myPromotion(email);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			prmt.setStartDateS(sdf.format(prmt.getStartDate()));
			prmt.setEndDateS(sdf.format(prmt.getEndDate()));
			return prmt;
			
		}else {
			return null;
		}
	}
	
	
	public String registerMyPromotion(Promotion prmt) {
		
		String prmtCode = prmt.getCode().toUpperCase();
		if(prmtCode.equals("COKSABU") || prmtCode.equals("LESSON")) {
			int myPrmtCount =  memberDao.myCommissionPromotionCount(prmt.getEmail());
			if(myPrmtCount !=0) {
				return "commissionAlreadyExist";
			}else {
				prmt.setTitle("수수료 무료");
				prmt.setContent("고객님의 과외 수수료를 회원가입 날짜를 기준으로 2개월 동안 무료로 적용합니다. 종료날짜 이전에 결제된 모든 거래에 대해 적용됩니다.");
				Date startDate = memberDao.takeSignUpDate(prmt.getEmail());
				prmt.setStartDate(startDate);
				memberDao.registerMyPromotion(prmt);
				return "success";
			}
			
		}else {
			return "codeWrong";
		}
	}
}
