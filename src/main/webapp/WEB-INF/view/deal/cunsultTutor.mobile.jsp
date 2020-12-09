<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>나에게 신청한 학생상담목록, 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="선생님이 학생에 상담신청받은 목록" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <style>
 html, body, section{
      	height:100%;
      }
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
.pagemove{
    	width:200px;
    	margin:30px auto;
    	text-align:center;
    }
.div-title{
            width:800px; margin:auto; padding:30px 0px 15px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
             font-size:24px;
        }
        
.select{
padding:15px;color:orange; background:white;border:1px solid dimgray; border-bottom:1px solid white;
}
.dis{
 padding:15px; color: dimgray;border:1px solid dimgray; border-bottom:1px solid white; 
}

table{
text-align:center;
}
table td{
padding:10px 5px;;
}
</style>
</head>
<body>
<div style="min-height:70%; background:rgb(233, 232, 232); padding:30px;">
	<div class="div-title" style="margin-top:50px;">
		<a href="./cunsultStudent" style="color:gray;text-decoration:none;"><span class="dis">신청한 상담(학생전용)</span></a>  
		<a href="./cunsultTutor" style="color:white;text-decoration:none;"><span class="select">신청받은 상담(선생님전용)</span></a>
	</div>
	
	<div style="width:90%;border:1px solid dimgray; background:white; margin:0px auto; padding:20px;min-height:200px;">
		
		<table style="border-spacing:0px;width:100%; margin:auto;">
		<tr style="font-size:18px;font-weight:bold;">
 		<td style="border-bottom:1px solid orange;padding:10px;">날짜</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">상담신청 수업</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">신청한 학생</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">메세지</td>
 		</tr>
 	<c:choose>	
 	<c:when test="${listModel.hasList == false }" >
	<tr>
	<td style="min-height:300px;font-family:'JejuGothic'; font-size:40px;padding:20px;" colspan="4">
	학생으로부터 받은 상담신청내역이 없습니다.
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	<c:forEach var="list" items="${listModel.list}">
 	<tr>
 		<td style="width:100px;">
 		<span style="color:orange;font-size:20px;font-family: 'JejuGothic'; ">${list.dateJ}</span>
 		</td>
 		<td style="width:200px; line-height:150%;">
 		<div style="font-size:20px;font-family: 'JejuGothic'; ">${list.title}</div>
 		<div style="font-size:20px;font-family: 'JejuGothic'; ">${list.cate}<br/>(${list.subcate})</div>
 		</td>
		<td style="width:150px;font-size:20px;">
		<div>${list.buyername} <br/>
		${list.buyerphone}</div>
		
		</td>
		<td style="font-size:12px;;">
		 <textarea style="padding:5px;line-height:120%;font-size:20px;" rows="8" cols="20" disabled>${list.message}</textarea>
		</td>
 	</tr>
 	</c:forEach>
 	</c:otherwise>
</c:choose>
 	
 	
		</table>
		
		<div class="pagemove">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="./purchaselist?p=${beginPage-1}"/>" style="color: black;font-size:30px;">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a href="<c:url value="./purchaselist?p=${pno}"/>" style="color: black;font-size:35px;margin:0px 10px;">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a href="<c:url value="./purchaselist?p=${pno}" />" style="color: gray;font-size:30px;margin:0px 10px;">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a href="<c:url value="./purchaselist?p=${endPage+1}"/>" style="color: black;font-size:35px;margin:0px 10px;">...다음</a>
	</c:if>
	</div>
	<div style="text-align:right; font-size:20px;">상담내역은 최근 1년간 목록만 공개됩니다.</div>
 	</div>
</div>

  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
 $(document).ready(function(){
	 
	 var none = "<c:out value="${none}" />"
	  
	  if(none=='none'){
		  alert('프로필과 수업을 모두 작성해주세요.')
		  window.location='./tutorpage';
	  }
       
	 $('.menu-title').append("신청받은 상담목록");
	 $('.my3').css('color','orange');
        	  });
		</script>
 </body>
</html>