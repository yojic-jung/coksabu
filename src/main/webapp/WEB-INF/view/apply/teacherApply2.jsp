<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>콕사부</title>
 <meta name="description" content="선생님 레슨지원" />
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
      body{
      font-family: 'JejuGothic';
      }
 #categories{
width:190px; 
margin:5px auto;
font-family:'JejuGothic';
font-weight:bold;
font-size:10px;
padding:0px;
color:Grey;
overflow:hidden;
white-space:nowrap;
text-overflow:ellipsis;
}
    #name{
font-family: 'JejuGothic';
font-weight:bold;
font-size:12px;
margin-top:7px
}
  #universe{
font-family: 새굴림;
font-weight:bold;
color: DimGrey;
font-size:11px;
width:190px; 
margin-top:7px;
overflow:hidden;
white-space:nowrap;
text-overflow:ellipsis;
}
#title{
font-family:'JejuGothic';
font-weight:900;
color: black;
font-size: 14px;
margin-top:7px;
padding:0px;

width: 190px; 
line-height: 20px;
height: 40px;
text-overflow:  ellipsis;
 overflow: hidden;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical;
display: -webkit-box;
word-wrap:break-word;
}

#priceL{
text-align:right;
font-family:Arial;
font-weight:bold;
font-size:16px;
padding:0px;
margin-top:5px;
color: black;
}
.student{
margin:auto;
}
.student td{
font-family: 'JejuGothic';
padding:10px;
text-align:center;
font-size:15px;
}
.student tr:nth-child(odd){
background:rgb(235, 235, 235);
}
.student tr:nth-child(even){
background:rgb(245, 244, 244);
}

</style>
</head>
<body>
<table class="student" style="width:600px;">
<tr><td colspan="2">${apply.name}(${apply.sexual}) ${apply.grade}</td></tr>
<tr><td colspan="2">${apply.locale} ${apply.locale3}</td></tr>
<tr><td>과외가능 요일<br/> ${apply.day}</td><td>과외가능 시간대 <br/>${apply.time}</td></tr>
<tr><td colspan="2"> 희망가격 ${apply.price1}~${apply.price2}<br/>
(${apply.month}. 회당 ${apply.gawetime} )</td></tr>
<tr><td colspan="2" style="padding:10px 50px 10px 50px">${apply.message}</td></tr>
</table>
<br/>
<div style="text-align:center; font-size:17px;color:orange; font-family:'JejuGothic'">
<span style="font-weight:bolder; font-size:20px;">${apply.subcate}</span>을 제공하는 레슨의 경우 지원 가능합니다.</div>
<br/>


<br/><br/>
<div style="margin-left:50px;">지원할 레슨카드 선택하기</div>
<br/>
<c:if test="${bool}">
<div style="font-size:14px;color:dimgray; width:500px; margin:auto; margin-bottom:50px;line-height:150%">
현재 등록되어있는 레슨이 없습니다.<br/>
 레슨을 지원하기 위해 [마이페이지][레슨만들기] 페이지를 통해 레슨을 등록해 주세요.
</div>
</c:if>
<c:if test="${!bool}">
<table>

						<tr>
						<c:forEach var="lesson" items="${list}" >
						
							<td id="lesson-td">
							<form method="post" onSubmit="return checkApply(this)">
							<div id="pst" style="border:1px solid silver;vertical-align:top;padding:0px; width:210px; height:300px; margin:5px">
							<div id="categories">${lesson.subcate}</div>
							<img src="<c:url value='/img/images/${lesson.represent}' />" style="width:208px; height:150px; magin-top:0px;" alt="레슨대표이미지"/>
							<div style="width:190px; margin:auto;">
							<div id="name"> ${lesson.name}(${lesson.birth}세, ${lesson.sexual})&nbsp;&nbsp;경력 <c:if test="${lesson.career!=0}">${lesson.career}년</c:if><c:if test="${lesson.career==0}">1년미만</c:if></div>
							<div id="universe"> ${lesson.universe} ${lesson.univsub}</div>
							<div id="title"> ${lesson.title}</div>
							<div id="priceL" ><span style="font-size:11px;">${lesson.price1}</span>&nbsp;&nbsp;${lesson.price3}원</div>
							</div>
							</div>
					
							<div style="text-align:center;">
							<input type="text" style="display:none" name="subcate" value="${lesson.subcate}" />
							<input type="text" style="display:none" name="represent" value="${lesson.represent}" />
							<input type="text" style="display:none" name="name" value="${lesson.name}" />
							<input type="text" style="display:none" name="birth" value="${lesson.birth}" />
							<input type="text" style="display:none" name="sexual" value=" ${lesson.sexual}" />
							<input type="text" style="display:none" name="career" value="${lesson.career}" />
							<input type="text" style="display:none" name="universe" value="${lesson.universe}" />
							<input type="text" style="display:none" name="univsub" value="${lesson.univsub}" />
							<input type="text" style="display:none" name="title" value="${lesson.title}" />
							<input type="text" style="display:none" name="price1" value="${lesson.price1}" />
							<input type="text" style="display:none" name="price3" value="${lesson.price3}" />
							
							
							
							
							<input type="text" style="display:none" name="applyId" value="${apply.id}" />
							<input type="text" class="lessonid" name="lessonId" style="display:none" value="${lesson.id}" />
							<input type="submit" class="btn" style="color:white; font-size:13px;padding:5px;cursor:pointer; border-radius:5px;background:dimgray;" value="지원하기"/>
							
							</div>
							</form>
							</td>
   		 				</c:forEach>
    					</tr>
    					
   		 			</table>
</c:if>

 
 		<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
        
        $(document).ready(function(){
		  var status = "<c:out value="${status}" />";
       	  if(status == "limit"){
       		  alert("이미 마감된 레슨입니다.");
       	  }else if(status == "duplicate"){
       		  alert("이미 지원하셨습니다.");
       	  }
       	  
       });
        
			$(document).on('click','.btn', function(){
				
				var subcate = "<c:out value="${apply.subcate}" />";
				var subcates = subcate.split(',');
				
				var cate = $(this).parents('#lesson-td').find('#categories').text();
				var cates = cate.split(',');
				var bool = false;
				for(var i=0; i<cates.length; i++){
					for(var j=0; j<subcates.length; j++){
						if(subcates[j]==cates[i]){
							bool=true;
						}	
					}
				}
				
				if(!bool){
					alert(subcate+'를 제공하는 레슨만 지원가능합니다.');
					return false;
				}
			});
			
			$(document).on('keyup','#message',function(){
	        	  var inputLength = $(this).val().length;
	          	var remain = inputLength;
	          	$('.message-length').html(remain);
	            });
			
			 function checkApply(member){
				 if($('#message').val().length>=500){
					 alert('남기실 메시지는 500글자 미만이어야 합니다.')
					 return false;
				 }
			 }
			
        </script>
</body>
</html>