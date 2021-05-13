<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>콕사부</title>
<meta charset="utf-8">
<meta name="description" content="내가 찾던 수업을 만나는 곳, 콕사부입니다." />
<meta name="naver-site-verification" content="d8a12dcb95b21f0d459e1385826becb35a921218" />
<meta property="og:type" content="website">
<meta property="og:title" content="콕사부">
<meta property="og:site_name" content="콕사부">
<meta property="og:description" content="내가 찾던 수업을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com">
<meta name="viewport" content="user-scalable=no" />
<meta name="facebook-domain-verification" content="p4cmwcul9alesb9w73uj30zly7m99z" />
 
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyMMddHHmm" /></c:set>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<link rel="canonical" href="https://coksabu.com/">
<link rel="stylesheet" href= "<c:url value="/resources/css/indexM.min.css?date=${date}" />"/>
   
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
 <script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<style>
		.tutorial-first-back{
			display:none;
			width:100%;
			height:100%;
			background:black;
			opacity:0.3;
			position:fixed;
			top:0px;
			left:0px;
			z-index:90;
		}

		.tutorial-first{
			line-height:200%;
			width:80%;font-size:40px;
			font-family: 'JejuGothic';
			border-radius:20px;
			color: black;;
			z-index:100;
			position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
			display:none;
			padding:0px;
			background-image:url(/resources/img/firecracker.png);
			background-repeat : no-repeat;
        	background-size : cover;
			text-align:center;
		}
		
		
		.tutorial-para{
		background:white;
		border-radius:20px 20px 150px 150px;
		text-align:center;
		padding:30px 0px;
		}
		.tutorial-first-title{
			color:orange;
			font-size:50px;
			margin-bottom:30px;
			
		}
		
		.tutorial-btn-st, .tutorial-btn-te{
			margin:40px auto;
			padding:10px;
			cursor:pointer;
			background:white;
			color:orange;
			border-radius:20px;
			width:80%;
			display:inline-block;
		}
		
		.tutorial-close{
			cursor:pointer;
		}
		
		.tutorial-close-div{
			margin-top:50px;
			text-align:right;
			color:white;
			font-size:30px;
			padding:10px;
		}
		.apple-customize{
	width:80%;text-align:center;
	background:black;
	font-family: 'Apple SD Gothic Neo','Malgun Gothic';font-size:45px;color:white;border-radius:10px; font-weight:bolder;
	margin:20px auto 60px auto;cursor:pointer;height:104px;border:1px solid black;
	display:none;
	}
		
	</style>

