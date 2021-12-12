<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.rootDiv{
	width:1200px;
	margin:100px auto;
	font-size: 20px;
}

.pageTitle{
	font-size:30px;
	text-align:center;
	margin:10px 0 100px 0;
}
#city, #district, #school {
	min-width: 150px;
}

#contentsFile {
	width: 750px;
	border:1px solid gray;
	background: #EAEAEA;
}

#fileDiffrentMsg {
	display: none;
	font-size:18px;
	color:#002266;
	font-weight:bold;
}

.submit-btn {
	margin-left: 30px;
	padding: 10px;
	color: white;
	background: orange;
}

.fileDiv, .contentsPropertyDiv, .workSttsTable {
	margin: 50px 0px 0px 30px;
}

.workSttsTable {
	border-spacing: 0px;
	text-align: center;
}

.workSttsTable td {
	border-spacing: 0px;
	padding: 10px;
	border: 1px solid gray;
}

.workSttsTable td:nth-child(even) {
	background: #EAEAEA;
}

.fileDiv input, .contentsPropertyDiv select, .workSttsTable select {
	font-size: 20px;
}
.submitDiv{
	text-align: right;
	margin-top:50px;
}
.submitDiv input{
	width:200px;
	font-size: 20px;
}

.hide{
	display:none;
}
</style>
</head>
<body>
	<table id="fileDiffrentMsg">
		<tr>
			<td>실제파일명 :</td>
			<td id="originFileName"></td>
		</tr>
		<tr>
			<td>사용자 선택파일명 :</td>
			<td id="userSelectName"></td>
		</tr>
		<tr>
			<td colspan="2">파일명이 서로 다릅니다. 다시한번 확인하여 업로드 해주시기 바랍니다.</td>
		</tr>
	</table>


	<script>
		var cityArr = new Array();
		var districtArr = new Array();
		var schoolArr = new Array();

		var matchArr = new Array();
	</script>
	<c:forEach var="menu" items="${contentsMenu}">
		<script>
			var city = "<c:out value="${menu.city}" />";
			var district = "<c:out value="${menu.district}" />";
			var school = "<c:out value="${menu.school}" />";
			if (!cityArr.includes(city)) {
				cityArr.push(city);
			}
			if (!districtArr.includes(district)) {
				districtArr.push(district);
			}

			matchArr.push([city, district, school
			]);
		</script>

	</c:forEach>
	<div class="rootDiv">
		<div class="pageTitle"> 기출문제 파일 업로드 </div>
		<form method="post" enctype="multipart/form-data" onSubmit="return check(this)">
			<div class="fileDiv">
				<input id="contentsFile" type="file" name="contentsFile" />
			</div>
			<div class="contentsPropertyDiv">
				<select id="year" name="year">
					<option>2020년</option>
					<option>2019년</option>
				</select>
				<select id="city" name="city"></select>
				<select id="district" name="district"></select>
				<select id="school" name="school"></select>
				<select id="grade" name="grade">
					<option>1학년</option>
					<option>2학년</option>
					<option>3학년</option>
				</select>
				<select id="semester" name="semester">
					<option>1학기</option>
					<option>2학기</option>
				</select>
				<select id="term" name="term">
					<option>중간</option>
					<option>기말</option>
				</select>
				<select id="subject" name="subject">
					<option>고등수학</option>
					<option>수학1</option>
					<option>수학2</option>
					<option>확률과통계</option>
					<option>미적분</option>
					<option>기하와벡터</option>
				</select>
				
				<input type="text" name="extension" id="extension" style="display:none;"/> 
				
			</div>
			<table class="workSttsTable">
				<tr>
					<td>이미지 작업 여부</td>
					<td>서술형 수정 여부</td>
					<td>정답 포함 여부</td>
					<td>원본파일 확장자</td>
					<td class="hide">파일럿 테스트 진행 여부</td>
					<td class="hide">고객 서비스 가능 여부</td>
				</tr>
				<tr>
					<td>
						<select id=imgWorkStts name="imgWorkStts">
							<option>--선택--</option>
							<option value="0">미작업</option>
							<option value="1">작업완료</option>
						</select>
					</td>
					<td>
						<select id=stateWorkStts name="stateWorkStts">
							<option>--선택--</option>
							<option value="0">미수정</option>
							<option value="1">수정완료</option>
						</select>
					</td>
					<td>
						<select id=ansExistStts name="ansExistStts">
							<option>--선택--</option>
							<option value="0">정답 미포함</option>
							<option value="1">정답 포함</option>
						</select>
					</td>
					<td>
						<select id=orginExtension name="orginExtension">
							<option>--선택--</option>
							<option>hwp</option>
							<option>pdf</option>
						</select>
					</td>
					<td class="hide">
						<select id=tempTestStts name="tempTestStts">
							<option>--선택--</option>
							<option value="0" selected>미진행</option>
							<option value="1">진행완료</option>
						</select>
					</td>
					<td class="hide">
						<select id=svcPossible name="svcPossible">
							<option>--선택--</option>
							<option value="0" selected>서비스 불가</option>
							<option value="1">서비스 가능</option>
						</select>
					</td>
				</tr>
			</table>
			
			<div class="submitDiv">
				<input type="submit" class="submit-btn" value="보내기" />
			</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
		$(document).ready(function() {
			debugger;
			for (var i = 0; i < cityArr.length; i++) {
				debugger
				$('#city').append('<option>' + cityArr[i] + '</option>');
			}

			$('#district').append('<option>--선택--</option>');
			for (var i = 0; i < districtArr.length; i++) {
				$('#district').append('<option>' + districtArr[i] + '</option>');
			}

			$('#district').change(function() {
				$('#school option').remove();
				for (var i = 0; i < matchArr.length; i++) {
					if ($('#district').val() == matchArr[i][1]) {
						$('#school').append('<option>' + matchArr[i][2] + '</option>');
					}
				}
			});

			var duplicate = "<c:out value="${duplicate}" />";
			if (duplicate == "duplicate") {
				alert("이미 등록되어있는 파일입니다. 다시한번 확인 후 등록해주세요.")
			}

			var originFileName = "<c:out value="${originFileName}" />";
			var userSelectName = "<c:out value="${userSelectName}" />";
			debugger;
			if (originFileName != "undefined" && originFileName != "") {
				$('#fileDiffrentMsg').show();
				debugger;
				$("#originFileName").append(originFileName);
				$("#userSelectName").append(userSelectName);
				debugger;
				alert("파일명이 서로 다릅니다. 다시한번 확인하여 업로드 해주시기 바랍니다.");
			}

		});

		function check() {
			if ($('#contentsFile').val() == "") {
				alert("파일을 업로드 해주세요.");
				return false;
			}
			if ($('#school').val() == null) {
				alert("학교를 선택하세요.");
				return false;
			}
			if ($('#subject').val() == "선택") {
				alert("과목을 선택하세요.");
				return false;
			}
			//
			if ($('#imgWorkStts').val() != "0" && $('#imgWorkStts').val() != "1") {
				alert("이미지 작업 여부를 선택하세요");
				return false;
			}

			if ($('#stateWorkStts').val() != "0" && $('#stateWorkStts').val() != "1") {
				alert("서술형 수정 여부를 선택하세요.");
				return false;
			}

			if ($('#ansExistStts').val() != "0" && $('#ansExistStts').val() != "1") {
				alert("정답 포함 여부를 선택하세요.");
				return false;
			}

			if ($('#orginExtension').val() != "hwp" && $('#orginExtension').val() != "pdf") {
				alert("원본파일의 확장자를 선택하세요.");
				return false;
			}

			if ($('#tempTestStts').val() != "0" && $('#tempTestStts').val() != "1") {
				alert("파일럿 테스트 진행 여부를 선택하세요.");
				return false;
			}

			if ($('#svcPossible').val() != "0" && $('#svcPossible').val() != "1") {
				alert("고객 서비스 가능 여부를 선택하세요.");
				return false;
			}
			
			var filevalue = $("#contentsFile").val().split("\\");
			var extensionVal = filevalue[filevalue.length-1].split(".");
			var extension = extensionVal[extensionVal.length-1];
			$("#extension").val(extension);
		}
	</script>
</body>
</html>