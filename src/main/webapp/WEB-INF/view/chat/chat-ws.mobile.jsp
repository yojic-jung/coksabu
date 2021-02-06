<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no">
<link rel="canonical" href="https://coksabu.com/chatroom?id=195&root=read">
<title>채팅</title>

 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdn.bootcss.com/stomp.js/2.3.3/stomp.js"></script>
<script type="text/javascript">
	
	var sender = "<c:out value="${sender}" />";
	var chatroom_id =  "<c:out value="${chatroom_id}" />";
	var success = "<c:out value="${success}" />";
    var stompClient = null;

   
    
    function connect() {
    	//파라미터 이름, 순서 바뀌면 안됨 , afterConnectionClosed메서드에서 참조함
        var socket = new SockJS("https://m.coksabu.com/hello?chatroom_id="+chatroom_id+"&username="+sender);
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            stompClient.subscribe('/queue/message-'+chatroom_id, function(greeting){
            	//실제 message_receiver와 관계없음, 딱히 저장해서 보낼만한 곳이 없어 receiver에 저장, 새롭게 만들면 null 오류 생길수도 있으므로
            	if(JSON.parse(greeting.body).message_receiver=="연결접속완료"){
            		if(JSON.parse(greeting.body).message_sender!=sender){
            			$('.readOrNot').remove();	
            		}
            	}else{
            		appendMessage(greeting);
            	}
            });
        });
        
        setTimeout(function(){
      			  var message = {};
      			  message.message_sender = sender;
      			//안읽음 메세지 읽음처리해주기 위해서
      			  stompClient.send("/app/newconnect", {atytopic:"message", name: chatroom_id}, JSON.stringify(message));
        }, 1000)
        
        
        socket.onclose = function(){
        	setTimeout(function(){connect();},1000);
        }
    }
    
    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
    }
    
    
    function send() {
    	var msg = $("#message").val();
    	if(msg != ""){
			  var message = {};
			  message.message_content = $("#message").val()
		  	  message.message_sender = sender
		  	  message.chatroom_id = chatroom_id
		  	  message.message_time = new Date();
		  }
		 
		 
        stompClient.send("/app/message", {atytopic:"message", name: chatroom_id}, JSON.stringify(message));
        $("#message").val("");
    }
	
		  
	function appendMessage(msg) {
		if(JSON.parse(msg.body).message_sender==sender){
			$("#chatMessageArea").append("<div><div class='senderMessage'>"+JSON.parse(msg.body).message_content+"</div><p style='clear:both'></p><div class='msg_time2'>"+"<span class='readOrNot'>"+JSON.parse(msg.body).message_read2+" </span>"+JSON.parse(msg.body).message_time2+"</div><p style='clear:both'></p></div>");
			$('html, body').scrollTop(document.body.scrollHeight);
		}else{
			$("#chatMessageArea").append("<div style='text-align:left;padding:5px;'><div class='receiverMessage'>"+JSON.parse(msg.body).message_content+"</div><div class='msg_time'>"+JSON.parse(msg.body).message_time2+"</div></div>");
			$('html, body').scrollTop(document.body.scrollHeight);
		}
	}

	
	$(document).ready(function(){
		$('.menu-title').append('<div class="message-title">메세지</div>');
		var message = document.getElementById('message');
		
		connect(); 

		$('#sendBtn').click(function() { 
			
			if(message.value.length>250){
				$("#message").val("");
				$('#message' ).prop( 'placeholder', '메세지를 입력하세요(250글자 미만)' );
			}else{
				send();	
				$('#message').trigger('focus')
			}
		});
		
		
	});
</script>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" /> 

<style>

	body{
		height:100%;padding:0px;
		margin:0px;
	}
	
	html{
		height:100%;padding:0px;
		margin:0px;
	}

.m-jbMenu{
     padding:10px; 
}

.m-jbMenu a{
	font-size:60px;
}

