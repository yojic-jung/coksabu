<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>카테고리 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="본인 인증 및 학력 인증하기" />
  <link rel="canonical" href="https://coksabu.com/category">
<style>
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

.big-title{
	text-align:center;
	padding:30px;
	color:black;
	background:#EAEAEA;
	font-size:50px;
	font-weight:bolder;
	border-top:3px solid black;
	border-bottom:3px solid black;
} 
.subheading{
	width:90%;
	margin:50px auto;
	color:black;
	font-size:40px;
	font-weight:bolder;
}

.cate-btn{
	padding:20px 80px; 
	border-radius:10px;
	color:white;
	background-color:orange;
	font-size:40px;
}
 </style>

</head>
<body>


<div class="big-title">카테고리</div>



<div class="subheading">수업목록</div>
	<div style="width:100%;padding:50px 20px;">
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
			<td><a href="./boarder?main=61&subject=61"><img src="<c:url value="/resources/images/ui6m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=64"><img src="<c:url value="/resources/images/ui7m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=71&subject=71"><img src="<c:url value="/resources/images/ui8m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><div>과 학</div></a></td>
			<td><a href="./boarder?main=61&subject=61"><div>음악/미술</div></a></td>
			<td><a href="./boarder?main=61&subject=64"><div>체 육</div></a></td>
			<td><a href="./boarder?main=71&subject=71"><div>자소서/<br/>논술/면접</div></a></td>
		</tr>
	</table>
</div>



<div class="subheading" >
수업 요청하기<br/>
<div style="text-align:center;">
<div style="margin:100px 0px 50px 0px;"><a href="./apply" style="text-decoration:none;"><span class="cate-btn">수업 요청 하기</span></a></div>
<div style="margin:60px 0px; color:gray;text-align:center;">원하는 수업이 가능한 선생님의 지원서를 받아 보세요.</div>
</div>
</div>



<!-- 주석 지우기
<div class="subheading" >
학생요청목록<br/>
<div style="text-align:center;padding:50px;">
<a href="./applylist" style="text-decoration:none;"><span class="cate-btn">학생요청목록 가기</span></a><br/>
<div style="text-align:center;margin:30px 0px 50px 0px; color:gray;">학생들이 선생님을 찾고 있습니다. 지원서를 넣어보세요.</div>
</div>
</div>
 -->

<div style="height:400px;"></div>




</body>
</html>


