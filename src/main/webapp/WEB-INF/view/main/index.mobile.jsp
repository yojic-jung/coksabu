<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>콕사부</title>
<meta charset="utf-8">
<meta name="description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다." />
<meta name="naver-site-verification" content="0f04a0bd345d491c42653f775e006069087daa62" />
<meta property="og:type" content="website">
<meta property="og:title" content="콕사부">
<meta property="og:site_name" content="콕사부">
<meta property="og:description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com">

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <link rel="canonical" href="https://coksabu.com/">
   <style>
   @charset "utf-8";
   @font-face{
   font-family:'JejuGothic';
   src:url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype')
   }
   
   *{margin:0;padding:0;box-sizing:border-box}
   
   body{margin:0;padding:0;font-family:'Malgun Gothic' ;
   -webkit-text-size-adjust:100%}
   .m-jbMenu{background:white;width:100%;padding:30px;font-size:80px;
   font-family:'Do Hyeon';
   border-bottom:1px solid gray;z-index:3}
   
   .m-jbFixed{position:fixed;top:0}
   .m-btn{width:50px;height:50px;
   position:absolute;right:0;top:0;z-index:1;
   cursor:pointer;display:inline-block;
   transition:all .4s;box-sizing:border-box;position:relative;
   width:60px;height:44px}
   
   .m-btn span{display:inline-block;
   transition:all .4s;box-sizing:border-box;
   position:absolute;left:0;width:100%;height:7px;
   background:orange;border-radius:4px}
   
   .m-btn span:nth-of-type(1)
   {top:0;left:10px}
   
   .m-btn span:nth-of-type(2){
   top:20px;left:10px}
   
   .m-btn span:nth-of-type(3){
   bottom:0;left:10px}
   
   .m-close{width:100px;
   position:absolute;right:10px;
   top:30px;z-index:1;padding:5px;
   border-radius:10px;
   background:orange;
   color:white;font-size:70px;
   font-weight:bold } 
   
   #m-menu{width:70%;height:100%;
   position:fixed;top:0;left:-71%;
   z-index:10;border-right:1px solid #c9c9c9;
   background-color:rgb(46,46,46);
   color:white;text-align:center;
   transition:All 0.2s ease;-webkit-transition:All 0.2s ease;
   -moz-transition:All 0.2s ease;-o-transition:All 0.2s ease
  }
  
  #m-menu2{width:30%;height:100%;position:fixed;top:0;left:-100%;
   z-index:10;border-right:1px solid #c9c9c9;
   background-color:lightgray;color:white;text-align:center;
   transition:All 0.2s ease;-webkit-transition:All 0.2s ease;
   -moz-transition:All 0.2s ease;-o-transition:All 0.2s ease;opacity:0.1}
   
   .m-menu-title{font-size:60px;padding:50px;
   border-bottom:4px solid white;color:orange;
   font-family:'Malgun Gothic';font-weight:bold}
   
   .m-menu-content{text-align:left;font-size:40px;
   padding:50px;border-bottom:1px solid gray;
   font-family:'Malgun Gothic'}
   
   .m-menu-href{font-size:40px;color:white;text-decoration:none}
   
   .m-title{position:absolute;left:50%;transform:translateX(-50%);color:orange	}
   .m-foot{width:100%;font-size:24px}
   
   .m-foot-align{width:100%;text-align:center;
   line-height:150%;text-decoration:none}
   
   .foot-cate a,.foot-company a{text-decoration:none;color:black}
   
   .fadeImg{width:100%;height:500px }  
   
   #inner-fade{z-index:1}
   
   .img-ui{width:95%;margin:auto}
   
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

.img-ui{
width:100%;margin:auto
}

.img-ui td{
	width:25%;
}
.img-ui a{
	text-decoration:none;
	color:black;
}

.list{
    	width:90%;
    	margin:auto;
    	border-spacing:0px 80px;
    }
.list td{
	padding-bottom:20px;
	border-bottom:1px solid gray;
}

