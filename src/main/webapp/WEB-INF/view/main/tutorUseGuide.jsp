<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>선생님 이용가이드, 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="콕사부 선생님 이용안내 페이지입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="선생님 이용가이드">
<meta property="og:site_name" content="선생님 이용가이드">
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
min-height:200px;
 background-image:url(<c:url value="/resources/img/tutorGuide.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
 
 .teacher-guide{
 padding:5px; background:black;color:white;font-size:20px;cursor:pointer
 }
 .teacher-guide-close{
 	display:none; font-size:20px;cursor:pointer; text-decoration:underline;
 }
.teacher-content{
 	width:70%;
 	margin:40px auto;
 	line-height:180%;
 }
 .subtile{
 	margin:80px 0px 30px 0px;
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
<div style="padding-top:70px;">
선생님 이용안내 
</div>
</div>

<div style="min-height:300px;font-size:20px;">
	<div class="teacher-content">
		<div class="subtile" style="clear:left;">'수수료' 안내</div>
		<div style="font-size:17px;">
		콕사부는 과외 중개수수료 및 유료 이용료 없이 서비스를 이용하는 모든 사용자가 무료로 이용할 수 있습니다.<br/>
		직거래를 하는 경우에는 어떠한 비용도 청구되지 않으나 콕사부 내의 안전거래를 통한 거래가 일어나는 경우  판매금액의 5%가 안전결제 서비스 사용료로 부과 됩니다.<br/>
		(직거래를 통한 사기 유도, 허위 광고, 상대에게 불쾌감을 주는 직거래 유도, 기타 불순한 목적으로 사용되는 경우에는 이용제한, 회원정지 등의 페널티가 주어짐.)<br/>
		안전거래 시스템 정책에 따라 수업비는 수업이 종료되는 날짜를 기준으로 1-3일 후 안전결제 서비스 사용료(판매금액의 5%) 제외 후 수업비가 전달됩니다.<br/>
		</div>

		
		<div class="subtile" style="clear:left;">'안전거래'와 '환불제도'</div>
		<div style="font-size:17px;">
		안전거래는 학생이 수업금액을 선생님에게 입금하지 않고 콕사부 회사로 입금하고 <br/>
		이를 회사가 보관하고 수업이 종료되는 날짜를 기준으로 1-3일 이후 선생님에게 수업비를<br/>
		전달하는 방식입니다.(안전결제 서비스 사용료 제외후)<br/>
		입금받을 계좌는 [마이페이지] [내 계정 정보 수정하기]에서 입력할 수 있습니다.<br/>
		'안전거래' 기능과 '환불제도'는 학생 학부모님에게 과외플랫폼에서도<br/>
		안전한 거래가 가능하다는 신뢰감을 드리고  보다 많은 학생 학부모 회원을 유입시키고자<br/>
		이러한 정책을 시행하오니 선생님들의 양해를 부탁드립니다.<br/>
		</div>
	
	
		<div class="subtile">서비스 안내</div>
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder;padding:30px 0px 20px 0px;">&#9312; &nbsp; 최대 3개의 수업 홍보 가능</div>
		<br/>
		<img class="find" src="<c:url value="/resources/img/makeclassway1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/makeclassway2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/makeclassway3.png" />"  alt="수업찾기3"/>
		<br/>
		프로필을 작성한 후 선생님은 수업을 작성할 수 있습니다.<br/>
		수업은 총 3개까지 만들수 있으며 수업이 노출되기 위해서는 '본인인증'과 '학력인증'은 필수 입니다.<br/>
		'본인인증'과 '학력인증'을 하지 않아도 수업을 만들수는 있지만, 노출이 되지 않습니다.<br/>
		따라서 '인증'을 하시게되면 수업이 노출되며 판매할 수 있습니다.<br/>
		수업 내용에는 수업 과목, 수업횟수, 회당 수업시간, 수업내용, 선생님 소개 등의 내용이 포함되며<br/>
		콕사부 내의 모든 수업은 학원법에 의거한 환불정책을 준수합니다.
		</div>
		
		
		
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder;padding:60px 0px 30px 0px;">&#9313; &nbsp;채팅창의 '거래 제안서 작성'</div>
		<br/>
		<img class="find" src="<c:url value="/resources/img/chatguide1.png" />"  alt="수업찾기1"/>
		<img class="find" src="<c:url value="/resources/img/chatguide2.png" />"  alt="수업찾기2"/>
		<img class="find" src="<c:url value="/resources/img/chatguide3.png" />"  alt="수업찾기3"/>
		<br/><br/>
		과외는 학생의 요구조건에 따라 수업형식과 수업가격이 천차만별 달라질 수 있어 <br/> 
		선생님이 판매하는 수업이 학생의 요구조건에 맞지 않는 경우<br/> 
		채팅창에서 빠르게 새로운 수업을 작성하여 거래를 할 수 있습니다.<br/> 
		예를들어 내가 판매하는 수업은 '한달8회', '회당2시간' ,'35만원' 인데<br/> 
		어떤 학생이 '회당3시간'으로 수업을 듣고 싶은 경우 선생님이 채팅창에서 새로운 거래제안서 작성을 통해<br/> 
		'회당3시간'로 수업을 만들어 판매 가격을 변경하여 거래를 할 수 있습니다. 
		</div>
		
		
		
		<div style="font-size:17px;">
		<div style="color:orange;font-weight:bolder;padding:60px 0px 30px 0px;">&#9314; &nbsp;학생의 수업 요청에 지원서 작성</div>
		<img class="find" style="float:left" src="<c:url value="/resources/img/teacherway.png" />"  alt="수업찾기1"/>
		학생의 수업 요청에 수업을 신청할 수 있습니다.<br/>
		예를들어 노원구에서 수학과목을 원하는 학생이 수업요청서를 작성하면 노원구에서 활동하며 수학수업을 진행하는 모든 선생님들에게 어플로 알림을 제공합니다.<br/>
		학생의 요청서를 보고 과외 수업을 진행하고 싶으시면 수업 지원을 할 수 있으며,
		수업 지원은 30글자 미만의 수업을 지원한다는 문구를 작성하시면 되며, 학생은 지원 문구와 함께
		선생님의 프로필 정보와 수업정보를 열람 할 수 있습니다.<br/>
		</div>
		
		
	</div>
	
	<div style='height:400px;'></div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
       $(document).ready(function(){
    	   
       });
</script>
</body>
</html>