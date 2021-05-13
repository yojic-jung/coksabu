<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=yes" />
<link rel="canonical" href="https://coksabu.com/orderInfo?id=73">
<title>주문정보 콕사부</title>
<style>
body{
	font-size:25px;
}
	table{
		border-spacing:0px 40px;
	}
	table tr:nth-child(2){
		font-weight:bolder;
	}
	table tr:nth-child(6){
		font-weight:bolder;
	}
</style>
</head>
<body>
<div style="font-size:30px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">수업정보</div>
<table style="width:90%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="3" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>주문날짜</td><td>수업제목</td><td>수업시수</td>
	</tr>
	<tr>
		<td colspan="3" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.orderDateJ}</td>
	<td>${pur.cate}(${pur.subcate })<br/>${pur.title }</td>
	<td>${pur.price1}<br/>회당 ${pur.price2} 수업</td>
	
	</tr>
	<tr>
		<td colspan="3" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>선생님 이름</td><td>수업시작일</td><td>수업종료일</td>
	</tr>
	<tr>
		<td colspan="3" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.sellerName}</td><td>${pur.startDateS}</td><td>${pur.endDateS}</td>
	</tr>
</table>


<div style="font-size:30px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">결제정보</div>
<table style="width:90%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="2" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>입금은행</td><td>가격</td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.bank}</td>
	<td>${pur.price3}</td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>입금자명</td><td></td>
	</tr>
	<tr>
		<td colspan="2" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.depositor}</td><td></td>
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