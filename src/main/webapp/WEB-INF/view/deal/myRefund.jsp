<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>서비스 환불 콕사부</title>
<style>
body{
	padding:0px;margin:0px;
}
.button{
	padding:10px;
	background: #FCFCFC;
	border: 1px solid #EAEAEA;
	width:150px;
	font-size:15px;
	color: #2B2B2B;
	font-weight:bolder;
	border-radius:10px;
	cursor:pointer
}
.refund-title{
text-align:center;font-size:18px;font-weight:bolder; background: #353535;color:white;padding:20px;
}
</style>
</head>
<body>
<div class="refund-title" >환불신청</div>
<form method="post" onSubmit="return checkRefund(this)">
<table style="width:350px;margin:auto;border-spacing:10px;font-size:13px;">
<c:choose>

<c:when test="${applicant=='me'}">
<tr>
	</tr>
	<tr>
		<td style="line-height:170%;">
		<div style="color:orange;margin-bottom:10px;">아래의 내용으로 환불접수가 되었습니다.<br/>콕사부 고객센터에서 상대방과 환불내용 확인 후 환불 절차를 진행하도록 하겠습니다.</div>
진행한 수업 : ${refund.processCount}회<br/>
남아있는 수업횟수 : ${refund.remainCount}회<br/>
기타 환불신청내용 : <br/>
<div style="border:1px solid lightgray;line-height:150%;margin:10px;width:100%;height:150px;overflow:scroll;">${refund.content }</div>
핸드폰 번호 : ${refund.phone}<br/>
환불계좌 : ${refund.account }
		</td>
	</tr>
</c:when>

<c:when test="${applicant=='counter'}">
	<tr>
		<td>
		<div style="color:orange;margin-bottom:10px;">상대방이 환불을 요청하였습니다. <br/>아래의 내용과 다른 점이 있으시다면 콕사부 고객센터에 연락주시기 바랍니다.</div>
진행한 수업 : ${refund.processCount}<br/>
남아있는 수업횟수 : ${refund.remainCount}<br/>
		</td>
	</tr>
</c:when>

<c:when test="${applicant=='noOne'}">
<tr>
		
	</tr>
	<tr>
		<td style="width:50%;">진행한 수업횟수</td>
		<td><input type="number" name="processCount" class="processCount" style="width:50px;padding:5px;" /></td>
	</tr>
	<tr>
		<td style="width:50%;">남아있는 수업횟수</td><td><input type="number" name="remainCount" class="remainCount" style="width:50px;padding:5px;"/></td>
	</tr>
	<tr>
		<td colspan="2">기타 환불신청내용 (<span class="content-length">0</span>/300)</td>
	</tr>	
	<tr>
		<td colspan="2"><textarea class="content" name="content" class="content" cols="40" rows="5" style="font-size:13px;line-height:150%;"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">핸드폰 번호</td>
	</tr>
	<tr>
	<td colspan="2"><input type="text" name="phone" class="phone" /></td>
	</tr>
	<tr>
		<td colspan="2">환불계좌(은행, 계좌번호, 예금주)</td>
	</tr>
	<tr>
	<td colspan="2"><textarea class="account " name="account" class="account" cols="40" rows="1" style="font-size:15px;line-height:180%;" placeholder="ex) 농협은행 0000000000000 홍길동"></textarea></td>
	</tr>
	
</c:when>

</c:choose>

</table>
<div style="display:none;"><input type="text" name="orderId" value="${orderId}" /></div>
<c:if test="${applicant=='noOne'}">
	<div style="text-align:center;"><input class="button" type="submit" value="등록"/></div>
</c:if>
</form>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	var applicant = "<c:out value="${applicant}" />";
	if(applicant=='notAllowAccess'){
		alert('비정상적인 접근입니다.');
		history.back();
	}
});
$(document).on('keyup','.content',function(){
 	  var inputLength = $(this).val().length;
   	var remain = inputLength;
   	$('.content-length').html(remain);
     });
     
function checkRefund(member){
	 var form = member;
	 var tel = /^[0-9]{10,11}$/
	 
	 if($('.processCount').val().length == 0 || $('.processCount').val().length >= 4){
	       	alert("진행한 수업횟수를 적어주시기 바랍니다.");
	   	  	return false;
	   	 }
	 if($('.remainCount').val().length == 0 || $('.remainCount').val().length >= 4){
	       	alert("남아있는 수업횟수를 적어주시기 바랍니다.");
	   	  	return false;
	   	 }
	 if($('.content').val().length >= 300){
	       	alert("글자수는 300글자 미만으로 작성하여주시기 바랍니다.");
	   	  	return false;
	   	 }
	 
	 
	 if(!check(tel, form.phone, "휴대폰 번호는 하이픈(-)을 제외한 숫자만 적어주세요.")){
		    return false;
	 }
	 
     
     if($('.account').val().length >= 35 || $('.account').val().length <= 10){
        	alert("환불계좌 정보를 적어주세요.");
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