<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>선생님 이력 목록 콕사부</title>
 <meta name="description" content="수업요청에 응답한 선생님 목록" />
 <meta property="og:type" content="website">
<meta property="og:title" content="응답선생님">
<meta property="og:site_name" content="응답선생님">
<meta property="og:description" content="나의 수업 요청에 지원한 선생님 목록">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/teacherForm">

<link rel="canonical" href="https://www.coksabu.com/teacherForm?id=100">
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
body{
background:rgb(240, 240, 240)
}
.list{
border-spacing:0px;
}
.list td{
border-bottom:1px solid black;
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

#price{
text-align:right;
font-family:Arial;
font-weight:bold;
font-size:16px;
padding:0px;
margin-top:5px;
color: black;
}
#pst:hover{
box-shadow:0px 0px 4px 4px LightGoldenRodYellow;
}
</style>
</head>
<body>
<div style="background:orange; color:white;padding:20px;margin:15px; text-align:center; font-family:'JejuGothic';">선생님 지원 목록(${size}/10)</div>
<c:if test="${size==0}">
<div style="font-size:25px; text-align:center;line-height:180%;font-family:'JejuGothic'; margin-top:140px;">
현재 지원하신 선생님이 없습니다. <br/>
조금 더 기다리시면 지원서를 받아 보실 수 있습니다.
</div>
</c:if>

					<table style="font-family:JejuGothic; font-size: 16px;border-spacing:0px;width:550px;margin:40px auto;">
		
			<% int i=-1; %>
			<c:forEach var="pro" items="${list}">
			<% i++; %>
							<tr>
								<td colspan="2" style="text-align:center;">
									<a href="./tutorprofile?id=${pro.teacher_id}&root=apply" style="color:gray;">프로필 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="./chatroom?id=${pro.teacher_id}&root=apply" style="color:gray;" style="color:gray;">채팅하기</a>
								</td>
							</tr>
	                            <tr>
                                <td rowspan="3"> <img style="width:140px; height:140px; border-radius:70px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                                <td style="color:rgb(87, 87, 87); padding:0px 5px 0px 20px;font-size:22px">${pro.nickname}(<span class="age">${pro.birth}</span>)</td>
                            </tr>
                            <tr>
                                <td style="color:rgb(151, 149, 149);padding:0px 5px 0px 20px;">
                                <c:choose>
									<c:when test="${pro.academy ne '' and pro.academy != null}">
										${pro.academy} ${pro.academyd}
									</c:when>
									<c:otherwise>
										${pro.universe} ${pro.univsub}
									</c:otherwise>
								</c:choose>
                                &nbsp;&nbsp;경력 <c:if test="${pro.career!=0}">${pro.career}년이상</c:if><c:if test="${pro.career==0}">1년미만</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="locale" style="padding:0px 5px 0px 20px;word-break:keep-all;line-height:25px;">${pro.locales}</td>
                            </tr>
                            <tr>
							<td  style="color:rgb(151, 149, 149);" id="lesson-td" colspan="2">
							<div style="margin:20px 0px 10px 20px;">메세지</div>
							<div style="border:1px solid lightgray;min-height:100px;padding:10px;width:500px;line-height:25px;background:white;">
							${pro.message}
							</div>
							</td>
						</tr>	
						<tr>
						<td>
						<br/><br/><br/><br/>
						</td>
						</tr>
                     
				</c:forEach>
  </table>	
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
	$(document).ready(function(){
		 $('.boardread').click(function(){
			var id =  $(this).find('.postId').text();
			 window.open("./boardread?postId="+id,'','width=1200,height=600');
		 });
		 
	});
	
	</script>
</body>
</html>