.list a{
	text-decoration:none;
}
#pst{
		vertical-align:top;padding:0px; width:100%;
		position: relative
	}

	#categories{
		width:100%; 
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		padding:10px 60px;
		color:Grey;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}

    #name{
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		color: DimGrey;
		padding:10px 20px;
	}
	
	#title{
		font-family:'JejuGothic';
		font-weight:bold;
		color: black;
		font-size: 30px;
		padding:10px 20px;
	}
	#universe{
		font-family:'JejuGothic';
		font-weight:bold;
		color: dimgray;
		font-size: 30px;
		padding:10px 20px;
	}
#profile{
	width:150px; height:150px; border-radius:75px;border:5px solid orange;
}
#price{
		font-family:Arial;
		font-weight:bold;
		font-size:30px;
		margin-top:5px;
		padding:10px 20px;
		color:black;
}

   </style>
</head>
<body>
<script>

</script>
<div class="progressbar" style="position: fixed;left: 0;top:5px;border:none;height:7px;z-index:15;"></div>
<header class="m-header">
  
    <div class="m-jbMenu">
      	<a class="m-btn" href="#">
      		<span> </span>
      		<span> </span>
      		<span> </span>
  		</a>
      
 		<a href="./"><span class="m-title">콕사부</span></a>
 	</div>
 	
 	
	<div id="m-menu"> 
			<div class="m-close">x</div> 
			<div class="m-menu-title">Menu</div>
			 <sec:authorize access="!isAuthenticated()">
			<a href="./login" class="m-menu-href" ><div class="m-menu-content">로그인</div></a>
			<a href="./signup" class="m-menu-href"><div class="m-menu-content">회원가입</div></a>
			<a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">레슨목록</div></a>
			<a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a>
			 </sec:authorize>
			 <sec:authorize access="isAuthenticated()">
              <a href="./message" class="m-menu-href"><div class="m-menu-content">메세지</div></a>
              <a href="./myroom" class="m-menu-href"><div class="m-menu-content">마이페이지</div></a>
              <a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">레슨목록</div></a>
              <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a>
              <a href="./lessonapply" class="m-menu-href"><div class="m-menu-content">레슨요청</div></a>
         	  <a href="./customer" class="m-menu-href"><div class="m-menu-content">고객센터</div></a>
         	 </sec:authorize>
	</div> 

	<div id="m-menu2"></div>

  	</header>
  	 	
	<section>
	
	 <ul id="inner-fade">
            
            <li><img class="fadeImg" src="<c:url value="/resources/img/Mmain2.png" />"  alt="메인이미지1"/></li>
            <li><img class="fadeImg" src="<c:url value="/resources/img/Mmain3.png" />"  alt="메인이미지2"/></li>
            <li><img class="fadeImg" src="<c:url value="/resources/img/main1.png" />"  alt="메인이미지3"/></li>
        </ul>
        
	<div style="width:100%;padding:90px 20px;">
	<table class="img-ui" style="border-spacing:70px 0px;text-align:center; font-size:35px;font-weight:bolder">
		<tr>
			<td><a href="./boarder?main=11&subject=11"><img src="<c:url value="/resources/images/ui1m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=21&subject=21"><img src="<c:url value="/resources/images/ui2m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=31&subject=31"><img src="<c:url value="/resources/images/ui3m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=41&subject=41"><img src="<c:url value="/resources/images/ui4m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=11&subject=11"><div >수 학</div></a></td>
			<td><a href="./boarder?main=21&subject=21"><div>외국어</div></a></td>
			<td><a href="./boarder?main=31&subject=31"><div>국 어</div></a></td>
			<td><a href="./boarder?main=41&subject=41"><div>사 회</div></a></td>
		</tr>
		<tr>
		<td colspan="4" style="height:70px;"></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><img src="<c:url value="/resources/images/ui5m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=62"><img src="<c:url value="/resources/images/ui6m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=64"><img src="<c:url value="/resources/images/ui7m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=71&subject=71"><img src="<c:url value="/resources/images/ui8m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><div>과 학</div></a></td>
			<td><a href="./boarder?main=61&subject=62"><div>예 능</div></a></td>
			<td><a href="./boarder?main=61&subject=64"><div>체 육</div></a></td>
			<td><a href="./boarder?main=71&subject=71"><div>자소서/<br/>입시</div></a></td>
		</tr>
	</table>
