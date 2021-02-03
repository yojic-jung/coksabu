<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>판매목록 거래 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="나의 수업 판매내역" />
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
 <link rel="canonical" href="https://coksabu.com/saleslist"> 
 <style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
 .div-title{
            width:90%; margin:50px auto 0px auto;
             font-family:'JejuGothic'; color:dimgray;
             font-size:30px;
        }

.inner-main{
			display:inline-block;
			background:white;
			padding:40px;
			border-radius: 20px 20px 0px 0px;
			border:3px solid gray;
			border-bottom:3px solid white;
			 font-size:35px;
}
.inner-sub{
			display:inline-block;
			background:white;
			padding:40px;
			border-radius: 20px 20px 0px 0px;
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
.pur-tr{
	display:none;
}

.refund, .refund-complete{
	padding:5px 30px;
	border:1px solid gray;
	font-size:30px;
}

.orderInfo{
border:1px solid gray; padding:5px 30px;cursor:pointer;font-size:30px;
}
.orderId{
	display:none;
}
 </style>
</head>
<body>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>
        <script>
          $(document).ready(function(){
        	  
        	  var none = "<c:out value="${none}" />"
        	  
        	  if(none=='none'){
        		  alert('프로필과 수업을 모두 작성해주세요.')
        		  window.location='./tutorpage';
        	  }
        	  
        	  $('.tutor3').css('color','orange');
        	  
        	  
        	  
          });
          
          
          $(function(){
       		 $(".pur-tr").slice(0, 8).show(); // 최초 4개 선택
       		 
       		 $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
       		 		e.preventDefault();
       		 		
       		 		if($(".pur-tr:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
       		 			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
       		 		}
       		 		
    	   		 	$(".pur-tr:hidden").slice(0, 8).show(); // 숨김 설정된 다음 4개를 선택하여 표시
       		 	
       			});
       		});
		</script>
 <div style="background:rgb(233, 232, 232); padding:30px 30px 250px 30px;min-height:1800px;">
<div class="div-title">
 
  <div class="inner-main">
  <a href="/saleslist" style="color: black;font-weight:bolder;">일반거래 판매내역</a>
  </div>
  <div class="inner-sub">
  <a href="/proposalsell" style="color: gray;text-decoration:none;">거래제안서 판매내역</a>
  </div>

 </div>
 <div style="width:90%; background:white; margin: auto; padding:40px;border:3px solid gray;">
 <div style="width:100%; margin:auto;">
 
 <table style="border-spacing:0px 40px;width:100%; margin:auto;">
 	<tr style="font-size:22px;font-weight:bold;text-align:center;">
 	<td style="border-bottom:1px solid orange;padding:10px;">입금상태</td>
 	<td style="border-bottom:1px solid orange;padding:10px;">수업명</td>
 	<td style="border-bottom:1px solid orange;padding:10px;">주문정보</td>
 	</tr>
 	
<c:choose>	
 	<c:when test="${size==0}" >
	<tr>
	<td style="min-height:300px;font-family:'JejuGothic'; font-size:34px;text-align:center;padding:10px; text-align:center;" colspan="3">
	판매내역이 없습니다.
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	<c:forEach var="list" items="${listModel}">
 	<tr class="pur-tr">
 		<td style="width:20%;text-align:center;">
 		<span style="color:orange;font-size:28px;font-family: 'JejuGothic'; ">${list.orderstatus}</span>
 		</td>
 		<td style="width:50%; line-height:150%;padding-left:10px;">
 		<div style="font-size:20px;">${list.orderDateJ}</div>
 		<div style="font-size:30px;font-family: 'JejuGothic';line-height:150% ">${list.title}</div>
 		<div style="font-size:25px;font-family: 'JejuGothic'; ">${list.cate}(${list.subcate})</div>
 		<div style="font-size:20px">${list.price3}원</div>
 		</td>
		<td style="text-align:center;width:30%;font-size:28px;">
		<div style="margin:30px 0px;"><a href="./sellerorderInfo?id=${list.orderId}" style="color:black;text-decoration:none;"><span class="orderInfo">주문정보</span></a></div>
		<c:if test="${list.orderstatus=='결제완료'}">
 			<div style="margin-bottom:30px;"><a href="./sellerrefundM?orderid=${list.orderId }" style="color:black;text-decoration:none;"><span class="refund">환불신청</span></a></div>
 		</c:if>
 		<c:if test="${list.orderstatus=='환불대기'}">
 			<div style="margin-bottom:30px;"><a href="./sellerrefundM?orderid=${list.orderId }" style="color:black;text-decoration:none;"><span class="refund">환불정보</span></a><span class="orderId">${list.orderId }</span></div>
 		</c:if>
 		<c:if test="${list.orderstatus=='환불완료'}">
 			<div style="margin-bottom:30px;"><a href="./sellerRefundCompleteInfo?orderid=${list.orderId }" style="color:black;text-decoration:none;"><span class="refund-complete">환불완료</span></a><span class="orderId">${list.orderId }</span></div>
 		</c:if>
		</td>
 	</tr>
 	<tr class="pur-tr">
 		<td colspan="3" style="border-bottom:0.5px solid gray; padding:20px 10px 20px 10px">
 		</td>
 	</tr>
 	</c:forEach>
 	</c:otherwise>
</c:choose>
 	</table>
 	
 	<div id="load">더보기</div>
 
 </div>
 </div>
    <div style="height:500px;"></div>
 </div>


</body>
</html>