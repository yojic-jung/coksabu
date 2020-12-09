<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>수업요청 콕사부</title>
 <meta name="description" content="학생의 수업요청으로 가기 위한 설명페이지" />
	<style>
	.teacher{
	height:500px;
	background-image:url(<c:url value="/resources/images/lessonapply.png" />);
 	background-repeat:no-repeat;
	background-position:center center; 
 	-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
	}
	.char{
		width:630px;
		margin:auto;
		font-weight:800;
		font-size:30px;
		color:white;
		padding-top:100px;
		padding-bottom:30px;
	}
	.btn{
		border:none; 
		border-radius:15px;
		padding:7px 40px;
		background:rgb(214, 200, 4);
		color:white;
		font-size:25px;
		font-weight:bolder;
	}
	</style>

</head>
<body>

			<div class="teacher">
			<div class="char">
			"수업요청"을 통해 <br/>
			선생님들의 <span style="font-weight:bold;font-size:33px;">"지원서"</span>를 받아볼 수 있습니다.</div>
			<div style="text-align:center;"><a style="text-decoration:none;" href="./apply"><span class="btn" >지금 "수업요청"하기</span></a></div>
			</div>

</body>
</html>