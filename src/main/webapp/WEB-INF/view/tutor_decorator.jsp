<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyMMddHHmm" />
</c:set>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/commonHeader.css?date=${date}"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/commonFooter.css?date=${date}"/>">
<style>
@font-face {
	font-family: 'JejuGothic';
	src: url(< c : url value = "/resources/JejuGothic-Regular.ttf"/ >)
		format('truetype');
}

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body {
	margin: 0px;
	padding: 0px;
	font-family: 'Apple SD Gothic Neo', 'Malgun Gothic';
	-webkit-text-size-adjust: 100%;
	-webkit-touch-callout: none;
}

.menu-title {
	text-align: center;
	font-size: 20px;
	color: white;
	padding: 25px;
}

.mypage {
	font-size: 25px;
	text-align: center;
	list-style: none;
	padding-bottom: 30px;
}

.mypage>li {
	font-family: 'JejuGothic';
	padding: 20px;
	display: inline;
}

.mypage a {
	color: rgb(201, 199, 199);
	text-decoration: none;
}

.changeToCustom {
	font-weight: bolder;
	color: dimgray;
	text-decoration: underline;
	border-radius: 5px;
	border: 2px solid dimgray;
	padding: 5px;
}
</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'G-4EM47WXQJ0');
	gtag('config', 'AW-413632618');
</script>
<!-- Facebook Pixel Code -->
<script>
	!function(f, b, e, v, n, t, s) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
					.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
		t = b.createElement(e);
		t.async = !0;
		t.src = v;
		s = b.getElementsByTagName(e)[0];
		s.parentNode.insertBefore(t, s)
	}(window, document, 'script',
			'https://connect.facebook.net/en_US/fbevents.js');
	fbq('init', '2787801881458923');
	fbq('track', 'PageView');
</script>
<noscript>
	<img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1" />
</noscript>
<!-- End Facebook Pixel Code -->
<decorator:head />
</head>
<body>

	<c:choose>
		<c:when test="${currentDevice.mobile}">
			<%@ include file="/WEB-INF/view/include/mHeader2.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/view/include/pcHeader.jsp"%>
		</c:otherwise>
	</c:choose>

	<div class="pc-tutor" style="background: rgb(46, 46, 46); color: rgb(219, 218, 218); font-size: 14px;">
		<div class="menu-title">튜터전용</div>
		<ul class="mypage" style="min-width: 600px;">
			<li><a href="./tutorpage" class="tutor2">프로필/수업 관리</a></li>
			<li><a href="./saleslist" class="tutor3">판매목록</a></li>
		</ul>




	</div>

	<div class="pc-tutor2" style="background: rgb(233, 232, 232); text-align: right; padding: 30px 30px 0px 0px;">
		<a href="./mypage" style="text-decoration: none;">
			<span class="changeToCustom">&hArr;고객으로 전환</span>
		</a>
	</div>


	<decorator:body />

	<c:choose>
		<c:when test="${currentDevice.mobile}">
			<%@ include file="/WEB-INF/view/include/mFooter2.jsp"%>
			<jsp:include page="/WEB-INF/view/include/mPageTransit.jsp"/>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/view/include/pcFooter.jsp"%>
		</c:otherwise>
	</c:choose>
	
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {

			var filter = "win16|win32|win64|mac|macintel";

			if (navigator.platform) {
				if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
					$('#botMyroom').attr('src','/resources/img/my2.png');
					$('#botMyroomStr').css('color','orange')
					$('.pc-tutor').remove();
					$('.pc-tutor2').remove();
				} 
			}

		});
	</script>

	<%
		session = request.getSession();
		String messageStatus = (String) session.getAttribute("messageStatus");
		if (messageStatus != null && messageStatus.equals("exist")) {
	%>
	<script>
		$('.message-notify')
				.after(
						'<span style="display:inline-block;vertical-align:top;width:6px;height:6px;border-radius:3px;background:red;"></span>');
		$('.m-message-notify')
				.after(
						'<span style="display:inline-block;vertical-align:top;width:16px;height:16px;border-radius:8px;background:red;"></span>');
	</script>
	<%
		}
	%>

</body>
</html>