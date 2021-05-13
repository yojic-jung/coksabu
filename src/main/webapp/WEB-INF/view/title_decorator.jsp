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
        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            font-family:'Apple SD Gothic Neo','Malgun Gothic' ;
            -webkit-text-size-adjust:100%;
            -webkit-touch-callout: none;
          }
      
   .m-jbMenu{
          background:white;
          width:100%;
          padding:30px; 
          font-size:80px;
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          position:fixed;
 		  top:0px;
          z-index:99;
          text-align:center;
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
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '2787801881458923');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->


<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-4EM47WXQJ0');
  gtag('config', 'AW-413632618');
</script>
<decorator:head />

</head>
<body>
<header class="m-header">
    <div class="m-jbMenu">
    <span class="m-back">&lt;</span>
 		<a href="./" class="m-title">콕사부</a>
 	</div>
</header>

<div class="m-fix-background" style="height:160px"></div>

<decorator:body />


<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>
        
        
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

    
    $(window).bind("pageshow", function(event) {
    	var broswerInfo = navigator.userAgent;
		//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
			$('.m-page-transit').fadeOut(100);
		}else{
			$('.m-page-transit').hide();
		}
    	if ( event.originalEvent && event.originalEvent.persisted) {// BFCahe
       	}
    });


$(document).ready(function(){

	var filter = "win16|win32|win64|mac|macintel";
	
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			
		}else{
				$('.m-header').remove();
				$('.m-mypage').remove();
				$('.m-sub-title').remove();
				$('.m-div').remove();
				$('.m-fix-background').remove();
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
        		var currenturl = window.location.href;
        		if(referpage==''){
        			//아이프레임 존재하는 페이지는 뒤로가기시 애니메이션 효과 없애기
        			if(currenturl.indexOf("usersetting")!=-1 || currenturl.indexOf("profile")!=-1 || currenturl.indexOf("signup")!=-1){
        				setTimeout(function(){$('.m-page-transit').hide();location.href = './';}, 100);
        			}else{
        				setTimeout(function(){location.href = './';}, 100);
        			}
        		}else{
        			//아이프레임 존재하는 페이지는 뒤로가기시 애니메이션 효과 없애기
        			if(currenturl.indexOf("usersetting")!=-1 || currenturl.indexOf("profile")!=-1 || currenturl.indexOf("signup")!=-1){
        				setTimeout(function(){$('.m-page-transit').hide();history.back();}, 100);
        			}else{
        				setTimeout(function(){history.back();}, 100);
        			}
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
</script>
        
</body>
</html>