</head>
<body>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1"
/></noscript>
<header class="m-header">
  
    <div class="m-jbMenu">
      	<span class="m-btn">
      		<span> </span>
      		<span> </span>
      		<span> </span>
  		</span>
      
 		<a href="./"><span class="m-title">콕사부</span></a>
 	</div>
 	
 	
	<div id="m-menu"> 
			<div class="m-close">x</div> 
			<div class="m-menu-title">Menu</div>
			 <sec:authorize access="!isAuthenticated()">
			<a href="./login" class="m-menu-href" ><div class="m-menu-content">로그인</div></a>
			<a href="./signup" class="m-menu-href"><div class="m-menu-content">회원가입</div></a>
			<a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">수업목록</div></a>
			<a href="./lessonapply" class="m-menu-href"><div class="m-menu-content">수업요청</div></a>
			<!-- 주석 지우기 <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
			 </sec:authorize>
			 <sec:authorize access="isAuthenticated()">
              <a href="./message" class="m-menu-href"><div class="m-menu-content">메세지</div></a>
              <a href="./myroom" class="m-menu-href"><div class="m-menu-content">마이페이지</div></a>
              <a href="./boarder?main=11&subject=11" class="m-menu-href"><div class="m-menu-content">수업목록</div></a>
              <!-- 주석 지우기 <a href="./applylist" class="m-menu-href"><div class="m-menu-content">요청목록</div></a> -->
              <a href="./lessonapply" class="m-menu-href"><div class="m-menu-content">수업요청</div></a>
         	  <a href="./customer" class="m-menu-href"><div class="m-menu-content">고객센터</div></a>
         	 </sec:authorize>
	</div> 

	<div id="m-menu2"></div>

  	</header>
  	 	
  	 	<!-- 모바일 프로모트 코드 -->	
  	 <div class="cok-intro-back"></div>      
  	<div class="cok-intro">
		<div class="intro-title">
			<span class="intro-close1">[하루동안 열지않음 X]</span>
			.
			<span class="intro-close2">[닫기 X]</span>
		</div>
		<div class="intro-content">
			<div style="width:90%;margin:70px auto 100px auto;font-size:55px;">콕사부에 대해 알아보고<br/>과외수업을 진행해보세요.</div>
			<div style="text-align:center;"><img style="width:100%;" src="<c:url value="/resources/img/people.png" />"  alt=""/></div>
			<div class="intro-text">
				<div class="teach-intro">선생님으로 알아보기</div>
				<div class="student-intro">학생/학부모님으로 알아보기</div>
			</div>
			<div class="teach-text1">
				<div style="text-align:center;margin:60px;"><img style="width:100%;" src="<c:url value="/resources/img/threeclass.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				콕사부 선생님은 최대 3개의 수업을 무료로 만들어 홍보 할 수 있습니다.
				</div>
				<div class="teach-next1">다음 알아보기</div>		
			</div>
			<div class="teach-text2">
				<div style="text-align:center;margin:60px;"><img style="width:30%;" src="<c:url value="/resources/img/notification.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				앱을 통해 학생의 과외 요청에 실시간 알림을 제공 받을수도 있습니다.
				</div>
				<div class="teach-next2">다음 알아보기</div>		
			</div>
			<div class="teach-text3">
				<div style="text-align:center;margin:60px;"><img style="width:40%;" src="<c:url value="/resources/img/gawerespond.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				물론, 학생의 과외요청서에 대해 무료로 지원서를 제출할 수 있습니다.
				</div>
				<div class="teach-next3">다음 알아보기</div>		
			</div>
			
			<div class="teach-text4">
				<div style="width:80%;margin:30px auto;">
				콕사부는 선생님들이 중개수수료와 유료 이용료 없이 과외를 구할 수 있도록 하였습니다.<br/>
				콕사부에서 자유롭게 과외활동을 해보세요.
				</div>
				<div class="teach-next4 teach-end">콕사부 홈페이지 더보기</div>
				
				<div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="display:none;"></div>
        
        		<div class="apple-customize">
        		<table style="width:100%;">
        			<tr>
        				<td><img src="<c:url value='/resources/img/appleLogo.png' />"  style="vertical-align: middle;width:71px;height:100px;"/></td>
        				<td style="text-align:center;">Sign in with Apple</td>
        			</tr>
        		</table>
        		</div>
        
				<div class="naver-customize">
        			<span style="font-weight:bolder;float:left;clear:right;">
        				<img src="<c:url value='/resources/img/naver.png' />"  style="width:80px;height:80px;"/>
        			</span>
        			네이버로 로그인
        		</div>
        		<div style="display:none;">
        			<div id="naverIdLogin"></div>
        		</div>
			</div>
			
			<div class="student-text1">
				<div style="text-align:center;margin:60px;"><img style="width:100%;" src="<c:url value="/resources/img/threeclass.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				수업목록을 통해 구체적인 선생님 정보와 수업정보를 알 수 있으며,<br/>
				성별, 경력, 과외가능위치 등 상세검색을 통해 원하는 선생님을 찾을 수 있습니다.
				</div>
				<div class="student-next1">다음 알아보기</div>		
			</div>
			<div class="student-text2">
				<div style="text-align:center;margin:60px;"><img style="width:100%;" src="<c:url value="/resources/img/gaweapplication.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				선생님을 직접 찾지 않더라고 과외요청서를 작성하면,<br/> 
				수업 가능한 선생님의 지원서를 받아 볼 수 있습니다.
				</div>
				<div class="student-next2">다음 알아보기</div>		
			</div>
			<div class="student-text3">
				<div style="text-align:center;margin:60px;"><img style="width:30%;" src="<c:url value="/resources/img/chat.png" />"  alt=""/></div>
				<div style="width:80%;margin:30px auto;">
				채팅을 통하여 안전하게 상담 또한 진행 할 수 있으니,<br/>
				지금 콕사부를 통해 과외선생님을 만나보세요!
				</div>
				<div class="student-next3 student-end">콕사부 홈페이지 더보기</div>
				
				<div class="apple-customize">
        		<table style="width:100%;">
        			<tr>
        				<td><img src="<c:url value='/resources/img/appleLogo.png' />"  style="vertical-align: middle;width:71px;height:100px;"/></td>
        				<td style="text-align:center;">Sign in with Apple</td>
        			</tr>
        		</table>
        		</div>
				
				<div class="naver-customize">
        			<span style="font-weight:bolder;float:left;clear:right;">
        				<img src="<c:url value='/resources/img/naver.png' />"  style="width:80px;height:80px;"/>
        			</span>
        			네이버 아이디로 로그인
        		</div>
				<div style="display:none;">
        			<div id="naverIdLogin"></div>
        		</div>
			</div>
		</div>
	</div> 	
  	 	
	<section>
	
	
	
	<div style="height:140px;"></div>
	 <ul id="inner-fade">
            
            <li>
            	<img class="fadeImg" src="<c:url value="/resources/img/main1.png" />"  alt="메인이미지1"/>
            	<div class="fade-content" style="text-align:center;">콕사부의 안전거래 시스템으로<br/>안전하게 거래하세요.</div>
            </li>
            <li>
            	<img class="fadeImg" src="<c:url value="/resources/img/main2.png" />"  alt="메인이미지2"/>
            	<div class="fade-content">콕사부의 사부님과<br/>내게 맞는 과외를 진행 해보세요.</div>
            </li>
            <li>
            	<img class="fadeImg" src="<c:url value="/resources/img/main3.png" />"  alt="메인이미지3"/>
            	<div class="fade-content">선생님의 판매 수업 외에도<br/>채팅창의 거래제안서 작성으로<br/>안전거래를 할 수 있습니다.</div>
            </li>
        </ul>
        	
	
	 <div style="text-align:center;font-family: 'JejuGothic';padding:30px; background:#F6F6F6 ">
      		<div style="margin-bottom:30px;font-size:35px;">콕사부 서비스 내용이 궁금하신가요?? </div>
      		<div style="margin:30px;"><a href="./useGuide" style="text-decoration:none;color:white;"><span style="padding:10px; border-radius:10px; background:orange;font-size:40px;">"콕사부 이용가이드"</span></a></div>
     </div>
        
	
	<div style="width:100%;padding:90px 20px;">
	<table class="img-ui" style="border-spacing:70px 0px;text-align:center; font-size:30px;font-weight:bolder">
		<tr>
			<td><a href="./boarder?main=11&subject=11"><img src="<c:url value="/resources/images/ui1m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=21&subject=21"><img src="<c:url value="/resources/images/ui2m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=31&subject=31"><img src="<c:url value="/resources/images/ui3m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=41&subject=41"><img src="<c:url value="/resources/images/ui4m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=11&subject=11"><div >수 학</div></a></td>
			<td><a href="./boarder?main=21&subject=21"><div>외국어</div></a></td>
			<td><a href="./boarder?main=31&subject=31"><div>국 어</div></a></td>
			<td><a href="./boarder?main=41&subject=41"><div>사 회</div></a></td>
		</tr>
		<tr>
		<td colspan="4" style="height:70px;"></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><img src="<c:url value="/resources/images/ui5m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=61"><img src="<c:url value="/resources/images/ui6m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=64"><img src="<c:url value="/resources/images/ui7m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=71&subject=71"><img src="<c:url value="/resources/images/ui8m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><div>과 학</div></a></td>
			<td><a href="./boarder?main=61&subject=61"><div>음악/미술</div></a></td>
			<td><a href="./boarder?main=61&subject=64"><div>체 육</div></a></td>
			<td><a href="./boarder?main=71&subject=71"><div>자소서/<br/>논술/면접</div></a></td>
		</tr>
	</table>
