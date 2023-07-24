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
            font-family: 'Apple SD Gothic Neo','Malgun Gothic';
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
        
          
</style>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdn.bootcss.com/stomp.js/2.3.3/stomp.js"></script>
<script>
window.onpageshow = function(event) {
	if ( event.originalEvent && event.originalEvent.persisted) {// BFCahe
    	window.location.reload();
		console.log("BF캐시 존재함")
	}else if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		//뒤로가기 이벤트 채팅 숫자 초기화 위해
		window.location.reload();
		console.log("캐시 존재함")
	}else{}
}

var email = "<c:out value="${email}" />";
var stompClient = null;

function connect() {
	//파라미터 이름, 순서 바뀌면 안됨 , afterConnectionClosed메서드에서 참조함
	var currentUrl = window.location.href;
	if(currentUrl.indexOf("www.coksabu.com")!=-1){
		 var socket = new SockJS("https://coksabu.com/chatmemberlist");
	}else if(currentUrl.indexOf("m.coksabu.com")!=-1){
		 var socket = new SockJS("https://coksabu.com/chatmemberlist");
	}else if(currentUrl.indexOf("13.209.57.40")!=-1){
		 var socket = new SockJS("http://13.209.57.40/chatmemberlist");
	}else{
		 var socket = new SockJS("https://coksabu.com/chatmemberlist");
	}
   
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