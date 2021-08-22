<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>이메일</td><td>최근 로그인 시간</td><td>회원탈퇴 요청 날짜</td>
		</tr>
		<c:forEach var="secession" items="${secessionList}">
		<tr>
			<td>${secession.email}</td><td>${secession.loginDateS}</td><td>${secession.secessionapplydateS}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>