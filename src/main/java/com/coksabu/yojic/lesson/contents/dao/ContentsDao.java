package com.coksabu.yojic.lesson.contents.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.coksabu.yojic.lesson.contents.model.KichulContents;

@Repository
public interface ContentsDao {
	
	public ArrayList<KichulContents> takeContentsMenu();
	
	public int countKichulContents(String contents);
	
	public int insertKichulContents(KichulContents contents);
}
