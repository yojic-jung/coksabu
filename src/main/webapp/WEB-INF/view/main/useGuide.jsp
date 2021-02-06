<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>이용가이드 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="콕사부 이용안내 페이지입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="이용가이드">
<meta property="og:site_name" content="이용가이드">
<meta property="og:description" content="내가 찾던 수업을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/useGuide">
<style>
body{
word-break: keep-all;
word-wrap: break-word;
}
 .first{
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
min-height:300px;
 background-image:url(<c:url value="/resources/images/company.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
 
 .student-guide, .teacher-guide{
 padding:5px; background:black;color:white;font-size:20px;cursor:pointer
 }
 .student-guide-close,  .teacher-guide-close{
 	display:none; font-size:20px;cursor:pointer; text-decoration:underline;
 }
 .student-content, .teacher-content{
 	display:none;
 	width:70%;
 	margin:40px auto;
 	line-height:180%;
 }
 .subtile{
 	padding:60px 0px 30px 0px;
 	text-align:center;
 	font-weight:bolder;
 }
 .find{
 	width:31%;
 }
</style>
</head>
<body>
<div class="first">
<div style="padding-top:50px;">
콕사부에서, 수업을 찾는 학생과 선생님이 만날수 있으며<br/>
'안전거래'를 통해 안전한 거래를 할 수 있습니다.
</div>
</div>
<div style="min-height:300px;font-size:20px;background-color:rgb(238, 238, 236);padding:100px 0px">
	<div style="text-align:center;">
		<span style="padding:10px; border-bottom:1px solid orange;font-size:25px;">학생/학부모 이용가이드</span><br/><br/><br/>
		학생/학부모 회원을 위한 콕사부의 과외연결 방법 안내 및 각종 기능 사용안내 입니다. 
		<br/><br/><br/>
		<span class="student-guide">내용 펼치기  &xdtri;</span>
		<span class="student-guide-close">내용 닫기 &xutri;</span>
	</div>
	<div class="student-content">
		<div style="line-height:200%;font-weight:bolder;color:orange;text-align:center;">"콕사부는 모든 선생님에 대해 신원 및 학력 인증 절차를 진행하며,<br/>콕사부 내의 모든 수업에 대해 환불정책과 안전거래 시스템을 제공합니다"</div>

		<div class="subtile">환불정책에 대해 알려주세요.</div>

		<div style="font-size:17px;">
		콕사부는 '환불정책'에 동의한 선생님들만 회원으로 받고 있으며, 
		관련 법률 '학원의 설립/운영 및 과외교습에 관한 법률 제 18조'에 
		의거하여 환불정책을 시행하고 있습니다.<br/>
		또한 모든 수업정보에 이를 공개하고 있습니다.<br/>
		<br/>
		따라서 콕사부에서 활동하는 모든 선생님들은 판매하는 수업에 대해 환불정책을 제공하며<br/>
		이를 콕사부가 '안전거래' 시스템을 통해 환불절차를 진행하고 있습니다.<br/>
		허나, 콕사부 내에서 거래하지 않고 직거래를 하는 경우에는 콕사부 환불정책의 보호를 받지 못할 수 있습니다.
		</div>

		<div class="subtile">선생님들의 본인/학력인증 시스템</div>

		<div style="font-size:17px;">
		콕사부는 모든 선생님들에 대해 '본인인증' 및 '학력인증'을 진행하고 있습니다. <br/>
		인증을 검증한 선생님들에 한해 수업을 판매하고 학생의 요청에 응답할 수 있습니다. <br/>
		또한 선생님들의 프로필 란에 '본인인증 학력인증' 라는 문구를 넣어 검증 된 선생님을 밝히고 있습니다.<br/>
		</div>


		<div class="subtile">'안전거래'는 무엇인가요?</div>

		<div style="font-size:17px;">
		콕사부에서 제공하는 '안전거래' 시스템은 학생/학부모 회원이 거래대금을 선생님에게 바로 입금하는 것이 아닌
		콕사부가 거래의 제 3자로서 대금을 보관하고 수업이 종료됨을 확인 후 선생님에게 전달하는 시스템입니다.<br/>
		이를 통해 학생/학부모와 선생님 모두 안전한 거래를 제공 받을 수 있도록 한 시스템입니다.<br/>
		</div>

		
		
		<div class="subtile">원하는 수업과 선생님을 찾는 방법 </div>
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder">방법 &#9312; &nbsp;수업목록 페이지에서 수업 찾기</div>
		<br/>
		<img class="find" src="<c:url value="/resources/img/classlist1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/classlist2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/classlist3.png" />"  alt="수업찾기3"/>
		<br/>
		수업목록 페이지에서는 지역/과목을 선택하여 수업목록을 확인해 볼 수 있습니다. <br/>
		지역/과목 외에도 세부검색 조건으로 선생님들의 경력, 성별을 구분하여 검색할 수 있습니다.<br/>
		<br/>
		모든 수업 내용에는 '프로필', '선생님 소개', '수업소개', '과외가능지역', '과외가능요일', '환불정책'이 게시되어있습니다.<br/>
		또한 채팅을 통해 선생님과 대화할 수 있으며 거래 또한 가능합니다. <br/>
		<br/>
		만약, 원하는 선생님을 찾았지만 판매하는 수업과 다르게 수업횟수, 수업시간 등을
		조정하여 진행하고 싶은 경우,<br/>
		채팅창에서 협의 후 거래제안서를 작성하여 수업 거래가 가능합니다.<br/>
		이 또한 '환불정책'에 따르며, 안전거래가 가능합니다.<br/>
 		</div>


		<div style="font-size:17px;margin-top:40px;">
		<div style="color:orange;font-weight:bolder">방법 &#9313; &nbsp;수업요청서를 작성하여 수업가능한 선생님 지원서 받기</div>
		<br/>
		<img class="find" src="<c:url value="/resources/img/applyway1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/applyway2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/applyway3.png" />"  alt="수업찾기3"/>
		<br/>
		수업 요청서에는 희망 과목, 수업 가능 요일, 수업 가능 지역, 
		수업횟수 및 회당 수업시간, 희망가격, 기타 요구사항 등을 작성하여 해당내용으로 수업이 가능한
		선생님들의 수업지원서를 최대 10개까지 받을 수 있는 방법입니다.<br/>

		선생님의 수업지원서를 통해 선생님들의 프로필과 제공하는 수업목록을 확인할 수 있으며  어플리케이션 내의 
		채팅을 통해 선생님과 상담을 할 수 있으며, 채팅창에서 거래 제안서를 작성하여 안전거래를 진행할 수 있습니다.
		</div>
		
		
		<div class="subtile">채팅창의 '거래 제안서 작성' 기능은 무엇인가요??</div>
		<div style="font-size:17px;">
		<br/>
		<img class="find" src="<c:url value="/resources/img/chatguide1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/chatguide2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/chatguide3.png" />"  alt="수업찾기3"/>
		<br/>
		원하는 선생님을 찾았지만 선생님이 제공하는 수업의 세부조건을 수정하여 수업을 받고 싶은 경우
		채팅창에서 새롭게 거래제안서를 작성하여 거래를 할 수 있으며 거래제안서의 내용에는 과목, 수업 횟수, 수업시간, 수업 가격, 기타 요구사항이 포함되며
		이 또한 안전거래와 환불정책을 제공합니다.
		</div>
	
	</div>
</div>

<div style="min-height:300px;font-size:20px;padding:100px 0px;">
	<div style="text-align:center;">
		<span style="padding:10px; border-bottom:1px solid orange;font-size:25px;">선생님 이용가이드</span><br/><br/><br/>
		선생님 회원을 위한 콕사부 서비스 안내 및 사용방법 안내 입니다. 
		<br/><br/><br/>
		<span class="teacher-guide">내용 펼치기  &xdtri;</span>
		<span class="teacher-guide-close">내용 닫기 &xutri;</span>
	</div>
	<div class="teacher-content">
		<div class="subtile">학생을 구하는 방법</div>
		
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder;padding:30px 0px 20px 0px;">방법 &#9312; &nbsp;수업 만들기</div>
		<br/>
		<img class="find" src="<c:url value="/resources/img/makeclassway1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/makeclassway2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/makeclassway3.png" />"  alt="수업찾기3"/>
		<br/>
		프로필을 작성한 후 선생님은 수업을 작성할 수 있습니다.<br/>
		수업은 총 3개까지 만들수 있으며 수업이 노출되기 위해서는 '본인인증'과 '학력인증'은 필수 입니다.<br/>
		'본인인증'과 '학력인증'을 하지 않아도 수업을 만들수는 있지만, 노출이 되지 않습니다.<br/>
		따라서 '인증'을 하시게되면 수업이 노출되며 판매할 수 있습니다.<br/>
		수업 내용에는 수업 과목, 수업횟수, 회당 수업시간, 수업내용, 선생님 소개 등의 내용이 포함되며
		콕사부는 학원법에 의거한 환불정책을 준수하며 이에 동의한 선생님들만이 서비스를 이용가능합니다.
		</div>
		
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder;padding:60px 0px 30px 0px;">방법 &#9313; &nbsp;학생의 수업 요청에 지원서 작성하기</div>
		<img class="find" style="float:left" src="<c:url value="/resources/img/teacherway.png" />"  alt="수업찾기1"/>
		학생의 수업 요청에 수업을 신청할 수 있습니다.<br/>
		예를들어 노원구에서 수학과목을 원하는 학생이 수업요청서를 작성하면 노원구에서 활동하며 수학수업을 진행하는 모든 선생님들에게 어플로 알림을 제공합니다.<br/>
		학생의 요청서를 보고 과외 수업을 진행하고 싶으시면 수업 지원을 할 수 있으며,
		수업 지원은 30글자 미만의 수업을 지원한다는 문구를 작성하시면 되며, 학생은 지원 문구와 함께
		선생님의 프로필 정보와 수업정보를 열람 할 수 있습니다.<br/>
		</div>
		
		<div class="subtile" style="clear:left">'본인인증'과 '학력인증'은 필수 인가요??</div>
		<div style="font-size:17px;">
		<img class="find" style="float:left" src="<c:url value="/resources/img/identifyway.png" />"  alt="수업찾기1"/>
		'본인인증'과 '학력인증'은 필수입니다. 인증이 안되어있다면 사실상 선생님 회원으로서 활동에 제한을 받습니다.<br/> 
		수업을 만들어도 노출이 되지 않으며, 학생의 수업요청에 지원서를 작성할 수도 없습니다.
		</div>

		<div class="subtile" style="clear:left;">'안전거래'는 무엇인가요??</div>
		<div style="font-size:17px;">
		안전거래는 학생이 수업금액을 선생님에게 입금하지 않고 콕사부 회사로 입금하고 
		이를 회사가 보관하고 수업이 종료되는 날짜를 기준으로 1-3일 이후 선생님에게 수수료를 제외하고
		전달하는 방식입니다.(수수료는 과외금액의 20%) 현재 수수료 할인 이벤트를 진행하고 있습니다. 
		3월 31일까지 수수료 할인 이벤트를 진행하며 3월 31일 전에 결제된 수업에 대하여 중개 수수료가 20%가 아닌 10%로 적용됩니다. 
		콕사부 내의 모든 거래는 안전거래로 진행이 되며 콕사부 내의 거래를 이용하지 않고 
		직거래를 한 경우에도 선생님 회원은 중개수수료를 회사에 납부하여야 합니다. 
		만일 이를 어길시 수수료의 10배에 해당하는 금액을 위약금으로 배상해야합니다. 
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
       $(document).ready(function(){
    	   
    	   $('.student-guide').click(function(){
    		   $('.student-guide-close').show();
    		   $(this).hide();
    		   $(".student-content").show();
    	   })
    	   
    	   $('.student-guide-close').click(function(){
    		   $('.student-guide').show();
    		   $(this).hide();
    		   $(".student-content").hide();
    	   })
    	   
    	   
    	   $('.teacher-guide').click(function(){
    		   $('.teacher-guide-close').show();
    		   $(this).hide();
    		   $(".teacher-content").show();
    	   })
    	   
    	   $('.teacher-guide-close').click(function(){
    		   $('.teacher-guide').show();
    		   $(this).hide();
    		   $(".teacher-content").hide();
    	   })
       });
</script>
</body>
</html>