<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>에러페이지 콕사부</title>
<style>
     @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
</style>
</head>
<body>
<div style="width:300px;height:300px;border-radius:150px;margin:100px auto 0px auto;display:table;background-color:lightgray;font-size:50px;text-align:center;">
<div style="vertical-align:middle;display:table-cell">!</div>
</div>
<div style="width:60%;margin:30px auto 0px auto;text-align:center;font-family:'JejuGothic'; ">
페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.<br/>
비정상적인 접근일 가능성이 있습니다.
</div>
<div style="margin-top:150px; text-align:center;">
<a href="javascript:history.back()" style="text-decoration:none"><span style="padding:10px;color:white;background:orange;border-radius:10px;font-size:30px;">뒤로가기</span></a>
</div>
</body>
</html>