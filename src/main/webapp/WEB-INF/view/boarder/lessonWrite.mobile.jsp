<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수업만들기, 콕사부</title>
<meta name="description" content="수업만들기 페이지" />
<meta charset="utf-8">
<link rel="canonical" href="https://coksabu.com/lessonWrite">
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

.lesson-table {
	border-spacing: 0px;
}

.lesson-table td {
	width: 33%;
}

.lesson-table select {
	width: 90%;
	font-size: 40px;
	margin-bottom: 15px;
}

#price3, #opt1price3, #opt2price3, #opt3price3, #opt4price3 {
	width: 80%;
	font-size: 35px;
}

#imgplus {
	width: 100px;
	height: 100px;
	backgroud: white;
	border-radius: 40px;
	border: 4px solid lightgray;
	cursor: pointer;
	position: relative;
	top: -80px;
	right: -300px;
}

.menu {
	width: 100%;
}

.menu td {
	font-family: 'JejuGothic';
	float: left;
	text-align: center;
	padding: 30px 0px;
	width: 16.5%;
	cursor: pointer;
}

.menu-td {
	background: #FBEADC;
	font-size: 35px;
	font-weight: bolder;
	color: #EF904F;
}

.td-trans {
	background: white;
	color: rgb(63, 63, 61);
	border-top: 5px solid #FBEADC;
	color: #EF904F;
}

.price-table {
	border-spacing: 20px 60px;
}

.btn-div {
	width: 100%;
	font-size: 50px;
	font-weight: bolder;
	position: fixed;
	left: 0;
	bottom: 0;
	text-align: center;
}

.btn1 {
	width: 100%;
	text-align: center;
	position: fixed;
	bottom: 0px;
	left: 0px;
	font-size: 50px;
	padding: 30px 0px;
	background: #F4C60B;
	color: white;
	background: #F4C60B;
	color: white;
}

.btn2, .btn3, .btn4, .btn5, .make-lesson {
	width: 50%;
	text-align: center;
	font-size: 50px;
	padding: 30px 0px;
	background: #F4C60B;
	color: white;
	background: #F4C60B;
	display: inline-block;
}

.prev2, .prev3, .prev4, .prev5, .prev5, .prev6 {
	width: 50%;
	text-align: center;
	font-size: 50px;
	padding: 30px 0px;
	border-top: 10px solid #F4C60B;
	color: #F4C60B;
	background: white;
	float: left;
	display: inline-block;
}

.btn {
	border-radius: 5px;
	cursor: pointer;
}

.img-add {
	padding: 20px;
	border-radius: 15px;
	background: black;
	font-size: 40px;
	color: white;
	cursor: pointer;
}

.save {
	background: orange;
	display: none;
	border: none;
}

.btnc {
	font-size: 35px;
	border-radius: 10px;
	padding: 15px;
	background: rgb(75, 74, 74);
	color: white;
	cursor: pointer;
}

.x-btn {
	font-size: 40px;
	padding: 10px;
	color: #D5D5D5;
}

.service-cate {
	padding: 30px;
	font-size: 50px;
	border-radius: 20px;
	width: 70%;
	color: dimgray;
	border: 5px solid #BDBDBD;
	background: #F9F9F9;
	margin-top: 20px;
}

.seg-cate0 select, .seg-cate1 select, .seg-cate2 select, .seg-cate3 select,
	.seg-cate4 select {
	display: none;
}

.seg-table td {
	padding: 0px 10px;
}

.seg-table tr:nth-child(1) td {
	padding-bottom: 40px;
	text-align: center;
}

.seg-table tr:nth-child(2n) td {
	padding-bottom: 60px;
}

.seg-table td:nth-child(2n) {
	background: #EBEBEB
}

.seg-table td:nth-child(2n+1) {
	background: #F6F6F6;
}

.seg-table select {
	font-size: 35px;
}

.seg-cate {
	width: 100%;
	padding: 15px;
	font-size: 35px;
	border-radius: 2px;
	line-height: 250%;
	margin-top: 10px;
}

.teacher-intr {
	font-size: 40px;
	font-family: 'JejuGothic';
	width: 90%;
	min-height: 400px;
	margin: 30px auto;
	line-height: 180%;
}

.career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
	padding: 10px;
	font-size: 40px;
	margin: 10px;
}

.career-disc {
	width: 70%;
	font-size: 40px;
	padding: 10px;
}

