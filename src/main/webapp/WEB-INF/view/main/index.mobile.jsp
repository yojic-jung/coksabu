<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <link rel="canonical" href="https://coksabu.com/">
   <style>
   @charset "utf-8";
   @font-face{
   font-family:'JejuGothic';
   src:url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype')
   }
   
   *{
   margin:0;
   padding:0;
   box-sizing:border-box;
   }
   
   body{margin:0;
  		 padding:0;
   		font-family:'Malgun Gothic' ;
   		-webkit-text-size-adjust:100%;
  		 -webkit-touch-callout: none;
		}

   
   .m-jbMenu{background:white;width:100%;padding:30px;font-size:80px;
   position:fixed;
   top:0px;
   font-family:'Do Hyeon';
   border-bottom:1px solid gray;z-index:3}
   
   .m-btn{width:50px;height:50px;
   position:absolute;right:0;top:0;z-index:1;
   cursor:pointer;display:inline-block;
   transition:all .4s;box-sizing:border-box;position:relative;
   width:60px;height:44px}
   
   .m-btn span{display:inline-block;
   transition:all .4s;box-sizing:border-box;
   position:absolute;left:0;width:100%;height:7px;
   background:orange;border-radius:4px}
   
   .m-btn span:nth-of-type(1)
   {top:0;left:10px}
   
   .m-btn span:nth-of-type(2){
   top:20px;left:10px}
   
   .m-btn span:nth-of-type(3){
   bottom:0;left:10px}
   
   .m-close{width:100px;
   position:absolute;right:10px;
   top:30px;z-index:1;padding:5px;
   border-radius:10px;
   background:orange;
   color:white;font-size:70px;
   font-weight:bold } 
   
   #m-menu{width:70%;height:100%;
   position:fixed;top:0;left:-71%;
   z-index:10;border-right:1px solid #c9c9c9;
   background-color:rgb(46,46,46);
   color:white;text-align:center;
   transition:All 0.2s ease;-webkit-transition:All 0.2s ease;
   -moz-transition:All 0.2s ease;-o-transition:All 0.2s ease
  }
  
  #m-menu2{width:30%;height:100%;position:fixed;top:0;left:-100%;
   z-index:10;border-right:1px solid #c9c9c9;
   background-color:lightgray;color:white;text-align:center;
   transition:All 0.2s ease;-webkit-transition:All 0.2s ease;
   -moz-transition:All 0.2s ease;-o-transition:All 0.2s ease;opacity:0.1}
   
   .m-menu-title{font-size:60px;padding:50px;
   border-bottom:4px solid white;color:orange;
   font-family:'Malgun Gothic';font-weight:bold}
   
   .m-menu-content{text-align:left;font-size:40px;
   padding:50px;border-bottom:1px solid gray;
   font-family:'Malgun Gothic'}
   
   .m-menu-href{font-size:40px;color:white;text-decoration:none}
   
   .m-title{position:absolute;left:50%;transform:translateX(-50%);color:orange	}
   .m-foot{width:100%;font-size:24px}
   
   .m-foot-align{width:100%;text-align:center;
   line-height:150%;text-decoration:none}
   
   .foot-cate a,.foot-company a{text-decoration:none;color:black}
   
   .fadeImg{width:100%;height:400px }  
   
   .fade-content{
        	color:white;
        	font-size:45px;
        	line-height:150%;
        	width:90%;
        	text-align:center;
        	margin:auto;
        	font-weight:bolder;
        	 position:absolute;
            left:50%; 
            transform:translateX(-50%);
            top:100px;
            z-index: 3;
        }
        
   #inner-fade{z-index:1}
   
   .img-ui{width:95%;margin:auto}
   
     .bottom-cate{
	width: 100%;
	padding:20px 20px 80px 20px;
	position: fixed;
	left: 0;
	bottom: 0;
	background:white;
	border:4px solid gray;
	z-index:10;
}
.bottom-table{
boarder-spacing:0px;
width:100%;
padding:0px;

}
.bottom-table td{
padding:0px;
text-align:center;
font-size:28px;
width:25%;

boarder-spacing:0px;
}
.bottom-img{
width:60%;
height:70px;
padding:0px;
}
.bottom-table a{
text-decoration:none;
color:#A6A6A6;
}

.img-ui{
width:100%;margin:auto
}

.img-ui td{
	width:25%;
}
.img-ui a{
	text-decoration:none;
	color:black;
}

.list{
    	width:90%;
    	margin:auto;
    	border-spacing:0px 80px;
    }
.list td{
	padding-bottom:20px;
	border-bottom:1px solid gray;
}

.list a{
	text-decoration:none;
}
#pst{
		vertical-align:top;padding:0px; width:100%;
		position: relative
	}

	#categories{
		width:100%; 
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		padding:10px 60px;
		color:Grey;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}

    #name{
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		color: DimGrey;
		padding:10px 20px;
	}
	
	#title{
		font-family:'JejuGothic';
		font-weight:bold;
		color: black;
		font-size: 30px;
		padding:10px 20px;
	}
	#universe{
		font-family:'JejuGothic';
		font-weight:bold;
		color: dimgray;
		font-size: 30px;
		padding:10px 20px;
	}
