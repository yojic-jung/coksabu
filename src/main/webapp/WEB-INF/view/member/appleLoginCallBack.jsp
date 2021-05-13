<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
  <title>회원가입, 콕사부</title>
    <meta name="description" content="애플로 로그인" />
    <meta charset="utf-8">
    <style>

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            
          }
          
	</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '2787801881458923');
</script>
<!-- End Facebook Pixel Code -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-413632618');
</script>
</head>
<body>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1"
/></noscript>

<div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="width:10px;height:5px;"></div>

    <img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;"/>
<script>
$(document).ready(function(){
	 var appleCerity = "<c:out value="${appleCerity}" />";
	 console.log(appleCerity);
	 if(appleCerity=='fail'){
		 alert("로그인 인증에 실패하였습니다.\n다시 로그인 시도해주시기 바랍니다.");
		 window.location.href="./login";
	 }
	 
	var status = "<c:out value="${status}" />"

	if(status=='signUp'){
		fbq('track', 'CompleteRegistration', {currency: "KRW", value: 1.00});
		gtag('event', 'conversion', {'send_to': 'AW-413632618/Emm8CI67sfkBEOqQnsUB'});
		alert("감사합니다. 정상적으로 회원가입 되셨습니다.")
		window.location.href="./?cok_tutorial=first_user"
	}else if(status=='goLogin'){
	  	window.location='./';
	}
});
</script>
</body>
</html>