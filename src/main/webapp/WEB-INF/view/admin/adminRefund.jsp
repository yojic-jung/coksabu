<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
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
		border-spacing:0px 30px;
		width:80%;
		font-size:18px;
		margin:20px auto;
		text-align:center;
	}
	
	.tran-first-tr td{
		font-weight:bolder;background:lightgray;width:20%;padding:15px
	}
	.orderInfo{
		padding:10px;
		border-radius:10px;
		border:1px solid gray;
		cursor:pointer;
	}
	.orderId{
		display:none;
	}
	.applicant{
		display:none;
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">환불신청내역</div>
<hr style="margin:30px 0px;"/>


<div style="font-weight:bolder;padding:5px;width:80%;margin:auto;">입금자 검색하기</div>
<form method="post" onSubmit="return checkForm(this)">
	<table style="border-spacing:0px 20px;width:80%;margin:auto;background:#EAEAEA;border:1px solid black;font-size:15px;padding:10px;">
		<tr>
			<td>신청자</td><td> <input id="applicant" type="text" name="applicantName" style="font-size:15px;padding:5px;"/> </td>
			<td><input style="padding:5px;font-size:15px;width:120px;background:orange;color:white;" type="submit" value="검색"/></td>
		</tr>
	</table>
	
</form>

<table class="tran-table">
	<tr class="tran-first-tr">
		<td>신청날짜</td>
		<td style="width:14%;">신청자</td>
		<td>신청자이메일</td>
		<td>생년월일</td>
		<td>수업정보</td>
	</tr>
	<c:if test="${size==0}">
		<tr>
			<td colspan="4">검색내역이 없습니다.</td>
		</tr>
	</c:if>
	<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 오래된순</div>
	
	<c:forEach var="pur" items="${list}">
	<tr >
		<td >${pur.recordtimeS}</td>
		<td><span class="depositorA">${pur.applicantname}</span></td>
		<td>${pur.applicant}</td>
		<td>${pur.birth}</td>
		<td><span class="orderId">${pur.orderId}</span><span class="applicant">${pur.applicant}</span><span class="orderInfo">주문정보</span></td>
	</tr>
	<tr>
		<td colspan="6" style="border-bottom:1px solid black;"></td>
	</tr>
	</c:forEach>
</table>
<br/>
<hr style="border:0.5px solid gray;width:80%;margin:auto;"/>
<br/>



<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 <script>
 $(document).ready(function(){
	 var applicantName = "<c:out value="${search.applicantName}" />";
	 $('#applicant').val(applicantName);
	 
		$('.back').click(function(){
			history.back();
		});
		
		$('.orderInfo').click(function(){
			var orderId= $(this).closest("td").find('.orderId').text();
			var applicant= $(this).closest("td").find('.applicant').text();
			window.open("./adminOrderInfoAndRefund?id="+orderId+"&applicant="+applicant, "", "width=800,height=600");
		});	
 });
 
 
 function checkForm(memberInfo){
		var applicant = $('#applicant').val();
		var birth = $('#birth').val();
		
		if(applicant.length>30){
			alert("신청자명은 30글자를 넘길수 없습니다.");
			return false;
		}
		if(birth.length!=6){
			alert("생년월일은 올바르게 입력해주세요. ex)980123");
			return false;
		}
		
		
}
 
 
 </script>
</body>
</html>