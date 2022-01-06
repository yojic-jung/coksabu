package com.coksabu.yojic.lesson.contents.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		return "contents/contentsMenu";
	}
	
	@RequestMapping(value="contentsMenu", method=RequestMethod.POST)
	public String contentsMenuPost(KichulContents contents, HttpServletRequest request,Model model) throws IllegalStateException, IOException {
		String configLocation = "classpath:applicationContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		ContentsService contentsService = ctx.getBean("contentsService", ContentsService.class );
		String path = request.getServletContext().getRealPath("resources/theme");
		HashMap<String, Object> map = contentsService.insertKichulContents(contents, path);
		System.out.println(path);
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
	
	@GetMapping(path = "/download")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String fileName = "2019년 서울시 강남구 경기여자고 1-1 기말 고등수학.hwp";
        // 파일 이름 가지고 오고
        StringBuilder sb = new StringBuilder("C:/Users/82108/workspace2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/coksabu/resources/theme/kichul-contents/2019년/서울시/강남구/1학년/1학기/기말/2019년 서울시 강남구 경기여자고 1-1 기말 고등수학.hwp");
        // 파일 저장되어 있는 경로뒤에 붙여줘서
        String saveFileName = sb.toString();
        // saveFileName을 만든다.
        
        
        String header = request.getHeader( "User-Agent" );

        //크롬만 해결 다른 브라우저 테스트 필요
    	if ( header.indexOf( "MSIE" ) > -1 ) {
    		System.out.println("1");
    		fileName = URLEncoder.encode( fileName, "UTF-8" ).replaceAll( "\\+", "%20" );
    	}

    	else if ( header.indexOf( "Trident" ) > -1 ) { 
    		System.out.println("2");
    		fileName = URLEncoder.encode( fileName, "UTF-8" ).replaceAll( "\\+", "%20" );
    	}

    	else if ( header.indexOf( "Chrome" ) > -1 ) {
    		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
    	}
    	else if ( header.indexOf( "Opera" ) > -1 ) {
    		System.out.println("Opera");
    		fileName = "\"" + new String( fileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
    	}

    	else if ( header.indexOf( "Safari" ) > -1 ) {
    		System.out.println("Safari");
    		fileName = "\"" + new String( fileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
    		fileName = URLDecoder.decode( fileName, java.nio.charset.StandardCharsets.UTF_8.toString() );
    	}else{
    		System.out.println("header: "+header.toString());
    		fileName = "\"" + new String( fileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
    		fileName = URLDecoder.decode( fileName, java.nio.charset.StandardCharsets.UTF_8.toString() );
    	}

    	



        // contentType 가져오고
        File file = new File(saveFileName);
        // 데이터베이스에 없는 정보는 파일로 만들어서 가져온다. 이 경우엔 Content-Length 가져온 것
        response.setContentType( "application/download; UTF-8" );
    	response.setContentLength( (int) file.length() );
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary"); 
        //response.setHeader("Content-Type", "hwp");
       // response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        // 그 정보들을 가지고 reponse의 Header에 세팅한 후
        
        try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
            // saveFileName을 파라미터로 넣어 inputStream 객체를 만들고 
            // response에서 파일을 내보낼 OutputStream을 가져와서  
            int readCount = 0;
            byte[] buffer = new byte[1024];
            // 파일 읽을 만큼 크기의 buffer를 생성한 후 
            while ((readCount = fis.read(buffer)) != -1) {
                out.write(buffer, 0, readCount);
                // outputStream에 씌워준다
            }
        } catch (Exception ex) {
            throw new RuntimeException("file Load Error");
        }
 
    }
	
}
