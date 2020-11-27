package test.dao;

import test.model.Member;

public interface LoginDao {

	public String login(String email);
	
	public int idCheck(String email);
	
	public void insertMember(Member member);
}
