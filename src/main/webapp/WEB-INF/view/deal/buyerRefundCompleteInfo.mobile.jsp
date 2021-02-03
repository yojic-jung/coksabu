<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=yes" />
<link rel="canonical" href="https://coksabu.com/buyerRefundCompleteInfo?orderid=62">
<title>구매자 환불완료정보 콕사부</title>
<style>


.title{
width:80%;
margin:auto;
	margin-top:70px;
	padding:30px; 
	font-size:40px;
	font-weight:bolder;
}

.lesson-table{
	width:80%;
	margin:auto;
}


.lesson-table td{
	background:#eaeaea;
	font-size:35px;
	text-align:center;
	padding:20px;
}
.content{
	width:80%;
	margin:auto;
	font-size:35px;
}


</style>
</head>
<body>
<div>

<div class='title'>수업정보</div>
	<table class="lesson-table">
		<tr>
			<td>전체 수업횟수</td>
			<td>진행한 수업횟수</td>
			<td>남은 수업횟수</td>
		</tr>
		<tr>
			<td>${refund.price1}</td>
			<td>${refund.progressLesson}</td>
			<td>${refund.remainLesson}</td>
		</tr>
	</table>
	
	<div class='title'>환불계좌정보</div>
	<div class="content">
		<table style="border-spacing:10px;">
		<tr>
			<td>은행 : </td>
			<td >${refund.buyerBank}</td>
			<td>계좌번호 : </td>
			<td>${refund.buyerAccount}</td>
		</tr>
		<tr>
			<td>예금주 : </td>
			<td>${refund.buyerAccountHolder}</td>
		</tr>
	</table>
	</div>
	
	<div class='title'>환불금액</div>
	<div class="content" > ${refund.buyerPrice }원</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	$('.m-jbMenu').append("환불완료 정보");
});
</script>
</body>
</html>