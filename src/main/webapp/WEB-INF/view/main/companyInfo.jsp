<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회사소개 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="콕사부 회사소개 페이지입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="회사소개">
<meta property="og:site_name" content="회사소개">
<meta property="og:description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/companyInfo">
<link rel="canonical" href="https://coksabu.com/companyInfo">
<style>

body{


}
 .first{
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
min-height:400px;
 background-image:url(<c:url value="/resources/images/company.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
 
  .second{
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
min-height:400px;
 background-image:url(<c:url value="/resources/images/info.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
 
</style>
</head>
<body>
<div class="first">
<div style="padding-top:100px;">
콕사부에서,<br/>
실력있는 전문가와 안전하게 거래하세요.
</div>
</div>
<div style="min-height:400px;font-size:25px;text-align:center;">
<div style="padding:100px;">
<span style="padding:10px; border-bottom:1px solid orange;">레슨찾기, 레슨요청</span><br/><br/>
선생님을 직접 찾아 볼 수 있고, 수업을 요청하여 선생님들의 지원서를 받아 볼 수 도 있습니다.
</div>
</div>
<div class="second">
<div style="padding-top:100px;">
단순 매칭이 아닌,<br/>
거래부터 환불까지 안전한 플랫폼
</div>
</div>

<div style="min-height:400px; background-color:rgb(238, 238, 236);font-size:30px;padding:120px; text-align:center;">
<div>"지금 원하는 레슨을 찾아보세요."</div><br/>
<span style="border-radius:5px; width:100px; padding:10px;background:orange;font-size:20px;"><a href="./boarder?main=11&subject=11" style="text-decoration:none; color:white;"><b>레슨 찾기</b></a></span>

</div>
</body>
</html>