#chatMessageArea{
border:none;
padding-bottom:200px;
}
#chatArea {
	width: 100%; margin:0px; overflow-y: auto; border: 1px solid #EAEAEA;
	border:none;
	
}
#writeMessage{
	width: 100%; margin:0px;
	padding:10px;
	position: fixed;
	left: 0;
	bottom: 0;
	z-index:10;
	background-color:#EAEAEA;
}
#message{
	background-color:#EAEAEA;
	width:80%;
	margin:auto;
	font-size:40px;
	padding:10px;
	border:1px solid gray;
	border-radius:30px;
	height:100px;max-height:160px;overflow-y:hidden;
	overflow:scroll;
}
#sendBtn{
	-webkit-appearance:none;
	padding:20px 40px; background-color:#FFE400;
	border:none;border-radius:40px;
	font-weight:border;
	font-size:40px;
	font-weight:bolder;
	position:absolute;
	right:50px;
	bottom:20px;
	
}
.senderMessage{
display: inline-block; max-width:60%; 
padding:20px;margin:30px 20px 0px 0px ;
word-break: break-all;
 border-radius:20px; background:#FFE400;
 font-size:40px;
 float:right;
 text-align:left;
}
.receiverMessage{
display: inline-block;max-width:60%;  padding:20px;margin:20px 0px 0px 20px ;
border-radius:20px; background:#E9E9E9;
word-break: break-all;
 font-size:40px;
}
.msg_time{
font-size:20px;color:gray; margin:10px 10px 0px 10px ;
}
.msg_time2{
font-size:20px;color:gray; margin:10px 10px 0px 10px ;float:right;
}

 .message-title{
        text-align:center;
        font-size:30px;
        	padding:30px;
        }
 .purchase{
 	width:100%;
 	padding:30px;
 	font-size:50px;
 	text-align:center;
 }
 
 .purchase-title{
 	padding:10px;
 	border-radius:20px;
 	background: orange;
 	width:90%;
 	margin:0px auto 0px auto;;
 	font-weight:bolder;
 	color:white;
 	font-size:50px;
 	text-align:center;
 }
 
 
 .purchase-exist{
 	display:none;
 }   
 .proposal{
 	width:80%;
 	margin:20px auto;
 	border-radius:10px;
 	background:#EAEAEA;
 	text-align:center;padding:20px 0px;
 	border:1px solid gray;
 	color:black;
 	text-decoration:none;
 }

	.main-2, .main-3, .main-4, .main-5{
		display:none;
	}
	.buyer{
		font-size:50px;
		background:white;
		color:orange;
		font-weight:bolder;
		padding:30px 0px 90px 0px;
		width:50%;
		display:inline-block;
		float:left;
		border-top:5px solid orange;
	}
	
	.seller{
		font-size:50px;
		background: orange;
		color:white;
		font-weight:bolder;
		padding:30px 0px 90px 0px;
		width:50%;
		display:inline-block;
	}
	
	.second{
		width:100%;
		font-size:50px;
		font-weight:bolder;
		position: fixed;
		left: 0;
		bottom: 0;
		text-align:center;
	}
	
	.down{
		width:100%;
		position: fixed;
		left: 0;
		bottom: 0;
		text-align:center;
		font-size:30px;
	}
	
	.previous1, .previous2, .previous3, .previous4{
		padding:30px 0px 90px 0px;
		background:#EAEAEA;
		width:50%;
		display:inline-block;
		float:left
	}
	
	.next1, .next2, .next3{
	padding:30px 0px 90px 0px;
	background:#353535;
	color:white;
	width:50%;
	display:inline-block;
	}
	
	 .next4{
	padding:30px 0px 90px 0px;
	background:orange;
	color:white;
	width:50%;
	display:inline-block;
	}
	
	.teacher-intr{
      	font-size:35px;
        font-family: 'JejuGothic'; 
        width:80%;
        margin:80px auto 0px auto;
        line-height:180%;
      }
      
      .cate{
      	width:23%;margin:1px;
      	display:inline-block;
      	background:#FAE0D4;
      	padding:50px 0px;
      	font-size:40px;
      	text-align:center;
      }
      
	 .service-cate {
        padding:15px;
        font-size:30px; border-radius:10px;
        margin-top:20px;
      }
      
      .seg-table{
      	width:100%;
      	border-spacing:0px;
      }
      
       .price-table{
      border-spacing:0px 40px;
      width:100%;
      }
	.price-pri{
		width:80%;
		border:1px solid black;
		text-align: right;
		padding:20px; 
		font-size:50px;
	}
      .ui-datepicker{ width: 80%;font-size:50px; }
      }
      
      .accept-proposal{
	cursor:pointer;
	text-decoration:underline;
}

 .purchase-bank{
 	display:none;
 }
</style>
</head>
<body>

<header class="m-header">
   <div class="m-jbMenu">
    <span class="m-back">&lt;</span>
   </div>
   <div style="background:white;padding:20px 0px 0px 0px">
   		<div class="purchase purchase-title" >
		거래 제안서 작성
		</div>
	</div>
	<div style="background:white;padding:20px 0px 0px 0px">
		<div class="purchase-exist purchase-box purchase-title">
		거래 제안서 보기
		</div>
	</div>
</header>

