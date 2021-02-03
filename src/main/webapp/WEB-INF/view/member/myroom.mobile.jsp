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
  <link rel="canonical" href="https://coksabu.com/myroom">

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
	font-size:50px;
	padding:40px 40px 40px 70px;
	font-weight:bolder;
	color:white;
	background-color:#696969;
}
.headline{
	width:100%;
	font-size:50px;
	padding:60px 40px 40px 70px;
	font-weight:bolder;
}
.subheading{
	width:100%;
	font-size:40px;
	padding:60px 60px 60px 70px;
	border-bottom:1px solid #D5D5D5;
}

.subheading a{
	text-decoration:none;
	color:black;
}




	
	
</style>
</head>
<body>




<div style="padding-bottom:500px;">
<div class="big-title">마이페이지</div>
<div class="subheading"><a href="./usersetting" style="text-decoration:underline">내 계정 정보수정하기</a></div>
<div class="headline">고객메뉴</div>
<div class="subheading"><a href="./purchaselist">구매목록</a></div>
<div class="subheading"><a href="./mypage">수업요청내역</a></div>
<div class="subheading"><a href="./wishlist">장바구니</a></div>
<div class="headline">튜터메뉴</div>
<div class="subheading"><a href="./lessoncertify">인증정보</a></div>
<div class="subheading"><a href="./tutorpage">프로필/수업 관리</a></div>
<div class="subheading"><a href="./saleslist">판매목록</a></div>


</div>




</body>
</html>