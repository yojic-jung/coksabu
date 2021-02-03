<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	table{
		border-spacing:0px 20px;
		text-align:center;
	}
	
	table td{
		padding:15px;
		font-size:15px;
	}
</style>
</head>
<body>
주문번호  ${refund.orderId }<br/>
환불완료 처리날짜  ${refund.recordtimeS}<br/>
<br/>
  
	<table>
		<tr>
			<td>진행한 수업횟수</td><td>남아있는 수업횟수</td><td>전체 수업횟수</td>
		</tr>	
		<tr>
			<td>${refund.progressLesson }</td><td>${refund.remainLesson }</td><td>${refund.price1 }</td>
		</tr>	
		<tr>
			<td>구매자</td> <td>구매자 이메일</td> <td>구매자 환불가격</td> <td>구매자 환불은행</td> <td>구매자 계좌</td> <td>구매자 예금주</td>
		</tr>
		<tr>
			<td>${refund.buyerName }</td><td>${refund.buyerEmail }</td><td>${refund.buyerPrice}</td><td>${refund.buyerBank }</td><td> ${refund.buyerAccount}</td><td> ${refund.buyerAccountHolder }</td>
		</tr>
		
		<tr>
			<td>판매자</td> <td>판매자 이메일</td> <td>판매자 환불가격</td> <td>판매자 환불은행</td> <td>판매자 계좌</td> <td>판매자 예금주</td>
		</tr>
		<tr>
			<td>${refund.sellerName }</td><td>${refund.sellerEmail }</td><td>${refund.sellerPrice}</td><td>${refund.sellerBank }</td><td> ${refund.sellerAccount}</td><td> ${refund.sellerAccountHolder }</td>
		</tr>
		
		<tr>
			<td>판매자 수수료</td> <td>판매자 최종입금금액</td>
		</tr>
		<tr>
			<td>${refund.fees }</td> <td>${refund.finalPrice}</td>
		</tr>
	</table>
	<div style="white-space:pre">환불내용 ${refund.content}</div>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	  $('table tr:even').css("background","#EAEAEA");         // odd 홀수
	});
</script>
</body>
</html>