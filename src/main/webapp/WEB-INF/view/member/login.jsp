<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 콕사부</title>
  <meta charset="utf-8">
  <meta name="description" content="로그인 하기" />
    <style>
      @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          
          .login-form{
              min-height:410px;
              width:410px;
              line-height: 250%;
              margin:60px auto;
          }
          .login-logo{
            width:200px;
            margin:auto;
            margin-bottom: 20px;
          }
          .login-main{
              border:1px solid lightgray;
              border-radius:5px;
              padding:30px;
              font-size:14px;
          }

          .login-main a{
            text-decoration:none;
            color:gray;
            font-size:14px;
          }
          .login-main a:hover{
              text-decoration:underline;
          }

          .form-input{
              width:350px;
              height:35px;
              border-radius:5px;
          }
          
          #emailPassFind{
          	float:left;
          	color:dimgray;
          }
          #emailPassFind > a{
          	color:dimgray;
          	text-decoration:none;
          }
          #emailPassFind:hover{
          		text-decoration:underline;
          }
  
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  
    <script>
$(document).ready(function(){
	
	 var ex = "<c:out value="${ERRORMSG}" />"
	    if(ex !="")
	    	alert(ex);
	
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputEmail = getCookie("userInputEmail");
    $("input[name='email']").val(userInputEmail); 
     
    if($("input[name='email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#emailSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#emailSave").change(function(){ // 체크박스에 변화가 있다면,
        if($("#emailSave").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputEmail");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#emailSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmail", userInputEmail, 30); // 30일 동안 쿠키 보관
        }
    });
    
});
    
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    	
    </script>
    	
    	<sec:authorize access="isAuthenticated()">
			<script>
				window.location="./";
			</script>
		</sec:authorize>
</head>
<body>

  <section style="min-height:500px">
    <div class="login-form">
    <div class="login-logo"><a href="./"><img style="width:200px" src="<c:url value="/resources/images/logo.png" />"   alt="로고"/></a></div>
    <div class="login-main">
        <form method="post" action="./loginprocess">
            이메일<br/>
            <input name="email" class="form-input" type="text"/><br/>
            비밀번호<br/>
            <input name="password" class="form-input" type="password"/><br/>
            <div>
            <div id="emailPassFind"><a href="./emailPassFind">아이디/비밀번호 찾기</a></div>
            <div class="abc"><a href="./signup" style="float:right;">회원가입</a></div><br/>
            </div>
            <label><input type="checkbox" id="emailSave" /> 이메일 기억하기</label><br/>
            <div style="display:none">
            <input id = "remember_me" name ="remember-me" type = "checkbox" checked/>Remember me<br/>
			</div>
            <input style="padding:15px; width:350px; background-color:rgb(68, 68, 68); 
            color : white; border:none; border-radius:5px; margin-top:20px;"
             type="submit" value="로그인" />
        </form>
    </div>
</div>
  </section>    
      
</body>
</html>