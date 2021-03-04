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
            font-family:'Malgun Gothic' ;
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
          text-align:center; font-size:20px;color:white;
          padding:25px;
          }
          
          .mypage{
          	 font-size:25px;
          	  text-align: center;
              list-style:none;
              padding-bottom:30px;
          } 
          
          .mypage>li{
            font-family: 'JejuGothic';
            padding:20px;
            display:inline;
        }
        .mypage a{
         color:rgb(201, 199, 199);
         	text-decoration:none;
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
    

    .m-tutor{
    	padding:50px 20px;
    	text-align:center;
    }
    .m-tutor li{
    	padding:10px;
    	font-family: 'JejuGothic';
            padding:20px;
            display:inline;
    }          
        .m-tutor a{
         color:rgb(201, 199, 199);
         	text-decoration:none;
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
	
	.mode{
		text-align:center;
		font-size:40px;
		color:white;
		margin-bottom:50px;
	}
	.mode-change{
		font-size:25px; 
		padding:10px; 
		background:white;
		color:black;
		position: absolute;
		right:20px;
		border-radius:10px;
	}	
	
.changeToCustom{
font-weight:bolder;
color:dimgray;
text-decoration:underline;
border-radius:5px;
border:2px solid dimgray;
padding:5px;
}
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-413632618');
</script>
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
 		<a href="./" class="m-title">콕사부</a>
 	</div>
 	
</header>


<div class="pc-tutor" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div class="menu-title">튜터전용</div>
                <ul class="mypage" style="min-width:600px;">
                	<li><a href="./lessoncertify" class="tutor1">인증정보</a></li>
                    <li><a href="./tutorpage" class="tutor2">프로필/수업 관리</a></li>
                    <li><a href="./saleslist" class="tutor3">판매목록</a></li>
                </ul>
                
               
                
                
            </div>
            
            <div class="pc-tutor2" style="background:rgb(233, 232, 232);text-align:right;padding:30px 30px 0px 0px;">
				<a href="./mypage" style="text-decoration:none;"><span class="changeToCustom">&hArr;고객으로 전환</span></a>
            </div>
            
            
            
<div class="m-tutor" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:30px;">
                <div class="mode">
                	튜터전용
                	<a href="./mypage"><span class="mode-change">&hArr;고객으로 전환</span></a>
                </div>
                <ul style="min-width:600px;line-height:200%;">
                	<li><a href="./lessoncertify" class="tutor1">인증정보</a></li>
                    <li><a href="./tutorpage" class="tutor2">프로필/수업 관리</a></li>
                    <li><a href="./saleslist" class="tutor3">판매목록</a></li>
                </ul>
            </div>
            
            
<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

<decorator:body />

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
                  <a href="./boarder?main=11&subject=11">수학</a><br/> 
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

$(document).ready(function(){

	var filter = "win16|win32|win64|mac|macintel";
	
	
	
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			$('.pc-header').remove();
			$('.pc-footer').remove();
			$('.pc-tutor').remove();
			$('.pc-tutor2').remove();
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
			$('.m-tutor').remove();
			$('.bottom-cate').remove();
		}
	}

});
</script>

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