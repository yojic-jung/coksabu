<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 설정 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="회원 정보 페이지" />
<style>
body{
background:#F6F6F6; 
padding-bottom:200px;
}
.main-title{
font-size:40px;
	padding:60px;
	text-align:center;
}
        .sub-title{
        font-size:15px;
        margin:20px 0px 20px 0px;
        color:gray;
        }
        
        .sub-value{
         font-size:20px;
          color:dimgray;
        }
        
        .info2{
        	border:1px solid rgb(180, 179, 179);
        	width:200px;
        	margin:5px 0px 20px 0px;
        	padding:6px;
        	padding-left:3px;
        	font-size:13px;
        }
       
        
        .phoneUpdate{
        text-decoration:underline;
        color: #003399;
        cursor:pointer;
        font-size:18px;
        }
        .akak{
        color: #003399;
        font-size:18px;
        }
 	
</style>
</head>
<body>
<!-- 핸드폰 변경시 뒤로가기 굉장히 많이 눌러야 뒤로가지기 대문에 홈으로 가는 키 하나 만듦 -->
<div class="main-title"><a href='/' style='color:black;'>홈으로</a></div>
<div>
	<table style="width:650px; margin:auto;border-spacing:30px;">
		<tr>
			<td class="sub-title">이메일</td><td class="sub-value">${member.email}</td>
		</tr>
<tr>
			<td class="sub-title">이름</td><td class="sub-value">${member.name}</td>
		</tr>
		<tr>
			<td class="sub-title">생년월일</td><td class="sub-value">${member.birth}</td>
		</tr>
		<tr>
			<td class="sub-title">핸드폰 번호</td><td><span class="sub-value">${member.phone}</span></td>
		</tr>
		<tr>
			<td class="sub-title">닉네임</td><td class="sub-value">${member.nickname} </td>
		</tr>
</table>
<div style="width:700px; margin:70px auto;text-align:center;">
<span class='phoneUpdate'>핸드폰 번호 변경</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="./passwordsetting" class="akak">비밀번호 수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="./myaccountinfo" class="akak">계좌정보 입력하기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="./secession" class="akak">회원 탈퇴</a>
</div>
</div>



 
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
        <script>
          $(document).ready(function(){
        	  var iamport = "<c:out value="${iamport}" />";
        	  
        	  IMP.init(iamport);
        	  
          });
          
          
          $(document).on('click','.phoneUpdate',function(){
        	  var merchant_uid1 = "<c:out value="${merchant_uid}" />";
        	  
        	  IMP.certification({ // param
        		    merchant_uid: merchant_uid1
        		  }, function (rsp) { // callback
        		    if (rsp.success) {
        		      // 인증 성공 시 로직,
        		      var uid = rsp.imp_uid;
        		      
        		    	$.ajax({
        		            url: "./usersetting/"+uid,
        		            method: "POST",
        		            headers: { "Content-Type": "application/json" },
        		            data: { imp_uid: rsp.imp_uid },
        		            error:function(request, error){
      	        			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
      	        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
      	        		  },
      	        		  	success:function(data){
    	        			 if(data=='success'){
    	        				 alert('정상적으로 핸드폰 번호를 변경하였습니다.');
    	        				 window.location.reload();
    	        			 }else{
    	        				 alert('회원가입시 등록된 본인정보(이름,생년)와 다른 정보로 변경은 불가능합니다.');
    	        			 }
    	        		  }
        		          });
        		    } else {
        		      // 인증 실패 시 로직,
        		    }
        		  });
          });
          </script>
</body>
</html>