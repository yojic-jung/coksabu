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
<div style="font-size:20px;font-weight:bolder;width:80%;margin:50px auto 0px auto;">수업정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="4" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>주문날짜</td><td>수업제목</td><td>수업시수</td><td>선생님 이름</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.purchase_dayS}</td>
	<td>${pur.cate}</td>
	<td>${pur.lessonCount}회분<br/>1회당 ${pur.lessonTime} 수업</td>
	<td>${pur.sellerName}</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>수업시작일</td><td>수업종료일</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.startDate}</td><td>${pur.endDate}</td>
	</tr>
</table>


<div style="font-size:20px;font-weight:bolder;width:80%;margin:50px auto 0px auto;">결제정보</div>
<table style="width:80%;text-align:center;margin:10px auto;">
	<tr>
		<td colspan="4" style="border-top:2px solid black;"></td>
	</tr>
	<tr>
	<td>구매자이름</td><td>주문상태</td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid gray;"></td>
	</tr>
	<tr>
	<td>${pur.buyerName}</td>
	<td>${pur.orderstatus}</td>
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