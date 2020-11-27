<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	.impact2{
		font-weight:bolder;
	}
	
	.title-div{
		font-weight:bolder;
		text-align:center;
		font-size:35px;padding:10px;
		margin:50px 0px 70px 0px;
	}
	
	.tran-table{
		border-spacing:10px;
		width:80%;
		font-size:18px;
		margin:20px auto;
	}
	
	.tran-table tr:first-child{
		font-weight:bolder;
	}
	.tran-table tr:nth-child(2){
		font-weight:bolder;
	}
	.tran-table td{
		padding:10px;
	}
	.go-from{
		cursor:pointer;
		text-decoration:underline;
		color:blue;
	}
	.go-to{
		display:none;
	}
	.changeOrderStatus{
		padding:10px;
		border-radius:5px;
		background:gray;
		color:white;
		cursor:pointer;
		
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">레슨 구매/판매 거래내역</div>

<div style="font-weight:bolder;padding:5px;width:80%;margin:auto;">입금자 검색하기</div>
<form method="post" onSubmit="return checkForm(this)">
	<table style="border-spacing:0px 20px;width:80%;margin:auto;background:#EAEAEA;border:1px solid black;font-size:15px;padding:10px;">
		<tr>
			<td>입금자명</td><td> <input id="depositor" type="text" name="depositor" style="font-size:15px;padding:5px;"/> </td>
			<td>구매자명</td><td> <input id="buyerName" type="text" name="buyerName" style="font-size:15px;padding:5px;"/></td>
			<td>은행</td>
			<td>
				<select id="bank" name="bank" style="font-size:15px;padding:5px;height:30px;">
					<option value="">--은행전체--</option>
					<option value="국민">국민</option>
					<option value="농협">농협</option>
					<option value="하나">하나</option>
					<option value="기업">기업</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주문날짜</td>
			<td>
				<input type="text" id="testDatepicker" name="startDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>&nbsp; ~ 
 				<input type="text" id="testDatepicker2" name="endDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>  
			</td>
			<td>주문상태</td>
			<td>
				<select id="orderstatus" name="orderstatus" style="font-size:15px; padding:5px; height:30px;">
					<option value="">전체</option>
					<option value="입금대기">입금대기</option>
					<option value="결제완료">결제완료</option>
					<option value="서비스완료">서비스완료</option>
					<option value="환불대기">환불대기</option>
					<option value="환불완료">환불완료</option>
				</select>
			</td>
			<td><input type="submit" value="검색" style="padding:5px; width:100px; background:orange;color:white;"/></td>
		</tr>
	</table>
	
</form>
<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 오래된순(선주문 건수부터)</div>

<hr style="margin:30px 0px;"/>

<c:forEach var="pur" items="${list}">
<table class="tran-table">
	<tr >
		<td>입금자 : <span class="depositorA">${pur.depositor}</span></td>
		<td>구매자 이름 : <span class="buyerNameA">${pur.buyerName}</span></td>
		<td>계좌 : <span class="bankA">${pur.bank}</span></td>
	</tr>
	<tr>
		<td >주문날짜 : ${pur.orderDateJ}</td>
		<td >주문상태 : ${pur.orderstatus}</td>
		<td >레슨 가격 : <span class="priceA">${pur.price3}</span></td>
	</tr>
	<tr>
		<td>구매자 이메일 : ${pur.buyerEmail}</td>
		<td class="impact2">구매자 번호 : ${pur.buyerPhone}</<td>
		<td><span class="go-from">레슨보기<span class="go-to">${pur.postId}</span></span></td>
	</tr>
	<tr>
		<td>판매자 이름 : ${pur.sellerName}</td>
		<td>판매자 이메일 : ${pur.sellerEmail}</td>
		<td>판매자 번호 : ${pur.sellerPhone}</<td>
	</tr>
	<tr>
		<td>레슨 시작날짜 : ${pur.startDateS}</td>
		<td>레슨 종료날짜 : ${pur.endDateS}</td>
		<td><c:if test="${pur.orderstatus=='입금대기'}"><span class="changeOrderStatus">입금확인</span></c:if></td>
	</tr>
	<tr style="display:none;">
		<td class="orderIdA">${pur.orderId}</td>
	</tr>
	
</table>
<br/>
<hr style="border:0.5px solid gray;width:80%;margin:auto;"/>
<br/>
</c:forEach>
	
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$('.back').click(function(){
		history.back();
	});

	$('.go-from').click(function(){
		window.open("./boardread?postId="+$(this).find('.go-to').text(), "레슨","width=800, height=500" );
	})

	 var depositorS = "<c:out value="${search.depositor}" />";
	 var buyerNameS = "<c:out value="${search.buyerName}" />";
	 var bankS = "<c:out value="${search.bank}" />";
	 var orderstatusS = "<c:out value="${search.orderstatus}" />";
	
	 $('#depositor').val(depositorS);
	 $('#buyerName').val(buyerNameS);
	 $('#bank').val(bankS).prop("selected",true);
	 
	 $('#orderstatus').val(orderstatusS).prop("selected",true);
	
	 $(document).on('click','.changeOrderStatus',function(){
	    	  	var con = confirm("입금내역이 확인되셨습니까? \n 확인을 누르시면 결제완료 상태로 변경됩니다.");
	    	  	if(con==true){
	    	  		var depositorA = $(this).closest('.tran-table').find(".depositorA").text();
	    	  		var buyerNameA = $(this).closest('.tran-table').find(".buyerNameA").text();
	    	  		var bankA = $(this).closest('.tran-table').find(".bankA").text();
	    	  		var postIdA = $(this).closest('.tran-table').find(".go-to").text();
	    	  		var orderIdA = $(this).closest('.tran-table').find(".orderIdA").text();
	    	  		var priceA = $(this).closest('.tran-table').find(".priceA").text();
	    	  		
	    	  		var orderData = {"depositor": depositorA, "buyerName": buyerNameA, 
	    	  		 "bank": bankA, "postId": postIdA, "orderId": orderIdA, "price": priceA};
	    	  		
	    	  		$.ajax({
	    	  		  url:'./changeOrderStatus',
	    	  		  type:'post',
	    	  		  data: orderData,
	    	  		  error:function(error){
	    	  			  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
	    	  		  },
	    	  		  success:function(data){
	    	  			  if(data=="success"){
	    	  				  alert("주문상태가 결제완료로 변경되었습니다. ");
	    	  					location.reload();
	    	  			  }
	    	  		  }
	    	  	  	});
	    	  		
	    	  	}else{
	    	  	}
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
    	
    	    var date = "<c:out value="${search.startDate}" />";
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
        	        nextText: '다음 달',
        	        prevText: '이전 달' 
        	 });
        	    
        	    $( "#testDatepicker2" ).prop('readonly',true);
        	    
        	    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
        		
        	    var date = "<c:out value="${search.endDate}" />";
        	   	var dates = date.split('-');
        	   	if(date!=''){
        	   	 $( "#testDatepicker2" ).val(dates[0]+'.'+dates[1]+'.'+dates[2] );
        	   	}else{
        	   	 $( "#testDatepicker2" ).datepicker( "setDate", new Date() );

        	   	}
        	    
    	    });
    	    
})

function checkForm(memberInfo){
	var depositor = $('#depositor').val();
	var buyerName = $('#buyerName').val();
	
	if(depositor.length>30){
		alert("입금자명은 30글자를 넘길수 없습니다.");
		return false;
	}
	if(buyerName.length>30){
		alert("구매자명은 30글자를 넘길수 없습니다.");
		return false;
	}
	
	
	
	
   	var ago  = $('#testDatepicker').val();
   	var last = $("#testDatepicker2" ).val();
   	age = ago.replace(',','');
  	last = last.replace(',','');
    
  	if(ago>last){
      alert(' 시작날짜는 종료날짜보다 뒤에 있을 수 없습니다.');
      return false;
    }
}
</script>
</body>
</html>