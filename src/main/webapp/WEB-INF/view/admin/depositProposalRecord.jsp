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
	.title-div{
		font-weight:bolder;
		text-align:center;
		font-size:35px;padding:10px;
		margin:50px 0px 70px 0px;
	}
	.tran-table{
		border-spacing:0px 30px;
		width:80%;
		font-size:18px;
		margin:20px auto;
	}
	
	}
	.tran-table td{
		padding:10px;
		width:33%;
	}
	.deposit-cancel{
		padding:10px;
		border-radius:10px;
		border:1px solid gray;
		cursor:pointer;
	}
	.orderId{
	}
	.chatTranId{
		display:none;
	}
</style>
</head>
<body>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">	입금확인 기록내역</div>
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
			<td>변경날짜</td>
			<td>
				<input type="text" id="testDatepicker" name="startDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>&nbsp; ~ 
 				<input type="text" id="testDatepicker2" name="endDate" style="font-size:15px;padding:5px;height:30px;width:110px;"/>  
			</td>
			<td><input type="submit" value="검색" style="padding:5px; width:100px; background:orange;color:white;"/></td>
		</tr>
	</table>
	
</form>

<div style="margin-top:30px;width:80%;text-align:right;">정렬기준: 최신순</div>
<hr style="margin:30px 0px;"/>
<c:forEach var="pur" items="${list}">
<table class="tran-table">
	<tr >
		<td>입금자 : <span class="depositorA">${pur.depositor}</span></td>
		<td>구매자 이름 : <span class="buyerNameA">${pur.buyerName}</span></td>
		<td>계좌 : <span class="bankA">${pur.bank}</span></td>
	</tr>
	<tr>
		<td>변경시간 : ${pur.recordtimeS}</td>
		<td>레슨 가격 : <span class="priceA">${pur.price}</span></td>
		<td><span class="deposit-cancel">입금확인 취소<span class="chatTranId">${pur.chatTranId}</span></span></td>
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
	
	 var depositorS = "<c:out value="${search.depositor}" />";
	 var buyerNameS = "<c:out value="${search.buyerName}" />";
	 var bankS = "<c:out value="${search.bank}" />";
	
	 $('#depositor').val(depositorS);
	 $('#buyerName').val(buyerNameS);
	 $('#bank').val(bankS).prop("selected",true);
	
	 
 		$(document).on('click','.deposit-cancel',function(){
 	 		var chatTranId = $(this).find('.chatTranId').text();
 	 		window.open("./cancelStatusProposal?id="+chatTranId,"","width=400, height=300");
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
	    	   	var dates = date.split('.');
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
	        	       	maxDate:1,
	        	        nextText: '다음 달',
	        	        prevText: '이전 달' 
	        	 });
	        	    
	        	    $( "#testDatepicker2" ).prop('readonly',true);
	        	    
	        	    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
	        		
	        	    var date = "<c:out value="${search.endDate}" />";
	        	   	var dates = date.split('.');
	        	   	if(date!=''){
	        	   	 $( "#testDatepicker2" ).val(dates[0]+'.'+dates[1]+'.'+dates[2] );
	        	   	}else{
	        	   	 $( "#testDatepicker2" ).datepicker( "setDate", new Date()+1 );

	        	   	}
	        	    
	    	    });
	    	    
});


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