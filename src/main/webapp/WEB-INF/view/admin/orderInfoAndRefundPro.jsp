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
		font-size:25px;padding:10px;
		margin:20px 0px;
	}
	.tran-table{
		border-spacing:10px;
		width:90%;
		font-size:16px;
		margin:20px auto;
	}
	
	.tran-table td{
		padding:10px;
	}
	input{
		padding:6px;
		font-size:16px;
		width:120px;
	}
	
	.refund-cancel{
		cursor:pointer;
		color:orange;
		text-decoration:underline;
	}
	
	.go-to{
		 display:none;
	}
	
	.go-from{
		padding:10px;
		border:1px solid gray;
		border-radius:10px;
		cursor:pointer;	
	}
</style>
</head>
<body>
<div><span class="refund-cancel">환불신청 취소하기</span></div>

<div class="title-div">주문정보</div>
<table class="tran-table">
	<tr >
		<td>입금자 : <span class="depositorA">${pur.depositor}</span></td>
		<td >주문날짜 : ${pur.purchase_dayS}</td>
		
		<td>계좌 : <span class="bankA">${pur.bank}</span></td>
	</tr>
	<tr>
		
		<td >주문상태 : ${pur.orderstatus}</td>
		<td >레슨 가격 : <span class="priceA">${pur.price}</span></td>
		<td >전체 수업 횟수 : ${pur.lessonCount}</td>
	</tr>
	<tr>
		<td>구매자 이름 : <span class="buyerNameA">${pur.buyerName}</span></td>
		<td>구매자 이메일 : ${pur.buyer}</td>
		
	</tr>
	<tr>
		<td>판매자 이름 : ${pur.sellerName}</td>
		<td>판매자 이메일 : ${pur.seller}</td>
	</tr>
	<tr>
		<td>레슨 시작날짜 : ${pur.startDate}</td>
		<td>레슨 종료날짜 : ${pur.endDate}</td>
		<td><span class="go-from">제안서보기<span class="go-to">${pur.id}</span></span></td>
	</tr>
	
</table>


<div class="title-div">환불정보</div>
<table class="tran-table" style="border-spacing:5px; border:1px solid black;">
	<tr>
		<td>환불신청날짜</td>
		<td>${refund.recordtimeS}</td>
	</tr>
	<tr>
		<td>환불신청자</td>
		<td>${refund.applicantname}</td>
	</tr>
	<tr>
		<td>신청내용</td>
		<td style="border:1px solid black;">
		진행한 수업 : ${refund.processCount}회<br/>
		남아있는 수업횟수 : ${refund.remainCount}회<br/>
		기타 환불신청내용 : <br/>
		<div style="border:1px solid lightgray;line-height:150%;margin:10px;width:400px;height:150px;overflow:scroll;">${refund.content }</div>
		핸드폰 번호 : ${refund.phone}<br/>
		환불계좌 : ${refund.account }
		</td>
	</tr>
</table>

<div class="title-div">환불완료처리</div>
<form method="post" onSubmit="return checkRefund(this)">
<table style="border-spacing:30px;">
	<tr>
		<td>주문번호</td><td><input type="text" class="orderId" name="orderId" value="${id}" style="background:#EAEAEA;" readonly/></td>
	</tr>
	<tr>
		<td style="font-weight:bolder;" colspan="2">---수업횟수---</td>
	</tr>
	<tr>	
		<td>진행한 수업횟수</td>
		<td>남은 수업횟수</td>
		<td>전체 수업횟수</td>
	</tr>
	
	<tr>	
		<td><input type="number" class="progressLesson" name="progressLesson"/></td>
		<td><input type="number" class="remainLesson" name="remainLesson"/></td>
		<td><input type="text" class="price1" name="price1" style="background:#EAEAEA;" value="${pur.lessonCount}" readonly/></td>
	</tr>
	<tr>
		<td style="font-weight:bolder;" colspan="2">---환불내용---</td>
	</tr>
	<tr>	
		<td>구매자 이름</td>
		<td>구매자 환불은행</td>
		<td>구매자 환불계좌</td>
		<td>구매자 환불 예금주 </td>
		<td>구매자 환불가격</td>
		
	</tr>
	<tr>	
		<td><input placeholder="이름" type="text" class="buyerName" name="buyerName" value="${pur.buyerName}" style="background:#EAEAEA;" readonly/></td>
		<td><input placeholder="은행" type="text" class="buyerBank" name="buyerBank"/></td>
		<td><input placeholder="계좌" type="text" class="buyerAccount" name="buyerAccount"/></td>
		<td><input placeholder="예금주" type="text" class="buyerAccountHolder" name="buyerAccountHolder"/></td>
		<td><input placeholder="가격" type="number" class="buyerPrice" name="buyerPrice"/></td>
	</tr>
	<tr>	
		<td>판매자 이름</td>
		<td>판매자 환불은행</td>
		<td>판매자 환불계좌</td>
		<td>판매자 환불 예금주</td>
		<td>판매자 환불가격</td>
	</tr>
	<tr>	
		<td><input placeholder="이름" type="text" class="sellerName" name="sellerName" value="${pur.sellerName}" style="background:#EAEAEA;" readonly/></td>
		<td><input placeholder="환불은행" type="text" class="sellerBank" name="sellerBank"/></td>
		<td><input placeholder="환불계좌" type="text" class="sellerAccount" name="sellerAccount"/></td>
		<td><input placeholder="예금주" type="text" class="sellerAccountHolder" name="sellerAccountHolder"/></td>
		<td><input placeholder="환불가격" placeholder="가격" type="number" class="sellerPrice" name="sellerPrice"/></td>
	</tr>
	<tr>
		<td>판매자 수수료</td>
		<td>판매자 최종입금금액</td>
	</tr>
	<tr>
		<td><input placeholder="수수료" type="number" class="fees" name="fees"/></td>
		<td><input placeholder="최종금액" type="number" class="finalprice" name="finalPrice"/></td>
	</tr>
	<tr>
		<td>환불 신청내용</td>	
		<td colspan="3"><textarea rows="20" cols="40" class="content" name="content">${refund.content}</textarea></td>
	</tr>
	
	<tr style="display:none;">
		<td>구매자 이메일 : <input type="text" class="buyerEmail" name="buyerEmail" value="${pur.buyer}" readonly/></td>	
		<td>판매자 이메일 : <input type="text" class="sellerEmail" name="sellerEmail" value="${pur.seller}" readonly/></td>
	</tr>
	
