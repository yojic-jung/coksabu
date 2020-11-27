<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>장바구니 가득참 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="장바구니 가득 찼을때 포워드 페이지" />
</head>
<body>
<script>
var full = "<c:out value="${full}" />";
var postId = "<c:out value="${postId}" />";
window.location="./boardread?postId="+postId+"&full="+full;
</script>
</body>
</html>