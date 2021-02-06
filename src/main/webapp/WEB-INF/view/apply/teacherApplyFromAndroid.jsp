<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
</head>
<body>
<script>
var id = "<c:out value="${id}" />";
location.href="./teacherApply?id="+id;
</script>
</body>
</html>