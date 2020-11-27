<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>이메일/비밀번호 찾기 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="이메일 및 비밀번호 찾기 선택 페이지" />
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
.emailFind, .passFind{
border-spacing:0px;
border:1px solid gray; 
border-radius:8px;margin:20px auto 40px auto;;
width:400px;text-align:center;

}

.emailFind-title, .passFind-title{
margin-top:50px;
width:400px;text-align:center;
font-size:25px;
font-weight:bolder;
}

.emailFind input, .passFind input{
	padding:10px; width:200px;
	font-size:15px;
	color:gray;
	margin:5px;
}
.emailFind button, .passFind button{
	padding:10px; width:200px;
	border-radius:10px;
	font-size:12px;
	color:white;
	background:orange;
	border:none;
	margin:15px;
	cursor:pointer;
}
.phoneCertify{
  			text-align:center;
  			cursor:pointer;
  			color:white;
  			background:rgb(115, 115, 117);
  			padding:10px; 
  			font-size:15px; 
  			text-align:center; 
  			width:200px;
  			margin:10px auto;
  			font-weight:bold;
  			border:0.5px solid rgb(115, 115, 117);
  			border-radius:3px;
  		  }
</style>

</head>
<body>
<div style="text-align:center;margin:10px;font-family: 'JejuGothic'; color:dimgray;font-size:25px; font-weigth:bold;">
<a href="./"><img style="width:100px;" src="<c:url value="/resources/images/logo.png" />" alt="로고" /></a>
아이디 / 비밀번호를 잊어버리셨나요
</div>
<hr/>
	<div style="width:300px; margin:auto;">
		<div class="emailFind-title">이메일 찾기</div>
		<table class="emailFind">
			<tr>
				<td style="padding:20px;">
					<input name="name" class="name" type="text" placeholder="이름"/><br/>
					<input name="phone" class="phone" type="text" placeholder="휴대폰번호"/><br/>
					<button class="email-btn">이메일 찾기</button>
				</td>
			</tr>
		</table>
		
		
		<div class="passFind-title">비밀번호 찾기</div>
		<table class="passFind">
			<tr>
				<td style="padding:20px;">
					<input type="text" name="email" class="email" placeholder="이메일"/><br/>
					<input name="phone2" class="phone2" type="text" style="display:none;" placeholder="휴대폰번호"/><br/>
					
    				<div class="phoneCertify">휴대폰 본인인증하기</div>
					<div class="cer-success"style="margin:10px; padding:10px;font-size:15px;"></div>
					<div style="display:none;">
    					<input type="checkbox" name="U_checkAgreement2" class="U_checkAgreement2" />
    				</div>  
					
					<button class="pass-btn">비밀번호 찾기</button>
				</td>
			</tr>
		</table>
		


	</div>
<div style="padding:10px; text-align:center;">Copyright(c) 콕사부. All Rights Reserved.</div>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
  	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
  $(document).ready(function(){
	  var iamport = "<c:out value="${iamport}" />";
	  
	  IMP.init(iamport);
	  
	$('.email-btn').click(function(){
		var name  = $('.name').val();
		var phone = $('.phone').val();
		$.ajax({
  		  url:'./emailFind?name='+name+'&phone='+phone,
  		  type:'get',
  		  error:function(error){
  			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
  		  },
  		  success:function(data){
  				if(data != ''){
  			  		alert("회원님의 이메일은 "+data+"입니다.")
  	  			}else{
  	  				alert('이름과 휴대폰번호를 다시 확인해주시기 바랍니다.')
  	  			}
  			}
  		  })
  	  });
	
	
	$('.pass-btn').click(function(){
		var email  = $('.email').val();
		var phone2  = $('.phone2').val();
		
		if(!$('.U_checkAgreement2').is(":checked") ){
		    alert('휴대폰 인증을 해주시기 바랍니다.');
		    return false;
		   }
		
		$.ajax({
  		  url:'./passwordFind?email='+email+'&phone='+phone2,
  		  type:'get',
  		  error:function(error){
  			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
  		  },
  		  success:function(data){
  			if(data == 'false'){
			  		alert("해당하는 이메일과 휴대폰번호에 대응하는 아이디가 없습니다.")
	  			}else if(data=='success'){
	  				alert('입력하신 이메일로 비밀번호를 발급해드렸습니다.')
	  			}
  			}
  		  })
  	  });
	
	
    $('.phoneCertify').hover(function(){
  	  $(this).css('background','rgb(209, 209, 209)');
    },function(){
  	  $(this).css('background','rgb(115, 115, 117)');
  	  });   
    
    
    })
    
          $(document).on('click','.phoneCertify',function(){
       	  var merchant_uid1 = "<c:out value="${merchant_uid}" />";
        	  
    	  IMP.certification({ // param
    		    merchant_uid: merchant_uid1
    		  }, function (rsp) { // callback
    		    if (rsp.success) {
    		      // 인증 성공 시 로직,
    		      var uid = rsp.imp_uid;
    		      
    		    	$.ajax({
    		            url: "./certifications/"+uid,
    		            method: "POST",
    		            headers: { "Content-Type": "application/json" },
    		            data: { imp_uid: rsp.imp_uid },
    		            error:function(request, error){
  	        			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
  	        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
  	        		  },
  	        		  	success:function(data){
	        			 $('.phone2').val(data.phone);
	        			 $('.cer-success').text('휴대폰 인증을 성공하였습니다.');
	        			 $('.U_checkAgreement2').attr('checked', true) ;

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