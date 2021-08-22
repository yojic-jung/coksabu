<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>나의 질문내역 고객센터 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="나의 질문내역" />
<meta property="og:type" content="website">
<meta property="og:title" content="나의 질문내역">
<meta property="og:site_name" content="나의 질문내역">
<meta property="og:description" content="콕사부가 모르는 것을 해결해드립니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/myqna">
<link rel="canonical" href="https://coksabu.com/myqna">
<style>

@charset "utf-8";

.div-title{
width:100%;margin:auto;padding:50px 0 50px 10px;
font-family:'JejuGothic';color:rgb(97,96,96)}

.first{padding:120px;font-size:35px;
line-height:180%;text-align:center;
color:white;height:200px;
background-image:url(resources/images/customer.png);
background-repeat:no-repeat;
background-position:center center;
-webkit-background-size:cover;
-moz-background-size:cover;
-o-background-size:cover;background-size:cover}

.left{line-height:180%;width:80%;margin:auto;color:black}

.right{font-size:20px;width:80%;margin:auto;padding:40px;
border:1px solid rgb(180,179,179)}
.list{width:100%;}
.first-q,.second-q,.third-q,.fourth-q{
cursor:pointer;padding:10px;border:1px solid black}

.first-a,.second-a,.third-a,.fourth-a{
line-height:150%;background:rgb(230,228,228);padding:15px}

.qa{margin-bottom:30px}

.yes{display:visible}

.no{display:none}

.pagemove{width:40%;font-size:30px;margin:auto;text-align:center}

#title{color:black;border:1px solid black;
padding:5px;margin:0;width:100%;padding:10px;margin:0;
font-size:30px;
}

#content{background:rgb(226,225,225);
font-size:30px;padding:10px;margin:0;color:gray;width:100%;line-height:150%}

#answer{padding:10px;
font-size:30px;color:orange;width:100%;line-height:150%}

.qna-table{width:100%;border-spacing:0;width:100%}

.td-content{background:rgb(247,246,246);width:100%;
padding:20px;font-size:30px } 

.content3{background:rgb(247,246,246);width:100%;
height:200px;padding:10px}

.td-title{width:30%;font-size:30px;
background:rgb(207,207,207);padding:20px}

.btn{padding:30px;background:dimgray;
color:white;font-size:30px;
border-radius:4px;border:none}


</style>
</head>
<body>
<div class="first">
<div>고객센터</div>
</div>

<div class="div-title" style="padding-bottom:240px;">
	<div class="left">
	<div style="font-size:30px;padding:5px;">
		<span style="font-size:30px;"><a href="./customer" style="text-decoration:none; color:dimgray;">자주하는 질문</a> &nbsp;&nbsp; | &nbsp;&nbsp;</span>
		<span style="font-size:30px;"><a href="./qna" style="text-decoration:none; color:dimgray;">고객문의</a> &nbsp;&nbsp; | &nbsp;&nbsp;</span>
		<span style="font-size:35px;"><a href="./myqna" style="text-decoration:none; color:black;">나의 질문내역</a></span>
	</div>
	</div>
	
	<div class="right">
	<div style="font-size:30px;margin-bottom:20px;"><b>나의 질문내역</b></div>


<c:choose>
	<c:when test="${list.hasList == false }" >
	<table border="0" class="list">
	<tr>
	<td colspan="4" style="min-height:300px;font-size:30px;">
	질문 내역이 없습니다.
	</td>
	</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table border="0" class="list">
	<c:forEach var="post" items="${list.list}">
	<tr>	
	<td>
	<div style="widht:90%; text-align:right;font-size:20px;">${post.dateJ}</div>
	<div id="title" >질문. ${post.title }</div>
	<div id="content">내용. ${post.content}</div>
	<c:if test="${post.answer != null}">
	<div id="answer">ㄴ 답변 <br/>${post.answer}</div>
	</c:if>
	<c:if test="${post.answer == null}">
	<div id="answer">빠른시일내에 고객님의 질문에 답변을 드리겠습니다.<br/>1~2일 정도의 시간이 걸릴수 있으니 양해부탁드립니다.</div>
	</c:if>
	<br/><br/>
	</td>
	</tr>
	</c:forEach>
	
	</table>


<div class="pagemove">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="./myqna?p=${beginPage-1}"/>">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a href="<c:url value="./myqna?p=${pno}"/>" style="color: black;font-size:20px;font-weight:bold;">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a href="<c:url value="./myqna?p=${pno}" />"  style="color:gray;font-size:20px;">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a href="<c:url value="./myqna?p=${endPage+1}"/>">...다음</a>
	</c:if>
	</div>


	</c:otherwise>
</c:choose>



	
	</div>
</div>
<div style="height:300px;"></div>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
</script>
</body>
</html>