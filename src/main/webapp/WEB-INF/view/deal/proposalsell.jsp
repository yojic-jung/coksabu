<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래제안서(판매) 콕사부</title>
<meta charset="utf-8">
<style>
.div-title{
            width:800px; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
.table-title{
		padding:10px;
		text-align:center;
		border-bottom:1px solid orange;
		font-weight:bolder;
}
.td-stl{
		font-weight:bolder;
}
#load{
		padding:20px;
		width:80%;
		margin:auto;
		background: #EAEAEA;
		text-align:center;
		border:1px solid gray;
		cursor:pointer;
}

table tr{
	display:none;
}

.orderInfo, .proposalOrderInfo{
border:1px solid gray; width:120px; padding:5px 0px; text-align:center; margin:10px auto;cursor:pointer;font-size:15px;
}
.proposal-id, .orderId{
	display:none;
}
</style>
</head>
<body>
<div style="background:rgb(233, 232, 232); padding:30px;min-height:300px;">
 <div class="div-title">거래 제안서</div>
 <div style="width:800px; background:white;min-height:400px; margin: auto; padding:20px;">
 

<c:choose>
	<c:when test="${size==0 }">
	<div style="text-align:center;margin-top:150px;font-weight:bolder;">거래 제안서를 통한 판매 내역이 없습니다.</div>
	</c:when>
	<c:otherwise>
	<div class="table-title" >거래제안서를 통해 판매한 내역이 공개됩니다.</div>
	<table style="border-spacing:0px 20px;width:100%;font-size:17px;">
	<c:forEach var="list" items="${purchase}">
	
	<tr>
		<td rowspan="4" style="text-align:center;font-size:18px;font-family: 'JejuGothic';width:20%;color:orange">${list.orderstatus }</td>
		<td colspan="4"></td>
		<td rowspan="4" style="padding:0px;width:20%;" >
<div class="orderInfo proposal-show"><span class="proposal-show">제안서 보기</span><span class="proposal-id">${list.id}</span></div>
		<div class="proposalOrderInfo">주문정보<span class="orderId">${list.id}</span></div>
		
		<c:choose>
		<c:when test="${list.orderstatus=='결제완료'}">
 			<div class="orderInfo refund"><span class="refund">환불신청</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불대기'}">
 			<div class="orderInfo refund"><span class="refund">환불정보</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불완료'}">
 			<div class="orderInfo refund-complete"><span class="refund-complete">환불완료</span></div>
 		</c:when>
 		</c:choose>


		</td>
	</tr>
	<tr>
		<td class="td-stl">구매자</td><td>${list.buyer }</td><td class="td-stl">주문날짜</td><td>${list.purchase_dayS }</td>
	</tr>
	<tr>
		<td class="td-stl">서비스</td><td>${list.cate }</td><td class="td-stl">가격</td><td>${list.price }</td>
	</tr>
	<tr>	
		<td class="td-stl">횟수</td><td>${list.lessonCount }</td><td class="td-stl">수업시간</td><td>회당 ${list.lessonTime }</td>
	</tr>
	<tr>
		<td colspan="6" style="border-bottom:1px solid gray;text-align:center;padding-bottom:20px;"></td>
	</tr>
	</c:forEach>
	</table>
	<div id="load">더보기</div>
	</c:otherwise>
	
</c:choose>
</div>
</div>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script>
          $(document).ready(function(){
        	  $('.tutor5').css('color','orange');
        	  
        	  $('.proposalOrderInfo').click(function(){
        			var id= $(this).closest("td").find('.orderId').text();
        			window.open("./sellerProposalOrderInfo?id="+id, "", "width=800,height=600");
        		});	
          });
          
          
          $(document).on('click','.refund',function(){
          	var orderId= $(this).closest("td").find('.orderId').text();
          	window.open("./refundproposal?orderid="+orderId, "purchaselist", "width=500,height=500");
              });
          
          $(document).on('click','.refund-complete',function(){
          	var orderId= $(this).closest("td").find('.orderId').text();
          	window.open("./sellerRefundCompletePro?orderid="+orderId, "purchaselist", "width=500,height=500");
              });
          
          $(document).on('click','.proposal-show',function(){
          	
          	var orderId= $(this).closest("div").find('.proposal-id').text();
          	window.open("./myproposal?id="+orderId, "", "width=800,height=600");
              });
          
          $(function(){
        		 $("tr").slice(0, 25).show(); // 최초 5개 선택
        		 
        		 $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
        		 		e.preventDefault();
        		 		if($("tr:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
        		 			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
        		 		}
        		 		
     	   		 		$("tr:hidden").slice(0, 25).show(); // 숨김 설정된 다음 10개를 선택하여 표시
        		});
        });
</script>
</body>
</html>