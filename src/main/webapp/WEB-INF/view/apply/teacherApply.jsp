<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>레슨 지원하기 선생님전용 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="선생님의 레슨 지원" />
 <meta property="og:type" content="website">
<meta property="og:title" content="수업 신청">
<meta property="og:site_name" content="수업신청">
<meta property="og:description" content="학생의 레슨요청에 선생님이 자신의 레슨을 지원할수 있습니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/teacherApply">
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
			<form method="post" onSubmit="return checkApply(this)">
<div style="text-align:center;">
<div style="margin:10px 0px;">학생에게 남기시고 싶은 말을 적어주시기 바랍니다.<span style="font-size:12px; color:dimgray;">(300글자미만, <span class="message-length">0</span>/300)</span>
</div>
<textarea id="message" name="message" rows="10" cols="60" style="font-size:15px; line-height:150%;">
</textarea>
</div>
<br/><br/>
				<table style="margin:auto;">
						<tr>
							<td id="lesson-td">
							<input name="teacherEmail" type="text" style="display:none" id="teacherEmail" value="${email}" />
							<input name="apply_id" type="text" style="display:none" id="applyId" value="${apply.id}" />
							<input type="submit" class="btn" style="color:white; font-size:13px;padding:5px;cursor:pointer; border-radius:5px;background:dimgray;" value="지원하기"/>
							</td>
    					</tr>
   		 			</table>

 	</form>
 		<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
        
        $(document).ready(function(){
		  var status = "<c:out value="${status}" />";
		  
		  if(status == "noMembership"){
			  alert("본인인증, 학력인증을 완료 후 이용 가능합니다.");
		  }else if(status == "limit"){
       		  alert("이미 마감된 레슨입니다.");
       	  }else if(status == "duplicate"){
       		  alert("이미 지원하셨습니다.");
       	  }else if(status == "noProfile"){
       		  alert("프로필이 등록되어있지 않습니다. 프로필을 등록해주세요.");
       	  }else if(status == "true"){
       		  alert("정상적으로 지원이 완료되었습니다.\n학생이 수업을 원할 경우 선생님 연락처로 연락이 갈 것입니다.");
       		  window.close();
       	  }else if(status =="teacherlimit"){
       		  alert("하루 최대 지원횟수는 3번 입니다. \n하루 최대 지원 횟수 3번 모두 사용하셨습니다.");
       	  }
       	  
       });
        
			
			$(document).on('keyup','#message',function(){
	        	  var inputLength = $(this).val().length;
	          	var remain = inputLength;
	          	$('.message-length').html(remain);
	            });
			
			 function checkApply(member){
				 if($('#message').val().length>300){
					 alert('남기실 메시지는 300글자 미만이어야 합니다.')
					 return false;
				 }
			 }
			
        </script>
</body>
</html>