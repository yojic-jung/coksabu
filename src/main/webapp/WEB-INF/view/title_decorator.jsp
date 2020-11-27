<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><decorator:title /></title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            font-family:'Malgun Gothic' ;
            -webkit-text-size-adjust:100%;
          }
      
   .m-jbMenu{
          background:white;
          width:100%;
          padding:30px; 
          font-size:80px;
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          z-index:3;
          text-align:center;
}
.m-jbFixed {
            position: fixed;
            top: 0px;
          }
          
.m-title{
	   	 color:orange;
	   	 text-decoration: none;
	}
	
	.m-back{	
	   	 position:absolute;
	   	 left:0%; 
	   	 color:#A6A6A6;
	   	 padding:0px 50px;
	}
</style>
<decorator:head />
</head>
<body>
<div class="progressbar" style="position: fixed;left: 0;top:5px;border:none;height:7px;z-index:15;"></div>
<header class="m-header">
  
    <div class="m-jbMenu">
    <span class="m-back">&lt;</span>
 		<a href="./" class="m-title">콕사부</a>
 	</div>
 	
</header>
<decorator:body />

        
        
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(window).on("beforeunload",function(){
	var broswerInfo = navigator.userAgent;
	
	if(broswerInfo.indexOf("APP_WISHRROM_Android")>-1){
			$(".progressbar").show();
			$(".progressbar").css({"background":"orange"});
			var i=0;
			var progressbar = setInterval(function(){
				i+=24;
				$(".progressbar").css({"width":i+"%"});
				
				if(i==96){
					clearInterval(progressbar);
				}
			},100);
		}
});


$(document).ready(function(){

	var filter = "win16|win32|win64|mac|macintel";
	
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
		 var jbOffset = $('.m-jbMenu').offset(); //상단메뉴 좌표 가져오는 코드
         $( window ).scroll( function() {        
              if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                $( '.m-jbMenu' ).addClass( 'm-jbFixed' );
              }
              else {
                $( '.m-jbMenu' ).removeClass( 'm-jbFixed' );
              }
            });
			
			
			}else{
				$('.m-header').remove();
				$('.m-mypage').remove();
				$('.m-sub-title').remove();
				$('.m-div').remove();
				$('.bottom-cate').remove();
			}
		}
	
	
	$('.m-back').click(function(){
		var referpage = document.referrer;
		
		if(referpage==''){
			location.href = './';
		}else{
			history.back();
		}
	});

});

$('.progressbar').hide();
</script>
        
</body>
</html>