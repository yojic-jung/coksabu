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
	padding:40px 0px 40px 0px;
	text-align:center;

}
.content{
	line-height:200%;
	padding:20px;
}
.prmtCode{
width:480px;
border-radius:10px;
border:1px solid dimgray;
padding:15px;
font-size:20px;
margin:20px;
}


.current{
	padding-bottom:15px;
	width:500px;
	margin:auto;
	font-size:18px;
}
.btn{
			margin-top:40px;
			margin-right:20px;
			padding:10px; 
        	background:dimgray;
        	color:white;
        	border-radius:10px;
        	border:none;
        	font-size:20px;
}

</style>
</head>
<body>
<div>

<div style="text-align:center;font-size:20px;margin-top:40px;"><a href="/" style="color: orange;">홈으로 가기</a></div>
<div class="main-title">프로모션 및 쿠폰 등록</div>



<form method='post'  commandName='memberInfo' onSubmit='return CheckForm(this)'>
<div class='content'>
<div class='current'></div>
<div style='font-size:30px; width:500px; margin:auto;padding-bottom:20px;'>
<div style="font-size:20px;padding-bottom:10px;">현재 진행중인 선생님 수수료 무료 프로모션은 회원가입 날짜로부터 2개월간 적용됩니다.</div>
<input class='prmtCode' type='text' placeholder='프로모션 코드 및 쿠폰을 등록 해주세요.' name='code'/>
 <div style='text-align:center'>
<input type='submit' class='btn' value='등록하기'/>  
</div>
</div> 
</div>
</form>

<div style="width:700px;margin:40px auto 0px auto;font-family:JejuGothic;">
	<c:if test="${promotion != null }">
	<div style="padding-left:20px;font-size:18px;">나의 프로모션 "이용내역"</div>
		<table style="border-spacing:20px;color:dimgray;">
			<tr>
				<td style="border-bottom:2px solid black;" colspan="4"></td>
			</tr>
			<tr style="color:black;">
				<td style="width:100px;">프로모션</td><td>프로모션 내용</td><td style="width:100px;">시작날짜</td><td style="width:100px;">종료날짜</td>
			</tr>
			<tr>
				<td style="border-bottom:1px solid lightgray;" colspan="4"></td>
			</tr>
			<tr>
				<td>${promotion.title }</td><td>${promotion.content}</td><td>${promotion.startDateS}</td><td>${promotion.endDateS}</td>
			</tr>			
		</table>
	</c:if>
</div>

 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  
        	 
        	  
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