<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>

<title>수업지원하기 선생님전용 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="선생님이 학생의 레슨요청에 본인의 레슨을 지원하는 페이지" />
</head>
<body>
  <% if(session.getAttribute("email")==null) {
%>
<script>
window.location="./";
</script>
<%
}
%>
<form method="post">
<div style="text-align:center;">
<div>정상적으로 지원되셨습니다.</div>
<div style="margin:10px 0px;">학생에게 남기시고 싶은 말을 적어주시기 바랍니다.<span style="font-size:12px; color:dimgray;">(500글자미만, <span class="message-length">0</span>/500)</span>
</div>
<textarea id="message" name="message" rows="10" cols="60">
</textarea>
</div>
<div>
<input type="text" style="display:none;" name="applyId" value="${applyId}" />
<input type="text" style="display:none;" name="lessonId" value="${lessonId}" />
<input type="submit" style="color:white; font-size:13px;padding:5px;cursor:pointer; border-radius:5px;background:dimgray;" value="메시지 남기기" />
</div>
</form>
 		<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
			$(document).on('keyup','#message',function(){
	        	  var inputLength = $(this).val().length;
	          	var remain = inputLength;
	          	$('.message-length').html(remain);
	          	
	          	
	      		  var status = "<c:out value="${status}" />";
	             	  if(status == "success"){
	             		  alert("정상적으로 지원이 완료되었습니다.");
	             	  }else if(status == "fail"){
	             		  alert("메시지를 500자 미만으로 다시 작성하여 주시기 바랍니다.");
	             	  }
	            });
			
			
			
        </script>

</body>
</html>