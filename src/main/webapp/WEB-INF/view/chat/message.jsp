<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no" />
<title>메세지</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
  
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            font-family:'Malgun Gothic' ;
            -webkit-text-size-adjust:100%;
            -webkit-touch-callout: none;
          }
      
        .message-title{
        text-align:center;
        font-size:30px;
        	padding:30px;
        }
        .div-title{
            width:600px; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
        table td:first{
        	width:150px;
        }
        
        .unread{
        	font-size:14px;
        	color:white;
        	background:red;
        	padding:5px 10px;
        	border-radius:10px;
        }
        
                  .jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 2px black;
          }
          .top-title{
            float:left;
            height:100%;
            border-right : 2px solid black;
            text-align:center;
          }
          .jbMenu > ul {
            margin:12px 0px 0px 0px;
            padding: 0px;
            list-style:none;
            float:right;
          }
          .jbMenu li{
            display :inline;
            margin-right:20px;
          }
          
         .top-ul a {
            text-decoration:none;
            color :black
          }
          .jbFixed {
            position: fixed;
            top: 0px;
          }
          
 .foot{
      width:100%;
      clear:left;
    }
    
    .foot-align{
      
      margin:auto;
      width:1000px;
      min-width:1000px;
    }

    .foot-align>div{
      float:left;
      margin:20px;
    }
    .foot p{
      font-size:12px;
      line-height:150%;
      text-decoration:none;
    }
    .foot-cate a, .foot-company a{
    text-decoration:none;
    color:black;
    
    }
</style>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdn.bootcss.com/stomp.js/2.3.3/stomp.js"></script>
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		window.location.reload();
    }
}

var email = "<c:out value="${email}" />";
var stompClient = null;

function connect() {
	//파라미터 이름, 순서 바뀌면 안됨 , afterConnectionClosed메서드에서 참조함
    var socket = new SockJS("https://coksabu.com/chatmemberlist");
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
        stompClient.subscribe('/queue/chatlist-'+email, function(greeting){
        	if(JSON.parse(greeting.body).message_receiver==email){
        			var roomNum = JSON.parse(greeting.body).chatroom_id;
        			$('.roomNum-'+roomNum).remove();
        			$('.dynamic_roomNum-'+roomNum).text(JSON.parse(greeting.body).unReadCount);
        			$('.chatMember-'+roomNum).insertAfter('.chatTop');
        			$('.dynamic_roomNum-'+roomNum).addClass('unread');
        	}
        		
        });
    });

    
    
    socket.onclose = function(){
    	setTimeout(function(){connect();},1000);
    }
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
}
$(document).ready(function(){
	$('.menu-title').append('<div class="message-title">메세지</div>');
	
	
    $('.chat-td').hover(function(){
    	  $(this).css('background','gray');
      },function(){
    	  $(this).css('background','#EAEAEA');
      });
      
    connect();
});

</script>
<header class="pc-header">
        <div class="jbMenu">
                <div class="top-title"><a href="./"><img src="<c:url value="/resources/images/logo.png" />"  alt="로고"/></a></div>
                
            <sec:authorize access="!isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">수업목록</a></li>
                    <li><a href="./lessonapply">수업요청</a></li>
                   <!-- 주석 지우기 <li><a href="./applylist">요청목록</a></li> -->
                    <li><a href="./login">로그인</a></li>
                    <li><a href="./signup">회원가입</a></li>
                </ul>
             </sec:authorize>
             <sec:authorize access="isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">수업목록</a></li>
                    <!-- 주석 지우기<li><a href="./applylist">요청목록</a></li> -->
                    <li><a href="./lessonapply">수업요청</a></li>
                    <li><a href="./myroom">마이페이지</a></li>
                    <li><a href="./message" class="message-notify">메세지</a></li>
                    <li><a href="<c:url value='j_spring_security_logout' />">로그아웃</a></li>
                </ul>
            </sec:authorize>
          </div>
</header>
<div class="pc-tutor" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div class="menu-title"></div>
            </div>