<div class="chat" style="padding-top:20px;">


	
    <div id="chatArea">
    <div id="chatMessageArea">
    	<div class="conversation">
    <c:forEach var="post" items="${mesList}">
    
    <c:choose>
   		<c:when test="${post.message_sender==sender}">
   		<div style="text-align:right;">
   		<div class="senderMessage">
   		${post.message_content}
   		</div>
   		<p style='clear:both'></p>
   		<div class="msg_time2">
   		<c:if test="${post.message_read==1}">
   		<span class="readOrNot">안읽음</span>
   		</c:if>
   		${post.message_time2}
   		</div>
   		<p style='clear:both'></p>
   		</div>
    	</c:when>
    	<c:otherwise>
    	<div style="text-align:left;padding:5px;">
    	<div class="receiverMessage">
   		${post.message_content}
   		</div>
   		<div class="msg_time">
   		${post.message_time2}
   		</div>
   		</div>
    	</c:otherwise>
    </c:choose>
    </c:forEach>
    </div>
    
    </div>
    </div>
    <div id="writeMessage">
    <textarea id="message"  placeholder="메세지를 입력하세요."></textarea>
	<textarea id="xt" style="width:80%;height:1px;font-size:40px;overflow-y:hidden;position:absolute;top:0px" disabled></textarea>
    <input type="button" id="sendBtn" value="&uarr;">
    </div>
    
    
    
</div>


<!-- 거래 제안서 작성 및 수정 -->
<div class="newPurchase" style="display:none;">
<div style="width:100%; text-align:center; font-size:60px;padding:30px;border-bottom:1px solid gray;font-weight:bolder;">
거래 제안서 작성
</div>
<span class="close-btn" style="position:absolute;left:80px; top:30px;font-size:60px;">&lt;</span>
<div class="main-1">
	<div class="content" style="font-size:50px;padding:30px;line-height:180%;width:80%;margin:auto;word-break:keep-all;">
	선생님이 판매하는 수업이<br/>고객의 요구와 맞지 않아 변동이 필요한 경우
	고객의 요구에 맞춘 1대1 맞춤형 수업을 만들어 안전거래를 할 수 있습니다.<br/>
	(거래제안서는 실명으로 작성되며 작성된 제안서에 실명이 표기됩니다.)
	<div style="text-align:center;margin-top:60px;">
	<img src="<c:url value="/resources/images/newpurchase.png" />" alt="거래 이미지" style="width:60%;height:300px;"/>
	</div>
	</div>
		<div class="down">
		<div class="buyer">구매자로 작성</div><div class="seller">판매자로 작성</div>
	</div>
</div>
<form id="proposal-form" name="newpurchase" method="post">
<div class="main-2">	
						<div class="teacher-intr content">
						<div style="line-height:180%;font-size:35px;">
						
						<div style="display:none;">
							<input class="customer-buyer" type="radio" name="customer" value="구매자"/>구매자
							<input  class="customer-seller" type="radio" name="customer" value="판매자"/>판매자
						</div>
						
                          	<div style="font-weight:bolder;">
                          		<span class="buyer-show">제공받을 </span>
                          		<span class="seller-show">제공하시는 </span>
                          		서비스를 선택해주세요.
                          	</div>
                          <div style="width:100%;margin-top:50px;">
                          	<div class="cate">수학</div>
                          	<div class="cate">외국어</div>
                          	<div class="cate">국어</div>
                          	<div class="cate">사회</div>
                          	<div class="cate">과학</div>
                          	<div class="cate">예체능</div>
                          	<div class="cate" style="width:48%">자소서/입시</div>
                          </div>
                          
                          <div style="display:none;">
                          	<input type="checkbox" name="cate" class="check" value="수학"/>수학 
                          	<input type="checkbox" name="cate" class="check" value="외국어"/>외국어 
                          	<input type="checkbox" name="cate" class="check" value="국어"/>국어  
                          	<input type="checkbox" name="cate" class="check" value="사회"/>사회  
                          	<input type="checkbox" name="cate" class="check" value="과학"/>과학 
                          	<input type="checkbox" name="cate" class="check" value="예체능"/>예체능 
                          	<input type="checkbox" name="cate" class="check" value="자소서/입시"/>자소서/입시 
                          </div>
                          


                        </div>
                    </div>
                    <div class="second">
        			<div class="previous1">이전</div>
        			<div class="next1">다음</div>
        			</div>