</div>

<div style="width:90%; margin:30px auto 0px auto; padding:30px 0px 0px 0px; font-size:3em; font-weight:900; font-family:'JejuGothic'; text-decoration:underline;">콕사부 인기 수업</div>
<div style="width:100%;">
<table class="list">
<c:forEach var="post" items="${list}" varStatus="status">
	<tr>
	<td style="width:30%;">
	<a href="./boardread?postId=${post.id}">
	<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:100%; height:250px;border-radius:20px; "/><br/>
	</td>
	<td>
	<a href="./boardread?postId=${post.id}">
	<div>
	<div id="title"> ${post.title}</div>
	<div id="name">${post.nickname}(${post.birth}, ${post.sexual})&nbsp;&nbsp;경력 <c:if test="${post.career!=0}">${post.career}년</c:if><c:if test="${post.career==0}">1년미만</c:if></div>
	
	<c:choose>
		<c:when test="${post.academy ne '' and post.academy != null}">
			<div id="universe"> ${post.academy} ${post.academyd}</div>
		</c:when>
		<c:otherwise>
			<div id="universe"> ${post.universe} ${post.univsub}</div>
		</c:otherwise>
	</c:choose>
	
	<div id="price" > ${post.subCate0} ${post.price3}원 <c:if test="${post.subCate1 !='nonevalue' }">/ ${post.subCate1} ${post.opt1price3}원</c:if> <c:if test="${post.subCate2!='nonevalue' }">/ ${post.subCate2} ${post.opt2price3}원</c:if></div>
	</div>
	</a>
	</td>
	</tr>
	</c:forEach>
	</table>
