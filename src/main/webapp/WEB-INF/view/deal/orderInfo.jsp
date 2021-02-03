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
		border-spacing:0px 10px;
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
<div style="font-size:20px;font-weight:bolder;width:80%;margin:30px auto 0px auto;">수업정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
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
	<td colspan="3">${pur.cate}(${pur.subcate })<br/>${pur.title }</td>
	
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td style="width:24%">수업시작일</td><td style="width:24%">수업종료일</td><td style="width:24%">수업시수</td><td style="width:24%">선생님 닉네임</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.startDateS}</td>
	<td>${pur.endDateS}</td>
	<td>${pur.price1}<br/>회당 ${pur.price2} 수업</td>
	<td>${pur.sellerNickname}</td>
	</tr>
</table>


<div style="font-size:20px;font-weight:bolder;width:80%;margin:50px auto 0px auto;">결제정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
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
</body>
</html>