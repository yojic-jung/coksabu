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
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href= "<c:url value="/resources/css/loginM.css" />" />
  

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
    
    
    $("#emailPassFind").click(function(){
    	 window.location='./emailPassFind';
    });
    $(".btn").click(function() { 
		$("#menu").animate({
			left:"0px"
		},100, function(){
		});

		$("#menu2").animate({
			left:"70%"
		},100, function(){
		})
	});

	$(".close").click(function() { 
		$("#menu").animate({
			left:"-71%"
		},100, function(){

		});

		$("#menu2").animate({
			left:"-70%"
		},100, function(){
		})
	});

	$("#menu2").click(function() { 
		$("#menu").animate({
			left:"-71%"
		},100, function(){

		});

		$("#menu2").animate({
			left:"-70%"
		},100, function(){
		})
	});
	
	
	$(".submit-btn").click(function() {
		$('.login').trigger('click');
		
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

</head>
<body>
    <sec:authorize access="isAuthenticated()">
		<script>
		window.location="./";
		</script>
	</sec:authorize>
  <section>
  <div class="form-div">
  <div class="abc"><a href="./signup" style="text-decoration:underline; color:orange;">회원가입</a></div>
        <form method="post" action="./loginprocess">
            이메일<br/>
            <input name="email" class="form-input" type="text"/><br/>
            비밀번호<br/>
            <input name="password" class="form-input" type="password"/><br/>
            <div>
            
             <label><input type="checkbox" id="emailSave" checked/> 이메일 기억하기</label><br/>
             <div style="display:none">
            	<input id = "remember_me" name ="remember-me" type = "checkbox" checked/>Remember me<br/>
			</div>
            </div>
            <div class="submit-btn">로그인</div>
           <input class="login" type="submit" value="로그인" />
        </form>
        <div id="emailPassFind">아이디/비밀번호 찾기</div>
  </div>
  </section>    
      
</body>
</html>