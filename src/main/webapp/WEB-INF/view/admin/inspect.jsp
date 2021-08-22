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
padding:10px; color:white; text-decoration:none;
width:100px;
}
.certify{
	background:orange;
	cursor:pointer;
}
.fail{
	background:dimgray;
	cursor:pointer;
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
<form method="post" enctype="multipart/form-data" >
<input type="text" name="email" value="${imgList.email}" style="display:none;"/>
<table style="border-spacing:20px;text-align:center;font-size:15px;font-weight:bolder;width:95%;margin-bottom:200px;">
	<tr>
		<td>${imgList.name}(${imgList.birth})</td>
		<td>${imgList.universe},${imgList.univsub}</td>
		<td>
			<c:if test="${imgList.academy!=null && imgList.academy!=''}">
				${imgList.academy}<br/>
				${imgList.academyd}
			</c:if>
		</td>
	</tr>
	<tr>
		<td style=";width:28%;">
			<img src="<c:url value='/resources/certifyImg/${imgList.certifyimg1}' />" style="width:100%; magin-top:0px;"/><br/>
		</td>
		<td style="width:28%;">
			<img src="<c:url value='/resources/certifyImg/${imgList.certifyimg2}' />" style="width:100%;magin-top:0px;"/><br/>
		</td>
		<td style="width:28%;">
			<c:if test="${imgList.academy!=null && imgList.academy!='' && imgList.certifyimg3 != null}">
			<img src="<c:url value='/resources/certifyImg/${imgList.certifyimg3}' />" style="width:100%;magin-top:0px;"/><br/>
			</c:if>
		</td>
		<td>
			<span class="btn certify">인증완료</span>
			<br/><br/><br/>
			<span class="btn fail" >반려</span>
		</td>
	</tr>
	<tr>
		<td><input name="certifyimg1" type="file"  accept="image/*" /></td>
		<td><input name="certifyimg2" type="file"  accept="image/*" /></td>
		<td><input name="certifyimg3" type="file"  accept="image/*" /></td>
	</tr>
	<tr>
		<td colspan="3"><input type="submit" value="이미지 수정하기" style="padding:10px;width:150px;font-size:15px;margin-top:20px;" /></td>
	</tr>
</table>
</form>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
	$(document).ready(function(){
		$('.back').click(function(){
			history.back();
		});
		
		
		
		 var email = "<c:out value="${imgList.email}" />";
		$('.certify').click(function(){
			var a = confirm('인증완료 하시겠습니까?');
  			if(a){
  			  location.href = "./complete?email="+email;
  		  	}else{
  				  return false;  
  		  }
		})
		
		$('.fail').click(function(){
			var b = confirm('반려하시겠습니까?');
  		  	if(b){
  		  		  var denyReason = prompt("반려사유를 적어주세요.","");
  				  $.ajax({
					  url:'./adminCertifyFail?email='+email,
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