<div style="background:rgb(233, 232, 232); padding:30px;min-height:500px;">
<div class="div-title">대화방 목록</div>
<div style="width:600px; background:white; min-height:300px; margin: auto; padding:20px;">
		<c:if test="${size==0 }">
			<div style="text-align:left; font-size:18px;font-family:'JejuGothic';color:gray;">
					대화상대가 없습니다.
			</div>
			</c:if>
			<div class="chatTop"></div>
			<c:forEach var="pro" items="${pro}">
            	<a class="chatMember-${pro.id}" href="./chatmyroom?id=${pro.id}" style="text-decoration:none;color:black;">
                           <table style="border-spacing:8px;font-family:JejuGothic; font-size: 14px;width:100%;border-bottom:1px solid lightgray; ">
                            <tr>
                                <td rowspan="3" style="width:80px;"> <img style="width:70px; height:70px; border-radius:35px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                                
                            </tr>
                            <tr>
                            	<td style="color:rgb(87, 87, 87); padding:0px 5px 0px 20px;font-size:18px">${pro.nickname} 님</td>
                            	<td style="text-align:right">
                            			<c:if test="${pro.unReadCount!=0 }">
                            				<span class="unread roomNum-${pro.id}">${pro.unReadCount}</span>
                            			</c:if>
                            			 <span class="dynamic_roomNum-${pro.id}"></span>
                            	</td>
                            </tr>
                            <tr>
                              <td colspan="2" style="color:rgb(151, 149, 149);padding:0px 5px 0px 20px;text-align:right;">
                                ${pro.lasttime}
                                </td>
                            </tr>
                             </table>
                  </a>
            	</c:forEach>

</div>
</div>
<footer class="pc-footer">
          <div class="foot">
            <hr/>
            <div class="foot-align">
            <div>
              <a href="./"><img src="<c:url value="/resources/images/logo.png" />" alt="로고"/></a>
            </div>
            <div>
                <p>상호 : 콕사부 <br/>
                대표자 : 정요직<br/> 
                개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368<br/>
                TEL. 02-959-1176<br/> 
                  사업자 등록번호 : 654-19-01069 <br/>
		통신판매업 신고 : 2019-서울동대문-0997호<br/>
                  EMAIL. dywlr74@naver.com<br/>
                  Copyright(c) 콕사부. All Rights Reserved.<br/>
                </p>
            </div>
            <div class="foot-cate">
                <p>
                  <b>카테고리</b><br/>
                  <a href="./boarder?main=11&subject=11"> 수학</a><br/> 
	              <a href="./boarder?main=21&subject=21">외국어</a><br/>
                  <a href="./boarder?main=31&subject=31">국어</a><br/>
                  <a href="./boarder?main=41&subject=41">사회</a><br/>
                  <a href="./boarder?main=51&subject=51">과학</a><br/>
                  <a href="./boarder?main=61&subject=61">예체능</a><br/>
                  <a href="./boarder?main=71&subject=71">입시/자소서</a><br/>
                </p>
              </div>
            <div class="foot-company">
                <p>
                 <a href="./companyInfo"> 회사소개</a><br/>
                <a href="./customer" style="text-decoration:none; color:black;"> 자주하는 질문</a><br/>
                 <a href="./qna" style="text-decoration:none; color:black;"> 고객문의</a><br/> 
                </p>
              </div>
            
            <div>
              <p>
       <a href="./qna" style="text-decoration:none;font-weight:bolder; color:black;"> 고객센터</a><br/>
                02-959-1176<br/>
                평일 10:00 ~ 17:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>

<div style="clear:left; text-align:center;font-size:11px;">콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 거래 정보 및 거래에 대한 책임은 각 판매자가 부담하고, 이에 대하여 콕사부는 일체 책임지지 않습니다.</div>
            
          </div>
          </div>
</footer>
<div class="m-page-transit" style="text-align:center;width:100%;background: white; height:100%;position:fixed;left:100%;top:0px;z-index:10;dispaly:none;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>
<div class="m-back-transit" style="text-align:center;width:100%;background: white; height:100%;position:fixed;right:100%;top:0px;z-index:10;dispaly:none;">
    <img src="<c:url value="/resources/img/Spin-1s-124px.svg" />"  style="margin-top:50%;"/>
</div>

       <%
       session=request.getSession();
       String messageStatus = (String)session.getAttribute("messageStatus");
       if(messageStatus!=null && messageStatus.equals("exist")){
       %>
       <script>
       $('.message-notify').after('<span style="display:inline-block;vertical-align:top;width:6px;height:6px;border-radius:3px;background:red;"></span>');
       </script>
       <%
       }
       %>
</body>
</html>