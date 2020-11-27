<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	.title{
		margin:50px 0px 70px 0px;
		text-align:center;
		font-size:35px;
		font-weight:bolder;
	}
	a{
		color:black;
		font-weight:bolder;
		font-size:20px;
	}
</style>
</head>
<body>
 <%if(!session.getAttribute("email").equals("dywlr74")){ %>
<script>
window.location="./";
</script>
<%
}
%>
<div style="padding:20px; text-align:right;">
	<a href="<c:url value='j_spring_security_logout' />">관리자 로그아웃</a>
</div>
<div class="title">관리자 메인 페이지</div>
<div style="width:80%;margin:auto;">
	<table style="border-spacing:20px; width:100%;">

		<tr>
			<td colspan="3">-고객문의-</td>
		</tr>

		<tr>
		<td><a href="./admininspect">본인/학력 인증 검사</a></td>
		<td><a href="./adminDelWaiting">삭제요청 리스트</a></td>
		<td><a href="./listqna">고객문의 Q&A 리스트</a></td>
		</tr>
		
		
		<tr>
			<td colspan="3" style="padding-top:50px;">-일반거래-</td>
		</tr>
		<tr>
		<td><a href="./adminTransaction">레슨 구매/판매 거래내역</a></td>
		<td><a href="./depositConfirmRecord">입금확인 기록내역</a></td>
		</tr>
		
		<tr>
		<td><a href="./adminRefund">환불신청내역</a></td>
		<td><a href="./adminRefundConfirmList">환불완료 기록내역</a></td>
		<td><a href="./adminRefundCancelList">환불취소 처리내역</a></td>
		</tr>
		
		
		<tr>
			<td colspan="3" style="padding-top:50px;">-거래제안서-</td>
		</tr>
		<tr>
		<td><a href="./adminChatTransaction">구매/판매 거래내역(거래제안서)</a></td>
		<td><a href="./depositConfirmProposalRecord">입금확인 기록내역</a></td>
		</tr>
		
		<tr>
		<td><a href="./adminProRefund">환불신청내역</a></td>
		<td><a href="./adminRefundProConfirmList">환불완료 기록내역</a></td>
		<td><a href="./adminRefundProCancelList">환불취소 처리내역</a></td>
		</tr>
		
		<tr>
		<td colspan="3" style="padding-top:50px;">-고객정보 검색-</td>
		</tr>
		<tr>
		<td>이름,핸드폰번호로 검색</td><td>이메일로 검색</td><td></td>
		</tr>
	</table>
</div>

<div style="height:200px;"></div>
</body>
</html>