<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	.order-title{
text-align:center;
font-weight:bolder; background: #353535;
color:white;
margin-bottom:50px;

     width:100%;
     padding:30px; 
     font-size:80px;
     font-family:'Do Hyeon'; 
     border-bottom:1px solid gray; 
     z-index:3;
     text-align:center;
}
.m-back{	
	   	   	 position:absolute;
	   	 left:0%; 
	   	 color:#A6A6A6;
	   	 padding:0px 50px;
	}
</style>
</head>
<body>
<header class="m-header">
  <div class="order-title">주문 정보
    <span class="m-back">&lt;</span>
   </div>
</header>
<div style="font-size:20px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">수업정보</div>
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
	<td>${pur.price1}<br/>1회당 ${pur.price2} 수업</td>
	
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


<div style="font-size:20px;font-weight:bolder;width:90%;margin:50px auto 0px auto;">결제정보</div>
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
</table>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){

	$('.m-back').click(function(){
		var referpage = document.referrer;
		
		if(referpage==''){
			location.href = './';
		}else{
			history.back();
		}
	});
});
</script>
</body>
</html>