</table>
		<div style="text-align:center;"><input type="submit" /></div>
</form>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	var success = "<c:out value="${success}" />"
	
	if(success=="success"){
		alert("환불완료처리하였습니다.");
		opener.location.reload();
		window.close();
	}
	
	
	
	$('.go-from').click(function(){
		var pro_id = $('.go-to').text();
		window.open("./myproposal?id="+pro_id, "", "width=800,height=600");
	});
	
	$('.refund-cancel').click(function(){
		var con = confirm("환불취소처리전 구매자와 판매자의 환불 취소 의사를 모두 확인하셨습니까? 삭제된 경우 복구할 수 없습니다.")
		var name = prompt("밑의 내용을 그대로 받아적어주세요. \n구매자, 판매자와 상담후 환불취소 의사를 모두 확인하였습니다.");
		if(name=="구매자, 판매자와 상담후 환불취소 의사를 모두 확인하였습니다."){
			var con2 = confirm("환불취소가 되면 구매자의 주문상태가 결제완료 상태로 바뀌게 됩니다.");
			
			var orderid = "<c:out value="${refund.orderId}" />"
			if(con2){
				$.ajax({
	    	  		  url:'./adminRefundCancelPro?orderId='+orderid,
	    	  		  type:'get',
	    	  		  error:function(error){
	    	  			  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
	    	  		  },
	    	  		  success:function(data){
	    	  			  alert("성공적으로 처리하였습니다. /n창을 새로고침을 하여주시기 바랍니다.")
	    	  			  window.close();
	    	  		  }
	    	  	  	});
			}
		}
	});
	
});
function checkRefund(member){
	var progressLesson = $('.progressLesson').val();
	var remainLesson = $('.remainLesson').val();
	var buyerPrice = $('.buyerPrice').val();
	var sellerPrice = $('.sellerPrice').val();
	var buyerBank = $('.buyerBank').val();
	var sellerBank = $('.sellerBank').val();
	var buyerAccount = $('.buyerAccount').val();
	var sellerAccount = $('.sellerAccount').val();
	var buyerAccountHolder = $('.buyerAccountHolder').val();
	var sellerAccountHolder = $('.sellerAccountHolder').val();
	var content = $('.content').val();
	var fees = $('.fees').val();
	var finalPrice = $('.finalPrice').val();
	
	
	if(progressLesson.length>3 || progressLesson.length==0){
		alert("진행한 수업횟수를 적어주세요.");
		return false;
	}
	if(remainLesson.length>3 || remainLesson.length==0){
		alert("남은 수업횟수를 적어주세요.");
		return false;
	}
	if(buyerPrice.length>7 || buyerPrice.length==0){
		alert("구매자 환불금액을 적어주세요.");
		return false;
	}
	if(sellerPrice.length>7 || sellerPrice.length==0){
		alert("판매자 환불금액을 적어주세요.");
		return false;
	}
	
	if(buyerBank.length>13 || buyerBank.length==0){
		alert("구매자 환불 은행을 적어주세요.");
		return false;
	}
	if(sellerBank.length>13 || sellerBank.length==0){
		alert("판매자 환불 은행을 적어주세요.");
		return false;
	}
	
	if(buyerAccount.length>24 || buyerAccount.length==0){
		alert("구매자 계좌번호를 입력하세요.");
		return false;
	}
	if(sellerAccount.length>24 || sellerAccount.length==0){
		alert("판매자 계좌번호를 입력하세요.");
		return false;
	}
	if(buyerAccountHolder.length>13 || buyerAccountHolder.length==0){
		alert("구매자 환불계좌 예금주를 입력해주세요.");
		return false;
	}
	if(sellerAccountHolder.length>13 || sellerAccountHolder.length==0){
		alert("판매자 환불계좌 예금주를 입력해주세요.");
		return false;
	}
	if(content.length>300 || content.lenth==0 ){
		alert("환불신청내용을 입력해주세요.(300글자 미만)");
		return false;
	}
	if(fees.length>6 || fees.lenth==0 ){
		alert("수수료를 입력해주세요.");
		return false;
	}
	if(finalPrice.length>7 || finalPrice.lenth==0 ){
		alert("판매자 최종입금금액을 입력해주세요.(500글자 미만)");
		return false;
	}
	
}  
</script>
</body>
</html>