</div>
<div  class="main-3">
                    <div style="width:80%; margin:auto;" class="content" >    
                         <div style="font-size:35px;font-weight:bolder;margin-top:80px;">수업 정보</div>
                        <div style="font-size:50px;margin-top:50px;">
                        <table class="price-table">
                        <tr>
                        <td>수업 전체횟수</td>
                        <td>
                        	<input class="count fix-hide" type="text" name="lessonCount" style="border:1px solid black;padding:20px;text-align:right;font-size:50px;width:200px;"/>회
                     	</td>
                     	</tr>
                     	<tr>
                     	<td> 회당 수업시간  </td>
                     	<td>
                      <select name="lessonTime" class="price-time"  style="padding:20px;font-size:50px;">
                          <option>60분</option>
                          <option>90분</option>
                          <option>2시간</option>
                          <option>2시간 30분</option>
                          <option>3시간</option>
                          <option>4시간</option>
                        </select>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="2">가격 </td>
                        </tr>
                        <tr>
                        <td colspan="2" style="width:100%;text-align:right;">
                        	<input name="price" class="price-pri fix-hide" type="text" id="price" placeholder="숫자만 입력" />원
                      		<div class="price-kor" style="margin:30px;"></div>
                      	</td>
                      </tr>
                    </table>
                      </div>
                      </div>
                      <div class="second">
                      	<div class="previous2">이전</div>
                      	<div class="next2">다음</div>
                      </div>
</div>
<div class="main-4">
		<div class="content"  style="font-size:45px;width:80%; margin:80px auto 0px auto;line-height:200%;word-break:keep-all;">협의한 수업 시작일자와 종료일자를 입력해주세요.<br/>
			<div style="line-height:250%;margin-top:80px;">
			<input type="text" id="testDatepicker" name="startDate" style="font-size:50px;padding:15px;margin-left:20px;" placeholder="시작일"/>&nbsp;&nbsp;  ~ <br/>
			<input type="text" id="testDatepicker2" name="endDate" style="font-size:50px;padding:15px;margin-left:20px;" placeholder="종료일"/>  
			</div>
		</div>
		<div class="second">
        <div class="previous3">이전</div>
        <div class="next3">다음</div>
        </div>
</div>
<div class="main-5">
		<div class="content" style="width:80%;margin:80px auto 0px auto;">
		<div style="font-size:50px;">기타 추가사항(선택)</div>
		<div style="font-size:40px;margin:50px 0px 20px 0px;line-height:170%;">추가로 필요한 거래 계약사항이 있으시면<br/> 거래 당사자간 협의된 사항을 적어주세요.</div>
		<div style="width:100%;">
			<textarea name="moreDetail" class="fix-hide" rows="10" style="width:100%;font-size:40px;border:1px solid black;padding:30px;"></textarea>
		</div>
		
		<div style="margin-top:80px;font-size:40px;font-weight:bolder;line-height:170%;width:100%;word-break:keep-all;">
		<input class="permit" type="checkbox" name="permit" style="zoom:2.0;" /> 콕사부 서비스정책과 학원법에 의거한 <span class="refund" style="text-decoration:underline">환불정책</span>을 이행할 것에 동의합니다.
		</div>
		<br/>
		
		<div class="refund-content" style="display:none;">
                <div style="overflow:scroll;font-size:25px; line-height:140%;margin:20px auto;height:600px;border:1px solid black; padding:10px;">
				<div style="text-align:right; "><span class="refund-close" style="background:black;color:white;padding:10px">닫기</span></div>
				가. 수업 환불기준 원칙<br/>
				<br/>
				학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
				- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
				<br/>
				1. 수업을 제공할 수 없거나, 수업 장소를 제공할 수 없게 된 날 : 이미 납부한 수업비 등을 일한 계산한 금액 환불<br/>
				<br/>
				2. 수업기간이 1개월 이내의 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 총 수업 시간의 1/3 경과전 : 이미 납부한 수업비의 2/3에 해당액 환불<br/>
				- 총 수업 시간의 1/2 경과전 : 이미 납부한 수업비용의 1/2에 해당액 환불<br/>
				- 총 수업시간의 1/2 경과후 : 반환하지 않음<br/>
				<br/>
				3.수업 기간이 1개월을 초과하는 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불 * 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함<br/>
				</div>
				<div style="height:300px;"></div>
		</div>
		
		<div class="second">
        <div class="previous4">이전</div>
        <div class="next4">작성 완료</div>
        </div>
        </div>
</div>
</form>
</div>


