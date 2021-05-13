<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
  <title>회원가입완료, 콕사부</title>
    <meta name="description" content="회원가입 페이지" />
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>

<!-- Event snippet for 가입 conversion page -->
<script>
  gtag('event', 'conversion', {'send_to': 'AW-413632618/Emm8CI67sfkBEOqQnsUB'});
</script>
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
fbq('track', 'CompleteRegistration', {currency: "KRW", value: 1.00});
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
<script>
setTimeout(function(){
	alert("감사합니다. 정상적으로 회원가입 되셨습니다.")
	window.location.href="./?cok_tutorial=first_user"
},1000);

</script>
</body>
</html>