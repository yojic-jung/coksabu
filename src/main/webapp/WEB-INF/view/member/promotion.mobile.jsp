<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>프로모션 및 쿠폰등록, 콕사부</title>
<meta charset="utf-8">
  <meta name="description" content="프로모션 및 쿠폰등록" />
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
body{
background:#F6F6F6;
padding-bottom:100px;
word-break:keep-all;
}
.main-title{
	font-size:40px;
	padding:80px;
	text-align:center;

}
.content{
	line-height:200%;
	padding:20px;
}
.prmtCode{
width:100%;
border-radius:10px;
border:1px solid dimgray;
padding:20px;
font-size:40px;
margin:50px 0px 50px 0px;
}


.current{
	padding-bottom:15px;
	width:500px;
	margin:auto;
	font-size:30px;
}
.btn{
			-webkit-appearance:none;
			margin-top:40px;
			margin-right:50px;
			padding:20px; 
        	background:dimgray;
        	color:white;
        	border-radius:10px;
        	border:none;
        	font-size:40px;
        	
}

</style>
</head>
<body>

<div class="main-title"><a href="/" style="color: orange;">홈으로 가기</a></div>


<form method='post'  onSubmit='return CheckForm(this)'>
<div class='content'>
<div class='current'></div>
<div style='font-size:35px; width:80%; margin:auto;padding-bottom:20px;text-align:center'>
<div style="padding-bottom:30px;line-height:150%;">현재 진행중인 프로모션이 없습니다.</div>
<input class='prmtCode' type='text' placeholder='프로모션 코드 및 쿠폰을 등록 해주세요.' name='code' readonly/>
<input type='submit' class='btn' value='등록하기'/>  
</div>
</div>
</form>

<div style="width:90%;margin:80px auto 0px auto;font-family:JejuGothic;">
	<c:if test="${promotion != null }">
	<div style="padding-left:20px;font-size:35px;">나의 프로모션 "<span style="color:orange">이용내역</span>"</div>
		<table style="border-spacing:20px;color:dimgray;font-size:30px;line-height:150%;">
			<tr>
				<td style="border-bottom:2px solid black;" colspan="4"></td>
			</tr>
			<tr style="color:black;text-align:center;">
				<td>프로모션</td><td>프로모션 내용</td><td>기간</td>
			</tr>
			<tr>
				<td style="border-bottom:1px solid lightgray;" colspan="3"></td>
			</tr>
			<tr>
				<td style="text-align:center;">${promotion.title }</td><td>${promotion.content}</td><td style="text-align:center;">${promotion.startDateS}<br/>~<br/>${promotion.endDateS}</td>
			</tr>			
		</table>
	</c:if>
</div>
<div style="height:400px;"></div>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
        $(document).ready(function(){
        	  
        	  $('.m-jbMenu').append("프로모션 쿠폰");
        	  
          });
          
          function CheckForm(memberInfo){
        		if($('.prmtCode').val().length == 0){
        			alert('프로모션 코드 및 쿠폰 코드를 입력해주세요.')
        			return false;
        		}else if($('.prmtCode').val().length > 20){
        			alert('프로모션 코드 및 쿠폰 코드는 20글자 미만입니다.')
        			return false;
        		}
          }
          
          </script>
</body>
</html>