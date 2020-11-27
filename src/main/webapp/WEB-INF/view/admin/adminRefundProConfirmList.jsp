<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	.title-div{
		font-weight:bolder;
		text-align:center;
		font-size:35px;padding:10px;
		margin:50px 0px 70px 0px;
	}
	.tran-table{
		border-spacing:0px 40px;
		width:80%;
		font-size:18px;
		margin:20px auto;
		text-align:center;
	}
	
	.tran-first-tr td{
		font-weight:bolder;background:lightgray;width:24%;padding:15px
	}
	
	.refundContent{
		padding:10px;
		border:1px solid lightgray;
		border-radius:10px;
		cursor:pointer;
		color: #2B2B2B;
	}
	.refundId{
		display:none;
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">환불완료 기록내역</div>
<hr style="margin:30px 0px;"/>


<div style="font-weight:bolder;padding:5px;width:80%;margin:auto;">신청자 검색하기</div>
<form method="post" onSubmit="return checkForm(this)">
	<table style="border-spacing:0px 20px;width:80%;margin:auto;background:#EAEAEA;border:1px solid black;font-size:15px;padding:10px;">
		<tr>
			<td>신청자 <input id="applicant" type="text" name="applicantName" style="font-size:15px;padding:5px;"/> </td>
			<td rowspan="2"><input style="padding:5px;font-size:15px;width:120px;background:orange;color:white;" type="submit" value="검색"/></td>
		</tr>
		<tr>
			<td><input type="text" id="testDatepicker" name="startDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>&nbsp; ~ 
 				<input type="text" id="testDatepicker2" name="endDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>  </td>
		</tr>
	</table>
	
</form>

<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 최신순</div>
<table class="tran-table">
	<tr class="tran-first-tr">
		<td>완료기록날짜</td>
		<td>구매자성함</td>
		<td>판매자성함</td>
		<td>환불완료정보</td>
	</tr>
	<c:if test="${size==0}">
		<tr>
			<td colspan="4">검색내역이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="pur" items="${list}">
	<tr >
		<td >${pur.recordtimeS}</td>
		<td>${pur.buyerName}</td>
		<td>${pur.sellerName}</td>
		<td><span class="refundContent">환불완료정보</span><span class="refundId">${pur.orderId}</span></td>
	</tr>
	<tr>
		<td colspan="4" style="border-bottom:1px solid black;"></td>
	</tr>
	</c:forEach>
</table>
<br/>
<hr style="border:0.5px solid gray;width:80%;margin:auto;"/>
<br/>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
 <script>
 $(document).ready(function(){
	 var applicantName = "<c:out value="${search.applicantName}" />";
	 $('#applicant').val(applicantName);
	 
	 
		$('.back').click(function(){
			history.back();
		});
		
		$('.refundContent').click(function(){
			var orderId= $(this).closest("td").find('.refundId').text();
			window.open("./adminRefundProCompleteInfo?orderId="+orderId, "" , "width=900,height=600");
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
		
 });
 </script>
</body>
</html>