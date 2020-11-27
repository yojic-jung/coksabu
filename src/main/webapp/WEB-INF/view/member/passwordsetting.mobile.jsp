<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 정보 변경</title>
<meta charset="utf-8">
  <meta name="description" content="비밀번호 설정" />
  
  <style>
body{
background:#F6F6F6;
padding-bottom:100px;
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
.password1, .password2, .password3{
width:480px;
border-radius:10px;
border:1px solid dimgray;
padding:15px;
font-size:30px;
margin:20px;
}


.current{
	padding-bottom:15px;
	width:500px;
	margin:auto;
	font-size:30px;
}
.btn{
			margin-top:40px;
			margin-right:50px;
			padding:10px; 
        	background:dimgray;
        	color:white;
        	border-radius:10px;
        	border:none;
        	font-size:30px;
}

.cancel{
			margin-top:40px;
			padding:10px; 
			text-align:center;
        	color: dimgray;
        	font-weight:bolder;
        	border:3px solid dimgray;
        	border-radius:10px;
        	font-size:30px;
        	text-decoration:none;
        	
}
</style>
</head>
<body>
<div>


<div class="main-title">비밀번호 변경</div>

<form method='post'  commandName='memberInfo' onSubmit='return CheckForm(this)'>
<div class='content'>
<div class='current'>현재 비밀번호</div>
<div style='font-size:30px; width:500px; margin:auto;padding-bottom:40px;'>
<input class='password1' type='password' placeholder='기존 비밀번호를 입력해주세요.' name='password'/>
</div> 
</div>

<div class='content'>
<div class='current'>변경할 비밀번호</div>
<div style='font-size:30px; width:500px; margin:auto;'> 
<input class='password2' type='password' placeholder='변경할 비밀번호를 입력해주세요.' name='password2' id='password2'/>
 <br/>  <br/> 
 <input class='password3' type='password' placeholder='변경할 비밀번호를 한번 더 입력해주세요.' name='password3'/>
 </div>
 
 <div style='text-align:center;margin-top:100px;'>
 <input type='submit' class='btn' value='변경하기'/>  
  <a href="javascript:history.back()" style="text-decoration:none;"><span class="cancel">취소</span></a>
 </div> 
 </div>
 </form>
</div>

 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  
        	  $('.m-jbMenu').append("비밀번호 변경");
        	  
			  var status = "<c:out value="${status}" />"
        	  
        	  if(status=="error"){
        		  alert("비밀번호가 잘못 되었습니다. 현재 비밀번호, 변경할 비밀번호를 다시 확인해주세요.")
        	  }else if(status=="success"){
        		  alert("비밀번호가 성공적으로 변경되었습니다.")
        	  }
        	  
        	  
          });
          
          function CheckForm(memberInfo){
        	  var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
      			
      		var form = memberInfo;

      		if(!check(regex, form.password2,"패스워드는 8~15자의 영문, 숫자, 특수문자로 입력")) {
      	           return false;
      	       }
      		if(form.password2.value != form.password3.value){
      			alert('변경할 비밀번호가 일치 하지 않습니다.')
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