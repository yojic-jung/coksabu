<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
#city, #district, #school{
	min-width:100px;
}
#contents{
	width:750px;
}
#fileDiffrentMsg{display:none;}
.submit-btn{
	margin-left:30px;
	padding:10px;
	color: white;
	background:orange;
}
</style>
</head>
<body>
<table id="fileDiffrentMsg">
	<tr>
		<td>실제파일명 :</td><td id="originFileName"></td>
	</tr>
	<tr>
		<td>사용자 선택파일명 :</td><td id="userSelectName"></td>
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
if(!cityArr.includes(city)){
	cityArr.push(city);
}
if(!districtArr.includes(district)){
	districtArr.push(district);
}

matchArr.push([city, district, school]);
</script>

</c:forEach>
<form method="post" enctype="multipart/form-data" onSubmit="return check(this)">
	<br/>
	<br/>
	<br/>
	<br/>
	<input id="contents" type="file" name="contentsFile" />
	<br/>
	<br/>
	<br/>
	<br/>
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
		<option>선택</option>
		<option>고등수학</option>
		<option>수학1</option>
		<option>수학2</option>
		<option>확률과통계</option>
		<option>미적분</option>
		<option>기하와벡터</option>
	</select>
	<input type="submit" class="submit-btn" value="보내기" />
</form>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	debugger;
	for(var i=0; i<cityArr.length; i++){
		debugger
		$('#city').append('<option>'+cityArr[i]+'</option>');
	}
	
	$('#district').append('<option>--선택--</option>');
	for(var i=0; i<districtArr.length; i++){
		$('#district').append('<option>'+districtArr[i]+'</option>');
	}
	
	$('#district').change(function(){
		$('#school option').remove();
		for(var i=0; i<matchArr.length; i++){
			if($('#district').val() == matchArr[i][1]){
				$('#school').append('<option>'+ matchArr[i][2]+'</option>');
			}
		}
	});
	
	var duplicate = "<c:out value="${duplicate}" />";
	if(duplicate=="duplicate"){
		alert("이미 등록되어있는 파일입니다. 다시한번 확인 후 등록해주세요.")
	}
	
	var originFileName = "<c:out value="${originFileName}" />";
	var userSelectName = "<c:out value="${userSelectName}" />";
	debugger;
	if(originFileName!="undefined" && originFileName!=""){
		$('#fileDiffrentMsg').show();
		debugger;
		$("#originFileName").append(originFileName);
		$("#userSelectName").append(userSelectName);
		debugger;
	}
	
});

function check(){
	if($('#contents').val()==""){
		alert("파일을 업로드 해주세요.");
		return false;
	}
	if($('#school').val()==null){
		alert("학교를 선택하세요.");
		return false;
	}
	if($('#subject').val()=="선택"){
		alert("과목을 선택하세요.");
		return false;
	}
	
}
</script>
</body>
</html>