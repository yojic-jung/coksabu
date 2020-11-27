<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문정보 콕사부</title>
<style>
	table{
		border-spacing:0px 20px;
	}
	table tr:nth-child(2){
		font-size:17px;
		font-weight:bolder;
	}
	table tr:nth-child(6){
		font-size:17px;
		font-weight:bolder;
	}
</style>
</head>
<body>
<div style="font-size:20px;font-weight:bolder;width:80%;margin:50px auto 0px auto;">수업정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="4" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>주문날짜</td><td>수업제목</td><td>수업시수</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.orderDateJ}</td>
	<td>${pur.cate}(${pur.subcate })<br/>${pur.title }</td>
	<td>${pur.price1}<br/>1회당 ${pur.price2} 수업</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>수업시작일</td><td>수업종료일</td><td>가격</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.startDateS}</td><td>${pur.endDateS}</td><td>${pur.price3}원</td>
	</tr>
</table>


<div style="font-size:20px;font-weight:bolder;width:80%;margin:50px auto 0px auto;">결제정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="4" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>구매자 이름</td><td>주문상태</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.buyerName}</td>
	<td>${pur.orderstatus}</td>
	</tr>
</table>
</body>
</html>