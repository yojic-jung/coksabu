<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.btn{
	padding:15px;
	width:150px;
}
</style>
</head>
<body>
<div style="text-align:center;line-height:180%;">
주문상태는 ${orderStatus}입니다.<br/><br/>
<a href="./cancelStatusProposal2?id=${id}" >입금확인취소</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="resources/jquery-number-master/jquery.number.min.js"></script>
        <script>
        $(document).ready(function(){
        	  
        	  var status = "<c:out value="${status}" />";
        	  if(status=="결제완료"){
        		  alert("결제완료 상태를 입금대기로 수정하였습니다.");
        		  window.close();
        	  }else if(status=="서비스완료"){
        		  alert("서비스완료, 환불대기(완료)상태는 취소되지 않습니다.");
        		  window.close();
        	  }else if(status=="환불대기"){
        		  alert("서비스완료, 환불대기(완료)상태는 취소되지 않습니다.");
        		  window.close();
        	  }else if(status=="환불완료"){
        		  alert("서비스완료, 환불대기(완료)상태는 취소되지 않습니다.");
        		  window.close();
        	  }else if(status=="입금대기"){
        		  alert("입금대기 상태는 취소되지 않습니다.");
        		  window.close();
        	  }
         });

</script>
</body>
</html>