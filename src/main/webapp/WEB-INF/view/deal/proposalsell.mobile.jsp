<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래제안서(판매) 콕사부</title>
<meta charset="utf-8">
<link rel="canonical" href="https://coksabu.com/proposalsell">
 <style>
  @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
 .table-title{
		padding:10px;
		text-align:center;
		border-bottom:1px solid orange;
		font-weight:bolder;
		font-size:30px;
}
.td-stl{
		font-weight:bolder;
}

#load{
		padding:30px;
		width:80%;
		margin:auto;
		background: #EAEAEA;
		text-align:center;
		border:1px solid gray;
		cursor:pointer;
		font-size:30px;
}

.tr{
	display:none;
}
.search{
	background:orange;
	border:none;
	padding:15px;
	margin-left:20px;
	color:white;
	font-size:24px
}
.orderInfo, .proposalOrderInfo {
border:1px solid gray; width:150px; padding:15px 0px; text-align:center; margin:20px auto;cursor:pointer;font-size:25px;
}
.proposal-id, .orderId{
	display:none;
}
 </style>
</head>
<body>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script>
          $(document).ready(function(){
        	  $('.tutor5').css('color','orange');
          });
</script>
 <div style="width:90%; background:white; margin: auto; padding:40px 0px;text-align:center;">
 <div style="width:100%;">
 	
<c:choose>
	<c:when test="${size==0 }">
	<div style="text-align:center;margin-top:150px;font-weight:bolder;font-size:30px;">거래 제안서를 통한 판매 내역이 없습니다.</div>
	</c:when>
	<c:otherwise>
	<div class="table-title" >거래제안서를 통해 판매한 내역이 공개됩니다.</div>
	<table style="border-spacing:30px;width:100%;font-size:30px;">
	<c:forEach var="list" items="${purchase}">
	<tr class="tr">
		<td rowspan="5" style="text-align:center;font-size:30px;font-family: 'JejuGothic';color:orange">${list.orderstatus }</td>
		<td colspan="3"></td>
		<td rowspan="5" >
<div class="orderInfo"><a href="./myproposal?id=${list.id}" style="color:black;text-decoration:none;">제안서 보기</a></div>
<div class="proposalOrderInfo"><a href="./sellerProposalOrderInfo?id=${list.id}" style="color:black;text-decoration:none;">주문정보</a></div>
		<c:choose>	
		<c:when test="${list.orderstatus=='결제완료'}">
 			<div class="orderInfo"><a href="./sellerRefundProM?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불신청</span></a></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불대기'}">
 			<div class="orderInfo"><a href="./sellerRefundProM?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불정보</span></a></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불완료'}">
 			<div class="orderInfo"><a href="./sellerRefundCompletePro?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불완료</span></a></div>
 		</c:when>
 		</c:choose>
		</td>
	</tr>
	<tr class="tr">
		<td class="td-stl">판매자</td><td class="td-stl">서비스</td><td class="td-stl">주문날짜</td>
	</tr>
	<tr class="tr" style="font-size:25px;">
		<td>${list.buyer }</td><td>${list.cate }</td><td>${list.purchase_dayS }</td>
	</tr>
	<tr class="tr">	
		<td class="td-stl">가격</td><td class="td-stl">횟수</td><td class="td-stl">수업시간</td>
	</tr>
	<tr class="tr" style="font-size:25px;">	
		<td>${list.price}</td><td>${list.lessonCount }</td><td>회당 ${list.lessonTime }</td>
	</tr>
	<tr class="tr">
		<td colspan="5" style="border:1px solid lightgray;"></td>
	</tr>
	</c:forEach>
	</table>
	<div id="load">더보기</div>
	</c:otherwise>
</c:choose>
 	
 </div>
 </div>
 <div style="height:300px;"></div>
  <script>
 $(function(){
	 $(".tr").slice(0, 30).show(); // 최초 5개 선택
	 
	 $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
	 		e.preventDefault();
	 		if($(".tr:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
	 			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
	 		}
	 		
		 		$(".tr:hidden").slice(0, 30).show(); // 숨김 설정된 다음 10개를 선택하여 표시
	});
});
 </script>
</body>
</html>