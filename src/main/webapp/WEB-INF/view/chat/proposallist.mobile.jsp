<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>거래제안서 목록 콕사부</title>
<style>
.accept-proposal{
	cursor:pointer;
	text-decoration:underline;
}
</style>
</head>
<body>
<div style="text-align:center;font-size:40px; margin:30px;"><a class="newDeal" href="./newpurchase?id=${chatroom_id }">거래 제안서 수정하기</a></div>
<c:forEach var="post" items="${list}">
	<div style="margin:50px;">
	<div id="categories">${post.customer} :
	 ${post.name}</div>
	
	<div id="categories">서비스 : ${post.cate}(${post.subCate})</div>
	
	
	<div id="categories">수업횟수 : ${post.lessonCount}</div>
	<div id="categories">회당 수업시간 : ${post.lessonTime}</div>
	
	<div id="categories">수업 시작일 : ${post.startDate}</div>
	<div id="categories">수업 종료일 : ${post.endDate}</div>
	<div id="categories">추가 사항 : ${post.moreDetail}</div>
	<div id="categories">콕사부 서비스정책과 환불정책을 이행함</div>
	<div id="categories">가격 : ${post.price}</div>
	<c:if test="${post.customer=='판매자'}">
	<div>레슨 구매하기</div>
	</c:if>
	<c:if test="${post.customer=='구매자'}">
	<div><span class="accept-proposal">거래 제안서 승낙</span></div>
	<div>구매자의 거래 제안서를 승낙하면 동일한 내용의 거래제안서가 판매자 명의로 작성되며 이후 구매자가 제안한 제안서와 동일하게 서비스를 판매 할 수 있습니다.</div>
	</c:if>
	</div>
</c:forEach>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>

$(document).ready(function(){
	var fail = "<c:out value="${fail}" />";	
	if(fail=="fail"){
		alert('구매자 본인이 거래를 승낙 할 수 없습니다.');
	}
	
});


$(document).on('click','.accept-proposal',function(){
	var chatroom_id = "<c:out value="${chatroom_id}" />";	
	
	$.ajax({
		  url:'./transactionJudge?id='+chatroom_id,
		  type:'get',
		  error:function(error){
			  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요.")
		  },
		  success:function(data){
			  if(data=="fail"){
				  alert("자기 자신과는 거래 할 수 없습니다.");
			  }else if(data=="success"){
				  alert("성공적으로 거래를 수정하였습니다.");
				  window.location.href="./acceptTransaction?id="+chatroom_id;
			  }
		  }
	  });
	
});

</script>
</body>
</html>