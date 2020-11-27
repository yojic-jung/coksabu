<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매하기 레슨목록 콕사부</title>
<meta name="description" content="레슨 구매페이지" />
<meta charset="utf-8">

<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" /> 
<style>
.represent-img{
          	float:left;
          	margin-right:40px;
          	width:30%;
          }
.title{
          	clear:right;
          	padding:10px;
          }
	.top-right{
		font-size:30px;width:90%;margin:50px auto 0px auto;
		
	}
	
.payment{
	font-size:30px;
	padding:20px;
	border-radius:10px;
	border:none;
	background:orange;
	color:white;
}
.ui-datepicker{ width: 80%;font-size:50px; }
      }
</style>

</head>
<body>
<div class="top-right">콕사부를 통해 튜터들과 '<b>안전거래</b>' 할 수 있습니다.</div>
<form method="post" commandName="memberInfo" onSubmit="return CheckForm(this)">
<div>
	<div style="width:90%;margin:auto;margin-top:50px;font-size:30px;">주문하기</div>
	<div style="width:90%; border:0.5px solid black; margin:10px auto; min-height:300px;padding:20px;">
		<div style="width:90%;margin:auto;padding:30px;">
		<div class="represent-img"><img style="width:100%; height:200px;margin-bottom:50px;" src="<c:url value="/img/representImg/${purchase.represent}" />" /></div>
		<div class="title">
		<span style="font-size:30px;font-family:'JejuGothic'">${purchase.title }</span><br/>
		<br/>
		<span style="font-size:30px;font-family:'JejuGothic'">${purchase.cate }(${purchase.pubSubcate })</span><br/>
		</div>
		</div>
		
		<table style="border-spacing:0px 20px;width:90%;margin:auto; font-size:30px;">
		<tr style="width:100%; background:rgb(240, 239, 239);font-size:30px;">
		<td class="purchase-first" style="padding:10px">
		<b>구매정보</b>
		</td>
		<td class="purchase-second" style="padding:10px">
		<b>가격</b>
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		수업과목 : ${purchase.pubSubcate}
		</td>
		<td rowspan="5">
		 <span style="font-family:'JejuGothic';font-size:24px;"><b>${purchase.pubprice3 }원</b></span>
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		회당 수업시간 : ${purchase.pubprice2 }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		수업시수  : ${purchase.pubprice1 }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		과외 가능 형태 : ${purchase.gawe }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		<c:if test="${purchase.trial!=null}">시범 수업 여부  : ${purchase.trial}</c:if>
		</td>
		</tr>
		</table>
		
		
		<div>
		<div style="width:90%; margin:auto; margin-top:50px; background:rgb(240, 239, 239);padding:10px;font-size:30px;">
		<b>휴대폰 번호</b></div>
		<div style="font-size:30px;padding:15px;width:90%; margin:auto;">
			<input id="buyerPhone" style="font-size:30px;padding:15px;margin-left:20px;" type="text" name="buyerPhone" value="${phone}" />
		</div>
		</div>
				
		<div>
		<div style="width:90%; margin:auto; margin-top:50px; background:rgb(240, 239, 239);padding:10px;font-size:30px;">
		<b>수업 시작/종료일 지정</b></div>
		<div style="font-size:30px;padding:15px;width:90%; margin:auto;line-height:300%; ">선생님과 협의한  시작일자와 종료일자를 입력해주세요.<br/>
		<input type="text" id="testDatepicker" name="startDateS" style="font-size:30px;padding:15px;margin-left:20px;" placeholder="시작일"/>&nbsp;&nbsp;  ~ 
		<input type="text" id="testDatepicker2" name="endDateS" style="font-size:30px;padding:15px;margin-left:20px;" placeholder="종료일"/>  
		</div>
		</div>
		
		<div style="font-size:30px;width:90%; margin:50px auto;">
		<div style="margin:30px 0px;  background:rgb(240, 239, 239);padding:10px;font-size:30px;">
		<b>결제방법</b></div>
		<div style="padding:10px;line-height:200%;">
		무통장 입금<br/>
		<table style="border-spacing:10px;">
		<tr>
		<td>계좌선택</td>
		<td>
		<select id="bank" name="bank" style="padding:10px;font-size:30px;height:50px;">
			<option>--은행선택--</option>
			<option>국민은행 3020092810491</option>
			<option>하나은행 3020092810491</option>
			<option>농협은행 3020092810491</option>
			<option>기업은행 3020092810491</option>
		</select>
		</td>
		</tr>
		<tr>
		<td>입금자명</td>
		<td><input id="depositor" type="text" name="depositor" style="font-size:30px;padding:10px;" placeholder="입금자 성함을 적어주세요."/></td>
		</tr>
		</table>
		</div>
		</div>
		
	</div>
