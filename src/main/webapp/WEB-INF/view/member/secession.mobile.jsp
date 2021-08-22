<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴 마이페이지 콕사부</title>
<meta charset="utf-8">
  <meta name="description" content="회원 탈퇴 " />
  <link rel="canonical" href="https://coksabu.com/secession">
<style>
body{
background:#F6F6F6;
padding-bottom:100px;
}
.main-title{
	font-size:40px;
	padding:80px;
	text-align:center;

}
.sub-title{
        font-size:30px;
        margin:20px 0px 20px 0px;
        color:gray;
        text-align:center;
        }
        
        .sub-value{
         font-size:20px;
          color:dimgray;
        }
        
  </style>
</head>
<body>
<div class="main-title"><a href="/" style="color:dimgray;font-size:50px;">홈으로 가기</a></div>
<div class="secession" style="font-size:40px;text-align:center;text-decoration:underline;cursor:pointer;">탈퇴요청하기</div>
<!-- 
<div style="text-align:center;line-height:180%;font-size:30px;">
	회원탈퇴를 원하시는 경우 고객센터 02-959-1176으로<br/>운영시간(평일 10:00 ~ 17:00) 에 연락주시기 바랍니다.
</div>
 -->
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  $('.m-jbMenu').append("회원 탈퇴");
        	  $('.secession').click(function(){
        		  var prmt = prompt("회원탈퇴를 신청하는 경우 아래칸에  따움표 없이 '회원탈퇴'  라고 적어주시기 바랍니다.");
        		  if(prmt=='회원탈퇴'){
        			  $.ajax({
            			  url:'./secessionApply',
            			  type:'get',
            			  error:function(error){
            				  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
            			  },
            			  success:function(data){
            					  alert("회원탈퇴를 신청하였습니다. 취소하고 싶으신 경우 2주 이내에 재로그인해 주시기 바랍니다.")
            					  window.location.href="./j_spring_security_logout"
            				  
            			  }
            		  });
        		  }
        		 
        	  });
        	  
          });
          </script>
</body>
</html>