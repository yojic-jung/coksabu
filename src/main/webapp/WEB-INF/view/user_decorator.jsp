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
     -webkit-text-size-adjust:100%;
     -webkit-touch-callout: none;
}
      


.jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 2px black;
          }
          .top-title{
            float:left;
            height:100%;
            border-right : 2px solid black;
            text-align:center;
          }
          .jbMenu > ul {
            margin:12px 0px 0px 0px;
            padding: 0px;
            list-style:none;
            float:right;
          }
          .jbMenu li{
            display :inline;
            margin-right:20px;
          }
          
            .top-ul a {
            text-decoration:none;
            color :black
          }
          .jbFixed {
            position: fixed;
            top: 0px;
          }
          .menu-title{
          text-align:center; font-size:30px;padding-bottom:30px;color:white;
          }
          
          
                
      
.m-jbMenu{
     background:white;
     width:100%;
     padding:30px; 
     font-size:80px;
     position:fixed;
     top:0px;
     font-family:'Do Hyeon'; 
     border-bottom:1px solid gray; 
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
	
	      .bottom-cate{
	width: 100%;
	padding:20px 20px 80px 20px;
	position: fixed;
	left: 0;
	bottom: 0;
	background:white;
	border:4px solid gray;
	z-index:10;
}
.bottom-table{
boarder-spacing:0px;
width:100%;
padding:0px;

}
.bottom-table td{
padding:0px;
text-align:center;
font-size:28px;
width:25%;

boarder-spacing:0px;
}
.bottom-img{
width:60%;
height:70px;
padding:0px;
}
.bottom-table a{
text-decoration:none;
color:#A6A6A6;
}
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-413632618');
</script>
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
<decorator:head />
</head>
<body>
<header class="pc-header">
        <div class="jbMenu">
                <div class="top-title"><a href="./"><img src="<c:url value="/resources/images/logo.png" />"  alt="로고"/></a></div>
                
             <sec:authorize access="!isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">수업목록</a></li>
                    <li><a href="./lessonapply">수업요청</a></li>
                   <!-- 주석 지우기 <li><a href="./applylist">요청목록</a></li> -->
                    <li><a href="./login">로그인</a></li>
                    <li><a href="./signup">회원가입</a></li>
                </ul>
            </sec:authorize>
             <sec:authorize access="isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">수업목록</a></li>
                   <!-- 주석 지우기 <li><a href="./applylist">요청목록</a></li> -->
                    <li><a href="./lessonapply">수업요청</a></li>
                    <li><a href="./myroom">마이페이지</a></li>
                    <li><a href="./message" class="message-notify">메세지</a></li>
                    <li><a href="<c:url value='j_spring_security_logout' />">로그아웃</a></li>
                </ul>
            </sec:authorize>
          </div>
</header>
<header class="m-header">
   <div class="m-jbMenu">
    <span class="m-back">&lt;</span>
   </div>
</header>
<div class="m-fix-background" style="height:160px"></div>
<decorator:body />


<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

        
        <div class="bottom-cate">
				<table class="bottom-table">
					<tr>
						<td><a href="./"><img class="bottom-img" src="<c:url value="/resources/img/home.png" />"  alt="home"/></a></td>
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my2.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./">홈</a></td>
					<td><a href="./category">카테고리</a></td>
					<td><a href="./message" class="m-message-notify">메시지</a></td>
					<td><a href="./myroom" style="color:orange">마이페이지</a></td>
					</tr>
				</table>
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
			
			$('.pc-header').remove();
			
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
</script>
        
       <%
       session=request.getSession();
       String messageStatus = (String)session.getAttribute("messageStatus");
       if(messageStatus!=null && messageStatus.equals("exist")){
       %>
       <script>
       $('.message-notify').after('<span style="display:inline-block;vertical-align:top;width:6px;height:6px;border-radius:3px;background:red;"></span>');
       $('.m-message-notify').after('<span style="display:inline-block;vertical-align:top;width:16px;height:16px;border-radius:8px;background:red;"></span>');
       </script>
       <%
       }
       %> 
        
</body>
</html>