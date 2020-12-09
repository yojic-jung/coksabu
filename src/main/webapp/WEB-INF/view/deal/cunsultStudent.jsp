<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>내가 신청한 상담, 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="학생이 선생님에게 상담신청한 목록" />
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
.pagemove{
    	width:200px;
    	margin:30px auto;
    	text-align:center;
    }
.div-title{
            width:800px; margin:auto; padding:30px 0px 15px 0px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
#boardread:hover{
background: lightgray;
}
.select{
padding:15px;color:orange; background:white; border:1px solid dimgray; border-bottom:1px solid white;
}
.dis{
 padding:15px; color: dimgray; border:1px solid dimgray; border-bottom:1px solid white; 
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
<div style="min-height:300px; background:rgb(233, 232, 232); padding:30px;">
	<div class="div-title" style="margin-top:50px;">
	<a href="./cunsultStudent" style="text-decoration:none;"><span class="select">신청한 상담(학생전용)</span></a> 
	<a href="./cunsultTutor" style="text-decoration:none;"><span class="dis">신청받은 상담(선생님전용)</span></a>
	</div>
 	<div style="width:800px; border:1px solid dimgray; background:white; margin: auto; padding:20px;min-height:200px;">
		
		<table style="border-spacing:0px;width:700px; margin:auto;">
		<tr style="font-size:12px;font-weight:bold;">
 		<td style="border-bottom:1px solid orange;padding:10px;">날짜</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">상담신청 수업</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">선생님 성함</td>
 		<td style="border-bottom:1px solid orange;padding:10px;">보낸 메세지</td>
 		</tr>
 	<c:choose>	
 	<c:when test="${listModel.hasList == false }" >
	<tr>
	<td style="min-height:300px;font-family:'JejuGothic'; font-size:18px;padding:20px;" colspan="4">
	내가 신청한 상담은 없습니다.
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	<c:forEach var="list" items="${listModel.list}">
 	<tr>
 		<td style="width:100px;">
 		<span style="color:orange;font-size:14px;font-family: 'JejuGothic'; ">${list.dateJ}</span>
 		</td>
 		<td style="width:200px; line-height:150%;">
 		<div id="boardread">
 		<a  href="./boardread?postId=${list.lessonid}" style="color:gray; text-decoration:none;">
 		<div style="font-size:15px;font-family: 'JejuGothic'; ">${list.title}</div>
 		<div style="font-size:12px;font-family: 'JejuGothic'; ">${list.cate}(${list.subcate})</div>
 		</a>
 		</div>
 		</td>
		<td style="font-size:14px;font-weight:bolder;color:dimgray;">
			${list.teachername}
		</td>
		<td style="font-size:12px;;">
		 <textarea style="padding:5px;line-height:150%;" rows="4" cols="35" disabled>${list.message}</textarea>
		</td>
 	</tr>
 	</c:forEach>
 	</c:otherwise>
</c:choose>
 	
 	
		</table>
		
		<div class="pagemove">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="./purchaselist?p=${beginPage-1}"/>" style="color: black">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a href="<c:url value="./purchaselist?p=${pno}"/>" style="color: black">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a href="<c:url value="./purchaselist?p=${pno}" />" style="color: black">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a href="<c:url value="./purchaselist?p=${endPage+1}"/>" style="color: black">...다음</a>
	</c:if>
	</div>
<div style="text-align:right; font-size:12px;">상담내역은 최근 1년간 목록만 공개됩니다.</div>
 	</div>
</div>


  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
 $(document).ready(function(){
        	  $('.menu-title').append("상담신청목록");
        	  $('.my2').css('color','orange');
        	  });
		</script>
</body>
</html>