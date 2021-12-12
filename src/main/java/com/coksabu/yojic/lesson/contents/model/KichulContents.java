package com.coksabu.yojic.lesson.contents.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class KichulContents {

	public String city;
	public String district;
	public String school;
	public String year;
	public String grade;
	public String semester;
	public String term;
	public String subject;
	private MultipartFile contentsFile;
	
	public String contents;
}
