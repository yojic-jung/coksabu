<%@page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>메세지</title>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no" />
<link rel="canonical" href="https://coksabu.com/message">
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
        font-size:40px;
        	padding:30px;
        }
        
        .unread{
        	font-size:30px;
        	color:white;
        	background:red;
        	padding:10px 20px;
        	border-radius:15px;
        }
		
</style>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script src="https://cdn.bootcss.com/stomp.js/2.3.3/stomp.js"></script>
<script>


var email = "<c:out value="${email}" />";
var stompClient = null;

function connect() {
	//파라미터 이름, 순서 바뀌면 안됨 , afterConnectionClosed메서드에서 참조함
	var currentUrl = window.location.href;
	if(currentUrl.indexOf("www.coksabu.com")!=-1){
		 var socket = new SockJS("https://coksabu.com/chatmemberlist");
	}else if(currentUrl.indexOf("m.coksabu.com")!=-1){
		 var socket = new SockJS("https://coksabu.com/chatmemberlist");
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

  //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
		$('.m-page-transit').fadeOut(200);
	}else{
		$('.m-page-transit').hide();
	}
	if ( event.originalEvent && event.originalEvent.persisted) {// BFCahe
    	window.location.reload();
    	console.log("BF캐시 존재함")
	}else if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		//뒤로가기 이벤트 채팅 숫자 초기화 위해
		window.location.reload();
		console.log("캐시 존재함")
	}else{}
});


</script>

<div class="pc-tutor" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div class="menu-title"></div>
            </div>

<div style="width:100%; background:white; margin: auto; padding:20px;">
			<c:if test="${size==0 }">
				<div style="text-align:left; font-size:25px;font-family:'JejuGothic';color:gray;">
					대화상대가 없습니다.
				</div>
			</c:if>
			<div class="chatTop"></div>
	<c:forEach var="pro" items="${pro}">
            	<a  class="chatMember-${pro.id}" href="./chatmyroom?id=${pro.id}" style="text-decoration:none;color:black;">
                           <table style="border-spacing:10px;font-family:JejuGothic; font-size: 35px;width:100%;border-bottom:1px solid gray; ">
                            <tr>
                                <td rowspan="3" style="width:202px;"> <img style="width:200px; height:200px; border-radius:100px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                               
                            </tr>
                            <tr>
                                <td style="color:rgb(87, 87, 87); padding:0px 5px 0px 20px;font-size:35px">${pro.nickname} 님</td>
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
<div style="height:500px;"></div>
<script>
var linkLocation="";
$(document).on("click","a",function(event){
	//datepicker에서는 효과 미적용
	if($(this).hasClass("ui-corner-all")){
		return;
	}
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
		event.preventDefault();
        linkLocation = this.href;
        if($(this).attr("href")!="#"){
        	$('.m-page-transit').fadeIn(100);
            setTimeout(function(){redirectPage()}, 100);
        }
	}
});



    function redirectPage() {
        window.location = linkLocation;
    }

    $(document).on("click", '.m-back', function(){
    	var broswerInfo = navigator.userAgent;
    	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
    	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    		var referpage = document.referrer;
            		$('.m-page-transit').fadeIn(200);
    		if(referpage==''){
    			setTimeout(function(){$('.m-page-transit').hide();location.href = './';}, 200);
    		}else{			
    			setTimeout(function(){$('.m-page-transit').hide();history.back();}, 200);
    		}
    	//웹뷰 아닌 그냥 모바일
    	}else{
    		var referpage = document.referrer;
    		if(referpage==''){
    			location.href = './';
    		}else{
    			history.back();
    		}
    	}
    });

</script>

	<div class="m-page-transit" style="text-align: center; width: 100%; position: fixed; left: 0px; top: 0px; background: #a6a6a6;opacity:0.5; height: 100%; z-index: 10;">
		<img src="/resources/img/Spinner-1s-130px.svg" style="position:absolute;top:50%;left:50%;transform:translate(-50%, -50%);" />
	</div>

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