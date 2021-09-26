<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>장바구니 거래 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="나의 수업 찜 목록" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="canonical" href="https://coksabu.com/wishlist">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/include/mLessonCard.css?v=4"/>">
<style>
@charset "UTF-8";

@font-face {
	font-family: 'JejuGothic';
	src: url(< c : url value = "/resources/JejuGothic-Regular.ttf"/ >)
		format('truetype');
}

html, body, section {
	height: 100%;
}

.div-title {
	font-size: 50px;
	text-align: center;
	padding: 30px 0px 20px 10px;
	font-family: 'JejuGothic';
	color: rgb(97, 96, 96);
}

#profile {
	width: 150px;
	height: 150px;
	border-radius: 75px;
	border: 5px solid orange;
}

.recom-table {
	width: 100%;
	margin: auto;
	border-spacing: 30px;
}

.recom-table td {
	width: 30%;
}

.recom-table img {
	width: 100%;
}

.wish-table {
	width: 95%;
	margin: auto;
	border-spacing: 0px 20px;
}

.wish-table td {
	width: 500px;
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<body>
	<div style="background: rgb(233, 232, 232); padding: 90px 0 30px 0; width: 100%">
		<div class="div-title">장바구니</div>
		<div style="width: 100%; margin: auto; padding: 20px;">
			<div>
				<div style="font-size: 30px; font-family: 'JejuGothic'; padding: 30px;">장바구니 목록은 14일간 보관됩니다.</div>
				<table class="wish-table" style="font-family: 'JejuGothic'; background: white; padding: 30px;">

					<c:choose>
						<c:when test="${size == 0 }">
							<tr>
								<td style="min-height: 300px">
									<div style="width: 100%; text-align: center; font-size: 30px; min-height: 80px; text-align: center; color: orange; padding: 30px;">장바구니가 비어있습니다.</div>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="post" items="${list}">
								<%@ include file="/WEB-INF/view/include/mLessonCard.jsp"%>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
	<div style="padding: 50px 50px 320px 50px;">
		<div style="width: 100%; margin: 20px auto; font-family: 'JejuGothic'; font-size: 25px;">추천 카테고리</div>
		<table class="recom-table">
			<tr>
				<td>
					<div>
						<a href="./boarder?main=71&subject=73"><img src="<c:url value="/resources/img/cunsult1.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=71&subject=72"><img src="<c:url value="/resources/img/cunsult2.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=11&subject=16"><img src="<c:url value="/resources/img/math5.png" />" alt="고등수학"></a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<a href="./boarder?main=21&subject=27"><img src="<c:url value="/resources/img/toeic.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=21&subject=26"><img src="<c:url value="/resources/img/freetalking.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=21&subject=24"><img src="<c:url value="/resources/img/higheng.png" />" /></a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<a href="./boarder?main=41&subject=46"><img src="<c:url value="/resources/img/society1.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=51&subject=53"><img src="<c:url value="/resources/img/science4.png" />" /></a>
					</div>
				</td>
				<td>
					<div>
						<a href="./boarder?main=61&subject=62"><img src="<c:url value="/resources/img/arts.png" />" /></a>
					</div>
				</td>
			</tr>
		</table>

	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="resources/js/include/lessonCard.js"></script>
	<script>
		$(document).ready(function() {
			$('.my5').css('color', 'orange');
		});
	</script>
</body>
</html>