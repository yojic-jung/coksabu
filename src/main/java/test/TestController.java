package test;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lesson.deal.service.DealPurchaseService;
import test.model.ImgUpload;
import test.model.ImgUploadDB;

@Controller
public class TestController {
	@RequestMapping(value="test", method = RequestMethod.GET)
	public String test( Model model,HttpSession session) {
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		String imgPath = dealService.takeImgPath();
		ctx.close();
		
		model.addAttribute("imgPath", imgPath);
		
		return "test/test";
	}
	
	@RequestMapping(value="test", method = RequestMethod.POST)
	public String test2(ImgUpload img, Model model,HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getServletContext().getRealPath("resources/theme/test");
		ImgUploadDB imgDB = new ImgUploadDB(img, path);
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationContext.xml");
		DealPurchaseService dealService = ctx.getBean("dealPurchaseService", DealPurchaseService.class );
		dealService.testImgUpload(imgDB);
		ctx.close();
		return "test/test";
	}
	
}