</div>

<div style="display:none;">
<input type="text" name="title" value="${purchase.title}" />
<input type="text" name="cate" value="${purchase.cate}" />
<input type="text" name="subcateIdx" value="${subcateIdx}" />
<input type="text" name="subcate" value="${purchase.pubSubcate}" />
<input type="text" name="price1" value="${purchase.pubprice1}" />
<input type="text" name="price2" value="${purchase.pubprice2}" />
<input type="text" name="price3" value="${purchase.pubprice3}" />
<input type="text" name="trial" value="${purchase.trial}" />
<input type="text" name="gawe" value="${purchase.gawe}" />
</div>
<br/>
<div style="margin:40px 0px 60px 0px; text-align:center; font-size:30px;width:80%;font-weight:bolder;margin:auto;">
<c:if test="${purchase.visible==0}">
<div style="font-size:40px;text-align:center;color:#FFBB00;line-height:150%;font-weight:bolder">판매 중단</div>
<div style="font-size:40px;text-align:center;color:#FFBB00;line-height:150%;font-weight:bolder">이 수업은 판매자의 요청으로 판매가 중단된 수업입니다.</div>
</c:if>
<c:if test="${purchase.visible==1}">
<input type="submit" class="payment" value="결제하기"/><br/>
</c:if>
콕사부에서는 고객의 휴대폰번호를 공개하지 않습니다.<br/>
서비스 결제전 상대방과 협의 후 연락처를 미리 공유하실것을 추천드립니다.
</div>
</form>

<div style="height:300px;"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function(){
	 var visible = "<c:out value="${purchase.visible}" />"
	 if(visible==0){
		 $('.m-jbMenu').append("판매중단");
	 }else{
		 $('.m-jbMenu').append("구매하기");
	 }
	

});

$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy-mm-dd",
        showButtonPanel: true,
        
        showOn:"both",
        buttonImage: "<c:url value="/resources/images/calendar3.png" />",
        buttonImageOnly:true,
       	minDate:0,
       	nextText: '&gt;',
        prevText: '&lt;' 
 });
    
    $( "#testDatepicker" ).prop('readonly',true);
    
    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
});

    $(function() {
        $( "#testDatepicker2" ).datepicker({
        	changeMonth: true, 
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy-mm-dd",
            showButtonPanel: true,
            
            showOn:"both",
            buttonImage: "<c:url value="/resources/images/calendar3.png" />",
            buttonImageOnly:true,
           	minDate:0,
            nextText: '&gt;',
            prevText: '&lt;' 
     });
        
        $( "#testDatepicker2" ).prop('readonly',true);
        
        $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
    });
    

function CheckForm(memberInfo){ 
	 var form = memberInfo;
	 var tel = /^[0-9]{10,11}$/
	
	if(!check(tel, form.buyerPhone, "휴대폰 번호는 하이픈(-)을 제외한 숫자만 적어주세요.")){
		return false;
	}
	
	if($('#testDatepicker').val().length==0){
		alert('수업 시작 날짜를 입력해주세요.');
		return false;
	}
	
	if($('#testDatepicker2').val().length==0){
		alert('수업 종료 날짜를 입력해주세요.');
		return false;
	}
	
	var ago  = $('#testDatepicker').val();
	var last = $("#testDatepicker2" ).val();
	age = ago.replace(',','');
	last = last.replace(',','');
	if(ago>last){
	   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
	  return false;
	}
	
	var idx = $("#bank option").index( $("#bank option:selected") );
	if(idx==0){
		alert('입금하실 은행을 선택해주세요.');
		return false;
	}

	var dep = $('#depositor').val().length;
	if(dep==0 || dep>30){
		alert("입금자명을 입력해주시기 바랍니다.")
		return false;
	}
	
}

function check(re, what, message) {
if(re.test(what.value)) {
    return true;
}
alert(message);
what.value = "";
what.focus();
//return false;
}

</script>
</body>
</html>