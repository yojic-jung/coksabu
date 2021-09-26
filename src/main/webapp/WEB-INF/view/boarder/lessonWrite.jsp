<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수업만들기, 콕사부</title>
<meta name="description" content="수업만들기 페이지" />
<meta charset="utf-8">
<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body {
	margin: 0px;
	padding: 0px;
	padding-bottom: 20px;
}

.mypage {
	list-style: none;
	padding: 20px;
}

.update {
	border-radius: 5px;
	border: 1px solid gray;
	background: gray;
	color: white;
	text-decoration: none;
	padding: 3px;
}

.mypage>li {
	font-family: 'JejuGothic';
	padding: 20px;
	display: inline;
}

.div-title {
	width: 800px;
	margin: auto;
	padding: 30px 0px 20px 10px;
	font-family: 'JejuGothic';
	color: rgb(97, 96, 96);
}

.seg-cate0 select, .seg-cate1 select, .seg-cate2 select, .seg-cate3 select,
	.seg-cate4 select {
	display: none;
}

#represent {
	display: none;
}

#imgplus {
	width: 50px;
	height: 50px;
	backgroud: white;
	border-radius: 15px;
	border: 2px solid lightgray;
	cursor: pointer;
	position: relative;
	top: -50px;
}

.menu td {
	font-family: 'JejuGothic';
	width: 120px;
	float: left;
	text-align: center;
	padding: 20px;
	cursor: pointer;
}

.menu-td {
	background: rgb(63, 63, 61);
	color: white;
}

.td-trans {
	background: white;
	color: rgb(63, 63, 61);
	border-top: 5px solid rgb(63, 63, 61);
}

.price-table {
	border-spacing: 10px;
}

.btn {
	font-size: 15px;
	border-radius: 5px;
	padding: 10px;
	cursor: pointer;
	background: rgb(75, 74, 74);
	color: white;
}

.img-add {
	padding: 10px;
	border-radius: 15px;
	background: black;
	color: white;
	cursor: pointer;
}

.save {
	background: orange;
	width: 200px;
	border: none;
	font-size: 15px;
	border-radius: 5px;
	padding: 10px;
}

.btnc {
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
	background: rgb(75, 74, 74);
	color: white;
	cursor: pointer;
}

.x-btn {
	margin-left: 10px;
	font-size: 10px;
	padding: 2px;
	border-radius: 5px;
	background: rgb(63, 63, 61);
	color: white;
	cursor: pointer;
}

.service-cate {
	width: 150px;
	padding: 7px;
	font-size: 18px;
	border-radius: 2px;
	margin-top: 10px;
	height: 40px;
}

.seg-cate {
	width: 650px;
	padding: 7px;
	font-size: 18px;
	border-radius: 2px;
	line-height: 170%;
	margin-top: 10px;
}

.btn-div {
	width: 650px;
	text-align: center;
	margin: 20px auto;
}

.teacher-intr {
	font-size: 20px;
	font-family: 'JejuGothic';
	width: 800px;
	min-height: 400px;
	margin: 30px auto;
	line-height: 180%;
}

.career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
	padding: 7px;
	font-size: 18px;
	margin-top: 10px;
}

.career-disc {
	width: 300px;
}

.career-box {
	border: 0.5px solid gray;
	width: 600px;
	min-height: 50px;
	margin-top: 20px;
	font-size: 18px;
	padding: 6px;
	color: gray;
}

.del-btn {
	color: white;
	background: rgb(63, 63, 61);
	border-radius: 3px;
	padding: 3px;
}

#output1, #output2, #output3, #output4 {
	width: 180px;
	height: 180px;
	margin: 10px;
}

.multi1, .multi2, .multi3, .multi4 {
	display: none;
}

.img-div {
	min-height: 200px;
	width: 400px;
	margin: auto;
}

.pri-neg-able {
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
}

