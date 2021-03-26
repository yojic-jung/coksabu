<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="본인 인증 및 학력 인증하기" />



<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
 * { margin:0px; 
 padding:0px;
  box-sizing: border-box;
  }
        
body {
     margin: 0px;
     padding: 0px;
     font-family:'Malgun Gothic' ;
     -webkit-text-size-adjust:100%;
}
          
.big-title{
	width:100%;
	font-size:30px;
	padding:40px 40px 40px 270px;
	font-weight:bolder;
	color:white;
	background-color:#696969;
}
.headline{
	width:80%;
	margin:auto;
	font-size:25px;
	padding:50px 20px 20px 120px;
	font-weight:bolder;
}
.subheading{
	width:80%;
	margin:auto;
	font-size:20px;
	padding:25px 20px 25px 120px;
	border-bottom:1px solid #D5D5D5;
}

.subheading a{
	text-decoration:none;
	color:black;
}




	
	
</style>
</head>
<body>




<div style="padding-bottom:200px;">
<div class="big-title">마이페이지</div>
<div class="headline">안녕하세요! ${name}님 </div>
<div class="subheading">내 계정 <a href="./usersetting" style="text-decoration:underline">정보수정하기</a></div>
<div class="subheading"><a href="./promotion">프로모션 및 쿠폰 등록</a></div>
<div class="headline">고객메뉴</div>
<div class="subheading"><a href="./purchaselist">&gt; 구매목록</a></div>
<div class="subheading"><a href="./mypage">&gt; 수업요청내역</a></div>
<div class="subheading"><a href="./wishlist">&gt; 장바구니</a></div>
<div class="headline">튜터메뉴</div>
<div class="subheading"><a href="./tutorpage">&gt; 프로필/수업 관리</a></div>
<div class="subheading"><a href="./saleslist">&gt; 판매목록</a></div>
</div>




</body>
</html>