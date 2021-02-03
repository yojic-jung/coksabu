<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입, 콕사부</title>
    <meta name="description" content="회원가입 페이지" />
    <meta charset="utf-8">
     <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<link rel="canonical" href="https://coksabu.com/signup">   
<style>
      @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            background:rgb(243, 243, 243);
          }
          
.jbMenu{
		text-align:center;
          background:white;
          width:100%;
          padding:30px; 
          font-size:80px;
          font-family:'Do Hyeon'; 
          border-bottom:1px solid gray; 
          }
          

	.menu-title{
		font-size:60px; padding:50px;
		border-bottom:4px solid white;
		color:orange;
		font-family:'Malgun Gothic';
		font-weight:bold;
	}
	
		.menu-content{
		text-align:left;
		font-size:40px;
		 padding:50px;
		border-bottom:1px solid gray;
		font-family:'Malgun Gothic';
	}
	
	.menu-href{
		font-size:40px;
		color:white;
		text-decoration:none;
	}
	.title{
	   	 color:orange;
	   	 
	}
          
          
          
          .login-form{
              width:90%;
              margin:80px auto;
              font-size:40px;
             
          }
          
          .name{
          display:none;
          }
          
          .birth{
          display:none;
          }
          .permit{
            width:100%;
            margin:30px 0px;
            padding:40px;
            font-size:40px;
            
          }
          .phone-select{
            width:100px;
            height:35px;
            margin:10px;
            font-size:15px;
            color:gray;
          }
          .private, .service{
          	cursor:pointer;
          	text-decoration:underline;
          }
  		.phoneCertify{
  			width:100%;
  			background:rgb(47, 46, 48);
  			color:white;
  			text-align:center;
  			font-size:30px;
  			font-weight:bold;
  			padding:30px;
  			cursor:pointer;
  			border:0.5px solid black;
  			
  		  }
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
		<sec:authorize access="isAuthenticated()">
			<script>
				window.location="./";
			</script>
		</sec:authorize>


  <section>
    <div class="login-form">
    <div style="color:gray;font-family: 'JejuGothic';">회원가입</div>

    <form:form commandName="memberInfo" onSubmit="return CheckForm(this)">
    
    <form:input path="email" class="permit" id="email" placeholder="이메일" value="${memberInfo.email}"/><br/>
	<form:errors path="email" />
    
    
    <form:password class="permit" id="password" placeholder="비밀번호(문자, 숫자, 특수문자 포함 8-15자)" path="password" value="${memberInfo.password}"/><br/>
    <form:errors path="password" />
    
    <input class="permit" id="password2" type="password" placeholder="비밀번호 확인" /><br/>
    
    <form:input class="permit name" id="name" placeholder="이름" path="name" value="${memberInfo.name}" />
    <form:errors path="name" />
    
    
    <form:input class="permit birth" id="birth"  placeholder="생년월일 ex)920123" path="birth" value="${memberInfo.birth}" />
   	<form:errors path="birth" />
    
    
    	<div class="phoneCertify">휴대폰 인증하기</div>
    
    <form:input style="display:none;" class="phone" id="phone" placeholder="휴대폰 번호 (-)없이 " path="phone" />
    <form:errors path="phone" />
    <br/>
    
    <div style="margin :20px auto;">
      <input type="checkbox" name="U_checkAgreement1" style="width:40px; height:40px;"/>
       회사의 <a style="color : black;" class="service">이용약관</a>과 
      <a style="color : black;" class="private">개인정보보호 방침</a>에 동의합니다.
    </div>
    
    <div style="display:none;">
    	<input type="checkbox" name="U_checkAgreement2" class="U_checkAgreement2" />
    </div>  
    
    
    
      <input style="color:white; background:rgb(105, 104, 104); font-size:35px;height:100px;margin:150px 0px; 
      padding:20x;border-radius:5px; width:100%;" type="submit" value="동의하고 가입하기"/>
    </form:form>  
    
    </div>
  </section>    
      <script>
      
      
      $(document).ready(function(){
    	  var ex = "<c:out value="${ex}" />";
    	  
    	  var iamport = "<c:out value="${iamport}" />";
    	  
    	  var status = "<c:out value="${status}" />";
    	  
          if(ex == 'exception'){
          	alert("이미 가입된 이메일 입니다.");
          }else if(ex == 'phone'){
            	alert("이미 가입된 휴대폰번호 입니다.");
          }else if(ex=='certify'){
            	alert('휴대폰 인증을 해주시기 바랍니다.')
            }
          
          IMP.init(iamport);
          
          if(status=='success'){
        	  alert("감사합니다. 정상적으로 회원가입을 완료하였습니다.\n가입한 이메일로 로그인을 해주시기 바랍니다. ");
        	  window.location.href="/login";
          }
          
          $('.phoneCertify').hover(function(){
        	  $(this).css('background','rgb(192, 192, 192)');
        	  $(this).css('color','white');
          },function(){
        	  $(this).css('background','rgb(224, 224, 224)');
        	  $(this).css('color','black');
        	  });        	  
          })
      
     
      
      $('.private').click(function(){
    	 window.location='./private';
      });
      $('.service').click(function(){
     	 window.location='./service';
       });
      
     
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
    		            url: "./certifications/"+uid,
    		            method: "POST",
    		            headers: { "Content-Type": "application/json" },
    		            data: { imp_uid: rsp.imp_uid },
    		            error:function(request, error){
  	        			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
  	        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
  	        		  },
  	        		  	success:function(data){
	        			 $('.name').val(data.name);
	        			 $('.birth').val(data.birth);
	        			 $('.phone').val(data.phone);
	        			 $('.U_checkAgreement2').prop('checked', true) ;
	        		  }
    		          });
    		    } else {
    		      // 인증 실패 시 로직,
    		    }
    		  });
    	  
      });
      
      function CheckForm(memberInfo){ 
    	  
  	 	var re = /^[a-z0-9]{6,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
  	 	var re1 = /^[a-z0-9]{8,12}$/ // 패스워드 문자 숫자 8-12자
   	
  	 	var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
  			//패스워드 문자 숫자 특수문자 8-15자

  	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  	       // 이메일이 적합한지 검사할 정규식
      var tel = /^[0-9]{10,11}$/
      var bir = /^[0-9]{6}$/
      var name = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/
  			
  		var form = memberInfo;

  	    if(!check(re2, form.email, "적합하지 않은 이메일 형식입니다.")) {
  	           return false;
  	       }
  		
  	    if(!form.password.value){
  			alert("비밀번호를 입력하세요.");
  			return false;
  			}
  		if(!check(regex, form.password,"패스워드는 8~15자의 영문, 숫자, 특수문자로 입력")) {
  	           return false;
  	       }
  		if(form.password.value != form.password2.value){
  			alert("비밀번호를 동일하게 입력하세요.");
  			return false;
        }
  		
  	   var chk1=form.U_checkAgreement1.checked;
  	   if(chk1==""){
  	    alert('약관에동의해 주세요');
  	    return false;
  	   }
  	   
  	   var chk2=form.U_checkAgreement2.checked;
  	   if(chk2==""){
  	    alert('휴대폰 인증을 해주시기 바랍니다.');
  	    return false;
  	   }
  	
  	}
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}
      
      </script>
</body>
</html>