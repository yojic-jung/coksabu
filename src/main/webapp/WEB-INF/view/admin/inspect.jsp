<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
body{
	font-size:12px;
}
.back{
	cursor:pointer;
	font-size:20px;
	font-weight:bolder;
}
.title-div{
	font-weight:bolder;
	text-align:center;
	font-size:35px;padding:10px;
	margin:50px 0px 70px 0px;
}
.btn{
padding:10px; color:black; text-decoration:none;
}
</style>
</head>
<body>
<%if(!session.getAttribute("email").equals("dywlr74")){ %>
<script>
window.location="./";
</script>
<%
}
%>
<div class="back-div" style="margin-top:30px;"><span class="back">&lt; 뒤로가기</span></div>
<div style="text-align:center;"><a href="./admin" style="color:orange">메인으로</a></div>
<div class="title-div">본인학력 인증검사</div>

<div style="color:black; font-size:18px;">
전체 갯수 : ${count}
</div>

<br/><br/>

<table style="border-spacing:20px;text-align:center;font-size:15px;font-weight:bolder;">
	<c:forEach var="imglist" items="${list}" >
	<tr>
		<td>${imglist.name}(${imglist.birth})</td>
		<td>${imglist.universe},${imglist.univsub}</td>
		<td>
			<c:if test="${imglist.academy!=null && imglist.academy!=''}">
				${imglist.academy}<br/>
				${imglist.academyd}
			</c:if>
		</td>
	</tr>
	<tr>
		<td style="padding-bottom:50px;">
			<img src="<c:url value='/resources/certifyImg/${imglist.certifyimg1}' />" style="width:300px; height:150px; magin-top:0px;"/><br/>
		</td>
		<td style="padding-bottom:50px;">
			<img src="<c:url value='/resources/certifyImg/${imglist.certifyimg2}' />" style="width:180px; height:230px; magin-top:0px;"/><br/>
		</td>
		<td style="padding-bottom:50px;">
			<c:if test="${imglist.academy!=null && imglist.academy!='' && imglist.certifyimg3 != null}">
			<img src="<c:url value='/resources/certifyImg/${imglist.certifyimg3}' />" style="width:180px; height:230px; magin-top:0px;"/><br/>
			</c:if>
		</td>
		<td>
			<button class="btn certify">인증완료<span style="display:none">${imglist.email}</span></button>
			<br/><br/>
			<button class="btn fail" >반려<span style="display:none">${imglist.email}</span></button>
		</td>
	</tr>
	</c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
	$(document).ready(function(){
		$('.back').click(function(){
			history.back();
		});
		
		
		$('.certify').click(function(){
		var email = $(this).find('span').text();
			var a = confirm('인증완료 하시겠습니까?');
  			if(a){
  			  window.location="./complete?email="+email;
  		  	}else{
  				  return false;  
  		  }
		})
		
		$('.fail').click(function(){
			var email2 = $(this).find('span').text();
			var b = confirm('반려하시겠습니까?');
  		  	if(b){
  		  		  var denyReason = prompt("반려사유를 적어주세요.","");
  				  $.ajax({
					  url:'./adminCertifyFail?email='+email2,
		    		  type:'post',
		    		  data : { "denyReason" : denyReason},
		    		  error:function(request,status,error){
		    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    		       },
		    		  success:function(data){
		    			  if(data=='success'){
		    				  alert('정상적으로 반려되었습니다. ')
		    				  window.location.reload(); 
		    			  }
		    		  	}
  					});
  				
  		 	 }else{
  				  return false;  
  		  	}	
		})
	});
</script>

</body>
</html>