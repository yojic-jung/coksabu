<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
  <title>회원가입, 콕사부</title>
    <meta name="description" content="네이버 아이디로 로그인" />
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            display:none;
          }
          
	</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>
		<sec:authorize access="isAuthenticated()">
			<script>
				window.location="./";
			</script>
		</sec:authorize>

<script>

		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "0PgcZhDTwaod8UwQsoKX",
				callbackUrl: "https://coksabu.com/loginCallBackNaver",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);
		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var name = naverLogin.user.getName();
					var mobile = naverLogin.user.getMobile();
					var birthyear = naverLogin.user.getBirthyear();
					var birthday = naverLogin.user.getBirthday();
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					if( name == undefined || name == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					if( mobile == undefined || mobile == null) {
						alert("휴대폰번호는 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					if( birthyear == undefined || birthyear == null) {
						alert("생년월일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					if( birthday == undefined || birthday == null) {
						alert("생년월일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					var token = naverLogin.accessToken+"";
					var fake = token.split(".");
					var fakeToken= fake[1]+"";
					$.ajax({
						  url:'/naverLogin',
			    		  type:'post',
			    		  data: {email:email, phone:mobile, name:name, birth:birthyear+birthday, naverToken: fakeToken},
			    		  error:function(request,status,error){
			    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    		       },
			    		  success:function(data){
			    			  console.log(data.status)
			    			  if(data.status=='phoneDuplicate'){
			    				  alert("이미 가입 정보가 있습니다. 다른 sns로그인 또는 이메일 비밀번호를 직접 입력하여 로그인 해주세요.")
			    				  return;
			    			  }else if(data.status=="success"){
			    				  deleteCookie("userInputEmail");
			    				  setCookie("userInputEmail", email, 180);
			    				  window.location.replace("./naverSignupSuccess")
			    			  }else{
			    				  deleteCookie("userInputEmail");
			    				  setCookie("userInputEmail", email, 168);
			    				  window.location.replace("./")
			    			  }
			    		  }
			    	  });
					
					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
		
		
		function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1);
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	     
	    
	</script>
</body>
</html>