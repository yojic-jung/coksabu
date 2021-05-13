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
  <link rel="stylesheet" href= "<c:url value="/resources/css/loginM.css" />" />
  <link rel="canonical" href="https://coksabu.com/login">   
<meta name="viewport" content="user-scalable=no" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            font-family: 'Apple SD Gothic Neo','Malgun Gothic';
            -webkit-text-size-adjust:100%;
            -webkit-touch-callout: none;
          }
      
   .m-jbMenu{
          background:white;
          width:100%;
          padding:30px; 
          font-size:80px;
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          position:fixed;
 		  top:0px;
          z-index:99;
          text-align:center;
}
          
.m-title{
	   	 color:orange;
	   	 text-decoration: none;
	}
	
	.m-back{	
	   	 position:absolute;
	   	 left:0%; 
	   	 color:#A6A6A6;
	   	 padding:0px 50px;
	}
	
	.naver-customize{
	 background-image:url(<c:url value="/resources/img/naverbackground.png" />);
	font-family: 'Apple SD Gothic Neo','Malgun Gothic';font-size:40px;color:white;border-radius:10px; padding:20px;
	margin-bottom:50px;font-weight:bolder;
	}
	
	.apple-customize{
	width:100%;text-align:center;
	background:black;
	font-family: 'Apple SD Gothic Neo','Malgun Gothic';font-size:45px;color:white;border-radius:10px; font-weight:bolder;
	margin:20px auto 60px auto;cursor:pointer;height:104px;border:1px solid black;
	}
	
</style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
	<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
    <script>
  $(window).bind("pageshow", function(event) {
    	var broswerInfo = navigator.userAgent;
    	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    		$('.m-page-transit').fadeOut(200);
    	}else{
    		$('.m-page-transit').hide();
    	}
    });
 
  
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
            var userInputEmailId = $("input[name='email']").val();
            setCookie("userInputEmailId", userInputEmailId, 30); // 30일 동안 쿠키 보관
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

</head>
<body>
<header class="m-header">
  
    <div class="m-jbMenu">
    <span class="m-back">&lt;</span>
 		<a href="./" class="m-title">콕사부</a>
 	</div>
</header>

<div class="m-fix-background" style="height:160px"></div>

    <sec:authorize access="isAuthenticated()">
		<script>
		window.location="./";
		</script>
	</sec:authorize>
  <section>
  <div class="form-div">
  <div class="abc"><a href="./signup" style="text-decoration:underline; color:orange;">회원가입</a></div>
        <form id="postPageTran" method="post" action="./loginprocess">
            이메일<br/>
            <input name="email" class="form-input email" type="text"/><br/>
            비밀번호<br/>
            <input name="password" class="form-input" type="password"/><br/>
            <div>
            
             <label><input type="checkbox" id="emailSave" checked/> 이메일 기억하기</label><br/>
             <div style="display:none">
            	<input id = "remember_me" name ="remember-me" type = "checkbox" checked/>Remember me<br/>
			</div>
            </div>
            <div class="submit-btn" style="padding:20px;font-weight:bolder;">로그인</div>
           <input class="login" type="submit" value="로그인" />
        </form>
        
        <div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="display:none;"></div>
        
        <div class="apple-customize">
        <table style="width:100%;">
        	<tr>
        		<td><img src="<c:url value='/resources/img/appleLogo.png' />"  style="vertical-align: middle;width:71px;height:100px;"/></td>
        		<td style="text-align:center;">Sign in with Apple</td>
        	</tr>
        </table>
        </div>
        <div style="text-align:center;">
        
        	<div class="naver-customize">
        		<span style="font-weight:bolder;float:left;clear:right;">
        		<img src="<c:url value='/resources/img/naver.png' />"  style="width:90px;height:90px;"/>
        		</span>
        		네이버 아이디로 로그인
        	</div>
        	<div style="display:none;">
        		<div id="naverIdLogin"></div>
        	</div>
        </div>
        
        <div id="emailPassFind">아이디/비밀번호 찾기</div>
        
  </div>
  </section>    
  <div style="height:300px;"></div>
  <img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;display:none;"/>
  
<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

      <script>
      var linkLocation="";
      $(document).on("click","a",function(event){
    		//datepicker에서는 효과 미적용
    		if($(this).hasClass("ui-corner-all")){
    			return;
    		}
    		var broswerInfo = navigator.userAgent;
    		//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    			event.preventDefault();
    	        linkLocation = this.href;
    	        if($(this).attr("href")!="#"){
    	        	$('.m-page-transit').fadeIn(100);
    	            setTimeout(function(){redirectPage()}, 100);
    	        }
    		}
    	});
      
      
      
      $(document).on("click", '.m-back', function(){
    		var broswerInfo = navigator.userAgent;
    		//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    			var referpage = document.referrer;
    	        		$('.m-page-transit').fadeIn(200);
    			if(referpage==''){
    				setTimeout(function(){$('.m-page-transit').hide();location.href = './';}, 200);
    			}else{			
    				setTimeout(function(){$('.m-page-transit').hide();history.back();}, 200);
    			}
    		//웹뷰 아닌 그냥 모바일
    		}else{
    			var referpage = document.referrer;
    			if(referpage==''){
    				location.href = './';
    			}else{
    				history.back();
    			}
    		}
    	});
      
      $('#postPageTran').submit(function(){
   	      var broswerInfo = navigator.userAgent;
   	      //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
   	      if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
   	            $('#spinner').show();
  	      }
	  });	
      $(document).on("click", '.naver-customize', function(){
    	  var broswerInfo = navigator.userAgent;
   	      //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
   	      if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
   	            $('#spinner').show();
  	      }
      });
      
      $(window).bind("pageshow", function(event) {
      	$('#spinner').hide();
  	  });
      
      
  	var naverLogin = new naver.LoginWithNaverId(
  		{
  			clientId: "0PgcZhDTwaod8UwQsoKX",
  			callbackUrl: "https://m.coksabu.com/loginCallBackNaver",
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
      
	     
	 var state = "<c:out value="${state}" />";
  	 var client_nonce = "<c:out value="${client_nonce}" />";
	 
  	 var currentUrlApple = window.location.href;
	 var callbackUrlApple = '';
	 if(currentUrlApple.indexOf("www.coksabu.com") != -1){
		 callbackUrlApple = "https://www.coksabu.com/loginCallBackApple";
	 }else if(currentUrlApple.indexOf("m.coksabu.com") != -1){
		 callbackUrlApple = "https://m.coksabu.com/loginCallBackApple";
	 }else{
		 callbackUrlApple = "https://coksabu.com/loginCallBackApple";
     } 
	 
	 
    
    
  	 AppleID.auth.init({
	         clientId : 'com.coksabu.coksabu',
	         scope : 'name email',
	         redirectURI : callbackUrlApple,
	         state : state,
	         nonce : client_nonce,
	 });  
  	
      </script>
</body>
</html>