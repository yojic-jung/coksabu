package com.coksabu.yojic.lesson.contents.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class KichulContents {
	
	public String contentsName;
	public String year;
	public String city;
	public String district;
	public String school;
	public String grade;
	public String semester;
	public String term;
	public String subject;
	public String imgWorkStts;
	public String stateWorkStts;
	public String ansExistStts;
	public String orginExtension;
	public String tempTestStts;
	public String svcPossible;
	public String extension;
	private MultipartFile contentsFile;
	
	
}
