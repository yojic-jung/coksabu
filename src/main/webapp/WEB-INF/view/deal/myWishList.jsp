<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니 거래 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="나의 수업 찜 목록" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/include/pcLessonCard.css?v=2"/>">
<style>
@font-face {
	font-family: 'JejuGothic';
	src: url(/resources/JejuGothic-Regular.ttf) format('truetype');
}
.lesson-href {
	text-decoration: none;
	color: black;
}


.div-title {
	width: 800px;
	margin: auto;
	padding: 30px 0px 20px 10px;
	font-family: 'JejuGothic';
	color: rgb(97, 96, 96);
}

.recom-table {
	width: 1200px;
	margin: auto;
	border-spacing: 30px;
}

.recom-table td {
	width: 350px;
}

.recom-table img {
	width: 350px;
}
</style>

</head>
<body>
	<div style="background: rgb(233, 232, 232); padding: 30px; min-height: 300px;">
		<div class="div-title">장바구니</div>
		<div style="width: 800px; background: white; margin: auto; padding: 20px;">


			<div>
				<div style="font-size: 12px; font-family: 'JejuGothic';">장바구니 목록은 14일간 보관됩니다.</div>
				<table style="border-spacing: 0px 10px; font-family: 'JejuGothic';">

					<c:choose>
						<c:when test="${size == 0 }">
							<tr>
								<td style="min-height: 300px">
									<div style="width: 700px; text-align: center; font-size: 20px; min-height: 80px; text-align: center; color: orange; padding-top: 30px;">장바구니에 담긴 수업 목록이 없습니다.</div>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="post" items="${list}">
								<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>


			</div>

		</div>
	</div>
	<div style="padding: 50px;">
		<div style="width: 1000px; margin: 20px auto; font-family: 'JejuGothic'; font-size: 18px;">추천 카테고리</div>
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