<!-- 거래 제안서 보기 -->
<div class="proposallist" style="display:none;">
<div style="text-align:right;font-size:50px;"></div>
	<div style="font-size:60px;padding:30px;width:100%; text-align:center;border-bottom:1px solid gray;font-weight:bolder;">
	거래 제안서
	<span class="close-btn2" style="position:absolute; top:30px; left:80px; font-size:60px;"> &lt; </span>
	</div>
	
	<div class="purchase-update" style="font-size:40px; margin:60px;text-align:center; text-decoration:underline;">
	거래 제안서 새로 작성하기
	</div>
	
	<div style="margin:50px; font-size:40px; padding:20px;line-height:180%;">
		(<span class="proposal-customer"></span>)
		<div >작성자 : <span class="proposal-name"></span></div>
		<div >서비스 : <span class="proposal-cate"></span></div>
		<div >수업횟수 : <span class="proposal-lessonCount"></span></div>
		<div >회당 수업시간 : <span class="proposal-lessonTime"></span></div>
		<div >수업 시작일 : <span class="proposal-startDate"></span></div>
		<div >수업 종료일 : <span class="proposal-endDate"></span></div>
		<div >추가 사항 : <br/><span class="proposal-moreDetail"></span></div>
		<div >가격 : <span class="proposal-price"></span></div>
		<br/>
		<div style="text-align:center;">콕사부 서비스정책과 <span class="refund2" style="text-decoration:underline;cursor:pointer">환불정책</span>을 이행함</div>
		
		<div class="refund-content2" style="display:none;">
                <div style="overflow:scroll;font-size:25px; line-height:140%;margin:20px auto;height:600px;border:1px solid black; padding:10px;">
				<div style="text-align:right; "><span class="refund-close2"  style="background:black;color:white;padding:10px">닫기</span></div>
				가. 수업 환불기준 원칙<br/>
				<br/>
				학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
				- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
				<br/>
				1. 수업을 제공할 수 없거나, 수업 장소를 제공할 수 없게 된 날 : 이미 납부한 수업비 등을 일한 계산한 금액 환불<br/>
				<br/>
				2. 수업기간이 1개월 이내의 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 총 수업 시간의 1/3 경과전 : 이미 납부한 수업비의 2/3에 해당액 환불<br/>
				- 총 수업 시간의 1/2 경과전 : 이미 납부한 수업비용의 1/2에 해당액 환불<br/>
				- 총 수업시간의 1/2 경과후 : 반환하지 않음<br/>
				<br/>
				3.수업 기간이 1개월을 초과하는 경우<br/>
				- 수업 시작전 : 이미 납부한 수업비 전액 환불<br/>
				- 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불 * 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함<br/>
				</div>
		</div>
		
		<!-- 거래승낙 또는 레슨 구매하기 -->
		<br/>
		<div class="purchase-bank" style="text-align:center;font-weight:bolder;font-size:40px;border-top:3px dashed gray;padding-top:30px;">구매하기</div>
		<div class="purchase-bank">무통장 입금</div>
		<div class="purchase-bank">
		<table style="border-spacing:30px 10px;">
		<tr>
			<td>입금계좌 선택</td>
			<td>
			<select class="bank" name="bank" style="padding:10px;font-size:25px;">
				<option>--- 은행선택 ---</option>
				<option value="농협은행 351-1087-9782-73 정요직(콕사부)">농협은행 351-1087-9782-73</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>입금자명</td> <td><input type="text" class="depositor" name="depositor" style="font-size:35px;padding:5px;border:1px solid gray;" /></td>
		</tr>
		</table>
		</div>
		
		<div class="customer-div"></div>
		<div class="customer-cont" style="font-weight:bolder"></div>
		<div class="proposal_id" style="display:none"></div>
		<div style="height:300px;"></div>
	</div>

	


</div>    
    
    
    
