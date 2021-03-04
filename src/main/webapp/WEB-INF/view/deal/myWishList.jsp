<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>장바구니 거래 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="나의 수업 찜 목록" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
.lesson-href{
	text-decoration:none;
	color:black;
}
.delete{
		border:none;
	background:rgb(42, 45, 54);
	padding:5px;
	color:white;
	font-size:14px;
}
.div-title{
            width:800px; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
        
   #categories{
font-family:'JejuGothic';
font-weight:bold;
font-size:16px;
color:Grey;
padding:5px;
}
    #name{
font-family: 'JejuGothic';
font-weight:bold;
font-size:14px;
padding:5px;
color:black;
}
  #universe{
font-family: 'JejuGothic';
font-weight:bold;
color: DimGrey;
font-size:14px;
padding:5px;
}
#title{
font-family:'JejuGothic';
font-weight:900;
color: black;
font-size: 18px;
margin-top:7px;
padding:5px;
}

#price{
font-family:Arial;
font-weight:bold;
font-size:16px;
padding:5px;
margin-top:5px;
color: black;
}
#pst:hover{
box-shadow:0px 0px 4px 4px LightGoldenRodYellow;
}
.recom-table{
	width:1200px;
	margin:auto;
	border-spacing:30px;
}
.recom-table td{
	
	width:350px;
}
.recom-table img{
width:350px;
}
</style>

</head>
<body>
<div style="background:rgb(233, 232, 232); padding:30px;min-height:300px;">
 <div class="div-title">장바구니</div>
 <div style="width:800px; background:white; margin: auto; padding:20px;">
 	

 	<div >
 	<div style="font-size:12px; font-family:'JejuGothic';">장바구니 목록은 14일간 보관됩니다.</div>
 	<table style="border-spacing:0px 10px; font-family:'JejuGothic';">
 	
			<c:choose>	
 				<c:when test="${size == 0 }" >
					<tr>
					<td style="min-height:300px">
						<div style="width:700px; text-align:center;font-size:20px;min-height:80px;text-align:center;color:orange;padding-top:30px;">장바구니에 담긴 수업 목록이 없습니다.</div>
					</td>
					</tr>
				</c:when>
 				<c:otherwise>
 					<c:forEach var="lesson" items="${list}" >
						<tr style="width:100%;">
								<td>
								<a href="<c:url value="./boardread?postId=${lesson.id}"/>">
								<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
								<img src="<c:url value='/img/representImg/${lesson.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="수업대표이미지"/>
								</div>
								</a>
								</td>
								<td style="vertical-align:top;padding-top:30px;width:100%;">
								<a href="<c:url value="./boardread?postId=${lesson.id}"/>" style="text-decoration:none;">
								<div id="categories">${lesson.subcate}</div>
								<div id="name"> ${lesson.nickname}(${lesson.birth}, ${lesson.sexual})&nbsp;&nbsp;경력 <c:if test="${lesson.career!=0}">${lesson.career}년</c:if><c:if test="${post.lesson==0}">1년미만</c:if></div>
								<div id="universe"> ${lesson.universe} ${post.univsub}</div>
								<c:choose>
									<c:when test="${lesson.academy ne '' and lesson.academy != null}">
										<div id="universe"> ${lesson.academy} ${lesson.academyd}</div>
									</c:when>
									<c:otherwise>
										<div id="universe"> ${lesson.universe} ${lesson.univsub}</div>
									</c:otherwise>
								</c:choose>
								<div id="title"> ${lesson.title}</div>
								<div id="price" >${lesson.subCate0} ${lesson.price3}원 <c:if test="${lesson.subCate1 !='nonevalue' }">/ ${lesson.subCate1} ${lesson.opt1price3}원</c:if> <c:if test="${lesson.subCate2!='nonevalue' }">/ ${lesson.subCate2} ${lesson.opt2price3}원</c:if></div>
								</a>
							</td>
						</tr>
					   <tr>
					   <td colspan="2" style=" border-bottom:1px solid gray; padding-bottom:20px;">
							<div style="text-align:center;">
							<a href="./deletewish?postId=${lesson.id}" class="lesson-href"><span class="delete">삭제하기</span></a>
							</div>
						</td>
						</tr>
   		 				</c:forEach>
 	</c:otherwise>
</c:choose>
 	</table>
 	
 	
 	</div>
 	
 </div>
 </div>
 <div style="padding:50px;">
 <div style="width:1000px; margin:20px auto; font-family:'JejuGothic'; font-size:18px;">추천 카테고리</div>
 <table class="recom-table">
 <tr>
 		<td>
 			 <div><a href="./boarder?main=71&subject=73" ><img src="<c:url value="/resources/img/cunsult1.png" />" /></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=71&subject=72" ><img src="<c:url value="/resources/img/cunsult2.png" />" /></a></div>
 		</td>
  		<td>
 		<div><a href="./boarder?main=11&subject=16" ><img src="<c:url value="/resources/img/math5.png" />" alt="고등수학"></a></div>
 		</td>
 	</tr>
 	<tr>
  		<td>
 		<div><a href="./boarder?main=21&subject=27" ><img src="<c:url value="/resources/img/toeic.png" />" /></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=21&subject=26" ><img src="<c:url value="/resources/img/freetalking.png" />" /></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=21&subject=24" ><img src="<c:url value="/resources/img/higheng.png" />" /></a></div>
 		</td>
 	</tr>
 	<tr>
  		<td>
 		<div><a href="./boarder?main=41&subject=46" ><img src="<c:url value="/resources/img/society1.png" />" /></a></div>
 		</td>
  		<td>
		<div><a href="./boarder?main=51&subject=53" ><img src="<c:url value="/resources/img/science4.png" />" /></a></div>
 		</td>
  		<td>
		<div><a href="./boarder?main=61&subject=62" ><img src="<c:url value="/resources/img/arts.png" />" /></a></div>
 		</td>
 	</tr>
 </table>
 
 </div>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="resources/jquery-number-master/jquery.number.min.js"></script>
<script>
        $(document).ready(function(){
        	  $('.my5').css('color','orange');
          });
</script>
</body>
</html>