<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>대학검색 콕사부</title>
     <meta name="description" content="선생님 대학교 목록 " />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
    @font-face { font-family: 'JejuGothic'; 
     url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
    
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        

        #useBtn{
             visibility:hidden;
        }
 
   </style>
    
</head>
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">대학검색</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" method="post" >
            <input type="text" name="univinput" placeholder="대학명 입력. ex)한국대" id="userId" style="font-size:15px" value="${univ }">
            <input type="submit" value="검색">
        </form>
        <div id="msg"></div>
        
        <div>
               
        
        <c:choose>
	<c:when test="${listModel.hasList == false }" >
	</c:when>
	<c:otherwise>
	<c:forEach var="univ" items="${listModel.list}"  varStatus="status">
	 <span class="univlist" style="cursor:pointer;text-decoration:none;line-height:300%;font-size:15px;color:gray;">${univ}</span>&nbsp;
        <c:if test="${status.index%3==2}">
        <br/>
        </c:if>
        <c:if test="${status.last}">
        <br/><br/>
        </c:if>
	
	</c:forEach>
	
	
	<div class="pagemove">
	<c:if test="${beginPage > 5}">
		<a class="page-a" href="<c:url value="./subCheckForm?p=${beginPage-1}"/>"  style="color: black;font-size:15px;">이전...</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<a class="page-a" href="<c:url value="./subCheckForm?p=${pno}"/>" style="color: black;font-size:15px;font-weight:bold;">[${pno}]</a>
	</c:when>
	<c:otherwise>
	<a class="page-a" href="<c:url value="./subCheckForm?p=${pno}" />"  style="color: gray">[${pno}]</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<a class="page-a" href="<c:url value="./subCheckForm?p=${endPage+1}"/>" style="color: black;font-size:15px;">...다음</a>
	</c:if>
	</div>
	</c:otherwise>
</c:choose>
	
			 <div style="text-align:center;line-height:180%;font-family:JejuGothic; font-size:15px; margin-top:30px;">검색결과가 없으신 경우 직접입력도 가능합니다. <br/>
			 <span style="cursor:pointer;text-decoration:underline;font-size:15px;padding:5px;color:black;" class="self">직접입력</span>
			 </div>
	
		</div>
    </div>
    <div id="chk2">
    		<div style="color:gray; font-size:15px;">직접입력(15글자 미만)</div><br/>
            <input type="text" name="univinput2" class="userId2" style="font-size:15px;">
            <input class="regist" type="button" value="등록">
        <div id="msg"></div>

		
        <br>
    </div>
</div> 
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	
	var univ = "<c:out value="${univ}" />"
	
	$('.univlist').hover(function(){
		$(this).css({
			textDecoration:'underline',
			color:'black'
		});
	},function(){
		$(this).css({
			textDecoration:'none',
			color:'gray'
		});		
	})
	
	$('.univlist').click(function(){
		window.close();
		opener.document.profile.univid.value = $(this).text();
	});
	$('#chk2').hide();
	$('.self').click(function(){
			$('#chk').css('display','none');
			$('#chk2').show();
	});
	
	$('.regist').click(function(){
		opener.document.profile.univid.value = $('.userId2').val();
		window.close();
		
	});
	
	
	$('.page-a').click(function(){
		var href = $(this).attr("href");
		href=href+"&univ="+encodeURIComponent(univ);
		$(this).prop('href',href);
	});
	
});
</script>   
</body>
</html>


