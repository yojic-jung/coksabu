<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>구매자 환불완료정보 콕사부</title>
<style>
.title{
	padding:30px; 
	font-size:20px;
	font-weight:bolder;
}

table{
	width:80%;
	margin:auto;
}


table td{
	background:#eaeaea;
	font-size:20px;
	text-align:center;
	padding:10px;
}
.content{
	width:80%;
	margin:auto;
	font-size:20px;
}

.small-title{
	
	font-size:16px;
}

</style>
</head>
<body>
<div>
<div class='title'>수업정보</div>
	<table>
		<tr>
			<td class="small-title">전체 수업횟수</td>
			<td class="small-title">진행한 수업횟수</td>
			<td class="small-title">남은 수업횟수</td>
		</tr>
		<tr>
			<td>${refund.price1}</td>
			<td>${refund.progressLesson}</td>
			<td>${refund.remainLesson}</td>
		</tr>
	</table>
	
	<div class='title'>환불계좌정보</div>
	<div class="content"><span class="small-title">은행</span> : ${refund.sellerBank} | <span class="small-title">계좌번호 : </span> ${refund.sellerAccount}</div>
	
	<div class='title'>환불금액</div>
	<div class="content" >최종 입금금액 ${refund.finalPrice}원(금액:${refund.sellerPrice}  , 수수료:${refund.fees})</div>
</div>
</body>
</html>