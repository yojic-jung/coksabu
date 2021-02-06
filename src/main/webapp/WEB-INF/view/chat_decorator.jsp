<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no" />
<title><decorator:title /></title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

*{ 
	margin:0px; 
	padding:0px; 
	box-sizing: border-box;
}

body {
     margin: 0px;
 	 padding: 0px;
     font-family:'Malgun Gothic' ;
     -webkit-text-size-adjust:100%;
     -webkit-touch-callout: none;
}
 
.m-header{
 width:100%;
}
   
.m-jbMenu{
     background:white;
     width:100%;
     padding:30px 0px 30px 0px; 
     font-size:80px;
     font-family:'Do Hyeon'; 
     border-bottom:1px solid gray; 
     z-index:3;
     text-align:center;
}


.m-jbFixed {
            position: fixed;
            top: 0px;
	   	 color:#A6A6A6;
	   	 padding:0px;

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
<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

<decorator:body />

        
        
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
var linkLocation="";
$(document).on("click","a",function(event){
	//datepicker에서는 효과 미적용
	if($(this).hasClass("ui-corner-all")){
		return;
	}
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
		event.preventDefault();
        linkLocation = this.href;
        if($(this).attr("href")!="#"){
        	$('.m-page-transit').fadeIn(100);
            setTimeout(function(){redirectPage()}, 100);
        }
	}
});

function redirectPage() {
     window.location = linkLocation;
}

$(document).ready(function(){

	var filter = "win16|win32|win64|mac|macintel";
	
	if(navigator.platform){
		
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
		 
			var jbOffset = $('.m-header').offset(); //상단메뉴 좌표 가져오는 코드
		    $( window ).scroll( function() {        
		      if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
		        $( '.m-header' ).addClass( 'm-jbFixed' );
		      }
		      else {
		        $( '.m-header' ).removeClass( 'm-jbFixed' );
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
	


});


$(document).on("click", '.m-back', function(){
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
		var referpage = document.referrer;
        		$('.m-page-transit').fadeIn(100);
		if(referpage==''){
			setTimeout(function(){location.href = './';}, 100);
		}else{			
			setTimeout(function(){history.back();}, 100);
		}
	//웹뷰 아닌 그냥 모바일
	}else{
		var referpage = document.referrer;
		if(referpage==''){
			location.href = './';
		}else{
			history.back();
		}
	}
});


$(window).bind("pageshow", function(event) {
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
		$('.m-page-transit').fadeOut(100);
	}else{
		$('.m-page-transit').hide();
	}
	if ( event.originalEvent && event.originalEvent.persisted) {// BFCahe
		//window.location.reload()사용시 모바일 사파리 스크롤이 최상단으로 가는 이슈로 인해 아래와 같이 구현
		var url = window.location.href;
		window.location.href=url;
    	console.log("BF캐시 존재함")
	}else if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		//뒤로가기 이벤트 채팅 숫자 초기화 위해
		//window.location.reload()사용시 모바일 사파리 스크롤이 최상단으로 가는 이슈로 인해 아래와 같이 구현
		var url = window.location.href;
		window.location.href=url;
		console.log("캐시 존재함")
	}else{}
});
</script>
        	
</body>
</html>