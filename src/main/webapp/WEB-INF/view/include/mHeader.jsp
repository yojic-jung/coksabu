<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 메인 페이지, category, myroom 데코레이터 -->
<header class="m-header">

	<div class="m-jbMenu">
		<span class="m-btn"> <span> </span> <span> </span> <span> </span>
		</span>

		<a href="./">
			<span class="m-title">콕사부</span>
		</a>
	</div>
<div class="m-fix-background" style="height: 160px"></div>

	<div id="m-menu">
		<div class="m-close">x</div>
		<div class="m-menu-title">Menu</div>
		<sec:authorize access="!isAuthenticated()">
			<a href="./login" class="m-menu-href">
				<div class="m-menu-content">로그인</div>
			</a>
			<a href="./signup" class="m-menu-href">
				<div class="m-menu-content">회원가입</div>
			</a>
			<a href="./boarder?main=11&subject=11" class="m-menu-href">
				<div class="m-menu-content">수업목록</div>
			</a>
			<a href="./apply" class="m-menu-href">
				<div class="m-menu-content">수업요청</div>
			</a>
			<!-- 주석 지우기 <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="./message" class="m-menu-href">
				<div class="m-menu-content">메세지</div>
			</a>
			<a href="./myroom" class="m-menu-href">
				<div class="m-menu-content">마이페이지</div>
			</a>
			<a href="./boarder?main=11&subject=11" class="m-menu-href">
				<div class="m-menu-content">수업목록</div>
			</a>
			<!-- 주석 지우기 <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
			<a href="./apply" class="m-menu-href">
				<div class="m-menu-content">수업요청</div>
			</a>
			<a href="./customer" class="m-menu-href">
				<div class="m-menu-content">고객센터</div>
			</a>
		</sec:authorize>
	</div>

	<div id="m-menu2"></div>

</header>