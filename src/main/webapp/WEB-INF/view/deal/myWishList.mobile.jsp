<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>장바구니 거래 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="나의 수업 찜 목록" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<link rel="canonical" href="https://coksabu.com/wishlist">
<style>
@charset "UTF-8";
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
      
      html, body, section{
      	height:100%;
      }
.lesson-href{
	text-decoration:none;
	color:black;
}
.delete{
		border:none;
	background:rgb(42, 45, 54);
	padding:10px 15px;
	color:white;
	font-size:25px;
}
.div-title{
			font-size:30px;
            width:90%; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
	#categories{
		width:100%; 
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		padding:10px 60px;
		color:Grey;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}

    #name{
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		color: DimGrey;
		padding:10px 20px;
	}
	
	#title{
		font-family:'JejuGothic';
		font-weight:bold;
		color: black;
		font-size: 30px;
		padding:10px 20px;
	}
#universe{
		font-family:'JejuGothic';
		font-weight:bold;
		color: dimgray;
		font-size: 30px;
		padding:10px 20px;
	}
#profile{
	width:150px; height:150px; border-radius:75px;border:5px solid orange;
}
	#price{
		font-family:Arial;
		font-weight:bold;
		font-size:30px;
		margin-top:5px;
		padding:10px 20px;
		color:black;
	}

    #pst:hover{
box-shadow:0px 0px 4px 4px LightGoldenRodYellow;
}
.recom-table{
	width:100%;
	margin:auto;
	border-spacing:30px;
}
.recom-table td{
	
	width:30%;
}
.recom-table img{
width:100%;
}
.wish-table{
	width:90%;margin:auto;
	border-spacing:0px 20px;
}
.wish-table td{
	width:500px;margin:0px;
	padding:0px;
}
</style>
</head>
<body>
<div style="background:rgb(233, 232, 232); padding:30px;width:100%">
 <div class="div-title">장바구니</div>
 <div style="width:90%; background:white; margin: auto; padding:20px;">
 	

 	<div >
 	<div style="font-size:30px; font-family:'JejuGothic';padding:30px;">장바구니 목록은 14일간 보관됩니다.</div>
 	<table class="wish-table" style="font-family:'JejuGothic';">
 	
<c:choose>	
 	<c:when test="${size == 0 }" >
	<tr>
	<td style="min-height:300px">
	<div style="width:100%; text-align:center;font-size:30px;min-height:80px;text-align:center;color:orange;padding:30px;">장바구니가 비어있습니다.</div>
	</td>
	</tr>
	</c:when>
 	<c:otherwise>
 	
						<c:forEach var="lesson" items="${list}" >
						<tr>
						<td style="width:30%;">
						<a href="./boardread?postId=${lesson.id}" style="text-decoration:none;">
						<img src="<c:url value='/img/representImg/${lesson.represent}' />" style="width:100%; height:250px;border-radius:20px; "/><br/>
						</a>
						</td>
						<td>
						<a href="./boardread?postId=${lesson.id}" style="text-decoration:none;">
							<div>
							<div id="title"> ${lesson.title}</div>
							<div id="name">${lesson.nickname}(${lesson.birth}, ${lesson.sexual})&nbsp;&nbsp;경력 <c:if test="${lesson.career!=0}">${lesson.career}년</c:if><c:if test="${lesson.career==0}">1년미만</c:if></div>
							<div id="universe"> ${lesson.universe} ${lesson.univsub}</div>
							<div id="price" > ${lesson.subCate0} ${lesson.price3}원 <c:if test="${lesson.subCate1 !='nonevalue' }">/ ${lesson.subCate1} ${lesson.opt1price3}원</c:if> <c:if test="${lesson.subCate2!='nonevalue' }">/ ${lesson.subCate2} ${lesson.opt2price3}원</c:if></div>
							</div>
							</a>
						</td>
						</tr>
						<tr>
						<td colspan="2">
							<div style="text-align: right;margin-bottom:60px">
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
 <div style="padding:50px 50px 320px 50px;">
 <div style="width:100%; margin:20px auto; font-family:'JejuGothic'; font-size:25px;">추천 카테고리</div>
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