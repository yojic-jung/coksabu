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

<c:forEach var="post" items="${imgList}">
<tr>
	<td>${post.email}</td>
	<td><img src="<c:url value='/resources/certifyImg/${post.certifyimg1}' />" style="width:100%; magin-top:0px;"/></td>
	<td><img src="<c:url value='/resources/certifyImg/${post.certifyimg2}' />" style="width:100%; magin-top:0px;"/></td>
	<td><c:if test="${post.certifyimg3!=null}" ><img src="<c:url value='/resources/certifyImg/${post.certifyimg3}' />" style="width:100%; magin-top:0px;"/></c:if></td>
</tr>
</c:forEach>
</table>

</body>
</html>