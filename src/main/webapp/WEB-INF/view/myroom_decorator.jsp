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
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          position:fixed;
 	      top:0px;
          z-index:99;
          }
          
          
.m-btn {
		width : 50px; 
		height : 50px; 
		position : absolute; 
		right : 0px; top : 0px; 
		z-index : 1; 
		cursor : pointer; 
		display:inline-block;
		transition:all .4s;
		box-sizing:border-box;
		position:relative;
		width:60px;
		height:44px;
	}
	.m-btn span {
		display:inline-block;
		transition:all .4s;
		box-sizing:border-box;
		position:absolute;
		left:0;
		width:100%;
		height:7px;
		background: orange;
		border-radius:4px;
	}
	.m-btn span:nth-of-type(1) {
		top : 0; left:10px;
	}
	.m-btn span:nth-of-type(2) {
		top : 20px; left:10px;
	}
	.m-btn span:nth-of-type(3) {
		bottom : 0; left:10px;
	}		

.m-close { 
	width : 100px; 
	position : absolute; 
	right : 10px;
	 top : 30px; 
	 z-index : 1; 
	 padding:5px;
	 border-radius:10px;
	 background:orange;
	 color:white;
	 font-size:70px;
	 font-weight:bold
 } 
 #m-menu { 
	width : 70%; 
	height : 100%; 
	position : fixed; 
	top : 0px; 
	left : -71%; 
	z-index : 10; 
	border-right : 1px solid #c9c9c9; 
	background-color : rgb(46, 46, 46); 
	color:white;
	text-align : center; 
	transition: All 0.2s ease; 
	-webkit-transition: All 0.2s ease; 
	-moz-transition: All 0.2s ease; 
	-o-transition: All 0.2s ease; 
	} 
#m-menu2{
	width : 30%; 
height : 100%; 
position : fixed; 
top : 0px; 
left : -100%; 
z-index : 10; 
border-right : 1px solid #c9c9c9; 
background-color : lightgray;
color:white;
text-align : center; 
transition: All 0.2s ease; 
-webkit-transition: All 0.2s ease; 
-moz-transition: All 0.2s ease; 
-o-transition: All 0.2s ease; 
opacity:0.1;
}

	.m-menu-title{
		font-size:60px; padding:50px;
		border-bottom:4px solid white;
		color:orange;
		font-family:'Apple SD Gothic Neo','Malgun Gothic';
		font-weight:bold;
	}
	.m-menu-content{
		text-align:left;
		font-size:40px;
		 padding:50px;
		border-bottom:1px solid gray;
		font-family:'Apple SD Gothic Neo','Malgun Gothic';
	}
	
	.m-menu-href{
		font-size:40px;
		color:white;
		text-decoration:none;
	}
	.m-title{
	   	 position:absolute;
	   	 left:50%; 
	   	 transform:translateX(-50%);
	   	 color:orange
	}
	
