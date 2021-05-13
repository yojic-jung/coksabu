<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴 마이페이지 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="회원 탈퇴 " />
<style>
body{
background:#F6F6F6;
padding-bottom:100px;
}
.main-title{
	font-size:40px;
	padding:40px 0px 80px 0px;
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
<div style="text-align:center;font-size:20px;margin-top:40px;"><a href="/" style="color: orange;">홈으로 가기</a></div>
<div class="main-title">회원탈퇴</div>
<div class="secession" style="text-align:center;text-decoration:underline;cursor:pointer;">탈퇴요청하기</div>
<!--
<div style="text-align:center;line-height:180%;font-size:18px;">
	회원탈퇴를 원하시는 경우 고객센터 02-959-1176으로<br/>운영시간(평일 10:00 ~ 17:00) 에 연락주시기 바랍니다.
</div>
 -->
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  
        	  $('.my6').css('color','orange');
        	  $('.pc-left').find('a').eq(2).css('color','orange');
        	  
        	  $('.secession').click(function(){
        		  var con = confirm("회원을 탈퇴하시겠습니까??")
        		  if(con==true){
        			  $.ajax({
            			  url:'./secessionApply',
            			  type:'get',
            			  error:function(error){
            				  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
            			  },
            			  success:function(data){
            				  window.location.href="./j_spring_security_logout"
            			  }
            		  });
        		  }
        		 
        	  });
        	  
          });
          </script>
</body>
</html>