#profile{
	width:150px; height:150px; border-radius:75px;border:5px solid orange;
}
#price{
		font-family:Arial;
		font-weight:bold;
		font-size:30px;
		margin-top:5px;
		padding:10px 20px;
		color:black;
}

.cok-intro{
	background:white;
	width:90%;height:90%;font-size:60px;
	line-height:180%;
	font-family:Malgun-Gothic;
	border-radius:30px;
	color:#002266;
	z-index:100;
	position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
	border:5px solid lightgray;
	display:none;
}

.intro-title{
text-align:center;font-family:'Do Hyeon';color: white;font-size:40px;padding:20px;
border-bottom:2px solid lightgray;text-align:right;
}

.intro-close1{
font-size:50px;padding-right:30px;
color:dimgray;
}

.intro-close2{
float:right;clear:right;font-size:50px;padding-right:30px;
color:dimgray;
}

.intro-content{
border-radius:30px;font-weight:bolder;
width:90%;
}
.intro-text{
width:90%;
z-index:101;
border:5px solid gray;
border-radius:30px;
background:white;
position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
padding:50px 0px;
}
.teach-intro{
font-size:40px;text-align:center;
width:80%;padding:15px;color:white; background:#002266;
margin:auto;
border-radius:80px;
}
.student-intro{
font-size:40px;text-align:center;
width:80%;padding:15px;color: #002266; background:white;border:5px solid #002266;
margin:60px auto 0px auto;
border-radius:80px;
}
.teach-text1, .teach-text2, .teach-text3, .student-text1, .student-text2, .student-text3{
	display:none;
	font-size:50px;
	line-height:160%;
	width:90%;
z-index:101;
border:5px solid gray;
border-radius:30px;
background:white;
position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
padding:50px 20px;
}
.teach-next1, .teach-next2, .teach-next3, .student-next1, .student-next2, .student-next3{
font-size:40px;text-align:center;
width:80%;padding:15px;color:white; background:#002266;
margin:80px auto;
border-radius:80px;
}


.naver-customize{
	width:80%;text-align:center;
	 background-image:url(<c:url value="/resources/img/naverbackground.png" />);
	font-family:Gothic;font-size:40px;color:white;border-radius:80px; padding:15px;font-weight:bolder;
	margin:20px auto;line-height:200%:
	}
   </style>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
   <!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '2787801881458923');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=2787801881458923&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->

   <script async src="https://www.googletagmanager.com/gtag/js?id=AW-413632618"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-413632618');