.foot{
      width:100%;
      clear:left;
    }
    
    .foot-align{
      
      margin:auto;
      width:1000px;
      min-width:1000px;
    }

    .foot-align>div{
      float:left;
      margin:20px;
    }
    .foot p{
      font-size:12px;
      line-height:150%;
      text-decoration:none;
    }
     .foot-cate a, .foot-company a{
    text-decoration:none;
    color:black;
    
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
width:20%;

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
<decorator:head />
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
<!-- Facebook Pixel Code -->

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
                  <!-- 주석 지우기  <li><a href="./applylist">요청목록</a></li> -->
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
      	<span class="m-btn" href="#">
      		<span> </span>
      		<span> </span>
      		<span> </span>
  		</span>
      
 		<a href="./"><span class="m-title">콕사부</span></a>
 	</div>
 	
 	
	<div id="m-menu"> 
			<div class="m-close">x</div> 
			<div class="m-menu-title">Menu</div>
			 <sec:authorize access="!isAuthenticated()">
			<a href="./login" class="m-menu-href"><div class="m-menu-content">로그인</div></a>
			<a href="./signup" class="m-menu-href"><div class="m-menu-content">회원가입</div></a>
			<a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">수업목록</div></a>
			<a href="./lessonapply" class="m-menu-href"><div class="m-menu-content">수업요청</div></a>
			<!-- 주석 지우기 <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
			 </sec:authorize>
             <sec:authorize access="isAuthenticated()">
              <a href="./message" class="m-menu-href"><div class="m-menu-content">메세지</div></a>
              <a href="./myroom" class="m-menu-href"><div class="m-menu-content">마이페이지</div></a>
              <a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">수업목록</div></a>
            <!-- 주석 지우기  <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
              <a href="./lessonapply" class="m-menu-href"><div class="m-menu-content">수업요청</div></a>
              <a href="./customer" class="m-menu-href"><div class="m-menu-content">고객센터</div></a>
             </sec:authorize>
	</div> 

	<div id="m-menu2"></div>

</header>
<div class="m-fix-background" style="height:160px"></div>
<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

<decorator:body />

<div class="bottom-cate">
				<table class="bottom-table">
					<tr>
						<td><a href="./"><img class="bottom-img" src="<c:url value="/resources/img/home.png" />"  alt="home"/></a></td>
						<td><a href="./apply"><img class="bottom-img" src="<c:url value="/resources/img/applyui.png" />"  alt="apply"/></a></td>
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my2.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./">홈</a></td>
					<td><a href="./apply">수업요청</a></td>
					<td><a href="./category">카테고리</a></td>
					<td><a href="./message" class="m-message-notify">메시지</a></td>
					<td><a href="./myroom" style="color:orange">마이페이지</a></td>
					</tr>
				</table>
			</div>

 <footer class="pc-footer">
          <div class="foot">
            <hr/>
            <div class="foot-align">
            <div>
              <a href="./"><img src="<c:url value="/resources/images/logo.png" />" alt="로고"/></a>
            </div>
            <div>
                <p>상호 : 콕사부 <br/>
                대표자 : 정요직<br/> 
                개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368<br/>
                TEL. 02-959-1176<br/> 
                  사업자 등록번호 : 654-19-01069 <br/>
		통신판매업 신고 : 2019-서울동대문-0997호<br/>
                  EMAIL. dywlr74@naver.com<br/>
                  Copyright(c) 콕사부. All Rights Reserved.<br/>
                </p>
            </div>
            <div class="foot-cate">
                <p>
                  <b>카테고리</b><br/>
                  <a href="./boarder?main=11&subject=11"> 수학</a><br/> 
	              <a href="./boarder?main=21&subject=21">외국어</a><br/>
                  <a href="./boarder?main=31&subject=31">국어</a><br/>
                  <a href="./boarder?main=41&subject=41">사회</a><br/>
                  <a href="./boarder?main=51&subject=51">과학</a><br/>
                  <a href="./boarder?main=61&subject=61">예체능</a><br/>
                  <a href="./boarder?main=71&subject=71">입시/자소서</a><br/>
                </p>
              </div>
            <div class="foot-company">
                <p>
                 <a href="./companyInfo"> 회사소개</a><br/>
                <a href="./customer" style="text-decoration:none; color:black;"> 자주하는 질문</a><br/>
                 <a href="./qna" style="text-decoration:none; color:black;"> 고객문의</a><br/> 
                </p>
              </div>
            
            <div>
              <p>
         <a href="./qna" style="text-decoration:none;font-weight:bolder; color:black;"> 고객센터</a><br/>
                02-959-1176<br/>
                평일 10:00 ~ 17:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>

<div style="clear:left; text-align:center;font-size:11px;">콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 거래 정보 및 거래에 대한 책임은 각 판매자가 부담하고, 이에 대하여 콕사부는 일체 책임지지 않습니다.</div>
            
          </div>
          </div>
          
        </footer>
        
        
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
			$('.pc-footer').remove();
		}else{
			$('.m-header').remove();
			$('.bottom-cate').remove();
			$('.m-fix-background').remove();
		}
	}
	
	
    $(".m-btn").click(function() { 
		$("#m-menu").animate({
			left:"0px"
		},100, function(){
		});

		$("#m-menu2").animate({
			left:"70%"
		},100, function(){
		})
	});

	$(".m-close").click(function() { 
		$("#m-menu").animate({
			left:"-71%"
		},100, function(){

		});

		$("#m-menu2").animate({
			left:"-70%"
		},100, function(){
		})
	});

	$("#m-menu2").click(function() { 
		$("#m-menu").animate({
			left:"-71%"
		},100, function(){

		});

		$("#m-menu2").animate({
			left:"-70%"
		},100, function(){
		})
	});	
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