<script>
$(document).ready(function(){
	var receiverName = "<c:out value="${receiverName}" />";
	var message = document.getElementById('message');
	var count = "<c:out value="${count}" />";
	var chatroom_id = "<c:out value="${chatroom_id}" />";
	
	$('.m-jbMenu').append('<a href="./tutorprofile?id='+chatroom_id+'&root=chat" style="color:gray;">'+receiverName+'</a>');

	$('html, body').scrollTop(document.body.scrollHeight);

	 var originalSize = $(window).width() + $(window).height();
	 
     // 창의 사이즈 변화가 일어났을 경우 실행된다.
     $(window).resize(function() {
    	
       // 처음 사이즈와 현재 사이즈가 변경된 경우
       // 키보드가 올라온 경우
       // 안드로이드에서만 적용됨, ios적용 안됨
       if($(window).width()+$(window).height() != originalSize) {
    	   $('html, body').scrollTop(document.body.scrollHeight);
       }
       // 처음 사이즈와 현재 사이즈가 동일한 경우
       // 키보드가 다시 내려간 경우
       else {
       }
     });
     
	
	if(count!=0){
		$('.purchase-exist').show();
		$('.purchase').hide();
	}
	
	
	var winH =$(window).height();
	
	$('.content').css('height', winH);
	
	$('.fix-hide').focus(function(){
		$('.down').hide();
		$('.second').hide();
	});
	
	$('.fix-hide').blur(function(){
		$('.down').show();
		$('.second').show();
	});
	
	
	
	function xSize(e)
	{
		var xe = document.getElementById('xt'),
			t;

		e.onfocus = function()
		{
			t = setInterval(
				function()
				{
					xe.value = e.value;
					e.style.height = (xe.scrollHeight + 40) + 'px';
				}, 100);
		}

		e.onblur = function()
		{
			clearInterval(t);
		}
	}

	xSize(document.getElementById('message'));
	
	
	
	
	$('.close-btn').click(function(){
		$('.main-2').hide();
		$('.main-3').hide();
		$('.main-4').hide();
		$('.main-5').hide();

		$('.main-1').show();  
		$('.cate').css('background','#FAE0D4');
		$('#proposal-form')[0].reset();
		
		$('.newPurchase').hide();
		$('.chat').show();
		$('.m-header').show();
		$('html, body').scrollTop(document.body.scrollHeight);
	});
	
	$('.close-btn2').click(function(){
		$('.proposallist').hide();
		$('.chat').show();
		$('.m-header').show();
		$('html, body').scrollTop(document.body.scrollHeight);
	});
	
	$('.refund').click(function(){
		$('.refund-content').show();
	});

	$('.refund-close').click(function(){
		$('.refund-content').hide();
	});


	$('.refund2').click(function(){
		$('.refund-content2').show();
	});

	$('.refund-close2').click(function(){
		$('.refund-content2').hide();
	});
	
	
	$('.buyer').click(function(){
			$('.main-1').hide();
    		$('.main-2').show();
    		
    		
    		$('.buyer-show').show();
    		$('.seller-show').hide();
    		
    		$('.customer-buyer').trigger("click");
		
	});
	
	$('.seller').click(function(){
			$('.main-1').hide();
    		$('.main-2').show();
    	
    		$('.buyer-show').hide();
    		$('.seller-show').show();
    		
    		$('.customer-seller').trigger("click");
	});
	
	$('.next1').click(function(){
		
		if($('.check').is(':checked')!=true){
			alert('서비스를 선택해주세요.');
		}else{
			$('.main-2').hide();
    		$('.main-3').show();
		}
		
	});
	
	$('.previous1').click(function(){
		$('.main-2').hide();
		$('.main-1').show();
	});
	
	$('.next2').click(function(){
		var regexp = /^[0-9]*$/

		if(!regexp.test($('.count').val() ) ){
			alert("수업 전체 횟수는 숫자만 입력하세요");
			$('.count').val("");
			
		}else if(!regexp.test($('#price').val().replace(/,/gi , '')) ) {
			alert("가격은 숫자만 입력하세요");
			$('#price').val("");
		}else if( $('.count').val() >100 || $('.count').val() <1 ){
			alert("수업 전체 횟수를 올바르게 입력해주시기 바랍니다.(숫자만, 최소1 최대99)")
			$('.count').val("");
		}else if($('#price').val().replace(/,/gi , '') > 2000000){
         	  alert("가격은 최대 200만원을 넘을 수 없습니다.")
         	 $('#price').val("");
        }else if($('#price').val().replace(/,/gi , '') < 10000){
            	  alert("가격은 최소 1만원을 이상입니다.");
            	  $('#price').val("");
  	    }else{
  	    	$('.main-3').hide();
    		$('.main-4').show();
  	    }
		
	});
	
	$('.next3').click(function(){
		
		var ago  = $('#testDatepicker').val();
		var last = $("#testDatepicker2" ).val();
		age = ago.replace(',','');
		last = last.replace(',','');
		
		if(ago.length==0 ){
			alert("수업 시작일자를 선택해주세요.");
        }else if( last.length==0 ){
        	alert("수업 종료일자를 선택해주세요.");
  	    }else if(ago>last){
 		   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
		 	}else{
  	    	$('.main-4').hide();
    		$('.main-5').show();
  	    }
		
	});
	
	
	$('.next4').click(function(){
		var regexp = /^[0-9]*$/
			
		var ago  = $('#testDatepicker').val();
		var last = $("#testDatepicker2" ).val();
		age = ago.replace(',','');
		last = last.replace(',','');
		
		if($('.check').is(':checked')!=true){
			alert('서비스를 선택해주세요.');
			return false;
		}else if(!regexp.test($('.count').val() ) ){
    		alert("수업 전체 횟수는 숫자만 입력하세요");
    		$('.count').val("");
    		return false;
    	}else if(!regexp.test($('#price').val().replace(/,/gi , '')) ) {
    		alert("가격은 숫자만 입력하세요");
    		$('#price').val("");
    		return false;
    	}else if( $('.count').val() >100 || $('.count').val() <1 ){
    		alert("수업 전체 횟수를 올바르게 입력해주시기 바랍니다.(숫자만, 최소1 최대99)")
    		$('.count').val("");
    		return false;
    	}else if($('#price').val().replace(/,/gi , '') > 2000000){
            alert("가격은 최대 200만원을 넘을 수 없습니다.")
            $('#price').val("");
            return false;
        }else if($('#price').val().replace(/,/gi , '') < 10000){
            alert("가격은 최소 1만원을 이상입니다.");
            $('#price').val("");
            return false;
        }else if(ago.length==0 ){
			alert("수업 시작일자를 선택해주세요.");
			return false;
        }else if( last.length==0 ){
        	alert("수업 종료일자를 선택해주세요.");
        	return false;
  	    }else if(ago>last){
 		   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
 		  return false;
		    }else if($('.permit').is(':checked') != true ){
		    	alert("환불정책 동의를 해주세요.");
		    	return false;
		    }else{
		    	
		    	
		    	var queryString = $("form[name=newpurchase]").serialize();
				
				$.ajax({
					  url:'./newpurchase?id='+chatroom_id,
		    		  type:'post',
		    		  data:queryString,
		    		  error:function(request,status,error){
		    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    		       },
		    		  success:function(data){
		    			  if(data=='success'){
		    				  alert('거래제안서를 정상적으로 작성하였습니다.')
		    			  }
		    			  
		    			$('.close-btn').trigger('click');
		    			$('.purchase-exist').show();
		    			$('.purchase').hide();
		    			
		    			var mes = {};
		    			mes.message_content = "[콕사부 알림] 새로운 거래 제안서가 작성되었습니다. 상단의 '거래제안서 보기'를 통해 확인 하실 수 있습니다.";
		    			mes.message_sender = sender
		    			mes.chatroom_id = chatroom_id
		    			mes.message_time = new Date();
		    			stompClient.send("/app/message", {atytopic:"message", name: chatroom_id}, JSON.stringify(mes));
		            	
		    		  }
		    	  });
  	    }
	});
	
	
	
	$('.previous2').click(function(){
		$('.main-3').hide();
		$('.main-2').show();
	});
	
	
	$('.previous3').click(function(){
		$('.main-4').hide();
		$('.main-3').show();
	});
	
	$('.previous4').click(function(){
		$('.main-5').hide();
		$('.main-4').show();
	});
	
});


