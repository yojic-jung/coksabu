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
	background: #FBEADC;
	color: #EF904F;
	font-weight:bold;
}

.td-trans {
	background: white;
	color: #EF904F;
}


.btn {
	font-size: 15px;
	border-radius: 5px;
	padding: 10px 50px;
	cursor: pointer;
	background: #EF904F;
	color: white;
	font-weight:bold;
}

.prev2, .prev3, .prev4, .prev5, .prev6 {
	font-size: 15px;
	border-radius: 5px;
	padding: 10px 50px;
	cursor: pointer;
	background:white;
	border:2px solid #EF904F;
	color: #EF904F;
}


.img-add {
	padding: 10px;
	border-radius: 15px;
	background: black;
	color: white;
	cursor: pointer;
}

.save {
	background: #EF904F;
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
display:none;
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
	border:2px solid dimgray;
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

.service-cate0, .service-cate1, .service-cate2, .service-cate3, .service-cate4,
.seg-cate0>select, .seg-cate1>select, .seg-cate2>select, .seg-cate3>select, .seg-cate4>select,
.price-standard0, .price-standard1, .price-standard2, .price-standard3, .price-standard4,
.price-time,
.price-pri1{
	padding: 15px;
	border-radius: 10px;
	border: 2px solid orange;
}

.service-cate0, .service-cate1, .service-cate2, .service-cate3, .service-cate4{
	width:200px;
}

.price-standard0, .price-standard1, .price-standard2, .price-standard3, .price-standard4{
	width:200px;height:40px;padding:7px;
}

.opt3-tr, .opt4-tr{
	display:none;
}
.hide{display:none;}
</style>
<title>수업 만들기</title>
</head>
<body>
	<div style="list-style: none; background: #FBEADC; padding: 0px;">
		<div>
			<span style="float: left; clear: right; font-size: 20px; padding: 15px;"> <a href="./tutorpage" style="color:#EF904F; text-decoration: none;font-weight:bold;">&lt;뒤로가기</a>
			</span>
			<table class="menu" style="width: 740px; margin: auto; ">
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
		<%@ include file="/WEB-INF/view/include/boarder/pcLessonWriteAndUpdate.jsp"%>
	</div>
	<div style="height: 100px;"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="<c:url value="resources/js/heic2any.js"  />"></script>
	<script src="<c:url value="resources/js/boarder/lessonWriteAndUpdate.js?v=14" />"></script>
	<script src="<c:url value="resources/js/cok_util.js?v=2"  />"></script>
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
/*
		$(document)
				.on(
						'click',
						'#output1',
						function() {
							//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
							$('.multi1').remove();
							$(this).remove();
							$('.uploadDiv')
									.append('<input name="contentimg" type="file" class="multi1" id="multi1" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output1" data-click-event="ok" />');
						});

		$(document)
				.on(
						'click',
						'#output2',
						function() {
							$('.multi2').remove();
							$(this).remove();
							$('.uploadDiv')
									.append('<input name="contentimg" type="file" class="multi2" id="multi2" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output2" data-click-event="ok" />');
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
											'<input name="contentimg" type="file" class="multi3" id="multi3" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output3" data-click-event="ok" />');
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
											'<input name="contentimg" type="file" class="multi4" id="multi4" accept="image/*" onchange="util_imgUpldCheck(this);util_imgUpldLoadFile(event);" data-output="output4" data-click-event="ok" />');
						});
	*/
	</script>
</body>
</html>