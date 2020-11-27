<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	.tran-table{
		border-spacing:0px 40px;
		width:80%;
		font-size:18px;
		margin:20px auto;
		text-align:center;
	}
	
	.tran-first-tr td{
		font-weight:bolder;background:lightgray;;padding:15px
	}
	.purchaselist{
		border-radius:5px; padding:5px;border:1px solid black;cursor:pointer;
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">삭제요청 레슨목록</div>
<hr style="margin:30px 0px;"/>

<table class="tran-table">
	<tr class="tran-first-tr">
		<td>번호</td>
		<td>게시글번호</td>
		<td>신청자이메일</td>
		<td>기록날짜</td>
		<td>거래내역</td>
	</tr>
	
	<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 오래된순(먼저요청한순)</div>
	
	<c:forEach var="del" items="${list}">
	<tr >
		<td class="id">${del.id}</td>
		<td class="postId">${del.postId}</td>
		<td>${del.email}</td>
		<td>${del.recordtimeS}</td>
		<td><span class="purchaselist">거래내역보기</span></td>
	</tr>
	<tr>
		<td colspan="5" style="border-bottom:1px solid black;"></td>
	</tr>
	</c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$('.back').click(function(){
		history.back();
	});
	
	$('.purchaselist').click(function(){
		var postId= $(this).closest("tr").find('.postId').text();
		var id = $(this).closest("tr").find('.id').text();
		window.open("./adminPurchaseList?postId="+postId+"&id="+id, "", "width=800,height=600");
	});
	
});
</script>
</body>
</html>