<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>대학검색 콕사부</title>
 <meta name="description" content="선생님 본인 대학 검색" />
</head>
<body>


<p>
<form method="post" name="memberInfo" >
	<label for="id">대학</label>: 
	<input name="id" id="id" onclick="openIdChk()"/>
	<input type="button" value="대학검색"  onclick="openIdChk()"/>
</form>
</p>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
function openIdChk(){
	window.name="parentForm";
	window.open("subCheckForm", "chkForm", "width=500, height=300, resizable = no, scrollbars=no");
	//수정
}

</script>
</body>
</html>