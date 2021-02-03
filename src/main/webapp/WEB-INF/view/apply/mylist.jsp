<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>선생님 이력목록 콕사부</title>
 <meta charset="utf-8">
 <meta name="description" content="나의 수업에 응답한 선생님 리스트" />
 <meta property="og:type" content="website">
<meta property="og:title" content="나의 수업 요청 내역">
<meta property="og:site_name" content="수업요청내역">
<meta property="og:description" content="학생의 수업요청 내역 리스트입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/mypage">
<link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
<style>
	.div-title{
            width:800px; margin:auto; padding:0px 0px 10px 10px;
            font-size:17px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
        #name{
			color:dimgray;
			font-size:14px;
			font-family:'malgun-gothic';
			margin-bottom:10px;
		}
	
		#grade{
			font-size:15px;
			color:dimgray;
			font-weight:bolder;
			margin-bottom:10px;
			font-family:'malgun-gothic';
		}
	
		#subcate{
			font-size:15px;
			color:dimgray;
			font-family:'malgun-gothic';
			margin-bottom:10px;
			font-weight:bolder;
			
		}
		
	#subcate-div{
			width:198px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
	}
	
	#locale{
			font-size:14px;
			font-family:'malgun-gothic';
			color:gray;
			margin-bottom:10px;
			width:198px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
	}
	
	#price{
		font-size:14px;
		font-family:'malgun-gothic';
		color:gray;
		margin-bottom:10px;
	}
	.btn{
		border-radius:5px;
		padding:5px;
		background:dimgray;
		color:white;
		font-size:12px;
		margin-right:5px;
		
	}
	.apply-table{
		width:360px;
		margin:10px auto;
	}
	
	.apply-table td{
		width:90px;
		padding:10px;
		min-height:30px;
		font-size:14px;
		color: black;
		text-align:center;
		border-right:0.2px solid lightgray;
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

<div style="min-height:300px; background:rgb(233, 232, 232); padding:30px;">
<div class="div-title" style="margin-top:50px;">나의 수업 요청 내역</div>
 	<div style="width:800px; background:white; margin: auto; padding:20px;min-height:200px;">
 		
 		<c:choose>
 		<c:when test="${bool}">
 			<div style="font-size:17px; font-family:'JejuGothic'; text-align:center;margin-top:50px;line-height:150%;">
 			현재 수업 요청 내역이 없습니다.<br/>
 			선생님을 찾고 계신다면 <a href="./apply" style="text-decoration:none; color:rgb(226, 193, 6); font-size:22px">[수업요청]</a> 을 해보세요.
 			</div>
 		</c:when>
 		<c:otherwise>
 		<div style="margin:20px; text-align:center;">
선생님을 찾고 계신다면 <a href="./apply" style="text-decoration:none; color:rgb(226, 193, 6); font-size:22px">[수업요청]</a> 을 해보세요.
		</div>
 		</c:otherwise>
 		
 		</c:choose>

	 <table border="0" class="list">
	<% int i=-1; %>
	<c:forEach var="apply" items="${list}">
	<% i++; %>
	<c:set var="k" value="<%= i %>" scope="page" />
	<c:if test="${k%4==0}" >
	<tr>
	</c:if>
	
	<td>
<div id="pst" style="border:1px solid silver;vertical-align:top;padding:15px; width:230px; margin:10px;
				">
		<div href="#applyform" class="student" style="text-decoration:none; color:black;cursor:pointer">
		<div style="padding:0px;font-family:'JejuGothic';;">
		<div id ="name" class="name">${apply.name} 학생</div>
		<div id="grade">${apply.grade}</div>
		<div id="subcate-div" style="margin-bottom:10px;"><span id="subcate">${apply.subcate}</span></div>
		<div id="locale">${apply.locale} ${apply.locale3}</div>
		<div id="price">희망가격 <span style="color:black;font-size:15px;font-weight:bold">${apply.price1} ~ ${apply.price2}</span></div>
		
		
		<!-- 컬러박스 -->
		<div class="apply-read" style="display: none;">
			<div style="width:400px; min-height:250px; font-family:'JejuGothic';color:dimgray;background:rgb(252, 251, 251);">
				
				<div style="width:400px; background:rgb(241, 241, 239);padding:10px;">
					<div style="margin:10px 0px; font-size:15px; text-align:center">${apply.name}(${apply.sexual})</div>
					<div style="margin:10px 0px;color:orange; font-size:18px;text-align:center">${apply.subcate}</div>
					<div style=" margin:10px 0px 10px 0px; font-size:15px;font-weight:bolder; text-align:center"></div>
				</div>
				<hr style=" border:0.5px solid lightgray; margin:auto"/> 

				<table class="apply-table">
				<tr>
				<td>${apply.locale} ${apply.locale3 }</td>
				<td>${apply.day}</td>
				<td style="border:none;">${apply.grade}<br/>
				</td>
				</tr>
				</table>
				
				<div style="width:400px; background:rgb(241, 241, 239);padding:10px;">
				<div style="margin:20px 0px 10px 0px; font-size:16px;font-weight:bolder; text-align:center">희망 가격 ${apply.price1} ~ ${apply.price2}</div>
				<div style="margin:10px 0px 10px 0px; font-size:13px;font-weight:bolder; text-align:center">(${apply.month}, 회당 ${apply.gawetime} )</div>
				</div>
				
				<div style="padding:20px; color:orange;line-height:150%;">${apply.message}</div>
				
				<div style="text-align:center;">
				<span class="applybtn" style="border-radius:5px; padding:5px; color:white;background:dimgray;  cursor:pointer" >
				<a href="./teacherForm?id=${apply.id}"  style="text-decoration:none;color:white;">선생님 요청서 보기</a>
				</span></div>
			</div>
		</div>
		</div>
	</div>
	</div>
 		<div style="text-align:right;padding-right:10px;">
 		
 			<span class="applybtn" style="margin-right:5px;font-size:12px;border-radius:5px; padding:5px; color:white;background:dimgray; cursor:pointer" >
				<a href="./teacherForm?id=${apply.id}" style="text-decoration:none;color:white;">선생님 요청서 보기</a>
				<input class="lessonId" style="display:none;" type="text" value="${apply.id}"/>
			</span>
		
		<a class="delete" href="./myapply/delete?id=${apply.id}" style="text-decoration:none;"><span class="btn">삭제하기</span></a>
		
		</div>
 		
 		</td>
 		</c:forEach>
 		</table>
 		<br/><br/>
 	<div style="text-align:right; font-size:14px;margin:15px 0px;">수업요청내역은 최근 1년간 목록만 공개됩니다.</div>
 		<div style="display:none; font-size:15px; color:gray; ">
            <div id="applyform" ></div>
        </div>
        
        
 	</div>
</div>
 <div style="padding:50px;">
 <div style="width:1000px; margin:20px auto; font-family:'JejuGothic'; font-size:18px;">추천 카테고리</div>
 <table class="recom-table">
 <tr>
 		<td>
 			 <div><a href="./boarder?main=71&subject=73" ><img src="<c:url value="/resources/img/cunsult1.png" />"  alt="입시컨설팅"/></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=71&subject=72" ><img src="<c:url value="/resources/img/cunsult2.png"  />" alt="자소서첨삭"/></a></div>
 		</td>
  		<td>
 		<div><a href="./boarder?main=11&subject=16" ><img src="<c:url value="/resources/img/math5.png" />" alt="고등수학"></a></div>
 		</td>
 	</tr>
 	<tr>
  		<td>
 		<div><a href="./boarder?main=21&subject=27" ><img src="<c:url value="/resources/img/toeic.png" />"  alt="토익토플텝스"/></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=21&subject=26" ><img src="<c:url value="/resources/img/freetalking.png" />"  alt="영어회화"/></a></div>
 		</td>
  		<td>
 		 <div><a href="./boarder?main=21&subject=24" ><img src="<c:url value="/resources/img/higheng.png" />"  alt="고등영어"/></a></div>
 		</td>
 	</tr>
 	<tr>
  		<td>
 		<div><a href="./boarder?main=41&subject=46" ><img src="<c:url value="/resources/img/society1.png" />"  alt="한국사"/></a></div>
 		</td>
  		<td>
		<div><a href="./boarder?main=51&subject=53" ><img src="<c:url value="/resources/img/science4.png" />" alt="중등과학" /></a></div>
 		</td>
  		<td>
		<div><a href="./boarder?main=61&subject=62" ><img src="<c:url value="/resources/img/arts.png" />" alt="미술"/></a></div>
 		</td>
 	</tr>
 </table>
 
 </div>


<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
<script>
  $(document).ready(function(){
	  $('.my4').css("color",'orange');
	  $('.student').colorbox({
	      inline:true,
	      overlayOpacity:0.5,
	      onOpen:function(){
	        $('#applyform').append( $(this).find('.apply-read').html() );
	      },
	      onClosed:function(){
	     	 $('#applyform').empty();
	      }
	    });
	  

  });
  
  
  $('.delete').click(function(){
    var confirmflag = confirm("해당하는 수업요청을 삭제하시겠습까?");

    if(confirmflag){
		return true;
       //확인 버튼 클릭 true 
    }else{
		return false;
      //취소 버튼 클릭 false
    }
});
</script>
</body>
</html>