package lesson.board.service;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import lesson.board.dao.BoardDao;
import lesson.board.model.PostList;
import lesson.board.model.PostView;
import lesson.board.model.SearchForm;

public class ListService {
	
	BoardDao boardDao;
	
	private static final  Logger logger = LoggerFactory.getLogger(ListService.class);
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	public static final int COUNT_PER_PAGE = 8;
	
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> listPost(int pageNumber, String subject, String array){
		if(pageNumber<0) {
			throw new IllegalArgumentException("page number < 0 : "+pageNumber);
		}
			if(subject!=null) {
				subject = switchSubject(subject);
			}

			HashMap<String, Object> map4 = new HashMap<>();
			map4.put("subject", subject );
			int totalPostCount = boardDao.countSubject(map4);
			
			logger.info(totalPostCount+"그냥");
			if(totalPostCount == 0) {
			PostList postList=new PostList();
			HashMap<String, Object> map = new HashMap<>();
			map.put("postList", postList);
			return map;
			}
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			
			map4.put("firstRow", firstRow-1);
			map4.put("endRow", endRow-firstRow+1);
			map4.put("array", array);
			
			List<PostView> postList = boardDao.listPost(map4);
			List<PostView> postNewList = boardDao.listNewPost(map4);
			
			
			for(Iterator<PostView> itr = postList.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
				if(post.getOpt1price3()!=null && !post.getOpt1price3().equals("")) {
					post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
				}
				if(post.getOpt2price3()!=null && !post.getOpt2price3().equals("")) {
					post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
				}
			}
			for(Iterator<PostView> itr = postNewList.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
				if(post.getOpt1price3()!=null && !post.getOpt1price3().equals("")) {
					post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
				}
				if(post.getOpt2price3()!=null && !post.getOpt2price3().equals("")) {
					post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
				}
			}
			
			PostList postListView = new PostList(
					postList, pageNumber, totalPageCount, firstRow, endRow);

			HashMap<String, Object> map = new HashMap<>();
			map.put("postList", postListView);
			map.put("postNewList", postNewList);
			return map;	
	}
	
	//통과
	@Transactional(rollbackFor= {Exception.class})
	public HashMap<String, Object> searchPost(int pageNumber, SearchForm form){
			if(pageNumber<0) {
				throw new IllegalArgumentException("page number < 0 : "+pageNumber);
			}
			if(form.getLocale2()==null) {
				form.setLocale2("");
			}
			String locale = form.getLocale1()+" "+form.getLocale2();

			logger.info(locale);
			
			if(form.getSubject()!=null) {
				form.setSubject(switchSubject(form.getSubject()));	
			}
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("subject", form.getSubject());
			map.put("locale", locale);
			map.put("career", form.getCareer());
			map.put("sexual", form.getSexual());
			
			
			
			int totalPostCount = boardDao.countForm(map);
			
			logger.info(totalPostCount+"에러찾기1");
			
			if(totalPostCount == 0) {
				PostList postList=new PostList();
				
				logger.info(postList.getTotalPageCount()+"에러찾기2");
				
				map.put("postList", postList);
				return map;
			}
				
			int totalPageCount = calculateTotalPageCount(totalPostCount);
			
			logger.info(totalPageCount+"에러찾기2");
			
			
			int firstRow = (pageNumber -1 )*COUNT_PER_PAGE+1;
			int endRow = firstRow + COUNT_PER_PAGE -1;
			
			logger.info(endRow+"엔드 로우");
			
			if(endRow > totalPostCount)
				endRow = totalPostCount;
			map.put("firstRow", firstRow-1);
			map.put("endRow", endRow-firstRow+1);
			map.put("array", form.getArray());
			
			logger.info(firstRow+","+endRow+"퍼스트 엔드 로우");
			
			List<PostView> postList = boardDao.listForm(map);
			List<PostView> postNewList = boardDao.listNewPost(map);
			
			for(Iterator<PostView> itr = postList.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
				if(post.getOpt1price3()!=null && !post.getOpt1price3().equals("")) {
					post.setOpt1price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt1price3())));
				}
				if(post.getOpt2price3()!=null && !post.getOpt2price3().equals("")) {
					post.setOpt2price3(NumberFormat.getInstance().format(Integer.parseInt(post.getOpt2price3())));
				}
			}
			for(Iterator<PostView> itr = postNewList.iterator(); itr.hasNext();) {
				PostView post = itr.next();
				post.setPrice3(NumberFormat.getInstance().format(Integer.parseInt(post.getPrice3())));
			}
			
			
			PostList postListView = new PostList(
					postList, pageNumber, totalPageCount, firstRow, endRow);
			
			logger.info(postListView.getTotalPageCount()+"에러찾기3");
			
			HashMap<String, Object> map2 = new HashMap<>();
			map2.put("postList", postListView);
			map2.put("postNewList", postNewList);
			return map2;	
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
	
	public static String switchSubject(String form) {
		switch(form) {
			case "11":return "수학";
			case "12":return "초등수학";
			case "13":return "중등수학";
			case "14":return "이과수학";
			case "15":return "문과수학";
			case "16":return "고등수학";
			case "17":return "수학논술";
			case "18":return "수학경시";
			
			case "21":return "외국어";
			case "22":return "초등영어";
			case "23":return "중등영어";
			case "24":return "고등영어";
			case "25":return "수능영어";
			case "26":return "영어회화";
			case "27":return "toeic/tofle/teps";
			case "28":return "일본어";
			case "29":return "중국어";
			
			case "31":return "국어";
			case "32":return "초등국어";
			case "33":return "중등국어";
			case "34":return "고등국어";
			case "35":return "수능국어";
			case "36":return "국어논술";
			
			case "41":return "사회";
			case "42":return "초등사회";
			case "43":return "중등사회";
			case "44":return "고등사회";
			case "45":return "사회탐구";
			case "46":return "한국사";
			
			case "51":return "과학";
			case "52":return "초등과학";
			case "53":return "중등과학";
			case "54":return "고등과학";
			case "55":return "물리";
			case "56":return "생명";
			case "57":return "화학";
			case "58":return "지구과학";
			
			case "61":return "예체능";
			case "62":return "미술";
			case "63":return "음악";
			case "64":return "체육";
			
			case "71":return "자소서/입시";
			case "72":return "자소서첨삭";
			case "73":return "입시컨설팅";
	}
		return "";
	}

}
