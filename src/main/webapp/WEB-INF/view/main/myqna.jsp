<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>나의 질문내역 고객센터 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="나의 질문내역" />
<meta property="og:type" content="website">
<meta property="og:title" content="나의 질문내역">
<meta property="og:site_name" content="나의 질문내역">
<meta property="og:description" content="콕사부가 모르는 것을 해결해드립니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/myqna">
<link rel="canonical" href="https://coksabu.com/myqna">
<style>

.div-title{
            width:1000px; margin:auto; padding:50px 0px 50px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
 .first{
  padding:60px;
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
 background-image:url(<c:url value="/resources/images/customer.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
  .left{
 	width:150px;margin:auto; float:left;
 	line-height:180%;
 	
 }
 .right{
 font-size:13px;
 	 width:700px;margin:auto; clear: right;
        padding:40px;
      	 border:1px solid rgb(180, 179, 179);
 }
  .pagemove{
    	width:200px;
    	margin:auto;
    	text-align:center;
    }
 
 #title{
 color:black;
 border:1px solid black;
 margin:0px;
 padding:10px;
 margin:0px;
  font-size:15px;
 }
 
 #content{
 background: rgb(226, 225, 225);
 padding:10px;
 margin:0px;
 font-size:15px;
 color:gray;
 width:500px;
 line-height:180%;
 }
 
 #answer{
 padding:10px;
 color: orange;
 font-size:15px;
 width:500px;
 line-height:180%;
 }
 
</style>
</head>
<body>
<div class="first">
<div>고객센터</div>
</div>


<div class="div-title">
	<div class="left">
	<div style="font-size:20px;padding:5px;"><b>고객센터</b>
	<hr style="width:100px;"/></div>
	<div><a href="./customer" style="text-decoration:none; color:black;">자주하는 질문</a></div>
	<div><a href="./qna" style="text-decoration:none; color:black;">고객문의</a></div>
	<div><a href="./myqna" style="text-decoration:none; color:black;">나의 질문내역</a></div>
	</div>
	
	<div class="right">
	<div style="font-size:16px;margin-bottom:20px;"><b>나의 질문내역</b></div>


<c:choose>
	<c:when test="${list.hasList == false }" >
	<table border="0" class="list">
	<tr>
	<td colspan="4" style="min-height:300px;">
	질문 내역이 없습니다.
	</td>
	</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table border="0" class="list">
	<c:forEach var="post" items="${list.list}">
	<tr>	
	<td>
	<div style="widht:400px; text-align:right;font-size:12px;">${post.dateJ}</div>
	<div id="title" >질문. ${post.title }</div>
	<div id="content">내용. ${post.content}</div>
	<c:if test="${post.answer != null}">
	<div id="answer">ㄴ 답변 <br/>${post.answer}</div>
	</c:if>
	<c:if test="${post.answer == null}">
	<div id="answer">빠른시일내에 고객님의 질문에 답변을 드리겠습니다.<br/>1~2일 정도의 시간이 걸릴수 있으니 양해부탁드립니다.</div>
	</c:if>
	<br/><br/>
	</td>
	</tr>
	</c:forEach>
	
	</table>


<div class="pagemove">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="./myqna?p=${beginPage-1}"/>">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a href="<c:url value="./myqna?p=${pno}"/>" style="color: black;font-size:13px;font-weight:bold;">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a href="<c:url value="./myqna?p=${pno}" />"  style="color: gray">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a href="<c:url value="./myqna?p=${endPage+1}"/>">...다음</a>
	</c:if>
	</div>


	</c:otherwise>
</c:choose>



	
	</div>
</div>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
</script>
</body>
</html>