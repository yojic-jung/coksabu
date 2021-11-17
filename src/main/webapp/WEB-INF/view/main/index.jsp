<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>콕사부</title>
<meta charset="euc-kr">
<meta name="description" content="내가 찾던 수업을 만나는 곳, 콕사부입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="콕사부">
<meta property="og:site_name" content="콕사부">
<meta property="og:description" content="내가 찾던 수업을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com">
<meta name="facebook-domain-verification" content="p4cmwcul9alesb9w73uj30zly7m99z" />
<!-- 뷰포트 화면깨지면 없애주기  -->
<meta name="viewport" content="width=device-width">
<meta name="naver-site-verification" content="09c0582232b10c99588e1c356cb1c1d08d7c28e0" />
<meta name="google-site-verification" content="p08VIDL4nCSNtPHj4o5tkE5_kxA34KzlSkwzGyOTTzk" />

<link rel="canonical" href="http://www.coksabu.com">

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyMMddHHmm" />
</c:set>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/slick/slick.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/slick/slick-theme.css" />">
<link rel="stylesheet" href="<c:url value="/resources/colorbox.css" />" />
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/index.css?date=${date}"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/commonHeader.css?date=${date}"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/commonFooter.css?date=${date}"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/include/pcLessonCard.css?v=2"/>">

<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<script src="<c:url value="/resources/js/jquery.innerfade.js"/>"></script>
<script src="<c:url value="/resources/slick/slick.js" />" type="text/javascript" charset="utf-8"></script>
<script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
<script src="resources/js/include/lessonCard.js"></script>

<style>
html, body{ 
height: 100%;
}
.hide {
	display: none;
}
.main-login {
	width: 400px;
	margin: auto;
	font-weight: bolder;
	text-align: center;
}
.fade-div1 {
	background:rgb(251,248,243);
	height: 100%;
	width: 100%;
}

.fade-div2 {
	background:rgb(251,248,243);
	height: 100%;
	width: 100%;
}

.fade-div3 {
	background:rgb(251,248,243);
	height: 100%;
	width: 100%;
}
.fade-img{
	position: absolute;
	top: 10%;
	left:45%;
	width:35%;
}
.contents-ui{
	position: absolute;
	top: 10%;
	left:45%;
	width:40%;
}
.school-img{
	position: absolute;
	top: 50%;
	left:50%;
	width:10%;
}
.cok-img{
	position: absolute;
	top: 15%;
	left:20%;
	width:5%;
	animation: target_updown 2s; 
 	animation-iteration-count: infinite;
}

.social-img{
	position: absolute;
	top: 25%;
	left:20%;
	width:5%;
	opacity:0.5;
}
@keyframes target_updown {

 0% { top: 15%;}

 50% { top: 20%; }

 100% { top: 15%;}

}
</style>
</head>
<body>
	<div style="height:100%;">

		<noscript>
			<img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1" />
		</noscript>
		<%@ include file="/WEB-INF/view/include/pcHeader.jsp"%>
<!-- 
		<div style="display: none; font-size: 15px; color: gray;">
			<div id="menu">

				<table>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=11">수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=21">외국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=31">국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=41">사회</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=51">과학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=61&subject=61">예체능</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=71&subject=71">자소서/입시</a>
						</td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=12">초등수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=22">초등영어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=32">초등국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=42">초등사회</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=52">초등과학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=61&subject=62">미술</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=71&subject=72">자소서첨삭</a>
						</td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=13">중등수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=23">중등영어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=33">중등국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=43">중등사회</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=53">중등과학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=61&subject=63">음악</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=71&subject=73">입시컨설팅</a>
						</td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=14">고등수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=24">고등영어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=34">고등국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=44">고등사회</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=54">고등과학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=61&subject=64">체육</a>
						</td>
						<td></td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=15">이과수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=25">수능영어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=35">수능국어</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=451">사회탐구</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=55">물리</a>
						</td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=16">문과수학</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=26">영어회화</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=31&subject=36">국어논술</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=41&subject=46">한국사</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=56">생명과학</a>
						</td>
						<td></td>
						<td></td>
					</tr>


					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=17">수학논술</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=27">toeic/tofle/teps</a>
						</td>
						<td></td>
						<td></td>
						<td class="menu-td">
							<a href="./boarder?main=51&subject=57">지구과학</a>
						</td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td class="menu-td">
							<a href="./boarder?main=11&subject=18">수학경시</a>
						</td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=28">일본어</a>
						</td>
						<td></td>
						<td></td>
						<td class="menu-td">
							<a href="/boarder?main=51&subject=58">화학</a>
						</td>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td></td>
						<td class="menu-td">
							<a href="./boarder?main=21&subject=29">중국어</a>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</table>

			</div>
		</div>

		<div class="main-search">
			<input type="text" class="main-input" href="#menu" placeholder="원하시는 수업을 찾아보세요..." />
			<button class="search-button">검색</button>
		</div>
