<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래제안서(구매) 콕사부</title>
<meta charset="utf-8">
<style>
.div-title{
            width:800px; margin:auto;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
             font-size:16px;
        }
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
.search{
	width:100px;
	border-radius:5px;
	background:orange;
	border:none;
	padding:5px;
	margin-left:20px;
	color:white;
}
#proposal-table tr{
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
 <div class="div-title">
  <div class="div-title-inner">

	<div class="inner-sub">
  <a href="/purchaselist" style="color: gray;text-decoration:none;">일반거래 구매내역</a>
  </div>
  <div class="inner-main">
  <a href="/proposalpurchase" style="color:black;font-weight:bolder;font-size:18px;">거래제안서 구매내역</a>
  </div>

  </div>
 </div>
 <div style="width:800px; background:white;min-height:400px; margin: auto; padding:20px;border:2px solid gray;">
	<div style="margin-bottom:20px;">
	<form method="post" onSubmit="return checkForm(this)">
 	<div style="position:relative;width:700px; margin:auto;">
 	<select style="position:relative; top:4px;padding:5px;heigh:24px;" id="orderStatus" name="orderStatus">
 		<option value="">전체</option>
 		<option value="주문취소">주문취소</option>
 		<option value="입금대기">입금대기</option>
 		<option value="결제완료">결제완료</option>
 		<option value="서비스완료">서비스완료</option>
 		<option value="환불대기">환불대기</option>
		<option value="환불완료">환불완료</option>
 	</select>
 	
 	<input type="text" id="testDatepicker" name="firstDateJ" style="font-size:12px;padding:5px;heigh:24px;width:110px;"/>&nbsp; ~ 
 	<input type="text" id="testDatepicker2" name="lastDateJ" style="font-size:12px;padding:5px;heigh:24px;width:110px;"/>  
 	
 	<input class="search" type="submit" value="조회하기" />
 	</div>
	</form> 	
	</div>
	<hr style="width:700px; border:1px solid gray; margin:20px auto;"/>
<c:choose>
	<c:when test="${size==0 }">
	<div style="text-align:center;margin:150px;font-weight:bolder;">거래 제안서를 통한 구매 내역이 없습니다.</div>
	</c:when>
	<c:otherwise>
	
	
	
	
	<table id="proposal-table" style="border-spacing:0px 15px;width:100%;font-size:14px;">
	<c:forEach var="list" items="${purchase}">
	
	<tr>
		<td rowspan="4" style="text-align:center;font-size:18px;width:20%;font-family: 'JejuGothic';color:orange">${list.orderstatus }</td>
		<td colspan="4"></td>
		<td rowspan="4" style="width:20%;" >
<div class="orderInfo"><span class="proposal-show">제안서 보기</span><span class="proposal-id">${list.id}</span></div>
		<div class="proposalOrderInfo">주문정보<span class="orderId">${list.id}</span></div>
		
		<c:choose>
		<c:when test="${list.orderstatus=='입금대기'}">
 			<div class="orderInfo orderCancel"><span class="orderCancel">주문취소</span></div>
 		</c:when>
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
		<td class="td-stl">판매자 닉네임</td><td>${list.seller }</td><td class="td-stl">주문날짜</td><td>${list.purchase_dayS }</td>
	</tr>
	<tr>
		<td class="td-stl">서비스</td><td>${list.cate }</td><td class="td-stl">가격</td><td>${list.price }</td>
	</tr>
	<tr>	
		<td class="td-stl">수업횟수</td><td>${list.lessonCount }</td><td class="td-stl">수업시간</td><td>회당 ${list.lessonTime }</td>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
        <script>
        $(document).ready(function(){
        	  $('.my1').css('color','orange');
        	  var orderStatus = "<c:out value="${orderStatus}" />";
        	  if(orderStatus !=""){
    				$('#orderStatus').val(orderStatus).prop('selected', true);
    			} 
        	  
        	  
        	  
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
                
                $('.proposalOrderInfo').click(function(){
          			var id= $(this).closest("td").find('.orderId').text();
          			window.open("./proposalOrderInfo?id="+id, "", "width=800,height=600");
          		});	
                
        	  
          });
        
        $(document).on('click','.refund',function(){
        	var orderId= $(this).closest("td").find('.orderId').text();
        	window.open("./refundproposal?orderid="+orderId, "purchaselist", "width=500,height=500");
            });
        
        $(document).on('click','.refund-complete',function(){
        	var orderId= $(this).closest("td").find('.orderId').text();
        	window.open("./buyerRefundCompletePro?orderid="+orderId, "purchaselist", "width=500,height=500");
        });
        
        
        
        $(document).on('click','.proposal-show',function(){
        	
        	var proposal_id = $(this).closest("div").find('.proposal-id').text();
        	window.open("./myproposal?id="+proposal_id, "", "width=800,height=600");
        });
        
        
        
        $(document).on('click','#testDatepicker',function(){
        	var ago = $( "#testDatepicker" ).val();
        	ago = ago.replace(',','');
        	var last = $( "#testDatepicker2" ).val();
        	last = last.replace(',','');
        	
        	if(ago>last){
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
        	       
        	        nextText: '다음 달',
        	        prevText: '이전 달' 
        	 });
        	    
        	    $( "#testDatepicker" ).prop('readonly',true);
        	    
        	    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
        	
        	    var date = "<c:out value="${firstDate}" />";
        	   	var dates = date.split('-');
        	   	if(date!=''){
        	   		$( "#testDatepicker" ).val(dates[0]+'.'+dates[1]+'.'+dates[2] );
        	   	}else{
        	   		var d =  new Date();
            	    $( "#testDatepicker" ).datepicker( "setDate", new Date(d.getFullYear()-2, d.getMonth(), d.getDate()) );

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
            	        nextText: '다음 달',
            	        prevText: '이전 달' 
            	 });
            	    
            	    $( "#testDatepicker2" ).prop('readonly',true);
            	    
            	    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
            		
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
   		 $("#proposal-table tr").slice(0, 25).show(); // 최초 5개 선택
   		 
   		 $("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
   		 		e.preventDefault();
   		 		
   		 		
   		 		if($("#proposal-table tr:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
   		 			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
   		 		}
   		 		
	   		 	$("#proposal-table tr:hidden").slice(0, 25).show(); // 숨김 설정된 다음 5개를 선택하여 표시
   		 		
   		 		
   		 	
   			});
   		});
        
		</script>
</body>
</html>