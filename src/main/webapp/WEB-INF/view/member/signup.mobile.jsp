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
             padding:0;font-size:40px;line-height:200%
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
  			background:gray;
  			color:white;
  			text-align:center;
  			font-size:40px;
  			font-weight:bold;
  			padding:20px;
  			cursor:pointer;
  			border:0.5px solid black;
  			
  		  }
  	.signup-btn{
  	text-align:center;
  	color:white; background:rgb(68,68,68); font-size:40px;margin:150px 0px 50px 0px; 
      padding:20px;border-radius:10px; width:100%;
  	}	  
  	.signup-submit{
  		display:none;
  	}
  	.naver-customize{
	 background-image:url(<c:url value="/resources/img/naverbackground.png" />);
	font-family:Gothic;font-size:40px;color:white;border-radius:10px; padding:20px;
	margin-bottom:50px;font-weight:bolder;
	}
	
    </style>
       <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-413632618');
</script>  
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

    <form:form id="postPageTran" commandName="memberInfo" onSubmit="return CheckForm(this)">
    
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
    
    
     <div class="signup-btn" style="font-weight:bolder;">
     	동의하고 가입하기
     </div>
      <input class="signup-submit" type="submit" />
    </form:form>  
    <div style="text-align:center;">
        	<div class="naver-customize">
        		<span style="font-weight:bolder;float:left;clear:right;">
        		<img src="<c:url value='/resources/img/naver.png' />"  style="width:90px;height:90px;"/>
        		</span>
        		네이버 아이디로 가입하기
        	</div>
        	<div style="display:none;">
        		<div id="naverIdLogin"></div>
        	</div>
        </div>
    
    </div>
  </section>    
  <div style="height:400px;"></div>
  
  <img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;display:none;"/>
  
  
      <script>
      
      
      $(document).ready(function(){
    	  var ex = "<c:out value="${ex}" />";
    	  
    	  var iamport = "<c:out value="${iamport}" />";
    	  
    	  
          if(ex == 'exception'){
          	alert("이미 가입된 이메일 입니다. 로그인 후 다시 신청해주시기 바랍니다.");
          }else if(ex == 'phone'){
            	alert("이미 가입된 휴대폰번호 입니다. 로그인 후 다시 신청해주시기 바랍니다.");
          }else if(ex=='certify'){
            	alert('휴대폰 인증을 해주시기 바랍니다.')
            }
          
          IMP.init(iamport);
          
          
          $('.phoneCertify').hover(function(){
        	  $(this).css('background','rgb(192, 192, 192)');
        	  $(this).css('color','white');
          },function(){
        	  $(this).css('background','rgb(224, 224, 224)');
        	  $(this).css('color','black');
			});
          
          
          
       })
      
      $('.signup-btn').click(function(){
     	 $('.signup-submit').trigger('click');
       });
      
      $('.private').click(function(){
    	 window.location='./private';
      });
      $('.service').click(function(){
     	 window.location='./service';
       });
      
      
      $(document).on("click", '.naver-customize', function(){
    	  var broswerInfo = navigator.userAgent;
   	      //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
   	      if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
   	            $('#spinner').show();
  	      }
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
  	   
  	   var broswerInfo = navigator.userAgent;
	   //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	   if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
	         $('#spinner').show();
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

$(window).bind("pageshow", function(event) {
	$('#spinner').hide();
});



	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "0PgcZhDTwaod8UwQsoKX",
			callbackUrl: "https://coksabu.com/loginCallBackNaver",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 2, height: 120} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	$(document).on("click",".naver-customize",function(event){
	  	  naverLogin.init(); 
	  	  location.href = naverLogin.generateAuthorizeUrl();
		});
	
      </script>
</body>
</html>