</script>
</head>
<body>
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
  	 	
  	
  	<div class="cok-intro">
		<div class="intro-title">
			<span class="intro-close1">[하루동안 열지않음 X]</span>
			.
			<span class="intro-close2">[닫기 X]</span>
		</div>
		<div class="intro-content">
			<div style="width:90%;margin:100px auto 100px auto;font-size:65px;">콕사부에 대해 알아보고<br/>과외수업을 진행해보세요.</div>
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
				<div class="teach-next3 teach-end">콕사부 홈페이지 더보기</div>
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
            	<div class="fade-content" style="text-align:center;">지금 가입하면<br/>선생님 "과외 수수료 2개월 무료"</div>
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
			<td><a href="./boarder?main=61&subject=62"><img src="<c:url value="/resources/images/ui6m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=61&subject=64"><img src="<c:url value="/resources/images/ui7m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
			<td><a href="./boarder?main=71&subject=71"><img src="<c:url value="/resources/images/ui8m.png" />" style="width:100%; height:120px;" alt="1"/></a></td>
		</tr>
		<tr>
			<td><a href="./boarder?main=51&subject=51"><div>과 학</div></a></td>
			<td><a href="./boarder?main=61&subject=62"><div>예 능</div></a></td>
			<td><a href="./boarder?main=61&subject=64"><div>체 육</div></a></td>
			<td><a href="./boarder?main=71&subject=71"><div>자소서/<br/>입시</div></a></td>
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
						<td><a href="./category"><img class="bottom-img" src="<c:url value="/resources/img/cate.png" />"  alt="cate"/></a></td>
						<td><a href="./message"><img class="bottom-img" src="<c:url value="/resources/img/message.png" />"  alt="message"/></a></td>
						<td><a href="./myroom"><img class="bottom-img" src="<c:url value="/resources/img/my.png" />"  alt="my"/></a></td>
					</tr>
					<tr>
					<td><a href="./" style="color:orange">홈</a></td>
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
    <script>

    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    
    var param = getParameterByName("inform");


    
    // 쿠키설정
    var strReturn;
    //아래에 정의되어 있는 GetCookie()라는 함수를 호출하여 현재 쿠키값이 있는지 확인
    strReturn = GetCookie('promoteCookie');
    //만약 쿠키가 없다면 starPop()함수를 호출하여 오픈 창으로 이벤트 페이지 실행
    if(strReturn == null || strReturn == '0'){
    	startPromote();
    }
 
  	
  	function GetCookie(sName){
  		/*저장되어있는 쿠키 정보 불러오기
  		오픈 페이지에서 부여하는 쿠키의 이름 및 값을 aCookie라는 변수에 저장.
  		여기서는 test_cookie=1이란 값이 저장 */
  		var aCookie = document.cookie.split("; ");
  		//검색을 원하는 쿠키명(test_cookie)과 저장되어 있는 쿠키의 이름이 일치하는지 확인
  		for(var i=0; i<aCookie.length; i++){
  			var aCrumb = aCookie[i].split("=");
  			if(sName == aCrumb[0]){
  				return unescape(aCrumb[1]);
  			}
  		}
  		return null;
  	}
  	//쿠키가 없을 경우 오픈창을 띄우는 스크립트 
  	function startPromote(){
  		if(param =="user"){
  			$('.cok-intro').show();
  		}
  	}
  	
  	function SetCookie(sName, sValue){
  		var date = new Date();
        date.setTime(date.getTime() + (1*24*60*60*1000));
		document.cookie = sName + "=" + escape(sValue)+";expires="+date.toGMTString();
	}
    
    $(document).on("click","a",function(event){
    	var broswerInfo = navigator.userAgent;
    	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    		event.preventDefault();
            linkLocation = this.href;
            $('.m-page-transit').fadeIn(100);
            setTimeout(function(){redirectPage()}, 100);
    	}
    });
    
    function redirectPage() {
             window.location = linkLocation;
    }
    $(document).ready(function(){
            
            
            
                $('.fadeImg').css('width',$(document).width());
                
                $("#inner-fade").innerfade({
                    animationtype:'fade',
                    speed:750,
                    timeout:8000,
                    type:'sequence',
                    containerheight:'400px'
                });
            
            
            
    	});
    

    
    	$(".intro-close1").click(function() { 
    		$('.cok-intro').remove();
    		SetCookie('promoteCookie','1');
		});
    
    	$(".intro-close2").click(function() { 
    		$('.cok-intro').remove();
		});
    	
    	
    	
    	$(".teach-intro").click(function() { 
    		$('.intro-text').hide();
    		$('.teach-text1').show();
		});
    	
    	$(".teach-next1").click(function() { 
    		$('.teach-text1').hide();
    		$('.teach-text2').show();
		});
    	
    	$(".teach-next2").click(function() { 
    		$('.teach-text2').hide();
    		$('.teach-text3').show();
		});
    	
    	$(".teach-end").click(function() { 
    		$('.cok-intro').remove();
		});
    	
    	
    	$(".student-intro").click(function() { 
    		$('.intro-text').hide();
    		$('.student-text1').show();
		});
    	
    	$(".student-next1").click(function() { 
    		$('.student-text1').hide();
    		$('.student-text2').show();
		});
    	
    	$(".student-next2").click(function() { 
    		$('.student-text2').hide();
    		$('.student-text3').show();
		});
    	
    	$(".student-end").click(function() { 
    		$('.cok-intro').remove();
		});
    	
    	
    	$(".m-btn").click(function() { 
    		$("#m-menu").animate({
    			left:"0px"
    		},100, function(){
    		});

    		$("#m-menu2").animate({
    			left:"70%"
    		},100, function(){
    		})
    	});

    	$(".m-close").click(function() { 
    		$("#m-menu").animate({
    			left:"-71%"
    		},100, function(){

    		});

    		$("#m-menu2").animate({
    			left:"-70%"
    		},100, function(){
    		})
    	});

    	$("#m-menu2").click(function() { 
    		$("#m-menu").animate({
    			left:"-71%"
    		},100, function(){

    		});

    		$("#m-menu2").animate({
    			left:"-70%"
    		},100, function(){
    		})
    	});
    	
    	$(window).bind("pageshow", function(event) {
    		var broswerInfo = navigator.userAgent;
    		//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    			$('.m-page-transit').fadeOut(200);
    		}else{
    			$('.m-page-transit').hide();
    		}
    	    
    	});
    	
    	  var naverLogin = new naver.LoginWithNaverId(
      	  		{
      	  			clientId: "0PgcZhDTwaod8UwQsoKX",
      	  			callbackUrl: "https://coksabu.com/loginCallBackNaver",
      	  			isPopup: false, /* 팝업을 통한 연동처리 여부 */
      	  			loginButton: {color: "green", type: 3, height: 170} /* 로그인 버튼의 타입을 지정 */
      	  		}
      	  	);
      	  	
      	  	/* 설정정보를 초기화하고 연동을 준비 */
      	  	naverLogin.init();
      	  	
      	  	$(document).on("click",".naver-customize",function(event){
      	  	  naverLogin.init(); 
      	  	  location.href = naverLogin.generateAuthorizeUrl();
      		});
    	</script>
    	
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
   </body>
</html>