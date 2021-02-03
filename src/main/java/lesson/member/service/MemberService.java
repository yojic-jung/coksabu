package lesson.member.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import lesson.member.dao.MemberDao;
import lesson.member.model.MemberInfo;
import lesson.member.model.MyAccount;
import lesson.member.model.MyQnaList;
import lesson.member.model.Password;
import lesson.member.model.Qna;

public class MemberService {
	
	private MemberDao memberDao;
	private PasswordEncoder passwordEncoder;
	
	private static final  Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	public static final int COUNT_PER_PAGE = 4;
	
	
	//통과
	public MemberInfo read(String email) {
		return memberDao.readMemberInfo(email);
	}
	
	//통과
	public MyAccount takeMyAccount(String email) {
		return memberDao.takeMyAccount(email);
	}
	
	//통과
	public int updateMyAccount(MyAccount account) {
		return memberDao.updateMyAccount(account);
	}
	
	//수정필요
	public String updatePhone(MemberInfo member) {
		
		MemberInfo mem = memberDao.readMemberInfo(member.getEmail());
		
		if(!mem.getName().equals(member.getName()) || !mem.getBirth().equals(member.getBirth())) {
			return "fail";
		}else {
			memberDao.updatePhone(member);
			return "success";
		}
		
		
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public int updatePassword(Password password) {
		String current = memberDao.takePassword( password.getEmail() );
		if(  !passwordEncoder.matches(password.getPassword(), current)){
			return -1;
		}else {
			password.setPassword2(passwordEncoder.encode(password.getPassword2()));
			return memberDao.updatePassword(password);
		}
	}
	
	public int insertQna(Qna qna) {
		qna.setDate(new Date());
		return memberDao.insertQna(qna);
	}
	
	public MyQnaList myqna(String email,int pageNumber) {
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}

			HashMap<String, Object> map = new HashMap<>();
			
			int totalPostCount = memberDao.countMyQna(email);
			logger.info(String.valueOf(totalPostCount));
			if(totalPostCount == 0) {
			MyQnaList myQnaList=new MyQnaList();
			return myQnaList;
			}
			
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			
			map.put("email", email);
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
			
			List<Qna> qnaList = memberDao.myQnaList(map);
			logger.info(String.valueOf(qnaList.isEmpty()));
			
			for(Iterator<Qna> itr = qnaList.iterator(); itr.hasNext();) {
				Qna purchase = itr.next();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				purchase.setDateJ(sdf.format(purchase.getDate()));
			}
			
			MyQnaList myQnaList = new MyQnaList(
					qnaList, pageNumber, totalPageCount, firstRow, endRow);

			return myQnaList;	
	}
	
	
	public String takeName(String email) {
		return memberDao.readName(email);
	}
	
	
	private int calculateTotalPageCount(int totalPostCount) {
		if(totalPostCount == 0) {
			return 0;
		}
		int pageCount = totalPostCount / COUNT_PER_PAGE;
		if(totalPostCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
	}
	
	public int takeUnreadMessageCount(String email) {
		return memberDao.takeUnReadCount(email);
	}
	
	public String takeNickName(String email) {
		return memberDao.takeNickName(email);
	}
	
	public int updateNickName(MemberInfo mem, String email) {
		
		int purchaseCount = memberDao.takePurchaseCount(email);
		int chatTranCount = memberDao.takeChatTranCount(email);
		
		int count = purchaseCount + chatTranCount;
		System.out.println(purchaseCount);
		System.out.println(chatTranCount);
		System.out.println(count);
		
		if(count>0) {
			return -1;
		}
		
		return memberDao.updateNickName(mem);
	}
}
