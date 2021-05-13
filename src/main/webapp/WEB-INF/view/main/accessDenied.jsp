<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>접근권한 거부 페이지, 콕사부</title>
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
      body{
      	padding:0px;
      	margin:0px;
      	font-family: 'JejuGothic'; 
      }
      .jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 2px black;
          }
          
	.pre-user{
		display:none;
		text-align:center;
		padding:30px;
		width:550px;
		border:1px solid lightgray;
		margin:30px auto;
	}
	.phoneCertify{
		cursor:pointer;
		padding:10px;
		font-family: 'JejuGothic'; 
		background: orange;
		color:white;
		border-radius:10px;
		width:250px;
		display:inline-block;
		font-size:15px;
		margin-top:30px;
	}
</style>
</head>
<body>
<div class="jbMenu">
      <div class="top-title"><a href="./"><img src="<c:url value="/resources/images/logo.png" />"  alt="로고"/></a></div>
</div>
          
<div class="access-deny">
<div style="width:300px;height:300px;border-radius:150px;margin:50px auto 0px auto;display:table;background-color:lightgray;font-size:50px;text-align:center;">
<div style="vertical-align:middle;display:table-cell">!</div>
</div>
<div style="width:60%;margin:30px auto 0px auto;text-align:center;font-family:'JejuGothic';font-size:20px; ">
접근권한이 없는 페이지 입니다.
</div>
<div style="margin-top:50px; text-align:center;">
<a href="javascript:history.back()" style="text-decoration:none"><span style="padding:10px;color:white;background:orange;border-radius:10px;font-size:20px;">뒤로가기</span></a>
</div>
</div>



<div class="pre-user">
<table style="width:100%;">
	<tr>
		<td style="text-align:left;">계정정보</td><td style="text-align:right;color:#FF4848;font-size:13px;">인증을 해주세요.</td>
	</tr>
</table>
<hr style="border:1px solid dimgray;"/>
	<div style="margin:20px 0px;line-height:180%;">회원님의 인증정보가 없습니다.<br/>본인인증 이후 해당 서비스를 이용할 수 있습니다. </div>
	<div><img src="resources/img/phoneCerti.png" style="width:220px;height:220px"/></div>
	
	<div class="phoneCertify">본인인증하기</div>
</div>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	 
	var authority = "<c:out value="${authority}" />";
	 
	 if(authority=='pre-user'){
		 $('.access-deny').hide();
		 $('.pre-user').show();
	 }
	 
	 var iamport = "<c:out value="${iamport}" />";
	 IMP.init(iamport);
	 
	 $(document).on('click','.phoneCertify',function(){
   	  var merchant_uid1 = "<c:out value="${merchant_uid}" />";
   	  //혹시나 오류나면 new Date()부분 없애기
   	  merchant_uid1 = merchant_uid1+ new Date();
   	  IMP.certification({ // param
   		    merchant_uid: merchant_uid1
   		  }, function (rsp) { // callback
   		    if (rsp.success) {
   		      // 인증 성공 시 로직,
   		      var uid = rsp.imp_uid;
   		      
   		    	$.ajax({
   		            url: "./idCertifyOnlyPreUser/"+uid,
   		            method: "POST",
   		            headers: { "Content-Type": "application/json" },
   		            data: { imp_uid: rsp.imp_uid },
   		            error:function(request, error){
 	        			alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
 	        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
 	        		  },
 	        		  	success:function(data){
 	        		  		if(data.status=="success"){
 	        		  			window.location.href=window.location.href;
 	        		  		}else if(data.status=="phoneDuplicate"){
 	        		  			alert("회원님의 휴대폰번호가 이미 등록되어있습니다.\n이미 가입되어있는 정보로 다시 로그인해주세요.")
 	        		  			window.location.href="./";
 	        		  		}else if(data.status=="not-preuser"){
 	        		  			alert("본인인증이 등록 되지 않은 회원을 위한 서비스 입니다.\n이미 본인인증이 되었거나 비정상적인 접근입니다.")
 	        		  			window.location.href="./";
 	        		  		}else{
 	        		  			
 	        		  		}
	        		  }
   		          });
   		    } else {
   		      // 인증 실패 시 로직,
   		    }
   		  });
   	  
     });
	 
});
</script>
</body>
</html>