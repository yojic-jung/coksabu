<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>닉네임 정보 변경</title>
<meta charset="utf-8">
  <meta name="description" content="닉네임 설정" />
<style>
body{
background:#F6F6F6;
padding-bottom:100px;
}
.main-title{
	font-size:40px;
	padding:40px 0px 80px 0px;
	text-align:center;

}
.content{
	line-height:200%;
	padding:20px;
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

#nickname{
	width:480px;
border-radius:10px;
border:1px solid dimgray;
padding:15px;
font-size:20px;
margin:20px;
}
.cancel{
			margin-top:40px;
			padding:10px; 
        	color: dimgray;
        	font-weight:bolder;
        	border:3px solid dimgray;
        	border-radius:10px;
        	font-size:20px;
        	text-decoration:none;
}
</style>
</head>
<body>

<div style="text-align:center;font-size:20px;margin-top:40px;"><a href="/" style="color: orange;">홈으로 가기</a></div>
<div class="main-title">닉네임 변경</div>



<form method='post'  onSubmit='return CheckForm(this)'>
<div class='content'>
	<div class='current'>닉네임</div>
		<div style='font-size:30px; width:500px; margin:auto;'>
			<input id="nickname" type="text" name="nickname" value="${nickName}" />
		</div> 
		<div style="font-size:15px; width:500px; margin:0px auto 30px auto;padding:15px;">구매 또는 판매 내역이 있는 회원의 경우, 닉네임 변경이 제한됩니다.</div>
 		<div style='text-align:center'>
 			<input type='submit' class='btn' value='변경하기'/>  
 			 <a href="javascript:history.back()" style="text-decoration:none;"><span class="cancel">취소</span></a>
 		</div> 
 		
</div>
 </form>

 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
        $(document).ready(function(){
        	
        	var status = "<c:out value="${status}" />";
        	if(status=="existPurchase"){
        		alert("구매 또는 판매한 내역이 있는 회원의 경우, 닉네임 변경시 상대방이 거래내역을 찾기 힘들 수 있어 닉네임 변경을 할 수 없습니다.")
        	}
        	
        });
        
        function CheckForm(memberInfo){
      	  var nick = $('#nickname').val().trim();
      	  $('#nickname').val(nick);
      	  
      	  if(nick.length>8){
      		  alert("닉네임은 8글자 이하로 작성해주세요.");
      		  return false;
      	  }
      	  if(nick.length<2){
      		  alert("닉네임은 2글자 이상으로 작성해주세요.");
      		  return false;
      	  }
      	  var special_pattern =  /[~!@#$%^&*()_+|<>?:{}]/;
      	  if(special_pattern.test(nick) == true) { 
      		  alert("닉네임에 특수문자는 사용할 수 없습니다.");
      		  return false; 
      	  }
      	  var blank_pattern = /[\s]/g;
      	  if( blank_pattern.test(nick) == true){
      	    alert("공백은 사용할 수 없습니다.");
      	    return false;
      	  }
		}
          </script>
</body>
</html>