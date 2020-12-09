<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래제안서 콕사부</title>
<meta charset="utf-8">

<link rel="canonical" href="https://coksabu.com/myproposal?id=26">
<style>
.content{
	font-weight:normal;
}
</style>
</head>
<body>
<div style="width:80%;margin:auto;">

<div style="margin:50px 0px;font-size:35px;line-height:300%;font-weight:bolder;">
<div >거래 날짜 : <span class="content">${proposal.purchase_dayS}</span></div>
<div >구매자 : <span class="content">${proposal.buyer}</span></div>
<div >판매자 : <span class="content">${proposal.seller}</span></div>
		<div >서비스 :  <span class="content">${proposal.cate}</span></div>
		<div >수업횟수 : <span class="content">${proposal.lessonCount}</span></div>
		<div >회당 수업시간 : <span class="content">${proposal.lessonTime}</span></div>
		<div >수업 시작일 : <span class="content">${proposal.startDate}</span></div>
		<div >수업 종료일 : <span class="content">${proposal.endDate}</span></div>
		<div >추가 사항 : <span class="content">${proposal.moreDetail}</span></div>
		
		<div>가격 : <span class="content">${proposal.price}</span></div>
		<div style="text-align:center;">콕사부 서비스정책과 <span class="refund" style="text-decoration:underline;cursor:pointer">환불정책</span>을 이행함</div>
		
		<div class="refund-content" style="display:none">
                <div style="overflow:scroll;font-size:30px; line-height:140%;margin:20px auto;height:500px;border:1px solid black; padding:10px;">
				<div style="text-align:right; "><span class="refund-close"  style="cursor:pointer;background:black;color:white;padding:10px">닫기</span></div>
				가. 수업 환불기준 원칙<br/>
				<br/>
				학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
				- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
				<br/>
				1. 수업을 제공할 수 없거나, 수업 장소를 제공할 수 없게 된 날 : 이미 납부한 수업비 등을 일한 계산한 금액 환불<br/>
				<br/>
				2. 수업기간이 1개월 이내의 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 총 수업 시간의 1/3 경과전 : 이미 납부한 수업비의 2/3에 해당액 환불<br/>
				- 총 수업 시간의 1/2 경과전 : 이미 납부한 수업비용의 1/2에 해당액 환불<br/>
				- 총 수업시간의 1/2 경과후 : 반환하지 않음<br/>
				<br/>
				3.수업 기간이 1개월을 초과하는 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불 * 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함<br/>
				</div>
</div>
<div style="height:500px;"></div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
        <script>
        $(document).ready(function(){
        	 $('.my2').css('color','orange');
        	  
        	 $('.refund').click(function(){
      			$('.refund-content').show();
      			});
      		
         	 $('.refund-close').click(function(){
        		 $('.refund-content').hide();
      		 });
         	 
         	 
         	 $('.m-jbMenu').append('거래제안서');
        	  
          });
		</script>
		
</body>
</html>