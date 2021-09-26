<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>튜터페이지 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="선생님 프로필 및 수업정보" />
<link rel="stylesheet" href="<c:url value="/resources/colorbox.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/include/pcLessonCard.css?v=2"/>">
<style>
@font-face {
	font-family: 'JejuGothic';
	src: url(/resources/JejuGothic-Regular.ttf) format('truetype');
}
.top-ul a {
	text-decoration: none;
	color: black
}

.lesson-make2 {
	background: rgb(224, 223, 223);
}

.div-title {
	width: 800px;
	margin: auto;
	padding: 30px 0px 20px 10px;
	font-family: 'JejuGothic';
	color: rgb(97, 96, 96);
}

.menu td {
	font-family: 'JejuGothic';
	width: 100px;
	float: left;
	text-align: center;
	padding: 10px;
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

.btn {
	font-size: 13px;
	border-radius: 5px;
	padding: 5px;
	cursor: pointer;
	background: rgb(75, 74, 74);
	color: white;
	float: right;
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
	width: 120px;
	padding: 5px;
	font-size: 14px;
	border-radius: 2px;
	margin-top: 10px;
}

.seg-cate {
	width: 500px;
	padding: 5px;
	font-size: 12px;
	border-radius: 2px;
	line-height: 170%;
	margin-top: 10px;
}

.teacher-intr {
	font-family: 'JejuGothic';
	width: 480px;
	min-height: 400px;
	margin: 30px auto;
	line-height: 130%;
}

.career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
	padding: 3px;
	font-size: 13px;
	margin-top: 10px;
}

.career-disc {
	width: 180px;
}

.career-box {
	border: 0.5px solid gray;
	width: 430px;
	min-height: 50px;
	margin-top: 20px;
	font-size: 13px;
	padding: 6px;
	color: gray;
}

.del-btn {
	color: white;
	background: rgb(63, 63, 61);
	border-radius: 3px;
	padding: 3px;
}

.td-locale {
	background: rgb(151, 149, 149);
	color: white;
	border-radius: 5px;
	padding: 5px;
	margin-right: 10px;
	font-size: 12px;
}

.tutorial-first-back {
	display: none;
	width: 100%;
	height: 100%;
	background: black;
	opacity: 0.3;
	position: fixed;
	top: 0px;
	left: 0px;
	z-index: 90;
}

.tutorial-first, .tutorial-certi, .tutorial-success {
	width: 320px;
	font-family: 'JejuGothic';
	z-index: 100;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: none;
	padding: 0px;
	background-image: url(/resources/img/firecracker.png);
	background-repeat: no-repeat;
	background-size: cover;
	text-align: center;
	border-radius: 20px;
	font-size: 18px;
}

.tutorial-para {
	text-align: center;
	padding-top: 30px;
	line-height: 180%;
	background: white;
	border-radius: 20px 20px 120px 120px;
}

.tutorial-first-title {
	color: #002266;
	font-size: 20px;
	margin-bottom: 30px;
	font-weight: bold;
}

.tutorial-btn, .tutorial-btn-certi, .tutorial-end {
	margin: 30px auto;
	padding: 10px;
	cursor: pointer;
	background: white;
	color: #002266;
	border-radius: 20px;
	width: 220px;
	display: inline-block;
	font-weight: bolder;
}

.tutorial-close, .tutorial-close-certi {
	cursor: pointer;
}

.tutorial-close-div {
	margin-top: 30px;
	text-align: right;
	color: white;
	font-size: 14px;
	padding: 5px;
}

.foot {
	width: 100%;
}

.foot-align {
	margin: auto;
	width: 1000px;
	min-width: 1000px;
}

.foot-align>div {
	float: left;
	margin: 20px;
}

.foot p {
	font-size: 12px;
	line-height: 150%;
	text-decoration: none;
}
</style>


