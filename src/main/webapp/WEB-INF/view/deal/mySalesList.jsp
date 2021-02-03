<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>판매목록 거래 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="나의 수업 판매내역" />
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
.div-title{
            width:800px; margin:auto;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
             font-size:16px;
        }
.inner-main{
			display:inline-block;
			background:white;
			padding:20px;
			border-radius: 10px 10px 0px 0px;
			border:2px solid gray;
			border-bottom:2px solid white;
}
.inner-sub{
			display:inline-block;
			background:white;
			padding:20px;
			border-radius: 10px 10px 0px 0px;
}
.div-title-inner{
			display:inline-block;
			background:white;
			padding:20px;
			border-radius: 10px 10px 0px 0px;
			border:1px solid lightgray;
}
#load{
		padding:20px;
		width:80%;
		margin:40px auto;
		background: #EAEAEA;
		text-align:center;
		border:1px solid gray;
		cursor:pointer;
}
.pur-tr{
	display:none;
}
.refund, .refund-complete{
	padding:5px 30px;
	border:1px solid gray;
	font-size:15px;
	cursor:pointer;
}

.orderInfo{
border:1px solid gray; padding:5px 30px;cursor:pointer;font-size:15px;
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
        	  
        	  
        	  $('.orderInfo').click(function(){
        			var orderId= $(this).closest("td").find('.orderId').text();
        			window.open("./sellerorderInfo?id="+orderId, "", "width=800,height=600");
        		});	
        	  
        	  $(document).on('click','.refund',function(){
              	var orderId= $(this).closest("td").find('.orderId').text();
              	window.open("./refund?orderid="+orderId, "", "width=500,height=500");
                  });
        	  
        	  $(document).on('click','.refund-complete',function(){
              	var orderId= $(this).closest("td").find('.orderId').text();
              	window.open("./sellerRefundCompleteInfo?orderid="+orderId, "", "width=500,height=500");
                  });
        	  
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
 <div style="background:rgb(233, 232, 232); padding:30px;min-height:300px;">
 <div class="div-title">

  <div class="inner-main">
  <a href="/saleslist" style="color: black;font-weight:bolder;font-size:18px;">일반거래 판매내역</a>
  </div>
  <div class="inner-sub">
  <a href="/proposalsell" style="color: gray;text-decoration:none;">거래제안서 판매내역</a>
  </div>
  
 </div>
 <div style="width:800px; background:white; margin: auto; padding:20px;border:2px solid gray;">
 <div style="width:700px; margin:auto;">
 
 <table style="border-spacing:0px 20px;width:700px; margin:auto;">
 	<tr style="font-size:12px;font-weight:bold;text-align:center;">
 	<td style="border-bottom:1px solid orange;padding:10px;">입금상태</td>
 	<td style="border-bottom:1px solid orange;padding:10px;">수업명</td>
 	<td style="border-bottom:1px solid orange;padding:10px;">주문정보</td>
 	</tr>
 	
<c:choose>	
 	<c:when test="${size==0 }" >
	<tr>
	<td style="min-height:300px;font-family:'JejuGothic'; font-size:14px;text-align:center;padding:10px; text-align:center;" colspan="3">
	판매내역이 없습니다.
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	<c:forEach var="list" items="${listModel}">
 	<tr class="pur-tr">
 		<td style="width:150px;text-align:center;">
 		<span style="color:orange;font-size:18px;font-family: 'JejuGothic'; ">${list.orderstatus}</span>
 		</td>
 		<td style="width:400px; line-height:150%;">
 		<div style="font-size:11px;">${list.orderDateJ}</div>
 		<div style="font-size:14px;font-family: 'JejuGothic'; ">${list.cate}(${list.subcate})</div>
 		<div style="font-size:18px;font-family: 'JejuGothic'; ">${list.title}</div>
 		<div style="font-size:14px">수업금액  ${list.price3}원</div>
 		</td>
		<td style="text-align:center;width:150px">
		<div style="margin:30px 0px;"><span class="orderInfo">주문정보</span><span class="orderId">${list.orderId }</span></div>
		<c:choose>
		<c:when test="${list.orderstatus=='결제완료'}">
 			<div style="margin-bottom:30px;"><span class="refund">환불신청</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불대기'}">
 			<div style="margin-bottom:30px;"><span class="refund">환불정보</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불완료'}">
 			<div style="margin-bottom:30px;"><span class="refund-complete">환불완료</span></div>
 		</c:when>
 		</c:choose>
		</td>
 	</tr>
 	<tr class="pur-tr">
 		<td colspan="3" style="border-bottom:0.5px solid gray; padding:20px 10px 20px 10px">
 		<div style="font-size:13px;font-family: 'JejuGothic';  text-align: center;color:rgb(209, 172, 8);">
 		구매자 이름 : ${list.buyerName } 
 		</div>
 		</td>
 	</tr>
 	</c:forEach>
 	</c:otherwise>
</c:choose>
 	</table>
 	<div id="load">더보기</div>
 </div>
 </div>
 </div>


</body>
</html>