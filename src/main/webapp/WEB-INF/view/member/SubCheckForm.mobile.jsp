<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>대학검색 콕사부</title>
     <meta name="description" content="선생님 대학교 목록 " />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="canonical" href="https://coksabu.com/subCheckForm">
    <style type="text/css">
    body{
    	background-color:#F6F6F6;
    }
    @font-face { font-family: 'JejuGothic'; 
     url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
    
        #wrap {
            width: 100%;
            text-align :center;
            font-size:40px;
        }
        
        #chk{
            text-align :center;
        }
        

        #useBtn{
             visibility:hidden;
        }
 
 .subcheck-close{
 	font-size:30px;
 }
   </style>
    
</head>
<body>

	<div style="text-align:right">
		<span class="subcheck-close" style="position:fixed; top:0px; right:0px;font-size:30x;background-color:black;color:white;padding:20px;">x</span>
	</div>

       
     <div id="chk2" style="text-align:right;height:700px;">
    		<div style="text-align:center;font-family:JejuGothic; font-size:30px;padding:40px;">결과가 없으신 경우 직접입력도 가능합니다.</div>
            <input type="text" name="univinput2" placeholder="대학명을 직접 입력해주세요." class="userId2" style="width:100%;font-size:35px; padding:20px;">
            <input class="regist" type="button" value="등록" style="position:relative;top:-75px;font-size:35px; padding:20px;">
    		
    		<div style="margin-top:30px;text-align:center;text-decoration:underline;font-size:30px;padding:15px;">
			 	<span class="univ-search">대학 검색</span>
			</div>
    </div>


	<div id="wrap">
        <form id="checkForm" method="post" >
        <div class="univ-div" style="text-align:right;">
            <input type="text" placeholder="대학명 입력  ex)한국대" name="univinput" id="userId" style="font-size:35px;width:100%; padding:20px;border:1px solid black;"  value="${univ }">
            <input type="submit" value="검색" style="position:relative;top:-75px;right:70px;font-size:35px; padding:10px;">
        </div>
        </form>
      

<c:choose>
	<c:when test="${listModel.hasList == false }" >
	</c:when>
	<c:otherwise>
	<c:forEach var="univ" items="${listModel.list}"  varStatus="status">
	 <span class="univlist" style="cursor:pointer;text-decoration:none;line-height:300%;font-size:30px;color:orange;">${univ}</span>&nbsp;
        <c:if test="${status.index%3==2}">
        <br/>
        </c:if>
        <c:if test="${status.last}">
        <br/>
        </c:if>
	
	</c:forEach>
	
	
	<div class="pagemove">
	<c:if test="${beginPage > 5}">
		<a class="page-a" href="<c:url value="./subCheckForm?p=${beginPage-1}"/>"  style="color: black;font-size:30px;">이전...</a>&nbsp;
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	&nbsp;<a class="page-a" href="<c:url value="./subCheckForm?p=${pno}"/>" style="color: black;font-size:30px;font-weight:bold;">[${pno}]</a>&nbsp;
	</c:when>
	<c:otherwise>
	&nbsp;<a class="page-a" href="<c:url value="./subCheckForm?p=${pno}" />"  style="font-size:30px;color: gray">[${pno}]</a>&nbsp;
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		&nbsp;<a class="page-a" href="<c:url value="./subCheckForm?p=${endPage+1}"/>" style="color: black;font-size:30px;">...다음</a>
	</c:if>
	</div>
	</c:otherwise>
</c:choose>
	
	
  
        <div>
	
			 <div style="font-family:JejuGothic; font-size:30px;margin-top:30px;">결과가 없으신 경우 직접입력도 가능합니다.<br/> 
			 	<div style="margin-top:30px;text-decoration:underline;font-size:30px;padding:15px;">
			 	<span class="self">직접입력</span>
			 	</div>
			 </div>
		</div>
    </div>







    
    
    <div style="height:100px;"></div>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	
	$('.m-jbMenu').remove();
	
	$('#chk2').hide();

	
	
	
	var univ = "<c:out value="${univ}" />"
	
	$('.univlist').hover(function(){
		$(this).css({
			textDecoration:'underline',
			color:'black'
		});
	},function(){
		$(this).css({
			textDecoration:'none',
			color:'orange'
		});		
	})
	
	
	$('.page-a').click(function(){
		var href = $(this).attr("href");
		href=href+"&univ="+encodeURIComponent(univ);
		$(this).prop('href',href);
	});
	
	$('.self').click(function(){
			$('#chk2').show();
			$('#wrap').hide();
	});
	
	
	
	$('.univ-search').click(function(){
		
		$('#wrap').show();
		$('#chk2').hide();
	});
	
	
	
	$('.univlist').click(function(){
		 window.parent.profile.universe.value = $(this).text();
		 $('.subcheck-close').trigger('click');
	});
	$('.regist').click(function(){
		 window.parent.profile.universe.value = $('.userId2').val();
		 $('.subcheck-close').trigger('click');
	});
	
   $('.subcheck-close').click(function(){
	   window.location="./subCheckForm"
	   $(top.document).find('.subcheck').css('display','none');
   	})
	
});
</script>   
</body>
</html>