.career-box {
	border: 0.5px solid gray;
	width: 100%;
	min-height: 150px;
	margin-top: 20px;
	font-size: 25px;
	padding: 10px;
	color: gray;
	line-height: 300%;
}

.car {
	margin: 20px;
	font-size: 30px;
	padding: 10px;
	border-radius: 50px;
	background: #F2F3F7;
	display: inline-block;
}

.del-btn {
	color: white;
	background: rgb(63, 63, 61);
	border-radius: 3px;
	padding: 3px;
}

#output1, #output2, #output3, #output4 {
	width: 50%;
	height: 400px;
	margin: 2%;
}

.multi1, .multi2, .multi3, .multi4 {
	display: none;
}

.img-div {
	width: 100%;
	text-align: center;
	min-height: 200px;
}

input[type="checkbox"] {
	width: 20px;
	height: 20px;
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
	border: 1px solid gray;
	background: #F6F6F6;
	width: 40%;
	padding: 20px;
	cursor: pointer;
}

.radio-back {
	background: #F29661;
	color: white;
}

.negotiation-possible, .negotiation-notpossible {
	display: none;
}


.service-cate0, .service-cate1, .service-cate2, .service-cate3, .service-cate4,
.seg-cate0>select, .seg-cate1>select, .seg-cate2>select, .seg-cate3>select, .seg-cate4>select,
.price-standard0, .price-standard1, .price-standard2, .price-standard3, .price-standard4,
.price-time{
	padding: 20px;
	border-radius: 20px;
	border: 3px solid orange;
	background: white url('/resources/img/selectBoxArrow.jpg') no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.price-pri1{
	padding: 20px;
	border-radius: 20px;
	border: 3px solid orange;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.opt3-tr,.opt4-tr{
	display:none;
} 
.hide{display:none;}
</style>
<title>수업 만들기</title>
</head>
<body>
	<div style="list-style: none; width: 100%;">

		<!-- 메뉴 -->
		<div style="width: 100%;">
			<table class="menu">
				<tr>
					<td class="menu-td">서비스</td>
					<td class="menu-td">제목</td>
					<td class="menu-td">정보</td>
					<td class="menu-td">소개</td>
					<td class="menu-td">미디어</td>
					<td class="menu-td">안내</td>
				</tr>
			</table>

		</div>
		<%@ include file="/WEB-INF/view/include/boarder/mLessonWriteAndUpdate.jsp"%>
	</div>

	<img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position: fixed; left: 50%; transform: translate(-50%, -50%); top: 50%; z-index: 99; display: none;" />

	<div style="height: 200px;"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="<c:url value="resources/js/heic2any.js"  />"></script>
	<script src="<c:url value="resources/js/boarder/lessonWriteAndUpdate.js?v=3" />"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('.m-jbMenu').append("수업 만들기");
							var error = "<c:out value="${error}" />";

							if (error == "error") {
								alert("수업은 1개만 등록 가능합니다.")
								window.history.back();
							} else if (error == "notPer1") {
								alert("입시(자소서/논술/면접) 영역을 제외한 다른 영역에서는 수업횟수를 한달 4,8,12회에서 선택해주세요.");
								window.history.back();
							}

							$('.price-pri').keyup(
									function() {
										$('.price-kor').text(
												"(" + viewKorean($(this).val())
														+ ")");
									});

						});

		$(document)
				.on(
						'click',
						'#output1',
						function() {
							//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
							$('.multi1').remove();
							$(this).remove();
							$('.uploadDiv')
									.append(
											'<input name="contentimg" class="multi1" id="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />');
						});

		$(document)
				.on(
						'click',
						'#output2',
						function() {
							$('.multi2').remove();
							$(this).remove();
							$('.uploadDiv')
									.append(
											'<input name="contentimg" class="multi2" id="multi2" type="file" accept="image/*" onchange="check22(this);loadFile2(event);" />');
						});

		$(document)
				.on(
						'click',
						'#output3',
						function() {
							$('.multi3').remove();
							$(this).remove();
							$('.uploadDiv')
									.append(
											'<input name="contentimg" class="multi3" id="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />');
						});

		$(document)
				.on(
						'click',
						'#output4',
						function() {
							$('.multi4').remove();
							$(this).remove();
							$('.uploadDiv')
									.append(
											'<input name="contentimg" class="multi4" id="multi4" type="file" accept="image/*" onchange="check4(this);loadFile4(event);" />');
						});

		$(window).bind("pageshow", function(event) {
			$('#spinner').hide();
		});
	</script>
</body>
</html>