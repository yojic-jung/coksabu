package com.coksabu.yojic.lesson.contents.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.coksabu.yojic.lesson.contents.model.KichulContents;
import com.coksabu.yojic.lesson.contents.model.Sngmoye;
import com.coksabu.yojic.lesson.contents.service.ContentsService;

@Controller
public class ContentsController {

	@RequestMapping(value="contentsMenu", method=RequestMethod.GET)
	public String contentsMenu(Model model) {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ContentsService contentsService = ctx.getBean("contentsService", ContentsService.class );
		List<KichulContents> contentsMenu = contentsService.takeContentsMenu();
		ctx.close();
		model.addAttribute("contentsMenu", contentsMenu);
		if(contentsMenu.get(0).getCity().equals(contentsMenu.get(1).getCity())){
			System.out.println(contentsMenu.get(0).getCity().equals(contentsMenu.get(1).getCity()));
			
		}
		return "contents/contentsMenu";
	}
	
	@RequestMapping(value="contentsMenu", method=RequestMethod.POST)
	public String contentsMenuPost(KichulContents contents, HttpServletRequest request,Model model) throws IllegalStateException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ContentsService contentsService = ctx.getBean("contentsService", ContentsService.class );
		String path = request.getServletContext().getRealPath("resources/theme");
		HashMap<String, Object> map = contentsService.insertKichulContents(contents, path);
		
		if(map.get("duplicate")!=null && map.get("duplicate").equals("duplicate")) {
			List<KichulContents> contentsMenu = contentsService.takeContentsMenu();
			ctx.close();
			model.addAttribute("contentsMenu", contentsMenu);
			model.addAttribute("duplicate", "duplicate");
			return "contents/contentsMenu";
		}
		
		if((Boolean)map.get("isCorrectFileName")) {
			ctx.close();
			return "redirect:contentsMenu";
		}else {
			model.addAttribute("originFileName", (String)map.get("originFileName"));
			model.addAttribute("userSelectName", (String)map.get("userSelectName"));
			
			List<KichulContents> contentsMenu = contentsService.takeContentsMenu();
			ctx.close();
			model.addAttribute("contentsMenu", contentsMenu);
			return "contents/contentsMenu";
		}
	}
	
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
