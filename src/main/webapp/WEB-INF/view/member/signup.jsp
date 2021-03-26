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
    <style>
      @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          
          .login-form{
              min-height:410px;
              width:410px;
              margin:60px auto;
          }
          
          .name{
          	display:none;
          }
          
          .birth{
          	display:none;
          }
          .login-logo{
            width:200px;
            margin:auto;
            margin-bottom: 20px;
          }
          .permit{
            width:350px;
            height:35px;
            margin:10px;
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
  			text-align:center;
  			cursor:pointer;
  			background:rgb(209, 209, 209);
  			padding:20px; 
  			font-size:12px; 
  			text-align:center; 
  			width:150px;
  			margin:10px auto;
  			font-weight:bold;
  			border:0.5px solid rgb(115, 115, 117);
  			border-radius:3px;
  		  }
  		  
  		 .naver-customize{
  		 width:350px;
	 background-image:url(<c:url value="/resources/img/naverbackground.png" />);
	font-family:Gothic;font-size:15px;color:white;border-radius:10px; padding:10px;font-weight:bolder;
	line-height:200%;
	margin:0px 10px;cursor:pointer;
	text-align:center;
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
  <section style="min-height:500px">
    <div class="login-form">
    <div class="login-logo"><a href="./"><img style="width:200px" src="<c:url value="/resources/images/logo.png" />" alt="로고" /></a></div>
    <div style="color:gray;font-family: 'JejuGothic';">회원가입</div>

    <form:form commandName="memberInfo" onSubmit="return CheckForm(this)">
    
    <form:input path="email" class="permit" id="email" placeholder="이메일" value="${memberInfo.email}"/><br/>
	<form:errors path="email" />
    
    
    <form:password class="permit" id="password" placeholder="비밀번호(문자, 숫자, 특수문자 포함 8-15자)" path="password"/><br/>
    <form:errors path="password" />
    
    <input class="permit" id="password2" type="password" placeholder="비밀번호 확인" /><br/>
    
    
    <form:input class="permit name" id="name" placeholder="이름" path="name" value="${memberInfo.name}"/>
    <form:errors path="name" />
    
    
    <form:input class="permit birth" id="birth"  placeholder="생년월일 ex)920123" path="birth" value="${memberInfo.birth}"/>
   	<form:errors path="birth" />
    <table style="border:1px solid rgb(209, 209, 209);width:350px;margin:10px;border-spacing:0px;border-radius:5px;">
    <tr>
    	<td style="background:rgb(209, 209, 209);padding:10px;font-size:11px;">휴대폰 인증하기</td>
    </tr>
    <tr>
    	<td>
    	<div style="font-size:11px; padding:10px;">본인명의 휴대폰 인증만 가능합니다.</div>
    	<div class="phoneCertify">휴대폰 인증하기</div>
    	</td>
    </tr>
    </table>
    
    <form:input style="display:none;" class="phone" id="phone" placeholder="휴대폰 번호 (-)없이 " path="phone" value=""/>
    <form:errors path="phone" />
    <br/>
    
    <div style="margin :0px auto;">
      <input type="checkbox" name="U_checkAgreement1" />
       회사의 <a style="color : black;" class="service">이용약관</a>과 
      <a style="color : black;" class="private">개인정보보호 방침</a>에 동의합니다.
    </div>
    
    <div style="display:none;">
    	<input type="checkbox" name="U_checkAgreement2" class="U_checkAgreement2" />
    </div>  
    
      <input style="color:white; background:rgb(94, 94, 94); font-size:15px; 
      padding:15px;border-radius:10px; width:350px;margin:60px 10px 40px 10px" type="submit" value="동의하고 가입하기"/>
    </form:form>  
    <div >
        	<div class="naver-customize">
        		<span style="font-weight:bolder;float:left;clear:right;margin:0px 10px">
        		<img src="<c:url value='/resources/img/naver.png' />"  style="width:40px;height:40px;"/>
        		</span>
        		네이버 아이디로 가입하기
        	</div>
        	<div style="display:none;">
        		<div id="naverIdLogin"></div>
        	</div>
        </div>
    </div>
  </section>    
      <script>
      $(document).ready(function(){
    	  var ex = "<c:out value="${ex}" />";
    	  
    	  var iamport = "<c:out value="${iamport}" />";
    	  
          if(ex == 'exception'){
          	alert("이미 가입된 이메일 입니다.");
          }else if(ex == 'phone'){
            	alert("이미 가입된 휴대폰번호 입니다.");
          }else if(ex=='certify'){
            	alert('휴대폰 인증을 해주시기 바랍니다.')
            }
          
          IMP.init(iamport);
          
          
          
          $('.phoneCertify').hover(function(){
        	  $(this).css('background','rgb(115, 115, 117)');
          },function(){
        	  $(this).css('background','rgb(209, 209, 209)');
        	  });        	  
          })
      
     
      
      $('.private').click(function(){
    	 window.open('./private','', 'width=530, height=600');
      });
      $('.service').click(function(){
     	 window.open('./service','', 'width=530, height=600');
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
      
      
var naverLogin = new naver.LoginWithNaverId(
	  		{
	  			clientId: "0PgcZhDTwaod8UwQsoKX",
	  			callbackUrl: "https://coksabu.com/loginCallBackNaver",
	  			isPopup: false, /* 팝업을 통한 연동처리 여부 */
	  			loginButton: {color: "green", type: 3, height: 170} /* 로그인 버튼의 타입을 지정 */
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