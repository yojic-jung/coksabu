<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Q&A 고객센터 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="묻고 답하기" />
<meta property="og:type" content="website">
<meta property="og:title" content="묻고 답하기 Q&A">
<meta property="og:site_name" content="묻고 답하기 Q&A">
<meta property="og:description" content="콕사부에 모르는 것이 있으면 질문하세요.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/qna">
<link rel="canonical" href="https://coksabu.com/qna">
<link rel="stylesheet" href= "<c:url value="/resources/css/servicecenterM.css" />" type="text/css" />
</head>
<body>

<div class="first">
<div>고객센터</div>
</div>

<div class="div-title"  style="padding-bottom:240px;">
	<div class="left">
	<div style="font-size:30px;padding:5px;">
		<span style="font-size:30px;"><a href="./customer" style="text-decoration:none; color:dimgray;">자주하는 질문</a> &nbsp;&nbsp; | &nbsp;&nbsp;</span>
		<span style="font-size:35px;"><a href="./qna" style="text-decoration:none; color:black;">고객문의</a> &nbsp;&nbsp; | &nbsp;&nbsp;</span>
		<span style="font-size:30px;"><a href="./myqna" style="text-decoration:none; color:dimgray;">나의 질문내역</a></span>
	</div>
	</div>
	
	<div class="right">
	<div style="font-size:30px;margin-bottom:20px;"><b>1:1 문의</b></div>
	<div style="margin-bottom:10px;font-size:30px">궁금하신 사항 또는 불편사항을 접수 해주세요.</div>
	<form method="post" commandName="profile" onSubmit="return CheckForm(this)">
	<table class="qna-table">
	<tr>
	<td class="td-title">제목</td>
	<td class="td-content"><input type="text" name="title" style="padding:5px;width:100%; font-size:30px;" /></td>
	</tr>
	
	<tr>
	<td class="td-title">내용</td>
	<td class="td-content content3"><textarea rows="7"  name="content" style=" width:100%;font-size:30px;line-height:180%;"></textarea></td>
	</tr>
	</table>
	<div style="margin:20px;text-align:center;">
	<input type="submit" value="질문하기" class="btn" />
	</div>
	</form>
	
	</div>
</div>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
$(document).ready(function(){
	
	
	  var success = "<c:out value="${success}" />";
	  if(success=="success"){
		  alert("성공적으로 질문을 접수하셨습니다.");
	  }
});

function CheckForm(memberInfo){
		 
	var form = memberInfo;
	
	 var title = $('input[name="title"]').val().length;
     if(title==0 || title>25){
         alert('제목 1글자 이상 25글자 이하로 입력해주세요.');
         return false;
     }
     var content = $('textarea[name="content"]').val().length;
     if(content==0 ||  content>250){
         alert('내용은 250글자 이하로 입력해주세요.');
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