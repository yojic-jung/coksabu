<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.back{
		cursor:pointer;
		font-size:20px;
		font-weight:bolder;
}

.title-div{
		font-weight:bolder;
		text-align:center;
		font-size:35px;padding:10px;
		margin:50px 0px 70px 0px;
}

</style>
</head>
<body>
<%if(!session.getAttribute("email").equals("dywlr74")){ %>
<script>
window.location="./";
</script>
<%
}
%>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">고객문의 Q&A 리스트</div>

<c:choose>
	<c:when test="${listModel.hasList == false }" >
	<table border="0" class="list">
	<tr>
	<td colspan="3" style="min-height:300px;">
	게시글이 없습니다.
	</td>
	</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table border="0" class="list">
	<% int i=-1; %>
	<c:forEach var="post" items="${listModel.list}">
	<% i++; %>
	<c:set var="k" value="<%= i %>" scope="page" />
	<c:if test="${k%2==0}" >
	<tr>
	</c:if>
	
	<td>
	<div style="width:500px; border:1px solid black;margin:10px;">
	<table>
	<tr>
	<td>이메일</td><td>${post.email}</td>
	</tr>
	<tr>
	<td>제목:</td><td>${post.title}</td>
	</tr>
	<tr>
	<td>내용</td> <td>${post.content}</td>
	</tr>
	<tr>
	<td colspan="2">
	<form method="post">
		<input class="email" type="text" value="${post.email}" style="display:none" />
		<input class="id" type="text" value="${post.id}" style="display:none" />
		<textarea class="answer" rows="10" cols="60"></textarea><br/>
		<input type="submit" value="답장하기" class="button" />
	</form>
	</td>
	</tr>
	</table>
	</div>
	</td>
	
	<c:if test="${k%2==1}" >
	</tr>
	</c:if>
	<c:if test="${k%2!=1 && k == listModel.endRow-listModel.startRow}" >
	</tr>
	</c:if>
	</c:forEach>
	
	</table>
	
	<div class="pagemove">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="./listqna?p=${beginPage-1}"/>">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a href="<c:url value="./listqna?p=${pno}"/>" style="color: black">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a href="<c:url value="./listqna?p=${pno}" />">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a href="<c:url value="./listqna?p=${endPage+1}"/>">...다음</a>
	</c:if>
	</div>
	</c:otherwise>
</c:choose>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
	$(document).ready(function(){
		$('.back').click(function(){
			history.back();
		});
		
		
		$('.button').click(function(){
			$(this).parent().find('.email').attr('name','email');
		
			
			$(this).parent().find('.id').attr('name','id');
			$(this).parent().find('.answer').attr('name','answer');
			
		});
		
	});
	
	</script>

</body>
</html>