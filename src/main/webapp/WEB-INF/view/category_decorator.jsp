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

.m-jbMenu{
          background:white;
          width:100%;
          padding:30px; 
          font-size:80px;
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          z-index:3;
          }
          .m-jbFixed {
            position: fixed;
            top: 0px;
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
		font-family:'Malgun Gothic';
		font-weight:bold;
	}
	.m-menu-content{
		text-align:left;
		font-size:40px;
		 padding:50px;
		border-bottom:1px solid gray;
		font-family:'Malgun Gothic';
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
<decorator:head />
</head>
<body>
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
			<a href="./login" class="m-menu-href"><div class="m-menu-content">로그인</div></a>
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

<decorator:body />

<div class="bottom-cate">
				<table class="bottom-table">
					<tr>
						<td><a href="./"><img class="bottom-img" src="<c:url value="/resources/img/home.png" />"  alt="home"/></a></td>
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate2.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./">홈</a></td>
					<td><a href="./category" style="color:orange">카테고리</a></td>
					<td><a href="./message">메시지</a></td>
					<td><a href="./myroom">마이페이지</a></td>
					</tr>
				</table>
			</div>


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
	
	var jbOffset = $('.m-jbMenu').offset(); //상단메뉴 좌표 가져오는 코드
    $( window ).scroll( function() {        
      if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
        $( '.m-jbMenu' ).addClass( 'm-jbFixed' );
      }
      else {
        $( '.m-jbMenu' ).removeClass( 'm-jbFixed' );
      }
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
});

$('.progressbar').hide();
</script>

</body>
</html>