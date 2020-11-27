<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매목록 거래 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="나의 레슨 구매내역" />
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" /> 
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
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
.lesson-href{
	color:black;
	text-decoration:none;
}
.lesson-hover:hover{
	background:rgb(236, 235, 234);
}
.div-title{
            width:90%; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
             font-size:30px;
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
.refund{
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
.orderCancel{
	padding:5px 30px;
	border:1px solid gray;
	font-size:30px;
}
</style>

</head>
<body>
<div style="background:rgb(233, 232, 232); padding:30px 30px 240px 30px;min-height:1800px;">
 <div class="div-title">구매관리</div>
 <div style="width:90%;; background:white; margin: auto; padding:20px;min-height:500px;">
 	
 	<form method="post" onSubmit="return checkForm(this)">
 	<div style="position:relative;width:700px; margin:auto;">
 	<select style="position:relative; top:4px;padding:15px;font-size:24px;" id="orderStatus" name="orderStatus">
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
 	<div style="width:100%; margin:auto;">
 	<table style="border-spacing:0px 40px;width:100%; margin:auto;text-align:center;">
 	
<c:choose>	
 	<c:when test="${size == 0 }" >
	<tr>
	<td style="min-height:300px;font-family:'JejuGothic'; font-size:34px;text-align:center;">
	구매내역이 없습니다.
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	<c:forEach var="list" items="${listModel}">
 	<tr class="pur-tr">
 		<td style="width:20%;text-align:center;">
 		<span style="color:orange;font-size:20px;font-family: 'JejuGothic'; ">${list.orderstatus}</span>
 		</td>
 		<td style="width:50%; padding:10px;text-align:left;">
 		<a class="lesson-href" href="./boardread?postId=${list.postId }">
 		<div class="lesson-hover">
 		<div style="font-size:20px;margin:10px;">주문날짜${list.orderDateJ}</div>
 		<div style="font-size:25px;margin:10px;font-family: 'JejuGothic'; ">${list.cate}(${list.subcate})</div>
 		<div style="font-size:30px;margin:10px;font-family: 'JejuGothic';margin-bottom:10px;line-height:120%; ">${list.title}</div>
 		<div style="font-size:25px;margin:10px;;">수업 금액 ${list.price3}</div>
 		<br/>
 		</a>
 		</td>
		<td style="text-align:center;width:30%;font-size:22px">
		<div style="margin:30px 0px;"><a href="./orderInfo?id=${list.orderId}" style="color:black;text-decoration:none;"><span class="orderInfo">주문정보</span></a></div>
		<c:choose>	
		<c:when test="${list.orderstatus=='입금대기'}">
 			<div style="margin-bottom:30px;"><span class="orderCancel">주문취소</span><span class="orderId">${list.orderId }</span></div>
 		</c:when>
		<c:when test="${list.orderstatus=='결제완료'}">
 			<div style="margin-bottom:30px;"><a href="./refundM?orderid=${list.orderId}" style="text-decoration:none;color:black;"><span class="refund">환불신청</span></a><span class="orderId">${list.orderId }</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불대기'}">
 			<div style="margin-bottom:30px;"><a href="./refundM?orderid=${list.orderId}" style="text-decoration:none;color:black;"><span class="refund">환불정보</span></a><span class="orderId">${list.orderId }</span></div>
 		</c:when>
 		<c:when test="${list.orderstatus=='환불완료'}">
 			<div style="margin-bottom:30px;"><a href="./buyerRefundCompleteInfo?orderid=${list.orderId}" style="text-decoration:none;color:black;"><span class="refund">환불완료</span></a><span class="orderId">${list.orderId }</span></div>
 		</c:when>
 		</c:choose>
		</td>
 	</tr>
 	<tr class="pur-tr">
 		<td colspan="3" style="border-bottom:0.5px solid gray;">
 		</td>
 	</tr>
 	</c:forEach>
 	</c:otherwise>
</c:choose>
 	</table>
 	</div>
 	
 	<div id="load">더보기</div>
 	
 </div>
 <div style="height:300px;"></div>
 </div>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="resources/jquery-number-master/jquery.number.min.js"></script>
        <script>
        $(document).ready(function(){
        	  $('.my1').css('color','orange');
        	  
        	  var orderStatus = "<c:out value="${orderStatus}" />";
        	  
        	  if(orderStatus !=""){
  				$('#orderStatus').val(orderStatus).attr('selected', true);
  			} 
        	  
        	  
        	  $('.orderCancel').click(function(){
        		  var orderId= $(this).closest("td").find('.orderId').text();
        		  
        			$.ajax({
        	  		  url:'./orderCancel?orderId='+orderId,
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
</body>
</html>