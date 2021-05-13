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
  	.naver-customize{
	 background-image:url(<c:url value="/resources/img/naverbackground.png" />);
	font-family: 'Apple SD Gothic Neo','Malgun Gothic';font-size:15px;color:white;border-radius:10px;font-weight:bolder;
	margin:20px auto;cursor:pointer;
	}
	.apple-customize{
	width:100%;text-align:center;
	background:black;
	font-family: 'Apple SD Gothic Neo','Malgun Gothic';font-size:15px;color:white;border-radius:10px; font-weight:bolder;
	margin:20px auto;cursor:pointer;border:1px solid black;
	}
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
	<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
    <script>
$(document).ready(function(){
	
	 var ex = "<c:out value="${ERRORMSG}" />"
	    if(ex !="")
	    	alert(ex);
	
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputEmailId = getCookie("userInputEmailId");
    $("input[name='email']").val(userInputEmailId); 
     
    if($("input[name='email']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#emailSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#emailSave").change(function(){ // 체크박스에 변화가 있다면,
        if($("#emailSave").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputEmailId = $("input[name='email']").val();
            setCookie("userInputEmailId", userInputEmailId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputEmailId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#emailSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputEmail = $("input[name='email']").val();
            setCookie("userInputEmailId", userInputEmail, 30); // 30일 동안 쿠키 보관
        }
    });
    
    
    $('.apple-customize').click(function(){
		   $('#appleid-signin').trigger("click");
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
        <form id="login-box" method="post" action="./loginprocess">
            이메일<br/>
            <input name="email" class="form-input email" type="text"/><br/>
            비밀번호<br/>
            <input name="password" class="form-input" type="password"/><br/>
            <div>
            <div id="emailPassFind"><a href="./emailPassFind">아이디/비밀번호 찾기</a></div>
            <div class="abc"><a href="./signup" style="float:right;">회원가입</a></div><br/>
            </div>
            <label><input type="checkbox" id="emailSave" /> 이메일 기억하기</label><br/>
            <div style="display:none">
            <input id="remember_me" name ="remember-me" type="checkbox" checked/>Remember me<br/>
			</div>
            <input style="padding:10px;font-size:15px; width:350px; background-color:rgb(68, 68, 68); 
            color : white; border:none; border-radius:5px; margin-top:20px;cursor:pointer;"
             type="submit" value="로그인" />
        </form>
        
        <div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="width:100%;height:45px;margin:20px auto;cursor:pointer;display:none;"></div>
        <div class="apple-customize">
       			<img src="<c:url value='/resources/img/appleLogo.png' />"  style="vertical-align: middle;width:32px;height:45px;"/>
        		Sign in with Apple
        </div>
        <div style="text-align:center;">
        	<div class="naver-customize">
        		<img src="<c:url value='/resources/img/naver.png' />"  style="vertical-align:middle;width:45px;height:45px;"/>
        		네이버 아이디로 로그인
        	</div>
        	<div style="display:none;">
        		<div id="naverIdLogin"></div>
        	</div>
        </div>
    </div>
</div>
  </section>    
      <script>
      
      var currentUrlNaver = window.location.href;
      var callbackUrlNaver = '';
      if(currentUrlNaver.indexOf("www.coksabu.com") != -1){
    	  callbackUrlNaver = "https://www.coksabu.com/loginCallBackNaver";
      }else{
    	  callbackUrlNaver = "https://coksabu.com/loginCallBackNaver";
      }
      
     
      
      var naverLogin = new naver.LoginWithNaverId(
    	  		{
    	  			clientId: "0PgcZhDTwaod8UwQsoKX",
    	  			callbackUrl: callbackUrlNaver,
    	  			isPopup: false, /* 팝업을 통한 연동처리 여부 */
    	  			loginButton: {color: "green", type: 3, height: 170} /* 로그인 버튼의 타입을 지정 */
    	  		}
    	  	);
    	  	
    	  	/* 설정정보를 초기화하고 연동을 준비 */
    	  	naverLogin.init();
    	  	
    	  	$(document).on("click",".naver-customize",function(event){
    	  	  naverLogin.init(); 
    	  	  location.href = naverLogin.generateAuthorizeUrl();
    		});
    	  	
    	  	$(document).ready(function(){
    	  	 
    	  		
    	     var currentUrlApple = window.location.href;
       	     var callbackUrlApple = '';
       	     if(currentUrlApple.indexOf("www.coksabu.com") != -1){
       	     	callbackUrlApple = "https://www.coksabu.com/loginCallBackApple";
       	     }else if(currentUrlApple.indexOf("m.coksabu.com") != -1){
       	     	callbackUrlApple = "https://m.coksabu.com/loginCallBackApple";
       	     }else{
     	     	callbackUrlApple = "https://coksabu.com/loginCallBackApple";
     	     }
       	     
       	     
       	     
       	  	 var state = "<c:out value="${state}" />";
          	 var client_nonce = "<c:out value="${client_nonce}" />";
          	 AppleID.auth.init({
       	         clientId : 'com.coksabu.coksabu',
       	         scope : 'name email',
       	         redirectURI : callbackUrlApple,
       	         state : state,
       	         nonce : client_nonce,
       	     });
    	  	})  	
    	  	 
    	     	  	
    	  	
    </script>
</body>
</html>