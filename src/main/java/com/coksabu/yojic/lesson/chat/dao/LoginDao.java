package com.coksabu.yojic.lesson.chat.dao;

import com.coksabu.yojic.lesson.chat.model.Member;

public interface LoginDao {

	public String login(String email);
	
	public int idCheck(String email);
	
	public void insertMember(Member member);
}
