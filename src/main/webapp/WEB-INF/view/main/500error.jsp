
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
<div style="width:200px;height:200px;border-radius:100px;margin:50px auto 0px auto;display:table;background-color:lightgray;font-size:50px;text-align:center;">
<div style="vertical-align:middle;display:table-cell">!</div>
</div>
<div style="font-size:20px;text-align:center;">
<div style="color:orange;margin-top:30px;">서비스에 접속 할 수 없습니다.</div>
<div style="font-size:15px;margin-top:30px;">죄송합니다.<br/> 서버 내부 문제로 접속이 원활하지 않습니다.<br/> 잠시후 다시 이용 부탁드리며 이용에 불편을 드려 사과드립니다.</div>
<div style="font-size:15px;margin-top:30px;">고객센터. 02-959-1176</div>
</div>

<div style="margin-top:50px; text-align:center;">
<a href="javascript:history.back()" style="text-decoration:none"><span style="padding:10px;color:white;background:orange;border-radius:10px;">뒤로가기</span></a>
</div>
</body>
</html>

