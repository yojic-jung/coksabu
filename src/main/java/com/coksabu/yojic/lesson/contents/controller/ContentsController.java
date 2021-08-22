package com.coksabu.yojic.lesson.contents.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.coksabu.yojic.lesson.contents.model.Sngmoye;

@Controller
public class ContentsController {

	@RequestMapping(value="contentsBuild", method=RequestMethod.GET)
	public String contentsBuilder() {
		return "contents/builder";
	}
	
	@RequestMapping(value="contentsBuild", method=RequestMethod.POST)
	public String contentsBuilder1(Sngmoye sngmoye) {
		System.out.println(sngmoye.getYear()+"년");
		System.out.println(sngmoye.getMonth()+"월");
		System.out.println(sngmoye.getQuestionNumber()+"번");
		System.out.println(sngmoye.getQuestionAnswer());
		
		return "contents/builder";
	}
	
	@RequestMapping(value="sngmoyeBuilder", method=RequestMethod.GET)
	public String sngmoyeBuilder() {
		return "contents/sngmoyeBuilder";
	}
	
	@RequestMapping(value="sngmoyeBuilder", method=RequestMethod.POST)
	public String sngmoyeBuilder2(Sngmoye sngmoye) {
		System.out.println(sngmoye.getYear()+"년");
		System.out.println(sngmoye.getMonth()+"월");
		System.out.println(sngmoye.getQuestionNumber()+"번");
		System.out.println(sngmoye.getQuestionAnswer());
		
		return "contents/sngmoyeBuilder";
	}
	
	@RequestMapping(value="resources/summerimages", method=RequestMethod.POST)
	public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws IOException {
		String path = request.getServletContext().getRealPath("resources/theme/summerimages");
		Random random = new Random();
		System.out.println(img.getOriginalFilename());
		System.out.println(path);
		long currentTime = System.currentTimeMillis();
		int	randomValue = random.nextInt(100);
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_a_"+img.getOriginalFilename();
		System.out.println(fileName);
		File file = new File(path , fileName);
		img.transferTo(file);
		return ResponseEntity.ok().body("resources/summerimages/"+fileName);

	}
}
