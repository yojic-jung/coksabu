<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="canonical" href="https://coksabu.com/buyerRefundCompleteInfo?orderid=62">
<title>구매자 환불완료정보 콕사부</title>
<style>

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

.title{
width:80%;
margin:auto;
	margin-top:70px;
	padding:30px; 
	font-size:40px;
	font-weight:bolder;
}

table{
	width:80%;
	margin:auto;
}


table td{
	background:#eaeaea;
	font-size:30px;
	text-align:center;
	padding:20px;
}
.content{
	width:80%;
	margin:auto;
	font-size:30px;
}

.small-title{
	font-size:30px;
}

</style>
</head>
<body>
<div>
<header class="m-header">
  <div class="order-title">환불완료 정보
    <span class="m-back">&lt;</span>
   </div>
</header>

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
	<div class="content"><span class="small-title">은행</span> : ${refund.buyerBank} | <span class="small-title">계좌번호 : </span> ${refund.buyerAccount}</div>
	
	<div class='title'>환불금액</div>
	<div class="content" > ${refund.buyerPrice }원</div>
</div>

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