</div>

	</section>
	
<div class="m-page-transit" style="text-align:center;width:100%;position:fixed;left:0px;top:0px;background: white; height:100%;z-index:10;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>


<div class="tutorial-first-back"></div>
    <div class="tutorial-first">
    	<div class="tutorial-para">
    	<div class="tutorial-first-title">튜토리얼 안내를 통해<br/>쉽고 빠르게 시작해보세요</div>
    	<div class="tutorial-first-content">
    	친절한 사용 설명과 함께  쉽고 빠르게<br/>
    	 콕사부 서비스를 사용할 수 있습니다</div>
    	</div>
    	<br/>
    	<div>
    	
    	<a href="./apply?cok_tutorial=first_student" style="color:orange;text-decoration:none;">
    		<div class="tutorial-btn-st">학생/학부모 튜토리얼</div>
    	</a>
    	<a href="./profile?cok_tutorial=first_profile" style="color:orange;text-decoration:none;">
    		<div class="tutorial-btn-te">선생님 회원 튜토리얼</div>
    	</a>
    	
    	</div>
    	<div class="tutorial-close-div"><span class="tutorial-close">[닫기x]</span></div>
</div> 

 <div id="appleid-signin" data-color="black" data-border="true" data-type="sign in" style="width:10px; height:5px;display:none;"></div>
 <footer class="m-footer">
          <div class="m-foot">
            <hr/>
            <div class="m-foot-align">
            <div>
       상호 : 콕사부  | 대표자 : 정요직 | 개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368 | TEL.02-959-1176 <br/> 
                  사업자 등록번호.654-19-01069 | 통신판매업 신고 : 2019-서울동대문-0997호
            </div>

            <div>
            고객센터.02-959-1176 | 
                평일 10:00 ~ 17:00 (점심 13:00 ~ 14:00) | <a href="./companyInfo" style="color:black; text-decoration:none;">회사소개</a>
            </div>
            <br/>
            <div style="clear:left; text-align:center;">
            콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 <br/>거래 정보 및 거래에 대한 책임은 각 판매자가 부담합니다.
          </div>
          </div>
          </div>
          <div style="height:300px;"></div>
          <div class="bottom-cate">
				<table class="bottom-table">
					<tr>
						<td><a href="./"><img class="bottom-img" src="<c:url value="/resources/img/home2.png" />"  alt="home"/></a></td>
						<td><a href="./apply"><img class="bottom-img" src="<c:url value="/resources/img/applyui.png" />"  alt="apply"/></a></td>
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./" style="color:orange">홈</a></td>
					<td><a href="./apply">수업요청</a></td>
					<td><a href="./category">카테고리</a></td>
					<td><a href="./message" class="m-message-notify">메시지</a></td>
					<td><a href="./myroom">마이페이지</a></td>
					</tr>
				</table>
			</div>		
        </footer>
  	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script src="<c:url value="/resources/js/jquery.innerfade.js"/>"></script>
    <script src="<c:url value="resources/js/indexM.min.js?date=${date}" />" ></script>
    
    
    <sec:authorize access="isAuthenticated()">
       <script>
       function getRequestParam(){
   	    var url = document.location.href;
   	    var qs = url.substring(url.indexOf('?') + 1).split('&');
   	    for(var i = 0, result = {}; i < qs.length; i++){
   	        qs[i] = qs[i].split('=');
   	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
   	    }
   	    return result;
   	}
       
     	//튜토리얼 코드
        if(getRequestParam().cok_tutorial=="first_user"){
    	   if(GetCookie("tutorial")!="end"){
    		   $('.tutorial-first').toggle(500);
         	   $('.tutorial-first-back').show();
    	   }
       }
     
       $(document).ready(function(){
    	   $('.tutorial-close').click(function(){
    		   $('.tutorial-first').remove();
         	   $('.tutorial-first-back').remove();
         	   SetCookie('tutorial','end')
    		});
       });
       </script>
       </sec:authorize>
       
       
    	 <%
       session=request.getSession();
       String messageStatus = (String)session.getAttribute("messageStatus");
       if(messageStatus!=null && messageStatus.equals("exist")){
       %>
       <script>
       $('.m-message-notify').after('<span style="display:inline-block;vertical-align:top;width:16px;height:16px;border-radius:8px;background:red;"></span>');
       </script>
       <%
       }
       %>
       
       <sec:authorize access="!isAuthenticated()">
       	<script>
        
        // 쿠키설정
        var strReturn;
        //아래에 정의되어 있는 GetCookie()라는 함수를 호출하여 현재 쿠키값이 있는지 확인
        strReturn = GetCookie('promoteCookie');
        //만약 쿠키가 없다면 starPop()함수를 호출하여 오픈 창으로 이벤트 페이지 실행
        
        if(strReturn == null || strReturn == '0'){
        	startPromote();
        }
        
        
    	
        var state = "<c:out value="${state}" />";
        var client_nonce = "<c:out value="${client_nonce}" />";
        console.log(client_nonce)
        AppleID.auth.init({
            clientId : 'com.coksabu.coksabu',
            scope : 'name email',
            redirectURI : 'https://m.coksabu.com/loginCallBackApple',
            state : state,
            nonce : client_nonce,
        });
        
        $(document).ready(function(){
      	   
      	   $('.apple-customize').click(function(){
      		   $('#appleid-signin').trigger("click");
      		});
      	   
         });
       	</script>
       </sec:authorize>
   </body>
</html>