-->
		<ul id="inner-fade">
			<li>
				<div class="fade-div1">
					<img src="<c:url value="/resources/images/main-phone.png" />" class="fade-img" />
					<img src="<c:url value="/resources/images/cok.png" />" class="cok-img" />
					<img src="<c:url value="/resources/images/cok-people.png" />" class="social-img" />
					<div class="fade-content" style="text-align: center;">
					콕콕콕!
					<br />
					당신이 찾는
					<br />
					 사부를 만나보세요
					 <div class="main-login" style="cursor:pointer;padding-top:70px;text-align:center;"><span style="font-size:20px;color:white;padding:10px 30px;border-radius:10px;background:orange;">수업목록</span></div>
					</div>
					
				</div>
			</li>
			<li>
				<div class="fade-div2">
					<img src="<c:url value="/resources/images/cok.png" />" class="cok-img" />
					<img src="<c:url value="/resources/images/cok-people.png" />" class="social-img" />
					<div class="fade-content">
					검증된 선생님과 매칭
					<br />
					거래부터 환불까지
					<br />
					"안전거래 과외플랫폼"
					<div class="main-login" style="cursor:pointer;padding-top:70px;text-align:center;"><span style="font-size:20px;color:white;padding:10px 30px;border-radius:10px;background:orange;">수업목록</span></div>
					</div>
				</div>
			</li>
			<li>
				<div class="fade-div3">
					<img src="<c:url value="/resources/images/contents-ui.png" />" class="contents-ui" />
					<img src="<c:url value="/resources/images/school.png" />" class="school-img" />
					<img src="<c:url value="/resources/images/cok.png" />" class="cok-img" />
					<img src="<c:url value="/resources/images/cok-people.png" />" class="social-img" />
					<div class="fade-content">
					컨텐츠 자료실에서
					<br />
					우리학교 기출문제도
					<br />
					다운 받을 수 있어요
					<div class="main-login" style="cursor:pointer;padding-top:70px;text-align:center;"><span style="font-size:20px;color:white;padding:10px 30px;border-radius:10px;background:orange;">수업목록</span></div>
					</div>
				</div>
			</li>
		</ul>

		<div style="text-align: center; font-family: 'JejuGothic'; padding: 30px; background: #F6F6F6">
			<div style="margin-bottom: 30px;">콕사부 서비스 내용이 궁금하신가요??</div>
			<div style="margin: 30px;">
				<a href="./useGuide" style="text-decoration: none; color: white;"><span style="padding: 10px; border-radius: 10px; background: orange; font-size: 18px;">"콕사부 이용가이드"</span></a>
			</div>
		</div>

		<nav>
			<table class="category">
				<tr class="categoryTr">
					<td>
						<a href="./boarder?main=11&subject=11">수학</a>
					</td>
					<td>
						<a href="./boarder?main=21&subject=21">외국어</a>
					</td>
					<td>
						<a href="./boarder?main=31&subject=31">국어</a>
					</td>
					<td>
						<a href="./boarder?main=41&subject=41">사회</a>
					</td>
					<td>
						<a href="./boarder?main=51&subject=51">과학</a>
					</td>
					<td>
						<a href="./boarder?main=61&subject=61">예체능</a>
					</td>
					<td>
						<a href="./boarder?main=71&subject=71">자소서/입시</a>
					</td>
				</tr>
			</table>
		</nav>
		<div class="a2" style="width: 1000px; min-width: 1000px; min-height: 350px; padding-bottom: 20px; border: 2px solid black; margin: 20px auto 100px auto;">
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=11&subject=12"><div>초등수학</div> <a href="./boarder?main=11&subject=13"><div>중등수학</div></a> <a href="./boarder?main=11&subject=14"><div>이과수학</div></a> <a href="./boarder?main=11&subject=15"><div>문과수학</div></a> <a href="./boarder?main=11&subject=16"><div>고등수학</div></a> <a href="./boarder?main=11&subject=17"><div>수학논술</div></a> <a href="./boarder?main=11&subject=18"><div>수학경시</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=0 && status.index<3}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=21&subject=22"><div>초등영어</div></a> <a href="./boarder?main=21&subject=23"><div>중등영어</div></a> <a href="./boarder?main=21&subject=24"><div>고등영어</div></a> <a href="./boarder?main=21&subject=25"><div>수능영어</div></a> <a href="./boarder?main=21&subject=26"><div>영어회화</div></a> <a href="./boarder?main=21&subject=27"><div>toeic/tofle/teps</div></a> <a href="./boarder?main=21&subject=28"><div>일본어</div></a> <a href="./boarder?main=21&subject=29"><div>중국어</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=3 && status.index<6}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=31&subject=32"><div>초등국어</div></a> <a href="./boarder?main=31&subject=33"><div>중등국어</div></a> <a href="./boarder?main=31&subject=34"><div>고등국어</div></a> <a href="./boarder?main=31&subject=35"><div>수능국어</div></a> <a href="./boarder?main=31&subject=36"><div>국어논술</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=6 && status.index<9}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=41&subject=42"><div>초등사회</div></a> <a href="./boarder?main=41&subject=43"><div>중등사회</div></a> <a href="./boarder?main=41&subject=44"><div>고등사회</div></a> <a href="./boarder?main=41&subject=451"><div>사회탐구</div></a> <a href="./boarder?main=41&subject=46"><div>한국사</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=9 && status.index<12}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=51&subject=52"><div>초등과학</div></a> <a href="./boarder?main=51&subject=53"><div>중등과학</div></a> <a href="./boarder?main=51&subject=54"><div>고등과학</div></a> <a href="./boarder?main=51&subject=55"><div>물리</div></a> <a href="./boarder?main=51&subject=56"><div>생명과학</div></a> <a href="./boarder?main=51&subject=57"><div>화학</div></a> <a href="./boarder?main=51&subject=58"><div>지구과학</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=12 && status.index<15}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>

			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=61&subject=62"><div>미술</div></a> <a href="./boarder?main=61&subject=63"><div>음악</div></a> <a href="./boarder?main=61&subject=64"><div>체육</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=15 && status.index<18}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div class='cont dispno'>
				<div class="frame1">
					<p class="frame-cate">카테고리</p>
					<hr />
					<a href="./boarder?main=71&subject=72"><div>자소서첨삭</div></a> <a href="./boarder?main=71&subject=73"><div>입시컨설팅</div></a>
				</div>
				<div style="font-family: 'JejuGothic'; font-size: 20px; margin-top: 20px; width: 600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>

				<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=18 && status.index<21}">
							<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="cateTitle">
			<p>
				<b>수학</b> 전문가와 수업해보세요.
			</p>
		</div>
		<section class="vertical-center-4 slider">
			<div>
				<a href="./boarder?main=11&subject=14"><img src="<c:url value="/resources/img/math2.png" />" alt="이과수학"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=15"><img src="<c:url value="/resources/img/math3.png" />" alt="문과수학"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=16"><img src="<c:url value="/resources/img/math5.png" />" alt="고등수학"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=13"><img src="<c:url value="/resources/img/middlemath.png" />" alt="중등수학"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=12"><img src="<c:url value="/resources/img/elementmath.png" />" alt="초등수학"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=18"><img src="<c:url value="/resources/img/math6.png" />" alt="수학경시"></a>
			</div>
			<div>
				<a href="./boarder?main=11&subject=17"><img src="<c:url value="/resources/img/mathlogic.png" />" alt="수학논술"></a>
			</div>
		</section>

		<div class="cateTitle">
			<p>
				나에게 맞는 <b>외국어</b> 수업을 찾고 싶다면
			</p>
		</div>
		<section class="vertical slider">
			<div>
				<a href="./boarder?main=21&subject=25"><img src="<c:url value="/resources/img/sateng.png" />" alt="수능영어" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=24"><img src="<c:url value="/resources/img/higheng.png" />" alt="고등영어" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=26"><img src="<c:url value="/resources/img/freetalking.png" />" alt="영어회화" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=22"><img src="<c:url value="/resources/img/eng1.png" />" alt="초등영어" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=23"><img src="<c:url value="/resources/img/eng2.png" />" alt="중등영어" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=27"><img src="<c:url value="/resources/img/toeic.png" />" alt="토익/토플/텝스" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=28"><img src="<c:url value="/resources/img/japan.png" />" alt="일본어" /></a>
			</div>
			<div>
				<a href="./boarder?main=21&subject=29"><img src="<c:url value="/resources/img/china.png" />" alt="중국어" /></a>
			</div>
		</section>

		<div class="cateTitle">
			<p>
				나에게 맞는 <b>국어</b> 수업을 찾고 싶다면
			</p>
		</div>
		<section class="vertical2 slider">
			<div>
				<a href="./boarder?main=31&subject=35"><img src="<c:url value="/resources/img/kor4.png" />" alt="수능국어" /></a>
			</div>
			<div>
				<a href="./boarder?main=31&subject=34"><img src="<c:url value="/resources/img/kor3.png" />" alt="고등국어" /></a>
			</div>
			<div>
				<a href="./boarder?main=31&subject=33"><img src="<c:url value="/resources/img/kor2.png" />" alt="중등국어" /></a>
			</div>
			<div>
				<a href="./boarder?main=31&subject=32"><img src="<c:url value="/resources/img/kor1.png" />" alt="초등국어" /></a>
			</div>
			<div>
				<a href="./boarder?main=31&subject=36"><img src="<c:url value="/resources/img/kor5.png" />" alt="국어논술" /></a>
			</div>
		</section>

		<div class="cateTitle">
			<p>
				<b>사회</b> 선생님을 찾아보세요.
			</p>
		</div>
		<section class="regular slider">
			<div>
				<a href="./boarder?main=41&subject=46"><img src="<c:url value="/resources/img/society1.png" />" alt="한국사" /></a>
			</div>
			<div>
				<a href="./boarder?main=41&subject=451"><img src="<c:url value="/resources/img/social2.png" />" alt="사회탐구" /></a>
			</div>
			<div>
				<a href="./boarder?main=41&subject=44"><img src="<c:url value="/resources/img/society4.png" />" alt="고등사회" /></a>
			</div>
			<div>
				<a href="./boarder?main=41&subject=43"><img src="<c:url value="/resources/img/society2.png" />" alt="중등사회" /></a>
			</div>
			<div>
				<a href="./boarder?main=41&subject=42"><img src="<c:url value="/resources/img/society3.png" />" alt="초등사회" /></a>
			</div>
		</section>

		<div class="cateTitle">
			<p>
				<b>과학</b> 선생님을 찾아보세요.
			</p>
		</div>
		<section class="regular2 slider">
			<div>
				<a href="./boarder?main=51&subject=55"><img src="<c:url value="/resources/img/science3.png" />" alt="물리" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=53"><img src="<c:url value="/resources/img/science4.png" />" alt="중등과학" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=54"><img src="<c:url value="/resources/img/science5.png" />" alt="고등과학" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=58"><img src="<c:url value="/resources/img/science6.png" />" alt="지구과학" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=56"><img src="<c:url value="/resources/img/science7.png" />" alt="생명과학" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=52"><img src="<c:url value="/resources/img/science1.png" />" alt="초등과학" /></a>
			</div>
			<div>
				<a href="./boarder?main=51&subject=57"><img src="<c:url value="/resources/img/scienceC.png" />" alt="화학" /></a>
			</div>
		</section>

		<div class="cateTitle">
			<p>
				<b>입시전문가</b>와 <b>예체능</b>까지
			</p>
		</div>
		<section class="center slider">
			<div>
				<a href="./boarder?main=71&subject=73"><img src="<c:url value="/resources/img/cunsult1.png" />" alt="입시컨설팅" /></a>
			</div>
			<div>
				<a href="./boarder?main=71&subject=72"><img src="<c:url value="/resources/img/cunsult2.png" />" alt="자소서첨삭" /></a>
			</div>
			<div>
				<a href="./boarder?main=61&subject=62"><img src="<c:url value="/resources/img/arts.png" />" alt="미술" /></a>
			</div>
			<div>
				<a href="./boarder?main=61&subject=63"><img src="<c:url value="/resources/img/musics.png" />" alt="음악" /></a>
			</div>
			<div>
				<a href="./boarder?main=61&subject=64"><img src="<c:url value="/resources/img/sport.png" />" alt="체육" /></a>
			</div>
		</section>


		<!-- pc프로모트 코드 -->
		<div class="cok-intro-back"></div>
		<div class="cok-intro">
			<div class="intro-title">
				<b> <span class="intro-close1">[하루동안 열지않음 X]</span> <span class="intro-close2">[닫기 X]</span>
				</b>
			</div>
			<div class="intro-content">
				<div style="width: 90%; margin: 10px auto 30px auto; font-size: 20px; line-height: 140%;">
					콕사부에 대해 알아보고
					<br />
					과외수업을 진행해보세요.
				</div>
				<div style="text-align: center;">
					<img style="width: 80%;" src="<c:url value="/resources/img/people.png" />" alt="" />
				</div>
				<div class="intro-text">
					<div class="teach-intro">선생님으로 알아보기</div>
					<div class="student-intro">학생/학부모님으로 알아보기</div>
				</div>
				<div class="teach-text1">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 100%;" src="<c:url value="/resources/img/threeclass.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 10px auto;">콕사부 선생님은 최대 5개 과목의 수업을 무료로 만들어 홍보 할 수 있습니다.</div>
					<div class="teach-next1">다음 알아보기</div>
				</div>
				<div class="teach-text2">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 30%;" src="<c:url value="/resources/img/notification.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 10px auto;">앱을 통해 학생의 과외 요청에 실시간 알림을 제공 받을수도 있습니다.</div>
					<div class="teach-next2">다음 알아보기</div>
				</div>
				<div class="teach-text3">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 40%;" src="<c:url value="/resources/img/gawerespond.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 10px auto;">물론, 학생의 과외요청서에 대해 무료로 지원서를 제출할 수 있습니다.</div>
					<div class="teach-next3">다음 알아보기</div>
				</div>

				<div class="teach-text4">
					<div style="width: 80%; margin: 10px auto;">
						콕사부는 선생님들이 중개수수료와 유료 이용료 없이 과외를 구할 수 있도록 하였습니다.
						<br />
						콕사부에서 자유롭게 과외활동을 해보세요.
					</div>
					<div class="teach-next4 teach-end">콕사부 홈페이지 더보기</div>

					<div class="apple-customize" style="display: none;">
						<img src="<c:url value='/resources/img/appleLogo.png' />" style="vertical-align: middle; width: 28px; height: 40px;" />
						Sign in with Apple
					</div>

					<div class="naver-customize">
						<img src="<c:url value='/resources/img/naver.png' />" style="vertical-align: middle; width: 30px; height: 30px;" />
						네이버로 로그인
					</div>
					<div style="display: none;">
						<div id="naverIdLogin"></div>
					</div>
				</div>

				<div class="student-text1">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 100%;" src="<c:url value="/resources/img/threeclass.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 30px auto;">
						수업목록을 통해 구체적인 선생님 정보와 수업정보를 알 수 있으며,
						<br />
						성별, 경력, 과외가능위치 등 상세검색을 통해 원하는 선생님을 찾을 수 있습니다.
					</div>
					<div class="student-next1">다음 알아보기</div>
				</div>
				<div class="student-text2">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 100%;" src="<c:url value="/resources/img/gaweapplication.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 30px auto;">
						선생님을 직접 찾지 않더라고 과외요청서를 작성하면,
						<br />
						수업 가능한 선생님의 지원서를 받아 볼 수 있습니다.
					</div>
					<div class="student-next2">다음 알아보기</div>
				</div>
				<div class="student-text3">
					<div style="text-align: center; margin: 10px;">
						<img style="width: 30%;" src="<c:url value="/resources/img/chat.png" />" alt="" />
					</div>
					<div style="width: 80%; margin: 30px auto;">
						채팅을 통하여 안전하게 상담 또한 진행 할 수 있으니,
						<br />
						지금 콕사부를 통해 과외선생님을 만나보세요!
					</div>
					<div class="student-next3 student-end">콕사부 홈페이지 더보기</div>

					<div class="apple-customize" style="display: none;">
						<img src="<c:url value='/resources/img/appleLogo.png' />" style="vertical-align: middle; width: 28px; height: 40px;" />
						Sign in with Apple
					</div>
					<div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="width: 80%; height: 45px; margin: auto; cursor: pointer; display: none;"></div>

					<div class="naver-customize">
						<img src="<c:url value='/resources/img/naver.png' />" style="vertical-align: middle; width: 30px; height: 30px;" />
						네이버로 로그인
					</div>
					<div style="display: none;">
						<div id="naverIdLogin"></div>
					</div>
				</div>
			</div>
		</div>


		<div class="tutorial-first-back"></div>
		<div class="tutorial-first">
			<div class="tutorial-para">
				<div class="tutorial-first-title">
					튜토리얼 안내를 통해
					<br />
					쉽고 빠르게 시작해보세요
				</div>
				<div class="tutorial-first-content">
					친절한 사용 설명과 함께 쉽고 빠르게
					<br />
					콕사부 서비스를 사용할 수 있습니다
				</div>
			</div>
			<br />
			<div>

				<a href="./apply?cok_tutorial=first_student" style="color: orange; text-decoration: none;">
					<div class="tutorial-btn-st">학생/학부모 튜토리얼</div>
				</a> <a href="./profile?cok_tutorial=first_profile" style="color: orange; text-decoration: none;">
					<div class="tutorial-btn-te">선생님 회원 튜토리얼</div>
				</a>

			</div>
			<div class="tutorial-close-div">
				<span class="tutorial-close">[닫기x]</span>
			</div>
		</div>

		<%@ include file="/WEB-INF/view/include/pcFooter.jsp"%>
	</div>
	<script src="<c:url value="resources/js/index.min.js?date=${date}" />"></script>
	<sec:authorize access="isAuthenticated()">
		<script>
			function getRequestParam() {
				var url = document.location.href;
				var qs = url.substring(url.indexOf('?') + 1).split('&');
				for (var i = 0, result = {}; i < qs.length; i++) {
					qs[i] = qs[i].split('=');
					result[qs[i][0]] = decodeURIComponent(qs[i][1]);
				}
				return result;
			}

			//튜토리얼 코드
			if (getRequestParam().cok_tutorial == "first_user") {
				if (GetCookie("tutorial") != "end") {
					$('.tutorial-first').toggle(500);
					$('.tutorial-first-back').show();
				}
			}

			$(document).ready(function() {

				$('.tutorial-close').click(function() {
					$('.tutorial-first').remove();
					$('.tutorial-first-back').remove();
					SetCookie('tutorial', 'end')
				});

			});
		</script>
	</sec:authorize>


	<%
		session = request.getSession();
		String messageStatus = (String) session.getAttribute("messageStatus");
		if (messageStatus != null && messageStatus.equals("exist")) {
	%>
	<script>
		$('.message-notify').after('<span style="display:inline-block;vertical-align:top;width:6px;height:6px;border-radius:3px;background:red;"></span>');
	</script>
	<%
		}
	%>

	<sec:authorize access="!isAuthenticated()">
		<script>
			// 쿠키설정
			var strReturn;
			//아래에 정의되어 있는 GetCookie()라는 함수를 호출하여 현재 쿠키값이 있는지 확인
			strReturn = GetCookie('promoteCookie');
			//만약 쿠키가 없다면 starPop()함수를 호출하여 오픈 창으로 이벤트 페이지 실행
			if (strReturn == null || strReturn == '0') {
				startPromote();
			}

			var currentUrlApple = window.location.href;
			var callbackUrlApple = '';

			if (currentUrlApple.indexOf("www.coksabu.com") != -1) {
				callbackUrlApple = "https://www.coksabu.com/loginCallBackApple";
			} else {
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

			$(document).ready(function() {
				$('.apple-customize').click(function() {
					$('#appleid-signin').trigger("click");
				});
			});
		</script>
	</sec:authorize>

</body>
</html>