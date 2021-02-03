<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매확정 거래 콕사부</title>
 <meta name="description" content="구매 성공, 최종 구매내역 및 선생님 정보 안내" />
<meta charset="utf-8">
<title>콕사부</title>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" /> 
<style>
@charset "UTF-8";
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          .jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 1px orange;
          }
          .top-title{
            float:left;
            height:100%;
            text-align:center;
          }
          .top-right{
          text-align:center;
          margin-right:150px;
          vertical-align:center;
          font-size:30px;
          font-family:'JejuGothic';
          padding-top:20px;
          clear:right;
          }
          .message{
			border-radius:10px;
			background: rgb(231, 231, 231);          
           width:70%;padding:40px;margin:auto;
           margin-top:30px;
           font-size:24px; 
           line-height:150%;
           text-align:center;
           
          }
          
          .account-table{
          	border-spacing:0px; background:rgb(231, 231, 231);margin: 30px auto; width:80%;
          }
          
          .account-table td{
          	padding:20px;
          }
          .first{
          	font-family:'Malgun Gothic';
          	font-size:30px;
          }
           .second{
          	font-family:'JejuGothic';
          	font-size:30px;
          }
</style>
</head>
<body>

<div style="width:80%; margin:60px auto; font-family:'JejuGothic';">
	<div style="width:40%;font-size:30px;margin:auto;font-weight:bolder;text-align:center;">
	<img style="width:300px; height:300px;border-radius:150px;" src="<c:url value="/img/profileImg/${imgpath}" />"  alt="선생님 프로필이미지"/><br/>
	${sellernickname} 선생님
	</div>
	<div class="message" >
	${buyername}님 수업을 신청해주셔서 감사합니다.<br/> 결제 완료되면 서비스가 진행됩니다.<br/> 아래의 결제정보를 확인해주세요.
	</div>
</div>

<hr style="width:80%; margin:0px auto 30px auto; border:0.7px solid black;"/>

<div style="width:70%; margin:auto;font-family:'JejuGothic';text-align:center;border:0.7px solid gray;">
<div style="font-size:35px; padding:30px; color:orange;">수업 신청이 완료 되었습니다.</div>
<div style="font-size:30px;">결제금액을 아래의 계좌로 입금해주세요.</div>

<table class="account-table" >
<tr>
<td class="first">은행</td>
<td class="second">${bank1 }</td>
</tr>


<tr>
<td class="first">가상계좌</td>
<td class="second">${bank2 }</td>
</tr>

<tr>
<td class="first">예금주</td>
<td class="second">${bank3 }</td>
</tr>

<tr>
<td class="first">금액</td>
<td class="second">${price3 }</td>
</tr>

<tr>
<td class="first">입금기한</td>
<td class="second">${depositDay}</td>
</tr>

<tr>
<td class="first">입금자명</td>
<td class="second">${depositor}</td>
</tr>

</table>

	<div style="font-size:25px;margin:20px 0px;">수업시작 전까지 입금을 만료해주시기 바랍니다.</div>
</div>
<div style="text-align:center;margin:50px auto;">
		<a href="./purchaselist" style="color:white;text-decoration:none;">
		<button style="width:400px; color:white; padding:20px; background:rgb(34, 36, 51);border:none;font-size:30px;">완료</button>
		</a>
</div>
<div style="height:300px;"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(document).ready(function(){
	$('.m-jbMenu').append("주문완료");
});
</script>
</body>
</html>