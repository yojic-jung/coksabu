<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<form method="post">
<input type="text" name="email"/>
<input type="submit" value="전송하기"/>
</form>

<script>
$(document).ready(function(){
	  var status = "<c:out value="${status}" />";
	  if(status=="success"){
		  	alert("성공적으로 삭제하였습니다.");
	  }
});
</script>
</body>
</html>