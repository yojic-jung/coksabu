<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래제안서(구매) 콕사부</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" /> 
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

.ui-datepicker{ font-size: 30px; padding:15px;}
.ui-datepicker select.ui-datepicker-month{ font-size: 30px;padding:15px; }
.ui-datepicker select.ui-datepicker-year{ font-size: 30px;padding:15px; }

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
        <script>
        $(document).ready(function(){
        	  $('.my2').css('color','orange');
        	  var orderStatus = "<c:out value="${orderStatus}" />";
        	  if(orderStatus !=""){
    				$('#orderStatus').val(orderStatus).prop('selected', true);
    			} 
          });
		</script>
		
		
 <div style="width:90%; margin: auto;padding:40px 0px; text-align:center;">
 <div style="width:100%; margin:auto;">
 
<c:choose>
	<c:when test="${size==0 }">
	<div style="text-align:center;padding:50px 0px;font-size:30px;font-weight:bolder;">거래 제안서를 통한 구매 내역이 없습니다.</div>
	</c:when>
	<c:otherwise>
	<div class="table-title" >거래제안서를 통해 구매한 내역이 공개됩니다.</div>
	
	
	<form method="post" onSubmit="return checkForm(this)">
 	<div style="width:700px;margin-top:20px;">
 	<select style="padding:15px;font-size:24px;" id="orderStatus" name="orderStatus">
 		<option value="">전체</option>
 		<option value="주문취소">주문취소</option>
 		<option value="입금대기">입금대기</option>
 		<option value="결제완료">결제완료</option>
 		<option value="서비스완료">서비스완료</option>
 		<option value="환불대기">환불대기</option>
		<option value="환불완료">환불완료</option>
 	</select>
 	
 	<input type="text" id="testDatepicker" name="firstDateJ" style="font-size:20px;padding:15px;width:150px;"/>&nbsp; ~ 
 	<input type="text" id="testDatepicker2" name="lastDateJ" style="font-size:20px;padding:15px;width:150px;"/>  
 	
 	<input class="search" type="submit" value="조회하기" />
 	</div>
	</form> 	
	
	<hr style="width:100%; border:1px solid gray; margin:20px auto;"/>
	
	<table style="border-spacing:30px;width:100%;font-size:30px;">
	<c:forEach var="list" items="${purchase}">
	<tr class="tr">
		<td rowspan="5" style="text-align:center;font-size:30px;font-family: 'JejuGothic';color:orange">${list.orderstatus }</td>
		<td colspan="3"></td>
		<td rowspan="5" >
<div class="orderInfo"><a href="./myproposal?id=${list.id}" style="color:black;text-decoration:none;">제안서 보기</a></div>
		<div class="proposalOrderInfo"><a href="./proposalOrderInfo?id=${list.id}" style="color:black;text-decoration:none;">주문정보</a></div>
		<c:choose>	
		<c:when test="${list.orderstatus=='입금대기'}">
 			<div class="orderInfo"><span class="orderCancel">주문취소</span><span class="orderId">${list.id }</span></div>
 		</c:when>
		<c:when test="${list.orderstatus=='결제완료'}">
 			<div class="orderInfo"><a href="./refundProM?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불신청</span></a></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불대기'}">
 			<div class="orderInfo"><a href="./refundProM?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불정보</span></a></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불완료'}">
 			<div class="orderInfo"><a href="./buyerRefundCompletePro?orderid=${list.id}" style="text-decoration:none;color:black;"><span class="refund">환불완료</span></a></div>
 		</c:when>
 		</c:choose>
		
		</td>
	</tr>
	<tr class="tr">
		<td class="td-stl">판매자</td><td class="td-stl">서비스</td><td class="td-stl">주문날짜</td>
	</tr>
	<tr class="tr" style="font-size:25px;">
		<td>${list.seller }</td><td>${list.cate }</td><td>${list.purchase_dayS }</td>
	</tr>
	<tr class="tr">	
		<td class="td-stl">가격</td><td class="td-stl">횟수</td><td class="td-stl">수업시간</td>
	</tr>
	<tr class="tr" style="font-size:25px;">	
		<td>${list.price}</td><td>${list.lessonCount }</td><td>회당 ${list.lessonTime }</td>
	</tr>
	<tr>
		<td colspan="5" style="border:1px solid lightgray;"></td>
	</tr>
	</c:forEach>
	</table>
	<div id="load">더보기</div>
	</c:otherwise>