</head>
<body>

	<section>

		<div style="background: rgb(233, 232, 232); padding: 30px;">

			<c:if test="${pro ==null}">
				<div class="div-title">프로필</div>
				<div style="width: 800px; background: white; margin: auto; padding: 20px; text-align: center;">
					<div style="margin-top: 30px;">
						프로필을 작성하지 않으셨습니다. <a href="./profile" style="text-decoration: none; color: black;"> <b>"프로필"</b>
						</a> 을 작성해주세요.
					</div>
					<div style="text-align: center; padding: 30px">
						<a href="./profile" style="text-decoration: none;">
							<button style="width: 200px; padding: 10px; color: white; background: dimgray; border-radius: 10px;">지금 프로필 작성하기</button>
						</a>
					</div>
				</div>
			</c:if>
			<c:if test="${pro !=null }">
				<div class="div-title">프로필</div>
				<div style="width: 800px; background: white; margin: auto; padding: 20px;">
					<table style="font-family: JejuGothic; font-size: 15px; border-spacing: 0px;">
						<tr>
							<td rowspan="3">
								<img style="width: 140px; height: 140px; border-radius: 70px;" src="<c:url value="/img/profileImg/${pro.imgPath}" />" alt="본인 프로필 이미지" />
							</td>
							<td style="color: rgb(87, 87, 87); padding: 0px 5px 0px 20px; font-size: 22px">${pro.nickname}님(${pro.birth})</td>
						</tr>
						<tr>
							<td style="color: rgb(151, 149, 149); padding: 0px 5px 0px 20px;">
								<c:choose>
									<c:when test="${pro.academy ne '' and pro.academy != null}">
										${pro.academy} ${pro.academyd}
									</c:when>
									<c:otherwise>
										${pro.universe} ${pro.univsub}
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;경력
								<c:if test="${pro.career!=0}">${pro.career}년이상</c:if>
								<c:if test="${pro.career==0}">1년미만</c:if>
							</td>
						</tr>
						<tr>
							<td class="locale" style="word-break: keep-all; line-height: 25px; padding: 0px 5px 0px 20px;">${pro.locales}</td>
						</tr>
					</table>
					<div style="text-align: right; font-size: 15px; margin-top: 25px; color: rgb(117, 116, 116);">
						<c:if test="${pro.certify==0}">
							<b style="color: orange">본인 학력 인증을 해주세요.&nbsp;&nbsp;</b>
						</c:if>
						<c:if test="${pro.certify==1}">
							<b style="color:#F4C60B">본인인증완료&nbsp;&nbsp;학력인증완료&nbsp;&nbsp;</b>
						</c:if>
						<c:if test="${pro.certify==2}">
							<b><span style="color: #FF3636">&quot;인증 실패&quot;</span> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</b>
						</c:if>
						<c:if test="${pro.certify==3}">
							<b><span style="color: orange">&quot;심사 중&quot;</span> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</b>
						</c:if>
						<span class="certify" style="cursor: pointer; border-radius: 15px; padding: 8px 10px; background: #EF904F; color: white;">
							<b> 본인/학력 인증 </b>
						</span>
						&nbsp;&nbsp; <a href="./profile" style="text-decoration: none; color: black"> <span class="profile" style="border-radius: 15px; padding: 8px 10px; background: #EF904F; color: white;">
								<b> 프로필 수정하기 </b>
							</span>
						</a>



					</div>
					<div style="text-align: center; margin-top: 20px; line-height: 180%;">

						<c:if test="${pro.certify==0}">
							<b style="color: orange; font-size: 15px;">미인증시 상위노출에 제한이 있으며 지원서 발송에 제한이 있습니다.</b>
						</c:if>
						<c:if test="${pro.certify==2}">
							<b style="font-size: 15px;">프로필 확인후 정확한 증명서 제출하시기 바랍니다.</b>
						</c:if>
						<c:if test="${pro.certify==3}">
							<b style="font-size: 15px;">인증 심사에는 1~2일 정도 걸릴 수 있습니다.</b>
						</c:if>
					</div>
				</div>
				<div class="div-title">수업 목록 (${size}/1)</div>
				<div style="width: 800px; background: white; margin: auto; padding: 20px;">
					<div class="lesson-make lesson-permit" href="#lesson" style="margin: auto; width: 690px; border: 1px dashed gray; cursor: pointer">
						<div style="text-align: center; margin: 15px auto; font-size: 20px; color: rgb(158, 158, 158)">
							<b> <span style="font-size: 13px;">수업을 만들어 학생들과 만나보세요.</span> <br /><span style="font-size:30px;font-weight:bold;">+</span><br /> 수업 만들기
							</b>
						</div>
					</div>
					<c:if test="${size != 0}">
						<div style="min-height: 300px;">

							<table class="list" style="border-spacing: 0px 15px;">

								<c:forEach var="post" items="${list}">
									<%@ include file="/WEB-INF/view/include/pcLessonCard.jsp"%>
								</c:forEach>


							</table>

						</div>
					</c:if>
				</div>
			</c:if>
		</div>

		<div class="tutorial-first-back"></div>
		<div class="tutorial-first">
			<div class="tutorial-para">
				<div class="tutorial-first-title">이제, 나의 수업을 만들어보세요.</div>
				<div>
					입력양식에 따라 차근차근
					<br />
					나의 수업을 채워 넣어보세요.
				</div>
			</div>
			<div>
				<a href="./lessonWrite?cok_tutorial=first_lesson" style="text-decoration: none;">
					<div class="tutorial-btn">수업 작성하기</div>
				</a>
			</div>
			<div class="tutorial-close-div">
				<span class="tutorial-close">[닫기x]</span>
			</div>
		</div>

		<div class="tutorial-certi">
			<div class="tutorial-para">
				<div class="tutorial-first-title">
					마지막 단계,
					<br />
					본인/학력인증을 완료하면
					<br />
					수업이 정상적으로 노출되며
					<br />
					학생의 과외요청에
					<br />
					알림을 받을 수 있습니다.
				</div>
			</div>
			<div>
				<div class="tutorial-btn-certi">인증하기</div>
			</div>
			<div class="tutorial-close-div">
				<span class="tutorial-close-certi">[닫기x]</span>
			</div>
		</div>


		<div class="tutorial-success">
			<div class="tutorial-para">
				<div class="tutorial-first-title">모든 단계를 완료하였습니다.</div>
				<div>
					본인학력인증 검수 후
					<br />
					인증이 완료되면
					<br />
					모든 서비스가 적용됩니다.
				</div>
			</div>
			<div>
				<div class="tutorial-end">튜토리얼 종료</div>
			</div>
		</div>

	</section>

	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
	<script src="resources/jquery-number-master/jquery.number.min.js"></script>
	<script src="resources/js/include/lessonCard.js"></script>
	<script>
		$(document).ready(function() {

			$('.tutor2').css('color', 'orange');

			var error = "<c:out value="${error}" />";

			if (error == "error") {
				alert("수업은 1개만 등록 가능합니다.")
			}

			var delError = "<c:out value="${delError}" />";

			if (delError == "delError") {
				alert("삭제 처리가 되지 않았습니다. 새로고침 후에 다시 시도해 주시기 바랍니다.");
			}
			
			var lessonSize = "<c:out value="${size}" />";

			$('.lesson-make').hover(function() {
				$(this).addClass('lesson-make2');
			}, function() {
				$(this).removeClass('lesson-make2');
			});

			$('.lesson-make').click(function() {
				
				if(lessonSize>=1){
					alert("수업은 1개만 등록이 가능합니다.");
					return false;
				}
				
				window.location = './lessonWrite';
			});

			var email = "<c:out value="${email}" />";

			$('.certify').click(function() {
				var url = './certify?email=' + email;
				window.open(url, '', 'width=600, height=600');
			});

			$('.tutorpage-update').click(function() {
				var updateUrl = './update?id=' + $(this).find('.idval').val();
				window.location = updateUrl;
			});

			$('.tutorpage-delete').click(function() {
				debugger;
				var confirmflag = prompt("해당하는 수업을 삭제하시려면 \'삭제\' 라고 입력해주세요");

				if (confirmflag == '삭제') {
					return true;
					// 확인 버튼 클릭 true
				} else {
					return false;
					// 취소 버튼 클릭 false
				}
			});

			$('.tutorial-close').click(function() {
				$('.tutorial-first').hide();
				$('.tutorial-first-back').hide();
				SetCookie('tutorial', 'end')
			});

			$('.tutorial-close-certi').click(function() {
				$('.tutorial-certi').hide();
				$('.tutorial-first-back').hide();
				SetCookie('tutorial', 'end')
			});

			$('.tutorial-btn-certi').click(function() {
				$('.tutorial-certi').hide();
				$('.tutorial-first-back').hide();
				var url = './certify?email=' + email + '&cok_tutorial=last_step';
				window.open(url, '', 'width=600, height=600');
			});

			$('.tutorial-end').click(function() {
				window.location.reload();
			});

		});

		function getRequestParam() {
			var url = document.location.href;
			var qs = url.substring(url.indexOf('?') + 1).split('&');
			for (var i = 0, result = {}; i < qs.length; i++) {
				qs[i] = qs[i].split('=');
				result[qs[i][0]] = decodeURIComponent(qs[i][1]);
			}
			return result;
		}

		if (getRequestParam().cok_tutorial == "first_lesson") {
			if (GetCookie("tutorial") != "end") {
				$('.tutorial-first').toggle(500)
				$('.tutorial-first-back').show();
			}
		}

		if (getRequestParam().cok_tutorial == "first_certi") {
			if (GetCookie("tutorial") != "end") {
				$('.tutorial-certi').toggle(500)
				$('.tutorial-first-back').show();
			}
		}

		function sendFromOpener(value) {
			if (value == "tutorial_success") {
				$('.tutorial-success').toggle(500)
				$('.tutorial-first-back').show();
				SetCookie('tutorial', 'end')
			}
		}

		function SetCookie(sName, sValue) {
			var date = new Date();
			date.setTime(date.getTime() + (1 * 24 * 60 * 60 * 1000));
			document.cookie = sName + "=" + escape(sValue) + ";expires=" + date.toGMTString();
		}

		function GetCookie(sName) {
			/*저장되어있는 쿠키 정보 불러오기
			오픈 페이지에서 부여하는 쿠키의 이름 및 값을 aCookie라는 변수에 저장.
			여기서는 test_cookie=1이란 값이 저장 */
			var aCookie = document.cookie.split("; ");
			//검색을 원하는 쿠키명(test_cookie)과 저장되어 있는 쿠키의 이름이 일치하는지 확인
			for (var i = 0; i < aCookie.length; i++) {
				var aCrumb = aCookie[i].split("=");
				if (sName == aCrumb[0]) {
					return unescape(aCrumb[1]);
				}
			}
			return null;
		}
	</script>
</body>
</html>