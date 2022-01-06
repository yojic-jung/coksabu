<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수업수정 콕사부</title>
<meta name="description" content="나의수업 수정하기 페이지" />
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

.seg-cate0 select, .seg-cate1 select, .seg-cate2 select, .seg-cate3 select,
	.seg-cate4 select {
	display: none;
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
.img-add {
	padding: 10px;
	border-radius: 15px;
	background: black;
	color: white;
	cursor: pointer;
}
.img-div {
	min-height: 200px;
	width: 480px;
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
	margin: 0px;
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

.del-div {
	text-align: center;
	width: 180px;
	margin: 10px;
}

.del1, .del2, .del3, .del4 {
	cursor: pointer;
	border-radius: 5px;
	padding: 3px;
	color: white;
	background: dimgray;
	font-size: 10px;
	text-decoration: none;
}

.td-locale {
	background: rgb(151, 149, 149);
	color: white;
	border-radius: 5px;
	padding: 5px;
	margin-right: 10px;
	font-size: 12px;
}
.hide{display:none;}
</style>
<title>수업 수정</title>
</head>
<body>
	<div style="list-style: none; background: #FBEADC; padding: 0px;">
		<div>
			<span style="float: left; clear: right; font-size: 20px; padding: 15px;"> <a href="./tutorpage" style="color: #EF904F;font-weight:bold; text-decoration: none;">&lt;뒤로가기</a></span>
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
	<div style="list-style: none; width: 740px; margin: auto;">
		<!-- 메뉴 -->

		<%@ include file="/WEB-INF/view/include/boarder/pcLessonWriteAndUpdate.jsp"%>
	</div>

	<div style="height: 200px;"></div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="<c:url value="resources/js/heic2any.js"  />"></script>
	<script src="resources/js/boarder/lessonWriteAndUpdate.js?v=10"></script>
	<script>
		$(document)
				.ready(
						function() {
							var error = "<c:out value="${error}" />";

							if (error == "notPer1") {
								alert("입시(자소서/논술/면접) 영역을 제외한 다른 영역에서는 수업횟수를 한달 4,8,12회에서 선택해주세요.");
								window.history.back();
							}

							var cate0 = "<c:out value="${lesson.cate0}" />";
							var cate1 = "<c:out value="${lesson.cate1}" />";
							var cate2 = "<c:out value="${lesson.cate2}" />";
							var cate3 = "<c:out value="${lesson.cate3}" />";
							var cate4 = "<c:out value="${lesson.cate4}" />";

							if(cate3 !="nonevalue"){
								$('.opt3-tr').show();
							}
							
							if(cate4 !="nonevalue"){
								$('.opt4-tr').show();
							}
							
							$('.service-cate0').val(cate0).trigger('change');
							$('.service-cate1').val(cate1).trigger('change');
							$('.service-cate2').val(cate2).trigger('change');
							$('.service-cate3').val(cate3).trigger('change');
							$('.service-cate4').val(cate4).trigger('change');

							var cate0Idx = $(".service-cate0 option").index(
									$(".service-cate0 option:selected"));
							var cate1Idx = $(".service-cate1 option").index(
									$(".service-cate1 option:selected"));
							var cate2Idx = $(".service-cate2 option").index(
									$(".service-cate2 option:selected"));
							var cate3Idx = $(".service-cate3 option").index(
									$(".service-cate3 option:selected"));
							var cate4Idx = $(".service-cate4 option").index(
									$(".service-cate4 option:selected"));

							var subCate0 = "<c:out value="${lesson.subCate0}" />";
							var subCate1 = "<c:out value="${lesson.subCate1}" />";
							var subCate2 = "<c:out value="${lesson.subCate2}" />";
							var subCate3 = "<c:out value="${lesson.subCate3}" />";
							var subCate4 = "<c:out value="${lesson.subCate4}" />";

							$('.seg-cate0 > select').eq(cate0Idx).val(subCate0)
									.attr("selected", true);
							$('.seg-cate1 > select').eq(cate1Idx).val(subCate1)
									.attr("selected", true);
							$('.seg-cate2 > select').eq(cate2Idx).val(subCate2)
									.attr("selected", true);
							$('.seg-cate3 > select').eq(cate3Idx).val(subCate3)
									.attr("selected", true);
							$('.seg-cate4 > select').eq(cate4Idx).val(subCate4)
									.attr("selected", true);

							var opIdx = $('.service-cate>option:selected')
									.index();
							if (opIdx == -1) {
								$('.service-cate').val('--선택--').trigger(
										'change');
							} else {
								$('.seg-cate').eq(opIdx - 1).show();
								$('.seg-cate').eq(opIdx - 1).find('select')
										.each(
												function(index, item) {
													$(this).prop("name",
															"subCate" + index);
												});

								if (opIdx == 7) {
									$('.onlyIpsi').show();
								} else {
									$('.onlyIpsi').remove();
								}

							}

							var price1 = "<c:out value="${lesson.price1}" />";
							var opt1price1 = "<c:out value="${lesson.opt1price1}" />";
							var opt2price1 = "<c:out value="${lesson.opt2price1}" />";
							var opt3price1 = "<c:out value="${lesson.opt3price1}" />";
							var opt4price1 = "<c:out value="${lesson.opt4price1}" />";

							$('select[name=price1]').val(price1).prop(
									"selected", true);
							$('select[name=opt1price1]').val(opt1price1).prop(
									"selected", true);
							$('select[name=opt2price1]').val(opt2price1).prop(
									"selected", true);
							$('select[name=opt3price1]').val(opt3price1).prop(
									"selected", true);
							$('select[name=opt4price1]').val(opt4price1).prop(
									"selected", true);

							var price2 = "<c:out value="${lesson.price2}" />";
							var opt1price2 = "<c:out value="${lesson.opt1price2}" />";
							var opt2price2 = "<c:out value="${lesson.opt2price2}" />";
							var opt3price2 = "<c:out value="${lesson.opt3price2}" />";
							var opt4price2 = "<c:out value="${lesson.opt4price2}" />";

							$('select[name=price2]').val(price2).prop(
									"selected", true);
							$('select[name=opt1price2]').val(opt1price2).prop(
									"selected", true);
							$('select[name=opt2price2]').val(opt2price2).prop(
									"selected", true);
							$('select[name=opt3price2]').val(opt3price2).prop(
									"selected", true);
							$('select[name=opt4price2]').val(opt4price2).prop(
									"selected", true);

							var priNegotiation = "<c:out value="${lesson.priNegotiation}" />";
							$('input[name=priNegotiation]').each(
									function(idx, item) {
										if ($(this).val() == priNegotiation) {
											$(this).attr("checked", true);
											$(this).closest("div").addClass(
													'radio-back');
										}
									})

							var careerDB = "<c:out value="${lesson.careerDB}" />";
							if (careerDB != "") {
								var careerDB2 = careerDB.split("*");
								for (var i = 0; i < careerDB2.length; i++) {
									var careerU = '<div class="car">'
											+ careerDB2[i]
											+ '<span class="x-btn">x</span></div>';
									var careerU2 = '<input name="ycareer" class="ycareer" type="text" style="display:none;" value="'+careerDB2[i]+'" />';
									$('.career-box').append(careerU);

									$('.career-box').append(careerU2);
								}
							}

							var day = "<c:out value="${lesson.day}" />";
							var days = day.split(',');
							$('input[name="day"]').each(function() {
								for (var i = 0; i < days.length; i++) {
									if ($(this).val() == days[i])
										$(this).attr("checked", true);
								}
							});
							var gawe = "<c:out value="${lesson.gawe}" />";
							var gawes = gawe.split(',');
							$('input[name="gawe"]').each(function() {
								for (var i = 0; i < gawes.length; i++) {
									if ($(this).val() == gawes[i])
										$(this).attr("checked", true);
								}
							});
							var trial = "<c:out value="${lesson.trial}" />";
							if (trial == "시범수업 무료") {
								$('.free').attr("checked", true);
							}

							$('.price-pri').keyup(function() {
								$('.price-pri').val($.number($(this).val()));
							});

							var ctx = "<c:out value="${pageContext.request.contextPath}" />";
							var imgPath = "<c:out value="${lesson.contentimg}" />";
							var img = imgPath.split("*");

							if (imgPath != '') {
								for (var i = 0; i < img.length; i++) {
									var name = 'output' + (i + 1);
									var path = ctx + '/resources/mediaImg/'
											+ img[i];
									var del = '<span class="del' + (i + 1)
											+ '" data-name="' + img[i]
											+ '">삭제</span>';
									var delDiv = '.del-div' + (i + 1);

									$('.img-div')
											.append(
													'<img id="'+name+'" style="width:170px;" src=""/>');
									$('.img-div').append(del);
									var nameId = "#" + name;
									$(nameId).attr('src', path);
								}
							}

						});

		var postId = "<c:out value="${lesson.id}" />";

		$(document).on(
				'click',
				'.del1',
				function() {
					$.ajax({
						url : './delimg?id=' + postId + '&name='
								+ $('.del1').attr('data-name'),
						type : 'get',
						error : function(error) {
						},
						success : function(data) {
						}
					});

					$(this).remove();
					$('.del-div1').remove();
					$('#output1').trigger('click');
				});

		$(document).on(
				'click',
				'.del2',
				function() {
					$.ajax({
						url : './delimg?id=' + postId + '&name='
								+ $('.del2').attr('data-name'),
						type : 'get',
						error : function(error) {
						},
						success : function(data) {
						}
					});
					$(this).remove();
					$('.del-div2').remove();
					$('#output2').trigger('click');
				});

		$(document).on(
				'click',
				'.del3',
				function() {
					$.ajax({
						url : './delimg?id=' + postId + '&name='
								+ $('.del3').attr('data-name'),
						type : 'get',
						error : function(error) {
						},
						success : function(data) {
						}
					});
					$(this).remove();
					$('.del-div3').remove();
					$('#output3').trigger('click');
				});

		$(document).on(
				'click',
				'.del4',
				function() {
					$.ajax({
						url : './delimg?id=' + postId + '&name='
								+ $('.del4').attr('data-name'),
						type : 'get',
						error : function(error) {
						},
						success : function(data) {
						}
					});
					$(this).remove();
					$('.del-div4').remove();
					$('#output4').trigger('click');
				});

		$(document)
				.on(
						'click',
						'#output1',
						function() {
							//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
							if ($('.del1').length == 0) {
								$('.multi1').remove();
								$(this).remove();
								$('.uploadDiv')
										.append(
												'<input name="contentimg" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event)" />');
							}
						});

		$(document)
				.on(
						'click',
						'#output2',
						function() {
							if ($('.del2').length == 0) {
								$('.multi2').remove();
								$(this).remove();
								$('.uploadDiv')
										.append(
												'<input name="contentimg" class="multi2" type="file" accept="image/*" onchange="check22(this);loadFile2(event)" />');
							}
						});

		$(document)
				.on(
						'click',
						'#output3',
						function() {
							if ($('.del3').length == 0) {
								$('.multi3').remove();
								$(this).remove();
								$('.uploadDiv')
										.append(
												'<input name="contentimg" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event)" />');
							}
						});

		$(document)
				.on(
						'click',
						'#output4',
						function() {
							if ($('.del4').length == 0) {
								$('.multi4').remove();
								$(this).remove();
								$('.uploadDiv')
										.append(
												'<input name="contentimg" class="multi4" type="file" accept="image/*" onchange="check4(this);loadFile4(event);" />');
							}
						});
	</script>
</body>
</html>