</c:choose>
 	
 
 </div>
 </div>
 <div style="height:500px;"></div>
 <script>
 $(document).ready(function(){

	 $('.orderCancel').click(function(){
		  var orderId= $(this).closest("td").find('.orderId').text();
			$.ajax({
	  		  url:'./proposalOrderCancel?orderId='+orderId,
	  		  type:'get',
	  		  error:function(error){
	  			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
	  		  },
	  		  success:function(data){
	  			  alert('성공적으로 주문취소를 하였습니다.');
	  			  window.location.reload() 
	  			}
	  		  })
	  	  });
      
 });
 
 $(document).on('click','#testDatepicker',function(){
 	var ago = $( "#testDatepicker" ).val();
 	ago = ago.replace(',','');
 	var last = $( "#testDatepicker2" ).val();
 	last = last.replace(',','');
 	
 	if(ago>last){
 		  alert('지난날짜가 다음날짜보다 뒤에 있을 수 없습니다.');
 		  return false;
 	  }
 	
 	
 	
 	  
     });
 
 
   $(function() {
 	    $( "#testDatepicker" ).datepicker({
 	    	changeMonth: true, 
 	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
 	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
 	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
 	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 	        dateFormat: "yy.mm.dd",
 	        showButtonPanel: true,
 	        minDate:'-2y',
 	        showOn:"both",
 	        buttonImage: "<c:url value="/resources/images/calendar3.png" />",
 	        buttonImageOnly:true,
 	       
 	       nextText: '&gt;',
 	        prevText: '&lt;'  
 	 });
 	    
 	    $( "#testDatepicker" ).attr('readonly',true);
 	    
 	    $("img.ui-datepicker-trigger").attr("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
 	
 	    var date = "<c:out value="${firstDate}" />";
 	   	var dates = date.split('-');
 	   	if(date!=''){
 	   		$( "#testDatepicker" ).val(dates[0]+'.'+dates[1]+'.'+dates[2] );
 	   	}else{
 	   		var d =  new Date();
     	    $( "#testDatepicker" ).datepicker( "setDate", new Date(d.getFullYear(), d.getMonth(), d.getDate()-14) );

 	   	}
 	   
 	    
   });
   
   
 	    $(function() {
     	    $( "#testDatepicker2" ).datepicker({
     	    	changeMonth: true, 
     	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
     	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
     	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
     	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     	        dateFormat: "yy.mm.dd",
     	        showButtonPanel: true,
     	        
     	        showOn:"both",
     	        buttonImage: "<c:url value="/resources/images/calendar3.png" />",
     	        buttonImageOnly:true,
     	       	maxDate:0,
     	       nextText: '&gt;',
     	        prevText: '&lt;'  
     	 });
     	    
     	    $( "#testDatepicker2" ).attr('readonly',true);
     	    
     	    $("img.ui-datepicker-trigger").attr("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
     		
     	    var date = "<c:out value="${lastDate}" />";
     	   	var dates = date.split('-');
     	   	if(date!=''){
     	   	 $( "#testDatepicker2" ).val(dates[0]+'.'+dates[1]+'.'+dates[2] );
     	   	}else{
     	   	 $( "#testDatepicker2" ).datepicker( "setDate", new Date() );

     	   	}
     	    
 	    });
 	    
     	   function checkForm(memberInfo){
     		  var ago  = $('#testDatepicker').val();
     		  var last = $("#testDatepicker2" ).val();
     		  age = ago.replace(',','');
     		  last = last.replace(',','');
     		   if(ago>last){
     			  alert(' 시작날짜는 종료날짜보다 뒤에 있을 수 없습니다.');
     			  return false;
     		   }
     	   }
 
 $(function(){
	 $(".tr").slice(0, 25).show(); // 최초 5개 선택
	 
	 $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
	 		e.preventDefault();
	 		if($(".tr:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
	 			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
	 		}
	 		
		 		$(".tr:hidden").slice(0, 25).show(); // 숨김 설정된 다음 10개를 선택하여 표시
	});
});
 </script>
</body>
</html>