$(".cate").on("click", function() {
	var opIndex = $(this).index();  
	
	if(!$('.check').eq(opIndex).is(':checked')){
		$(this).css('background','orange');
	}else{
		$(this).css('background','#FAE0D4');
	}
	
	$('.check').eq(opIndex).trigger("click");
});



$(document).on("click", ".purchase", function(){
	$('.newPurchase').show();
	$('.m-header').hide();
	$('.chat').hide();
	$('html, body').scrollTop(0);
});

$(document).on("click", ".purchase-update", function(){
	$('.newPurchase').show();
	$('.m-header').hide();
	$('.proposallist').hide();
});

$(document).on("click", ".purchase-box", function(){
	$('.proposallist').show();
	$('.m-header').hide();
	$('.chat').hide();
	
	$.ajax({
	  url:'./proposallist?id='+chatroom_id,
		  type:'get',
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
		  success:function(data){
			$('.proposal-name').text(data.name);
			$('.proposal-cate').text(data.cate);
			$('.proposal-lessonCount').text(data.lessonCount);
			$('.proposal-lessonTime').text(data.lessonTime);
			$('.proposal-startDate').text(data.startDate);
			$('.proposal-endDate').text(data.endDate);
			$('.proposal-moreDetail').text(data.moreDetail);
			$('.proposal-price').text(data.price+" ("+viewKorean(data.price)+")");
			
			
			if(data.customer=="구매자"){
				$('.proposal-customer').text("수업 요청");
				$('.purchase-bank').hide();
				$('.customer-div').html('<div style="text-align:center;margin-top:50px;"><span class="accept-proposal" style="cursor:pointer; text-decoration:underline;color:orange;font-weight:bolder;font-size:50px;">거래 제안서 승낙</span></div><div>수업을 제공하는 선생님이 거래 제안서를 승낙 하면 해당하는 내용의 수업 거래가 가능합니다.</div>');
				$('.customer-cont').html('');
			}else if(data.customer=="판매자"){
				$('.proposal-customer').text("판매자");
				$('.customer-div').html('<div class="lesson-purchase" style="text-align:center;margin-top:50px;font-weight:bolder;font-size:50px;padding:20px;color:white;border-radius:10px; background:orange;">수업 구매하기</div>');
				$('.customer-cont').html('콕사부는 고객님의 휴대폰 번호를 공개적으로 공개하지 않습니다.<br/>서비스 결제전 상대방과 합의 후 연락처를 공유하시는걸 추천드립니다.');
				$('.proposal_id').text(data.proposal_id);
				$('.purchase-bank').show();
			}
			
			
		  }
	  });
});


