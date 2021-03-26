<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>계좌정보 입력</title>
<meta charset="utf-8">
  <meta name="description" content="비밀번호 설정" />
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
.content{
	line-height:200%;
	padding:20px;
}
.accountnumber{
width:300px;
border-radius:10px;
border:1px solid dimgray;
padding:10px;
font-size:20px;
margin:20px;
}


.current{
	padding-bottom:15px;
	width:500px;
	margin:auto;
	font-size:18px;
}
.btn{
			margin-top:40px;
			margin-right:20px;
			padding:10px; 
        	background:dimgray;
        	color:white;
        	border-radius:10px;
        	border:none;
        	font-size:20px;
        	cursor:pointer;
}

.cancel{
			margin-top:40px;
			padding:10px; 
        	color: dimgray;
        	font-weight:bolder;
        	border:3px solid dimgray;
        	border-radius:10px;
        	font-size:20px;
        	text-decoration:none;
        	
}
</style>
</head>
<body>

<div style="text-align:center;font-size:20px;margin-top:40px;"><a href="/" style="color: orange;">홈으로 가기</a></div>
<div class="main-title">계좌정보 입력</div>



<form method='post'  commandName='memberInfo' onSubmit='return CheckForm(this)'>

<div class='content'>
<div style='font-size:20px; width:500px; margin:auto;'> 
<div style="margin:20px 0px">본인 명의 계좌를 입력해주시기 바랍니다.</div>
<div style="margin:20px 0px">예금주 <input class="depositor" style="font-size:20px;padding:10px; width:200px" type='text' value="${account.name}" disabled/></div>
<div style="margin:20px 0px">은행명 
<select class="account" style="padding:10px; width:200px;font-size:20px;" name="account">
			<option>--선택--</option>
			<option>국민은행</option>
			<option>기업은행</option>
			<option>농협은행</option>
			<option>신한(구조흥)은행</option>
			<option>우리은행</option>
			<option>하나은행</option>
			<option>카카오뱅크</option>
			<option>K뱅크</option>
			<option>SC(구제일)은행</option>
			<option>경남은행</option>
			<option>광주은행</option>
			<option>대구은행</option>
			<option>부산은행</option>
			<option>산업은행</option>
			<option>수협은행</option>
			<option>전북은행</option>
			<option>제주은행</option>
			<option>한국씨티은행</option>
			<option>새마을금고</option>
			<option>신협</option>
			<option>상호저축은행</option>
			<option>산림조합</option>
			<option>우체국</option>
			</select>
</div>
계좌번호  <input class='accountnumber' type='text' value="${account.accountNumber}" placeholder=" '-' 없이 숫자만 입력해주세요." name='accountNumber'/>
 </div>
 
 <div style='text-align:center'>
 <input type='submit' class='btn' value='저장하기'/>  
  <a href="javascript:history.back()" style="text-decoration:none;"><span class="cancel">취소</span></a>
 </div> 
 </div>
 </form>

 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  var status = "<c:out value="${status}" />";
        	  
        	  if(status=="success"){
        		  alert("계좌정보가 정상적으로 입력 되었습니다.");
        	  }else if(status=="fail"){
        		  alert("계좌 입력에 실패하였습니다. 다시 시도 해주시기 바랍니다.");
        	  }
        	  
        	  var account = "<c:out value="${account.account}" />";
        		
        		$('.account').find('option').each(function(){
        			if($(this).val()==account){
        				$(this).prop('selected', 'true');
        			}
        		});
        	  
        	  
        	  
          });
          
          function CheckForm(){
     		if($('.account').val()=='--선택--'){
     			alert('계좌 은행을 선택해주세요.');
     			 return false;
     		}
     		if($('.accountnumber').val().length==0 || $('.accountnumber').val().length > 19){
     			alert('계좌번호를 -없이 입력해주세요.');
     			 return false;
     		}
     		var accountnumber = $('.accountnumber').val();
     		
     		if(accountnumber.indexOf('-')!=-1){
     			alert('계좌번호는 -없이 입력해주시기 바랍니다.');
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