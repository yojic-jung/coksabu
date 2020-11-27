<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>선생님 이력목록 콕사부</title>
 <meta charset="utf-8">
 <meta name="description" content="나의 레슨에 응답한 선생님 리스트" />
 <meta property="og:type" content="website">
<meta property="og:title" content="나의 레슨 요청 내역">
<meta property="og:site_name" content="레슨요청내역">
<meta property="og:description" content="학생의 레슨요청 내역 리스트입니다.">
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
			color: gray;
			font-size:25px;
			font-family:'JejuGothic';
			margin-bottom:10px;
		}
	
		#grade{
			font-size:30px;
			color: dimgray;
			font-weight:bolder;
			margin-bottom:10px;
		}
	
		#subcate{
			font-size:30px;
			color: dimgray;
			font-family:'JejuGothic';
			margin-bottom:15px;
			font-weight:bolder;
		
		}
	
	#locale{
			font-size:25px;
			font-family:'JejuGothic';
			color:gray;
			margin-bottom:10px;
			width:198px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
	}
	
	#price{
		font-size:25px;
		font-family:'JejuGothic';
		color:gray;
		margin-bottom:10px;
	}
	.btn{
		border-radius:5px;
		padding:5px;
		background:dimgray;
		color:white;
		font-size:22px;
		margin-right:5px;
		
	}
	.apply-table{
		width:100%;
		margin:10px auto;
		padding:30px;
	}
	
	.apply-table td{
		padding:30px;
		min-height:30px;
		font-size:24px;
		color: black;
		text-align:center;
		border-right:0.2px solid lightgray;
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
.list{
	width:100%; border-spacing:50px;
}
.c-box-close{
		padding:20px;
	}
</style>
</head>
<body>

<div style="min-height:300px; background:rgb(233, 232, 232); padding:30px;">
<div class="div-title" style="margin-top:50px;font-size:25px;">나의 레슨 요청 내역</div>
 	<div style="width:90%; background:white; margin: auto; padding:20px;min-height:200px;">
 	
 		
 		<c:choose>
 		<c:when test="${bool}">
 			<div style="font-size:30px; font-family:'JejuGothic'; text-align:center;margin-top:50px;line-height:150%;">
 			현재 레슨 요청 내역이 없습니다.<br/>
 			선생님을 찾고 계신다면 <a href="./apply" style="text-decoration:none; color:rgb(226, 193, 6); font-size:30px">[레슨요청]</a> 을 해보세요.
 			</div>
 		</c:when>
 		<c:otherwise>
 			<div style="margin:20px; text-align:center;font-size:30px;">
선생님을 찾고 계신다면 <a href="./apply" style=" color:rgb(226, 193, 6); font-size:35px">[레슨요청]</a> 을 해보세요.
		</div>
 		</c:otherwise>
 		
 		</c:choose>
 		

	 <table border="0" class="list">
	<c:forEach var="apply" items="${list}">
	<tr>	
	<td>
<div id="pst" style="border:1px solid silver;vertical-align:top;padding:50px;width:80%; margin:20px auto;">
		<div href="#applyform" class="student" style="text-decoration:none; color:black;cursor:pointer">
		<div style="padding:0px;font-family:'JejuGothic';;">
		<div id ="name" class="name">${apply.name}</div>
		<div id="grade">${apply.grade}</div>
		<div style="margin-bottom:10px;"><span id="subcate">${apply.subcate}</span></div>
		<div id="locale">${apply.locale} ${apply.locale3}</div>
		<div id="price">희망가격 <span style="color: dimgray;font-size:30px;font-weight:bold">${apply.price1} ~ ${apply.price2}</span></div>
		
		
		<!-- 컬러박스 -->
		<div class="apply-read" style="display: none;">
			<div style="width:100%; min-height:250px; font-family:'JejuGothic';color:dimgray;background:rgb(252, 251, 251);">
				
				<div style="width:100%; background:rgb(241, 241, 239);padding:10px;">
					<div style="margin:10px 0px; font-size:25px; text-align:center">${apply.name}(${apply.sexual})</div>
					<div style="margin:10px 0px;color:orange; font-size:28px;text-align:center">${apply.subcate}</div>
					<div style=" margin:10px 0px 10px 0px; font-size:25px;font-weight:bolder; text-align:center"></div>
				</div>
				<hr style=" border:0.5px solid lightgray; margin:auto"/> 

				<table class="apply-table" >
				<tr>
				<td>${apply.locale} ${apply.locale3 }</td>
				<td>${apply.day}</td>
				<td>${apply.grade}<br/>
				</td>
				</tr>
				</table>
				
				<div style="width:100%;padding:30px;background:rgb(241, 241, 239);padding:10px;">
				<div style=";margin:20px 0px 10px 0px; font-size:26px;font-weight:bolder; text-align:center">희망 가격 ${apply.price1} ~ ${apply.price2}</div>
				<div style="margin:10px 0px 10px 0px; font-size:23px;font-weight:bolder; text-align:center">(${apply.month}, 회당 ${apply.gawetime} )</div>
				</div>
				
				<div style="padding:30px;font-size:20px; color:orange;line-height:150%;">${apply.message}</div>
				
				<div style="text-align:center;padding:30px;">
				<span class="applybtn" style="border-radius:5px; padding:15px; color:white;background:dimgray; font-size:30px; cursor:pointer" >
				<a href="./teacherForm?id=${apply.id}"  style="text-decoration:none;color:white;">선생님 요청서 보기</a>
				</span></div>
				<div style="width:100%;font-size:25px; text-align:right;"><span class="c-box-close">[닫기]</span></div>
			</div>
		</div>
		</div>
	</div>
	</div>
 		<div style="text-align:right;padding-right:10px;font-size:30px;margin-right:30px;">
 		
 			<span class="applybtn" style="margin-right:25px;font-size:22px;border-radius:5px; padding:5px; color:white;background:dimgray; cursor:pointer" >
				<a href="./teacherForm?id=${apply.id}"  style="text-decoration:none;color:white;">선생님 요청서 보기</a>
			</span>
		
		<a class="delete" href="./myapply/delete?id=${apply.id}" style="text-decoration:none;"><span class="btn">삭제하기</span></a>
		
		</div>
 		
 		</td>
 		</tr>
 		</c:forEach>
 		</table>
 	<div style="text-align:right; font-size:22px;margin-top:30px;">레슨요청내역은 최근 1년간 목록만 공개됩니다.</div>
 		<div style="display:none; font-size:25px; color:gray; ">
            <div id="applyform" ></div>
        </div>
        
        
 	</div>
</div>
 <div style="padding:50px 50px 440px 50px;">
 <div style="width:100%; margin:20px auto; font-family:'JejuGothic'; font-size:25px;">추천 카테고리</div>
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
	      closeButton:false,
	      overlayOpacity:0.5,
	      onOpen:function(){
	        $('#applyform').append( $(this).find('.apply-read').html() );
	        $('.c-box-close').click(function(){
	  		  $.colorbox.close();
	  	  })
	      },
	      onClosed:function(){
	     	 $('#applyform').empty();
	      }
	    });
  });
  
  
  $('.delete').click(function(){
    var confirmflag = confirm("해당하는 레슨요청을 삭제하시겠습까?");

    if(confirmflag){
    	window.location='./myapply/delete';
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