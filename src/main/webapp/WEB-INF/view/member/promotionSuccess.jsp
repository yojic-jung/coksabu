<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>프로모션 및 쿠폰등록, 콕사부</title>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script>
          $(document).ready(function(){
        	  var status = "<c:out value="${status}" />";
        	  if(status=='commissionAlreadyExist'){
        		  alert("이미 등록하신 프로모션 코드입니다.");
        		  window.history.back();
        	  }else if(status=='codeWrong'){
        		  alert("존재하지 않는 코드입니다.");
        		  window.history.back();
        	  }else if(status=='success'){
        		  alert("성공적으로 등록 되셨습니다.");
        		  window.location.href = "./promotion";
        	  }
        	  
          });
          </script>
</body>
</html>