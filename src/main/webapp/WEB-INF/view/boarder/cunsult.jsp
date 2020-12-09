<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상담목록 학생전용 콕사부</title>
<meta name="description" content="학생회원의 선생님 수업에 상담신청하기" />
<meta charset="utf-8">
<title>상담신청</title>
<style>
@font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

body{
font-family:'JejuGothic';
}
</style>
</head>
<body>

<div style="text-align:center;margin:10px;color:orange;font-size:20px;">선생님과 상담하기</div>

<div style="font-size:14px;margin:20px auto;width:370px;"><b>선생님에게 상담하고 싶은 사항 또는 궁금사항을 적어주세요.</b></div>
<form method="post" onSubmit="return checkLesson(this)">
<div style="color:dimgray;font-size:13px;width:360px;margin:10px auto;">메시지(100자 내외, <span class="title-length">0</span>/100)</div>
<div style="text-align:center;">

<textarea id="lesson-title" rows="4" cols="50" name="message"></textarea>
</div>
<div style="text-align:center;width:370px;margin:10px auto;line-height:150%;font-size:11px;color:gray;">
하루 최대 상담신청 횟수는 3회입니다.<br/>
상담신청시 메시지와 함께 회원님의 연락처가 선생님에게 전달됩니다.<br/>
메시지 확인 후 선생님으로부터 연락이 갈 것입니다.
</div>

<input type="text" style="display:none;" value="${id}" name="lessonid" />
<input type="text" style="display:none;" value="${lesson.cate}" name="cate" />
<input type="text" style="display:none;" value="${lesson.subcate}" name="subcate" />
<input type="text" style="display:none;" value="${lesson.title}" name="title" />
<input type="text" style="display:none;" value="${lesson.name}" name="teachername" />
<input type="text" style="display:none;" value="${lesson.email}" name="teacheremail" />




<div style="margin-top:20px;text-align:center;">
<input type="submit" style="border-radius:10px; padding:10px; background:orange; color:white;" value="상담신청하기" />
</div>
 </form>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="resources/jquery-number-master/jquery.number.min.js"></script>    
<script>
$(document).ready(function(){
	
	var status = "<c:out value="${status}" />";
	
	if(status=="success"){
		alert("상담신청이 성공적으로 진행되었습니다. \n연락 확인 후 선생님에게서 연락이 갈 것입니다. ");
		window.close();
	}else if(status=="limit"){
		alert("하루 최대 신청횟수는 3회입니다. \n[수업요청]페이지를 통해 수업을 요청하면 신청횟수에 상관없이 \n선생님들의 지원서와 연락처를 받아볼 수 있습니다.  ");
		window.close();
	}
	
});


$(document).on('keyup','#lesson-title',function(){
	  var inputLength = $(this).val().length;
  	var remain = inputLength;
  	$('.title-length').html(remain);
    });

function checkLesson(member){
	 if($('#lesson-title').val().length>100) {
		  alert('메시지 최대길이는 100글자 미만입니다.');
          return false;
      }
}

 
</script>  
            

</body>
</html>