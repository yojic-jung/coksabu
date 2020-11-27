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
<style>

.div-title{
            width:1000px; margin:auto; padding:50px 0px 50px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
 .first{
  padding:60px;
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
 background-image:url(<c:url value="/resources/images/customer.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
  .left{
 	width:150px;margin:auto; float:left;
 	line-height:180%;
 	
 }
 .right{
 font-size:15px;
 	 width:700px;margin:auto; clear: right;
        padding:40px;
      	 border:1px solid rgb(180, 179, 179);
 }
 .qa{
 margin-bottom:30px;
 }
  table{
  border-spacing:0;
  }
 .td-content{
  background:rgb(247, 246, 246);
 	width:500px;
 	 padding:10px;
 }
 .content3{
 background:rgb(247, 246, 246);
 	height:200px;
 	 padding:10px;
 }
 .td-title{
 background:rgb(207, 207, 207);
  padding:10px;
 }
 .btn{
        	padding:10px; 
        	background:dimgray;
        	color:white;
        	border-radius:4px;
        	border:none;
        }
</style>
</head>
<body>
<div class="first">
<div>고객센터</div>
</div>


<div class="div-title">
	<div class="left">
	<div style="font-size:20px;padding:5px;"><b>고객센터</b>
	<hr style="width:100px;"/></div>
	<div><a href="./customer" style="text-decoration:none; color:black;">자주하는 질문</a></div>
	<div><a href="./qna" style="text-decoration:none; color:black;">고객문의</a></div>
	<div><a href="./myqna" style="text-decoration:none; color:black;">나의 질문내역</a></div>
	</div>
	
	<div class="right">
	<div style="font-size:16px;margin-bottom:20px;"><b>1:1 문의</b></div>
	<div style="margin-bottom:10px;">궁금하신 사항 또는 불편사항을 접수 해주세요.</div>
	<form method="post" commandName="profile" onSubmit="return CheckForm(this)">
	<table>
	<tr>
	<td class="td-title">제목</td>
	<td class="td-content"><input type="text" name="title" style="padding:5px; font-size:15px; width:500px;" /></td>
	</tr>
	
	<tr>
	<td class="td-title">내용</td>
	<td class="td-content content3"><textarea style="width:500px;padding:5px; font-size:15px;height:200px;" rows="10" name="content"></textarea></td>
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