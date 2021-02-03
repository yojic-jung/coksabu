<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=yes" />
<link rel="canonical" href="https://coksabu.com/sellerorderInfo?id=75">
<title>주문정보 콕사부</title>
<style>
	table{
		border-spacing:0px 40px;
		font-size:25px;
	}
	table tr:nth-child(2){
		font-size:25px;
		font-weight:bolder;
	}
	table tr:nth-child(6){
		font-size:25px;
		font-weight:bolder;
	}
</style>
</head>
<body>
<div style="font-size:30px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">수업정보</div>
<table style="width:90%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="4" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>주문날짜</td><td colspan="3">수업제목</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.orderDateJ}</td>
	<td colspan="3">(${pur.cate}, ${pur.subcate})<br/>${pur.title }</td>
	
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td style="width:22%">수업시작일</td><td style="width:22%">수업종료일</td><td style="width:22%">수업시수</td><td style="width:22%">가격</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.startDateS}</td><td>${pur.endDateS}</td><td>${pur.price1}<br/>회당 ${pur.price2} 수업</td><td>${pur.price3}원</td>
	</tr>
</table>


<div style="font-size:30px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">결제정보</div>
<table style="width:90%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="3" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td style="width:30%">구매자 이름</td><td style="width:30%">구매자 닉네임</td><td style="width:30%">주문상태</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.buyerName}</td>
	<td>${pur.buyerNickname}</td>
	<td>${pur.orderstatus}</td>
	</tr>
</table>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	$('.m-jbMenu').append("주문 정보");
});
</script>

</body>
</html>