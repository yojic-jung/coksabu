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
	public String unitClassifyStts;		//단원 분류 여부
	public String typeClassifyStts;		//유형 분류 여부
	public String imgWorkStts;			//이미지 작업 수정 여부
	public String stateWorkStts;		//서술형 수정여부
	public String ansExistStts;			//정답 존재 여부
	public String orginExtension;		//원본 파일 확장자
	public String tempTestStts;			//파일럿 테스트 진형여부
	public String svcPossible;			//고객 서비스 가능여부
	public String extension;			//확장자
	private MultipartFile contentsFile;
	
	
}
