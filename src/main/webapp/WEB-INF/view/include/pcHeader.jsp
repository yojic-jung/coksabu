<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<header class="pc-header">
	<div class="jbMenu">
		<div class="top-title">
			<a href="./">
				<img src="<c:url value="/resources/images/logo.png" />" alt="로고" />
			</a>
		</div>

		<sec:authorize access="!isAuthenticated()">
			<ul class="top-ul">
				<li><a href="./boarder?main=11&subject=11">수업목록</a></li>
				<li><a href="./lessonapply">수업요청</a></li>
				<!-- 주석 지우기 <li><a href="./applylist">요청목록</a></li> -->
				<li><a href="./login">로그인</a></li>
				<li><a href="./signup">회원가입</a></li>
			</ul>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<ul class="top-ul">
				<li><a href="./boarder?main=11&subject=11">수업목록</a></li>
				<!-- 주석 지우기 <li><a href="./applylist">요청목록</a></li> -->
				<li><a href="./lessonapply">수업요청</a></li>
				<li><a href="./myroom">마이페이지</a></li>
				<li><a href="./message" class="message-notify">메세지</a></li>
				<li><a href="<c:url value='j_spring_security_logout' />">로그아웃</a></li>
			</ul>
		</sec:authorize>
	</div>
</header>