$(document).on('click','.accept-proposal',function(){
	var chatroom_id = "<c:out value="${chatroom_id}" />";	
	
	$.ajax({
		  url:'./transactionJudge?id='+chatroom_id,
		  type:'get',
		  error:function(error){
			  alert("처리가 제대로 되지 않았습니다.\n 다시 시도 해주세요."+error);
		  },
		  success:function(data){
			  if(data=="fail"){
				  alert("본인의 거래 제안서에 본인이 승낙 할수는 없습니다.");
			  }else if(data=="success"){
				  alert("성공적으로 거래 제안서를 승낙 하였습니다.");
				  $('.close-btn2').trigger('click');
				  
				  var mes = {};
	    			mes.message_content = "[콕사부 알림] 거래 제안서를 승낙했습니다. 서비스를 구매 하실 수 있습니다.";
	    			mes.message_sender = sender
	    			mes.chatroom_id = chatroom_id
	    			mes.message_time = new Date();
	    			stompClient.send("/app/message", {atytopic:"message", name: chatroom_id}, JSON.stringify(mes));
			  }
		  }
	  });
	
});


$(document).on('click','.lesson-purchase',function(){
	var proposal_id = $('.proposal_id').text();
	
	var idx = $(".bank option").index( $(".bank option:selected") );
	var bank = $(".bank option:selected").val();
	
	var depositor = $(".depositor").val();
	
	if(idx!=0){
		if(depositor.length == 0){
			alert("입금자명을 입력해주세요.")
		}else if(depositor.length >= 25){
			alert("입금자명은 25글자 미만입니다.")
		}else{
			$.ajax({
				url:'./chatTransaction?id='+proposal_id ,
				  data : { "bank" : bank, "depositor" : depositor },
				  type:'get',
				  error:function(error){
					  alert("에러"+error);
				  },
				  success:function(data){
					  if(data=='success'){
						alert('정상적으로 구매하였습니다.');
						$('.close-btn2').trigger('click');
						
						var mes = {};
		    			mes.message_content = "[콕사부 알림] 구매자가 서비스를 구매하였습니다. 구매자는 마이페이지의 [구매목록 -> 거래제안서 구매내역]에서, 판매자는 마이페이지의 [판매 목록 -> 거래제안서 판매내역]에서 주문정보를 확인할 수 있습니다. 구매자의 입금이 확인되면 주문정보가 '결제완료'로 변경이 되니 구매/판매 목록에서 '결제완료'상태를 확인 후 서비스를 진행해주세요. ";
		    			mes.message_sender = sender
		    			mes.chatroom_id = chatroom_id
		    			mes.message_time = new Date();
		    			stompClient.send("/app/message", {atytopic:"message", name: chatroom_id}, JSON.stringify(mes));
					  }else if(data=='fail')
					  	alert('자기자신의 수업은 구매할 수 없습니다.');
				  }
			  });
		}
	}else{
		alert("입금은행을 선택해주세요.");
	}
});


$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy. mm.dd",
        showButtonPanel: true,
        
        showOn:"both",
        buttonImage: "<c:url value="/resources/images/calendar3.png" />",
        buttonImageOnly:true,
       	minDate:0,
       	nextText: '&gt;',
        prevText: '&lt;' 
 });
    
    $( "#testDatepicker" ).prop('readonly',true);
    
    $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
});

    $(function() {
        $( "#testDatepicker2" ).datepicker({
        	changeMonth: true, 
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy. mm.dd",
            showButtonPanel: true,
            
            showOn:"both",
            buttonImage: "<c:url value="/resources/images/calendar3.png" />",
            buttonImageOnly:true,
           	minDate:0,
            nextText: '&gt;',
            prevText: '&lt;' 
     });
        
        $( "#testDatepicker2" ).prop('readonly',true);
        
        $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
    });
    
    
    	$('.price-pri').keyup(function(){
    		$('.price-kor').text(viewKorean($(this).val()));
    	});
    	
    	

        function viewKorean(num) { 
        	var hanA = new Array("","일","이","삼","사","오","육","칠","팔","구","십");
        	var danA = new Array("","십","백","천","","십","백","천","","십","백","천","","십","백","천"); 
        	var result = ""; 
        	for(i=0; i<num.length; i++) { 
        		str = ""; 
        		han = hanA[num.charAt(num.length-(i+1))]; 
        		if(han != "") str += han+danA[i]; 
        		if(i == 4) str += "만"; 
        		if(i == 8) str += "억"; 
        		if(i == 12) str += "조"; 
        		result = str + result; 
        		}
        		if(num != 0) result = result + "원"; 
        		return result ; 
        	}
        
        
       
</script>
    
    
</body>

</html>