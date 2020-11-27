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
	padding:30px;
	background: #FCFCFC;
	border: 1px solid #EAEAEA;
	width:250px;
	font-size:35px;
	color: #2B2B2B;
	font-weight:bolder;
	border-radius:10px;
}
.refund-title{
text-align:center;
font-weight:bolder; background: #353535;
color:white;
margin-bottom:50px;

     width:100%;
     padding:30px; 
     font-size:80px;
     font-family:'Do Hyeon'; 
     border-bottom:1px solid gray; 
     z-index:3;
     text-align:center;
}
.m-back{	
	   	   	 position:absolute;
	   	 left:0%; 
	   	 color:#A6A6A6;
	   	 padding:0px 50px;
	}
</style>
</head>
<body>
<header class="m-header">
  <div class="refund-title">환불신청
    <span class="m-back">&lt;</span>
   </div>
</header>

<form method="post" onSubmit="return checkRefund(this)">
<table style="width:300px;margin:auto;border-spacing:20px;font-size:40px;">
	<tr>
		<td>신청내용(<span class="refund-length">0</span>/500)</td>
	</tr>
	<tr>
		<td>
<c:choose>
<c:when test="${size!=0}">
<textarea class="refunddetail" name="refunddetail" cols="40" rows="10" style="font-size:35px;line-height:180%;">${content.refunddetail}</textarea></c:when>
<c:otherwise>
				<textarea class="refunddetail" name="refunddetail" cols="40" rows="10" style="font-size:35px;line-height:180%;">진행한 레슨횟수 :
남아있는 레슨횟수 :
핸드폰 번호 :
환불 계좌(은행,계좌번호,예금주) :
기타 환불신청내용 :

				</textarea>
</c:otherwise>
</c:choose>
		</td>
	</tr>
</table>
<div style="display:none;"><input type="text" name="orderId" value="${orderId}" /></div>
<c:if test="${size==0}">
	<div style="text-align:center;"><input class="button" type="submit" value="등록"/></div>
</c:if>
<c:if test="${size==1}">
<div style="text-align:center;"><input  class="button" type="submit" value="수정"/></div>
</c:if>
</form>
<div style="height:300px;">
</div>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){

	$('.m-back').click(function(){
		var referpage = document.referrer;
		
		if(referpage==''){
			location.href = './';
		}else{
			history.back();
		}
	});
});
$(document).on('keyup','.refunddetail',function(){
 	  var inputLength = $(this).val().length;
   	var remain = inputLength;
   	$('.refund-length').html(remain);
     });
     
function checkRefund(member){

     if($('.refunddetail').val().length >= 500){
       	alert("글자수는 500글자 미만으로 작성하여주시기 바랍니다..");
   	  	return false;
   	 }
   
   
     
 }  
</script>
</body>
</html>