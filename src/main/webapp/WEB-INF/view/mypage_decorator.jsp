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
        body {
            margin: 0px;
            padding: 0px;
            font-family:'Malgun Gothic' ;
            -webkit-text-size-adjust:100%;
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
    
    

    .m-mypage{
          	  font-size:17px;
          	  text-align:center;
              list-style:none;
              padding:40px 20px;
          } 
          
     .m-mypage>li{
            font-family: 'JejuGothic';
            padding:15px;
            display:inline;
        }
     .m-mypage a{
         color:rgb(201, 199, 199);
         	text-decoration:none;
        }
        
   
   
   .m-tutor{
    	padding:0px 20px;
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
    
.changeToTutor{
font-weight:bolder;
color:dimgray;
text-decoration:underline;
border-radius:5px;
border:2px solid dimgray;
padding:5px;
}

</style>
<decorator:head />
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
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
			$('.pc-header').remove();
			$('.pc-footer').remove();
			$('.pc-mypage').remove();
			$('.pc-mypage2').remove();
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


</script>
<div class="progressbar" style="position: fixed;left: 0;top:5px;border:none;height:7px;z-index:15;"></div>
<header class="pc-header">
        <div class="jbMenu">
                <div class="top-title"><a href="./"><img src="<c:url value="/resources/images/logo.png" />"  alt="로고"/></a></div>
                
             <sec:authorize access="!isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">레슨목록</a></li>
                    <li><a href="./applylist">요청목록</a></li>
                    <li><a href="./login">로그인</a></li>
                    <li><a href="./signup">회원가입</a></li>
                </ul>
            </sec:authorize>
             <sec:authorize access="isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">레슨목록</a></li>
                    <li><a href="./applylist">요청목록</a></li>
                    <li><a href="./lessonapply">레슨요청</a></li>
                    <li><a href="./myroom">마이페이지</a></li>
                    <li><a href="./message">메세지</a></li>
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

<div class="pc-mypage" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div class="menu-title">고객전용</div>
                <ul class="mypage" style="min-width:600px;">
                    <li><a href="./purchaselist" class="my1">구매목록</a></li>
                    <li><a href="./proposalpurchase" class="my2">거래제안서(구매)</a></li>
 					<li><a href="./mypage" class="my4">레슨요청내역</a></li>
                    <li><a href="./wishlist" class="my5">장바구니</a></li>
                </ul>
                
                </div>
            
            <div class="pc-mypage2" style="background:rgb(233, 232, 232);text-align:right;padding:30px 30px 0px 0px;">
				<a href="./tutorpage" style="text-decoration:none;"><span class="changeToTutor">&hArr;튜터로 전환</span></a>
            </div>
            
            
<div class="m-mypage" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:30px;">
               <div class="mode">
                	고객전용 
                	<a href="./tutorpage"><span class="mode-change">&hArr;튜터로 전환</span></a>
                </div>
               <ul class="m-tutor" style="min-width:600px;">
						<li><a href="./purchaselist" class="my1">구매목록</a></li>
						<li><a href="./proposalpurchase" class="my2">거래제안서(구매)</a></li>
						<li><a href="./mypage" class="my4">레슨요청내역</a></li>
						<li><a href="./wishlist" class="my5">장바구니</a></li>
				</ul>
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
					<td><a href="./message">메시지</a></td>
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
                평일 10:00 ~ 16:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>

<div style="clear:left; text-align:center;font-size:11px;">콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 거래 정보 및 거래에 대한 책임은 각 판매자가 부담하고, 이에 대하여 콕사부는 일체 책임지지 않습니다.</div>
            
          </div>
          </div>
          
        </footer>
		<script>
        	$('.progressbar').hide();
        </script>
</body>
</html>