</div>
	
<div style="width:90%; margin:auto; padding:30px 0px 0px 0px; font-size:3em; font-weight:900; font-family:'JejuGothic'; text-decoration:underline;">콕사부 인기 수업</div>
<div style="width:100%;">
<table class="list">
<c:forEach var="post" items="${list}" varStatus="status">
	<tr>
	<td style="width:30%;">
	<a href="./boardread?postId=${post.id}">
	<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:100%; height:250px;border-radius:20px; "/><br/>
	</td>
	<td>
	<a href="./boardread?postId=${post.id}">
	<div>
	<div id="title"> ${post.title}</div>
	<div id="name">${post.name}(${post.birth}, ${post.sexual})&nbsp;&nbsp;경력 <c:if test="${post.career!=0}">${post.career}년</c:if><c:if test="${post.career==0}">1년미만</c:if></div>
	<div id="universe"> ${post.universe} ${post.univsub}</div>
	<div id="price" > ${post.subCate0} ${post.price3}원 <c:if test="${post.subCate1 !='nonevalue' }">/ ${post.subCate1} ${post.opt1price3}원</c:if> <c:if test="${post.subCate2!='nonevalue' }">/ ${post.subCate2} ${post.opt2price3}원</c:if></div>
	</div>
	</a>
	</td>
	</tr>
	</c:forEach>
	</table>
</div>

	</section>
 
 <footer class="m-footer">
          <div class="m-foot">
            <hr/>
            <div class="m-foot-align">
            <div>
       상호 : 콕사부  | 대표자 : 정요직 | 개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368 | TEL.02-959-1176 <br/> 
                  사업자 등록번호.654-19-01069 | 통신판매업 신고 : 2019-서울동대문-0997호
            </div>

            <div>
            고객센터.02-959-1176 | 
                평일 10:00 ~ 16:00 (점심 13:00 ~ 14:00) | <a href="./companyInfo" style="color:black; text-decoration:none;">회사소개</a>
            </div>
            <br/>
            <div style="clear:left; text-align:center;">
            콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 <br/>거래 정보 및 거래에 대한 책임은 각 판매자가 부담합니다.
          </div>
          </div>
          </div>
          <div style="height:300px;"></div>
          <div class="bottom-cate">
				<table class="bottom-table">
					<tr>
						<td><a href="./"><img class="bottom-img" src="<c:url value="/resources/img/home2.png" />"  alt="home"/></a></td>
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./" style="color:orange">홈</a></td>
					<td><a href="./category">카테고리</a></td>
					<td><a href="./message">메시지</a></td>
					<td><a href="./myroom">마이페이지</a></td>
					</tr>
				</table>
			</div>		
        </footer>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script src="<c:url value="/resources/js/jquery.innerfade.js"/>"></script>
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

            var jbOffset = $('.m-jbMenu').offset(); //상단메뉴 좌표 가져오는 코드
                $( window ).scroll( function() {        
                  if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                    $( '.m-jbMenu' ).addClass( 'm-jbFixed' );
                  }
                  else {
                    $( '.m-jbMenu' ).removeClass( 'm-jbFixed' );
                  }
                });
            
            
                $('.fadeImg').css('width',$(document).width());
                
                $("#inner-fade").innerfade({
                    animationtype:'fade',
                    speed:750,
                    timeout:5000,
                    type:'sequence',
                    containerheight:'500px'
                });
            
            
            
    	});
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
    	
    	$('.progressbar').hide();

    	</script>
   </body>
</html>