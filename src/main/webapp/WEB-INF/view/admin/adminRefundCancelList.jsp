<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.back{
		cursor:pointer;
		font-size:20px;
		font-weight:bolder;
	}
	.title-div{
		font-weight:bolder;
		text-align:center;
		font-size:35px;padding:10px;
		margin:50px 0px 70px 0px;
	}
	.tran-table{
		border-spacing:0px 40px;
		width:80%;
		font-size:18px;
		margin:20px auto;
		text-align:center;
	}
	
	.tran-first-tr td{
		font-weight:bolder;background:lightgray;;padding:15px
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">환불취소 처리내역</div>
<hr style="margin:30px 0px;"/>


<table class="tran-table">
	<tr class="tran-first-tr">
		<td>주문번호</td>
		<td>신청자이름</td>
		<td>신청자이메일</td>
		<td>기록날짜</td>
		<td style="width:50%;">환불내용</td>
	</tr>
	
	<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 최신순</div>
	
	<c:forEach var="refund" items="${list}">
	<tr >
		<td >${refund.orderId}</td>
		<td>${refund.applicantname}</td>
		<td>${refund.applicant}</td>
		<td>${refund.recordtimeS}</td>
		<td><div style="height:200px; ">진행한 수업 : ${refund.processCount}회<br/>
남아있는 수업횟수 : ${refund.remainCount}회<br/>
기타 환불신청내용 : <br/>
<div style="border:1px solid lightgray;line-height:150%;margin:10px;width:500px;height:80px;overflow:scroll;">${refund.content }</div>
핸드폰 번호 : ${refund.phone}<br/>
환불계좌 : ${refund.account }</div></td>
	</tr>
	<tr>
		<td colspan="5" style="border-bottom:1px solid black;"></td>
	</tr>
	</c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$('.back').click(function(){
		history.back();
	});
});
</script>
</body>
</html>