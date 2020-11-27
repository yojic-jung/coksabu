<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
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
	.delLesson{
	   	cursor:pointer; border:1px solid gray; padding:10px; border-radius:5px;
	}
</style>
</head>
<body>

<div style="margin-top:50px; font-size:20px;text-align:center;font-weight:bolder">
<c:choose>
	<c:when test="${delStatus=='삭제가능'}">
		<span style="color:blue;">${delStatus}</span>
	</c:when>
	<c:otherwise>
		<span style="color:red;">${delStatus}</span>
	</c:otherwise>
</c:choose>	
</div>

<table class="tran-table">
	<tr class="tran-first-tr">
		<td>주문 날짜</td>
		<td>구매자 이메일</td>
		<td>구매자 이름</td>
		<td>구매자 번호</td>
		<td>주문 상태</td>
		<td>수업종료날짜</td>
	</tr>
	
	<c:forEach var="pur" items="${list}">
	<c:choose>
	<c:when test="${pur.orderstatus=='입금대기' or pur.orderstatus=='환불대기' or pur.orderstatus=='결제완료'}">
	<tr style="background: #FFC19E;" >
	</c:when>
	<c:otherwise>
	<tr>
	</c:otherwise>
	</c:choose>
		<td>${pur.orderDateJ}</td>
		<td >${pur.buyerEmail}</td>
		<td class="postId">${pur.buyerName}</td>
		<td>${pur.buyerPhone}</td>
		<td>${pur.orderstatus}</td>
		<td>${pur.endDateS}</td>
	</tr>
	<tr>
		<td colspan="6" style="border-bottom:1px solid black;"></td>
	</tr>
	</c:forEach>
</table>
	
	<c:if test="${delStatus=='삭제가능'}">
	<div style="text-align:center;margin-bottom:80px;">
		<span class="delLesson">삭제하기</span>
	</div>
	</c:if>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).on('click','.delLesson',function(){
		var postId = "<c:out value="${postId}" />";
		var id = "<c:out value="${id}" />";
		alert(id)
		alert(postId)
		
		$.ajax({
	  		  url:'./adminDelLesson?postId='+postId+'&id='+id,
	  		  type:'get',
	  		  error:function(error){
	  			  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
	  		  },
	  		  success:function(data){
	  			  if(data=="success"){
	  				  alert("성공적으로 삭제되었습니다.");
	  				  opener.location.reload();
					  window.close();
	  			  }
	  		  }
	  	  	});
});
</script>
</body>
</html>