.pri-neg-disable {
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

.pri-neg-able, .pri-neg-disable {
	display: inline-block;
	background: #EAEAEA;
	padding: 5px 30px;
	cursor: pointer;
}

.radio-back {
	background: dimgray;
	border: 3px solid #4C4C4C;
	color: white;
}

.pri-neg-able:hover, .pri-neg-disable:hover {
	border: 3px solid #4C4C4C;
}

.negotiation-possible, .negotiation-notpossible {
	display: none;
}
</style>
<title>수업 만들기</title>
</head>
<body>
	<div style="list-style: none; background: rgb(63, 63, 61); padding: 0px;">
		<div>
			<span style="float: left; clear: right; font-size: 20px; padding: 15px;">
				<a href="./tutorpage" style="color: white; text-decoration: none;">&lt;뒤로가기</a>
			</span>
			<table class="menu" style="width: 740px; margin: auto;">
				<tr>
					<td class="menu-td">서비스</td>
					<td class="menu-td">수업제목</td>
					<td class="menu-td">수업정보</td>
					<td class="menu-td">선생님소개</td>
					<td class="menu-td">미디어</td>
					<td class="menu-td">정책안내</td>
				</tr>
			</table>

		</div>
	</div>
	<div style="list-style: none; width: 800px; margin: auto;">

		<!-- 메뉴 -->
		<form:form commandName="card" method="post" enctype="multipart/form-data" onSubmit="return checkLesson(this)">
			<input name="email" type="hidden" value="<%=(String) session.getAttribute("email")%>" />
			<!-- 선생님 소개 -->
			<div class="teacher-intr">
				<div style="margin-top: 20px; line-height: 180%;">
					선생님의 재능을 마음껏 펼쳐보세요!
					<br />
					많은 수업을 등록 할수록 많은 학생들에게 선생님의 수업이 노출 됩니다.

					<table style="width: 100%; border-spacing: 0px 20px;">
						<tr>
							<td>제공수업1(필수)</td>
						</tr>
						<tr>
							<td>
								<select name="cate0" class="service-cate0" id="service-cate0" style="font-size: 15px; padding: 7px; height: 40px;">
									<option value="nonevalue">--선택--</option>
									<option>수학</option>
									<option>외국어</option>
									<option>국어</option>
									<option>사회</option>
									<option>과학</option>
									<option>예체능</option>
									<option>입시(자소서/논술/면접)</option>
								</select>
							</td>
							<td class="seg-cate0">
								<select name="subCate0" style="font-size: 15px; padding: 7px; height: 40px; width: 130px; display: inline-block" disabled>
									<option value="nonevalue">선택없음</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등수학</option>
									<option>중등수학</option>
									<option>고등수학</option>
									<option>문과수학</option>
									<option>이과수학</option>
									<option>수학경시</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등영어</option>
									<option>중등영어</option>
									<option>고등영어</option>
									<option>수능영어</option>
									<option>영어회화</option>
									<option>toeic/tofle/teps</option>
									<option>중국어</option>
									<option>일본어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등국어</option>
									<option>중등국어</option>
									<option>고등국어</option>
									<option>수능국어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등사회</option>
									<option>중등사회</option>
									<option>고등사회</option>
									<option>생활과윤리</option>
									<option>사회문화</option>
									<option>한국지리</option>
									<option>세계지리</option>
									<option>윤리와사상</option>
									<option>동아시아사</option>
									<option>법과정치</option>
									<option>세계사</option>
									<option>경제</option>
									<option>한국사</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등과학</option>
									<option>중등과학</option>
									<option>고등과학</option>
									<option>물리</option>
									<option>화학</option>
									<option>생명과학</option>
									<option>지구과학</option>
									<option>물리2</option>
									<option>화학2</option>
									<option>생명과학2</option>
									<option>지구과학2</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>미술</option>
									<option>유아미술</option>
									<option>초등미술</option>
									<option>중등미술</option>
									<option>고등미술</option>
									<option>성인미술</option>
									<option>음악</option>
									<option>악기</option>
									<option>성악</option>
									<option>국악</option>
									<option>체육</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>자소서첨삭</option>
									<option>입시컨설팅</option>
									<option>면접</option>
									<option>수학논술</option>
									<option>인문논술</option>
									<option>국어논술</option>
									<option>과학논술</option>
								</select>
							</td>
							<td>
								<select name="price1" class="price-standard0" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>한달 12회</option>
									<option>한달 8회</option>
									<option>한달 4회</option>
								</select>
							</td>
							<td>
								<select name="price2" class="price-time" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>60분</option>
									<option>90분</option>
									<option>2시간</option>
									<option>2시간 30분</option>
									<option>3시간</option>
									<option>4시간</option>
								</select>
							</td>
							<td>
								<input name="price3" style="text-align: right;; padding: 7px; width: 130px; font-size: 15px;" class="price-pri1" type="text" id="price3" placeholder="숫자만 입력" />원
							</td>
						</tr>


						<tr>
							<td>제공수업2(선택)</td>
						</tr>
						<tr>
							<td>
								<select name="cate1" class="service-cate1" id="service-cate1" style="font-size: 15px; padding: 7px; height: 40px;">
									<option value="nonevalue">--선택--</option>
									<option>수학</option>
									<option>외국어</option>
									<option>국어</option>
									<option>사회</option>
									<option>과학</option>
									<option>예체능</option>
									<option>입시(자소서/논술/면접)</option>
								</select>
							</td>
							<td class="seg-cate1">
								<select  name="subCate1" style="font-size: 15px; padding: 7px; height: 40px; width: 130px; display: inline-block" disabled>
									<option value="nonevalue">선택없음</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px">
									<option>초등수학</option>
									<option>중등수학</option>
									<option>고등수학</option>
									<option>문과수학</option>
									<option>이과수학</option>
									<option>수학경시</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등영어</option>
									<option>중등영어</option>
									<option>고등영어</option>
									<option>수능영어</option>
									<option>영어회화</option>
									<option>toeic/tofle/teps</option>
									<option>중국어</option>
									<option>일본어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등국어</option>
									<option>중등국어</option>
									<option>고등국어</option>
									<option>수능국어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등사회</option>
									<option>중등사회</option>
									<option>고등사회</option>
									<option>생활과윤리</option>
									<option>사회문화</option>
									<option>한국지리</option>
									<option>세계지리</option>
									<option>윤리와사상</option>
									<option>동아시아사</option>
									<option>법과정치</option>
									<option>세계사</option>
									<option>경제</option>
									<option>한국사</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등과학</option>
									<option>중등과학</option>
									<option>고등과학</option>
									<option>물리</option>
									<option>화학</option>
									<option>생명과학</option>
									<option>지구과학</option>
									<option>물리2</option>
									<option>화학2</option>
									<option>생명과학2</option>
									<option>지구과학2</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>미술</option>
									<option>유아미술</option>
									<option>초등미술</option>
									<option>중등미술</option>
									<option>고등미술</option>
									<option>성인미술</option>
									<option>음악</option>
									<option>악기</option>
									<option>성악</option>
									<option>국악</option>
									<option>체육</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>자소서첨삭</option>
									<option>입시컨설팅</option>
									<option>면접</option>
									<option>수학논술</option>
									<option>인문논술</option>
									<option>국어논술</option>
									<option>과학논술</option>
								</select>
							</td>
							<td>
								<select name="opt1price1" class="price-standard1" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>한달 12회</option>
									<option>한달 8회</option>
									<option>한달 4회</option>
								</select>
							</td>
							<td>
								<select name="opt1price2" class="price-time" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>60분</option>
									<option>90분</option>
									<option>2시간</option>
									<option>2시간 30분</option>
									<option>3시간</option>
									<option>4시간</option>
								</select>
							</td>
							<td>
								<input name="opt1price3" style="text-align: right;; padding: 7px; width: 130px; font-size: 15px;" class="price-pri1" type="text" id="opt1price3" placeholder="숫자만 입력" />원
							</td>
						</tr>



						<tr>
							<td>제공수업3(선택)</td>
						</tr>
						<tr>
							<td>
								<select name="cate2" class="service-cate2" id="service-cate2" style="font-size: 15px; padding: 7px; height: 40px;">
									<option value="nonevalue">--선택--</option>
									<option>수학</option>
									<option>외국어</option>
									<option>국어</option>
									<option>사회</option>
									<option>과학</option>
									<option>예체능</option>
									<option>입시(자소서/논술/면접)</option>
								</select>
							</td>
							<td class="seg-cate2">
								<select name="subCate2" style="font-size: 15px; padding: 7px; height: 40px; width: 130px; display: inline-block" disabled>
									<option value="nonevalue">선택없음</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등수학</option>
									<option>중등수학</option>
									<option>고등수학</option>
									<option>문과수학</option>
									<option>이과수학</option>
									<option>수학경시</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등영어</option>
									<option>중등영어</option>
									<option>고등영어</option>
									<option>수능영어</option>
									<option>영어회화</option>
									<option>toeic/tofle/teps</option>
									<option>중국어</option>
									<option>일본어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등국어</option>
									<option>중등국어</option>
									<option>고등국어</option>
									<option>수능국어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등사회</option>
									<option>중등사회</option>
									<option>고등사회</option>
									<option>생활과윤리</option>
									<option>사회문화</option>
									<option>한국지리</option>
									<option>세계지리</option>
									<option>윤리와사상</option>
									<option>동아시아사</option>
									<option>법과정치</option>
									<option>세계사</option>
									<option>경제</option>
									<option>한국사</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등과학</option>
									<option>중등과학</option>
									<option>고등과학</option>
									<option>물리</option>
									<option>화학</option>
									<option>생명과학</option>
									<option>지구과학</option>
									<option>물리2</option>
									<option>화학2</option>
									<option>생명과학2</option>
									<option>지구과학2</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>미술</option>
									<option>유아미술</option>
									<option>초등미술</option>
									<option>중등미술</option>
									<option>고등미술</option>
									<option>성인미술</option>
									<option>음악</option>
									<option>악기</option>
									<option>성악</option>
									<option>국악</option>
									<option>체육</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>자소서첨삭</option>
									<option>입시컨설팅</option>
									<option>면접</option>
									<option>수학논술</option>
									<option>인문논술</option>
									<option>국어논술</option>
									<option>과학논술</option>
								</select>
							</td>
							<td>
								<select name="opt2price1" class="price-standard2" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>한달 12회</option>
									<option>한달 8회</option>
									<option>한달 4회</option>
								</select>
							</td>
							<td>
								<select name="opt2price2" class="price-time" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>60분</option>
									<option>90분</option>
									<option>2시간</option>
									<option>2시간 30분</option>
									<option>3시간</option>
									<option>4시간</option>
								</select>
							</td>
							<td>
								<input name="opt2price3" style="text-align: right;; padding: 7px; width: 130px; font-size: 15px;" class="price-pri1" type="text" id="opt2price3" placeholder="숫자만 입력" />원
							</td>
						</tr>

						<tr>
							<td>제공수업4(선택)</td>
						</tr>
						<tr>
							<td>
								<select name="cate3" class="service-cate3" id="service-cate3" style="font-size: 15px; padding: 7px; height: 40px;">
									<option value="nonevalue">--선택--</option>
									<option>수학</option>
									<option>외국어</option>
									<option>국어</option>
									<option>사회</option>
									<option>과학</option>
									<option>예체능</option>
									<option>입시(자소서/논술/면접)</option>
								</select>
							</td>
							<td class="seg-cate3">
								<select name="subCate3" style="font-size: 15px; padding: 7px; height: 40px; width: 130px; display: inline-block" disabled>
									<option value="nonevalue">선택없음</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등수학</option>
									<option>중등수학</option>
									<option>고등수학</option>
									<option>문과수학</option>
									<option>이과수학</option>
									<option>수학경시</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등영어</option>
									<option>중등영어</option>
									<option>고등영어</option>
									<option>수능영어</option>
									<option>영어회화</option>
									<option>toeic/tofle/teps</option>
									<option>중국어</option>
									<option>일본어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등국어</option>
									<option>중등국어</option>
									<option>고등국어</option>
									<option>수능국어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등사회</option>
									<option>중등사회</option>
									<option>고등사회</option>
									<option>생활과윤리</option>
									<option>사회문화</option>
									<option>한국지리</option>
									<option>세계지리</option>
									<option>윤리와사상</option>
									<option>동아시아사</option>
									<option>법과정치</option>
									<option>세계사</option>
									<option>경제</option>
									<option>한국사</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등과학</option>
									<option>중등과학</option>
									<option>고등과학</option>
									<option>물리</option>
									<option>화학</option>
									<option>생명과학</option>
									<option>지구과학</option>
									<option>물리2</option>
									<option>화학2</option>
									<option>생명과학2</option>
									<option>지구과학2</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>미술</option>
									<option>유아미술</option>
									<option>초등미술</option>
									<option>중등미술</option>
									<option>고등미술</option>
									<option>성인미술</option>
									<option>음악</option>
									<option>악기</option>
									<option>성악</option>
									<option>국악</option>
									<option>체육</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>자소서첨삭</option>
									<option>입시컨설팅</option>
									<option>면접</option>
									<option>수학논술</option>
									<option>인문논술</option>
									<option>국어논술</option>
									<option>과학논술</option>
								</select>
							</td>
							<td>
								<select name="opt3price1" class="price-standard3" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>한달 12회</option>
									<option>한달 8회</option>
									<option>한달 4회</option>
								</select>
							</td>
							<td>
								<select name="opt3price2" class="price-time" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>60분</option>
									<option>90분</option>
									<option>2시간</option>
									<option>2시간 30분</option>
									<option>3시간</option>
									<option>4시간</option>
								</select>
							</td>
							<td>
								<input name="opt3price3" style="text-align: right;; padding: 7px; width: 130px; font-size: 15px;" class="price-pri1" type="text" id="opt3price3" placeholder="숫자만 입력" />원
							</td>
						</tr>



						<tr>
							<td>제공수업5(선택)</td>
						</tr>
						<tr>
							<td>
								<select name="cate4" class="service-cate4" id="service-cate4" style="font-size: 15px; padding: 7px; height: 40px;">
									<option value="nonevalue">--선택--</option>
									<option>수학</option>
									<option>외국어</option>
									<option>국어</option>
									<option>사회</option>
									<option>과학</option>
									<option>예체능</option>
									<option>입시(자소서/논술/면접)</option>
								</select>
							</td>
							<td class="seg-cate4">
								<select name="subCate4" style="font-size: 15px; padding: 7px; height: 40px; width: 130px; display: inline-block" disabled>
									<option value="nonevalue">선택없음</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등수학</option>
									<option>중등수학</option>
									<option>고등수학</option>
									<option>문과수학</option>
									<option>이과수학</option>
									<option>수학경시</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등영어</option>
									<option>중등영어</option>
									<option>고등영어</option>
									<option>수능영어</option>
									<option>영어회화</option>
									<option>toeic/tofle/teps</option>
									<option>중국어</option>
									<option>일본어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등국어</option>
									<option>중등국어</option>
									<option>고등국어</option>
									<option>수능국어</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등사회</option>
									<option>중등사회</option>
									<option>고등사회</option>
									<option>생활과윤리</option>
									<option>사회문화</option>
									<option>한국지리</option>
									<option>세계지리</option>
									<option>윤리와사상</option>
									<option>동아시아사</option>
									<option>법과정치</option>
									<option>세계사</option>
									<option>경제</option>
									<option>한국사</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>초등과학</option>
									<option>중등과학</option>
									<option>고등과학</option>
									<option>물리</option>
									<option>화학</option>
									<option>생명과학</option>
									<option>지구과학</option>
									<option>물리2</option>
									<option>화학2</option>
									<option>생명과학2</option>
									<option>지구과학2</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>미술</option>
									<option>유아미술</option>
									<option>초등미술</option>
									<option>중등미술</option>
									<option>고등미술</option>
									<option>성인미술</option>
									<option>음악</option>
									<option>악기</option>
									<option>성악</option>
									<option>국악</option>
									<option>체육</option>
								</select>
								<select style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>자소서첨삭</option>
									<option>입시컨설팅</option>
									<option>면접</option>
									<option>수학논술</option>
									<option>인문논술</option>
									<option>국어논술</option>
									<option>과학논술</option>
								</select>
							</td>
							<td>
								<select name="opt4price1" class="price-standard4" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>한달 12회</option>
									<option>한달 8회</option>
									<option>한달 4회</option>
								</select>
							</td>
							<td>
								<select name="opt4price2" class="price-time" style="font-size: 15px; padding: 7px; height: 40px; width: 130px;">
									<option>60분</option>
									<option>90분</option>
									<option>2시간</option>
									<option>2시간 30분</option>
									<option>3시간</option>
									<option>4시간</option>
								</select>
							</td>
							<td>
								<input name="opt4price3" style="text-align: right;; padding: 7px; width: 130px; font-size: 15px;" class="price-pri1" type="text" id="opt4price3" placeholder="숫자만 입력" />원
							</td>
						</tr>

					</table>
				</div>


				<div>
					<div class="service-table">
						<div style="font-size: 15px; text-align: center; margin-top: 30px;">
							<label>
								<div class="pri-neg-able">
									<input type="radio" class="negotiation-possible" name="priNegotiation" value="yes" />가격협의 가능
								</div>
							</label>
							<label>
								<div class="pri-neg-disable">
									<input type="radio" class="negotiation-notpossible" name="priNegotiation" value="no" />가격협의 불가
								</div>
							</label>
						</div>
					</div>
				</div>

				<br />
				<div class="btn-div">
					<span class="btn1 btn">다음단계</span>
				</div>
			</div>

			<!-- 선생님 -->
			<div class="teacher-intr">
				<div>
					수업 대표 이미지
					<br />
					<span style="color: gray; font-size: 18px; margin: 15px 0px 15px 0px;">수업을 대표하는 이미지나 선생님 사진을 넣어주세요.</span>
					<br />
					<img id="output" style="width: 240px; height: 240px;" src="<c:url value="/resources/profileImg/pro.png"  />" alt="수업대표이미지" />
					<br />
					<div style="width: 240px; text-align: right;">
						<img id="imgplus" src="<c:url value="/resources/images/imgplus.png" />" />
					</div>

					<input type="file" name="represent" id="represent" accept="image/*" onchange="check(this);loadFile(event)" />

				</div>

				<div>
					제목
					<br />
					<span style="color: gray; font-size: 18px;">
						제목을 30글자 미만으로 적어주세요.(
						<span class="title-length">0</span>
						/30)
					</span>
					<br />
					<input name="title" type="text" id="lesson-title" style="margin-top: 10px; width: 570px; padding: 7px; font-size: 18px;" placeholder="수업제목을 30자 내외로 적어주세요." value="${lesson.title}" />
				</div>
				<br />
				<br />
				<div class="btn-div">
					<span class="prev2 btn">이전단계</span>
					<span class="btn2 btn">다음단계</span>
				</div>
			</div>

			<!-- 수업 소개 -->
			<div class="teacher-intr">
				수업 가능 요일
				<br />
				<span style="color: gray; font-size: 18px; margin-top: 10px;">
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="월" /> 월
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="화" /> 화
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="수" /> 수
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="목" /> 목
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="금" /> 금
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="토" /> 토
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="day" value="일" /> 일
					</label>
				</span>
				<br />
				<br />
				수업 형태
				<br />
				<span style="color: gray; font-size: 18px; margin-top: 10px;">
					<label style="cursor: pointer">
						<input type="checkbox" name="gawe" value="개인 과외 가능" /> 개인 과외 가능
					</label>
					&nbsp;
					<label style="cursor: pointer">
						<input type="checkbox" name="gawe" value="화상 과외 가능" /> 화상 과외 가능
					</label>
				</span>
				<br />
				<br />
				시범수업
				<br />
				<span style="color: gray; font-size: 18px; margin-top: 10px;">
					<label style="cursor: pointer">
						<input type="checkbox" name="trial" class="free" value="시범수업 무료" /> 시범수업 무료
					</label>
				</span>
				<br />
				<br />
				수업 소개
				<br />
				<span style="color: gray; font-size: 18px; margin-top: 10px">
					수업 형태나 학습목표, 커리큘럼에 대해 자세히 적어주세요.(
					<span class="lesson-length">0</span>
					/500)
				</span>
				<textarea name="lesson" id="lesson-intr" rows="10" cols="75" style="font-size: 15px; padding: 5px; line-height: 160%; overflow-y: scroll; margin-top: 10px;"></textarea>
				<br />
				<br />
				<div class="btn-div">
					<span class="prev3 btn">이전단계</span>
					<span class="btn3 btn">다음단계</span>
				</div>
			</div>

			<!-- 경력사항 -->
			<div class="teacher-intr">
				선생님 경력
				<br />
				<span style="color: gray; font-size: 18px;">경력이 없으신 경우 생략가능합니다.</span>
				<br />
				<div class="career" id="career"></div>
				<div style="width: 600px; margin: 10px auto; text-align: right;">
				</div>
				<div class="career-box"></div>
				<br />
				선생님 소개
				<br />
				<span style="color: gray; font-size: 18px; margin-top: 10px">
					선생님의 지도성향이나 학습방식, 경력 등을 자세하게 서술해주세요.(
					<span class="teach-length">0</span>
					/500)
				</span>
				<br />
				<textarea id="careerDesc" name="description" rows="10" cols="75" style="font-size: 15px; padding: 5px; line-height: 140%; overflow-y: scroll; margin-top: 10px;"></textarea>
				<br />
				<br />
				<div class="btn-div">
					<span class="prev4 btn">이전단계</span>
					<span class="btn4 btn">다음단계</span>
				</div>
			</div>

			<!-- 미디어 -->
			<div class="teacher-intr" id="teacher-intr">
				<div style="text-align: center; font-family: 'JejuGothic'; font-size: 16px;">수업과 관련된 이미지를 등록하여 수업을 어필해보세요. (선택)</div>
				<div style="text-align: center; margin: 30px;">
					<span class="img-add">이미지 추가</span>
					<br />
					<br />
					<span style="font-size: 15px; color: gray;">
						이미지는 최대 4장까지 업로드 가능합니다.
						<br />
						이미지 취소를 원할 경우 해당 이미지를 클릭하면 됩니다.
					</span>
					<br />
				</div>
				<div class="img-div"></div>
				<div class="uploadDiv">
					<input name="contentimg" type="file" class="multi1" accept="image/*" onchange="check1(this);loadFile1(event);" /> <input name="contentimg" type="file" class="multi2" accept="image/*" onchange="check22(this);loadFile2(event);" /> <input name="contentimg" type="file" class="multi3" accept="image/*" onchange="check3(this);loadFile3(event);" /> <input name="contentimg" type="file" class="multi4" accept="image/*" onchange="check4(this);loadFile4(event);" />
				</div>
				<div>
					<br />
					<div class="btn-div">
						<span class="prev5 btn">이전단계</span>
						<span class="btn5 btn">다음단계</span>
					</div>
				</div>
			</div>

			<!-- 정책안내 -->
			<div class="teacher-intr" id="teacher-intr">
				<div>콕사부 정책</div>
				<div style="font-size: 15px; line-height: 130%; margin: 20px auto;; border: 1px solid black; padding: 10px;">
					안전거래를 통해 거래가 이루어진 경우 수업료의 5%가 안전결제 서비스 사용료로 부과됩니다.
					<br />
					(직거래시 안전결제 서비스 사용료는 부과되지 않음.)
					<br />
					서비스의 안전한 거래를 위하여 판매금을 서비스가 종료된 날짜를 기준으로 1-3일 후에 입금됨을 알립니다.
					<br />
					입금 받을 계좌는 [마이페이지] -> [내 계정 정보 수정하기] 페이지에서 등록 할 수 있습니다.
				</div>
				<div>취소 및 환불규정</div>
				<div style="overflow: scroll; font-size: 15px; line-height: 130%; margin: 20px auto; height: 400px; border: 1px solid black; padding: 10px;">
					가. 수업 환불기준 원칙
					<br />
					<br />
					학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)
					<br />
					- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.
					<br />
					<br />
					1. 수업을 제공할 수 없거나, 수업 장소를 제공할 수 없게 된 날 : 이미 납부한 수업비 등을 일한 계산한 금액 환불
					<br />
					<br />
					2. 수업기간이 1개월 이내의 경우
					<br />
					- 수업 시작전 : 이미 납부한 수업비 전액 환불
					<br />
					- 총 수업 시간의 1/3 경과전 : 이미 납부한 수업비의 2/3에 해당액 환불
					<br />
					- 총 수업 시간의 1/2 경과전 : 이미 납부한 수업비용의 1/2에 해당액 환불
					<br />
					- 총 수업시간의 1/2 경과후 : 반환하지 않음
					<br />
					<br />
					3.수업 기간이 1개월을 초과하는 경우
					<br />
					- 수업 시작전 : 이미 납부한 수업비 전액 환불
					<br />
					- 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불 * 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함
					<br />
				</div>
				<br />

				<div class="btn-div">
					<span class="prev6 btn">이전단계</span>
					<input class="save btn" type="submit" value="동의하고 수업 만들기" />
				</div>
			</div>

		</form:form>
	</div>
	<div style="height: 100px;"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="<c:url value="resources/js/boarder/lessonWriteAndUpdate.js?v=2" />"></script>
	<script>
		$(document).ready(function() {

			var error = "<c:out value="${error}" />";

			if (error == "error") {
				alert("수업은 1개만 등록 가능합니다.")
				window.history.back();
			} else if (error == "notPer1") {
				alert("입시(자소서/논술/면접) 영역을 제외한 다른 영역에서는 수업횟수를 한달 4,8,12회에서 선택해주세요.");
				window.history.back();
			}

		});

		$(document).on('click', '#output1', function() {
			//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
			$('.multi1').remove();
			$(this).remove();
			$('.uploadDiv').append('<input name="contentimg" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />');
		});

		$(document).on('click', '#output2', function() {
			$('.multi2').remove();
			$(this).remove();
			$('.uploadDiv').append('<input name="contentimg" class="multi2" type="file" accept="image/*" onchange="check22(this);loadFile2(event);" />');
		});

		$(document).on('click', '#output3', function() {
			$('.multi3').remove();
			$(this).remove();
			$('.uploadDiv').append('<input name="contentimg" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />');
		});

		$(document).on('click', '#output4', function() {
			$('.multi4').remove();
			$(this).remove();
			$('.uploadDiv').append('<input name="contentimg" class="multi4" type="file" accept="image/*" onchange="check4(this);loadFile4(event);" />');
		});
	</script>
</body>
</html>