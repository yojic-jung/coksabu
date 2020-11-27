<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

    
    //this line.
    function connect() {
    	//파라미터 이름, 순서 바뀌면 안됨 , afterConnectionClosed메서드에서 참조함
        var socket = new SockJS("https://coksabu.com/hello?chatroom_id="+chatroom_id+"&username="+sender);
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
        	$.ajax({
    			  url:'./chatmemberstatus?id='+chatroom_id,
      		  type:'get',
      		  error:function(request,status,error){
      		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      		       },
      		  success:function(data){
      			  var message = {};
      			  message.message_sender = sender;
      			  stompClient.send("/app/newconnect", {atytopic:"message", name: chatroom_id}, JSON.stringify(message));
      		  }
      		  });
        },1000);
        	
        
        
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
			$("#chatMessageArea").append("<div style='text-align:right'><div class='senderMessage'>"+JSON.parse(msg.body).message_content+"</div>"+
			"<div class='msg_time'>"+"<span class='readOrNot'>"+JSON.parse(msg.body).message_read2+" </span>"+JSON.parse(msg.body).message_time2+"</div></div>");
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);
		}else{
			$("#chatMessageArea").append("<div style='text-align:left;padding:5px;'><div class='receiverMessage'>"+JSON.parse(msg.body).message_content+"</div>"+
			"<div class='msg_time'>"+JSON.parse(msg.body).message_time2+"</div></div>");
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);
		}
	}

	
	$(document).ready(function(){
		$('.menu-title').append('<div class="message-title">메세지</div>');
		var message = document.getElementById('message');
		connect(); 
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});

		//윈도우 사파리인 경우 스크롤이 맨위로 가있어서 맨밑으로 스크롤 내리기
		var agent = navigator.userAgent.toLowerCase();
		if (agent.indexOf("window") != -1) {
		  	if (agent.indexOf("safari") != -1) {
				if (agent.indexOf("chrom") != -1) {
				}else{
					alert("windows 운영체제 환경에서 safari 브라우저를 통해 접속하신 경우,\n채팅 기능 중 다소 불편함이 있을 수 있습니다. \n다른 브라우저로 접속하기를 권장합니다.");
				}
		  	}
		}

		
		
		$('#sendBtn').click(function() { 
			
			if(message.value.length>250){
				$("#message").val("");
				$('#message' ).prop( 'placeholder', '메세지를 입력하세요(250글자 미만)' );
			}else{
				send();	
			}
			 });
		
		$("#chatMessageArea").append($('.conversation').html());
	});
	
	

</script>
<style>
	body{
		height:100%;padding:0px;
		margin:0px;
	}
	
	html{
		height:100%;padding:0px;
		margin:0px;
	}
#chatArea {
	width: 800px; height:400px; margin:0px; overflow-y: auto; border: 1px solid #EAEAEA;
}
#writeMessage{
	width: 800px; height: 100px; margin:0px;padding:0px;
}
#message{
	background-color:#F6F6F6;
	float:left;
	border:none;
	font-size:15px;
	margin:0px;
	padding:10px;
	width:80%;
}
#sendBtn{
	padding:35px; background-color:orange;
	border:none;border-radius:5px;
	float:right;
	clear:right;
	width:18%;
}
.senderMessage{
display: inline-block; max-width:300px; 
padding:10px;margin:10px 0px 0px 0px ;
word-break: break-all;
 border-radius:10px; background:#FFE400;
  font-size:15px;

}
.receiverMessage{
display: inline-block;max-width:300px;  padding:10px;margin:5px;
border-radius:10px; background:#E9E9E9;
word-break: break-all;
 font-size:15px;
}
.msg_time{
font-size:12px;color:gray
}
.chatReceiver{
	width:800px;
	padding:20px;
	font-size:20px;
	background:#FFE400;
}

 .message-title{
        text-align:center;
        font-size:30px;
        	padding:30px;
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
		font-size:20px;
		background:white;
		color:orange;
		font-weight:bolder;
		padding:20px 0px 40px 0px;
		width:50%;
		display:inline-block;
		float:left;
		border-top:5px solid orange;
		cursor:pointer;
	}
	
	.seller{
		font-size:20px;
		background: orange;
		color:white;
		font-weight:bolder;
		padding:20px 0px 40px 0px;
		width:50%;
		display:inline-block;
		cursor:pointer;
	}
	
	.second{
		width:100%;
		font-size:20px;
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
		font-size:20px;
		
	}
	
	.previous1, .previous2, .previous3, .previous4{
		padding:20px 0px 40px 0px;
		background:#EAEAEA;
		width:50%;
		display:inline-block;
		cursor:pointer;
		float:left
	}
	
	.next1, .next2, .next3{
	padding:20px 0px 40px 0px;
	background:#353535;
	color:white;
	width:50%;
	display:inline-block;
	cursor:pointer;
	}
	
	 .next4{
	padding:20px 0px 40px 0px;
	background:orange;
	color:white;
	width:50%;
	display:inline-block;
	cursor:pointer;
	}
	
	.teacher-intr{
      	font-size:35px;
        font-family: 'JejuGothic'; 
        width:70%;
        margin:40px auto 0px auto;
        line-height:180%;
      }
      
      .cate{
      	width:23%;margin:1px;
      	display:inline-block;
      	background:#FAE0D4;
      	padding:20px 0px;
      	font-size:20px;
      	text-align:center;
      	cursor:pointer;
      }
      
	 .service-cate {
        padding:15px;
        font-size:20px; border-radius:10px;
        margin-top:10px;
      }
      
       .price-table{
      border-spacing:0px 20px;
      width:100%;
      }
	.price-pri{
		width:80%;
		border:1px solid black;
		text-align: right;
		padding:10px; 
		font-size:20px;
	}
   .accept-proposal{
	cursor:pointer;
	text-decoration:underline;
}
.tran-style{
	width:70%;
	margin:20px auto;
	border-radius:10px;
	padding:10px;
	background:orange;
	color:white;
	font-size:20px;
	cursor:pointer;
}

 .cont-stl{
 	font-weight:normal;
 }
 
 .purchase-bank{
 	display:none;
 }
</style>
</head>

<body>
<div class="pc-tutor" style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div class="menu-title"></div>
            </div>
            


<div class="chat" style="padding:30px;">
<div style="width:804px; border:1px solid #D5D5D5;background:white; margin: auto; padding:0px;text-align:center;">

	<div style="width:800px;padding:1px;">
	<div class="chatReceiver">
	<a href="./tutorprofile?id=${chatroom_id}&root=chat" style="color:gray;">${receiverName}</a>님과의 대화
	</div>
	
	
<div class="purchase">
<div class="tran-style"> 거래 제안서 작성하기 </div>
</div>
<div class="purchase-exist purchase-box">
<div class="tran-style">  거래 제안서 보기 </div> 
</div>




    <div id="chatArea">
    <div id="chatMessageArea"></div>
    </div>
    <div style="background-color:#F6F6F6;width:800px;padding:0px">
    <div id="writeMessage">
    <textarea id="message" rows="5" placeholder="메세지를 입력하세요."></textarea>
    <input type="button" id="sendBtn" value="전송">
    </div>
    </div>
    <div style="display:none;">
    <div class="conversation">
    <c:forEach var="post" items="${mesList}">
    
    <c:choose>
   		<c:when test="${post.message_sender==sender}">
   		<div style="text-align:right;">
   		<div class="senderMessage">
   		${post.message_content}
   		</div>
   		<div class="msg_time">
   		<c:if test="${post.message_read==1}">
   		<span class="readOrNot">안읽음</span>
   		</c:if>
   		 ${post.message_time2}
   		</div>
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
</div>
</div>













<div class="newPurchase" style="display:none;">
<div style="height:100px">
<span class="close-btn" style="cursor:pointer;padding:10px;position:absolute;top:10px; left:30px;font-size:50px;cursor:pointer">&lt;</span>
</div>
<div class="main-1">
	<div class="content" style="font-size:25px;font-weight:bolder;padding:30px;line-height:180%;width:70%;margin:auto;word-break:keep-all;">
	선생님이 판매하는 레슨이<br/>고객의 요구와 맞지 않아 변동이 필요한 경우
	고객의 요구에 맞춘 1대1 맞춤형 거래 양식을 새롭게 작성하여 거래 할 수 있습니다.
	<div style="text-align:center;margin-top:100px;">
	<img src="<c:url value="/resources/images/newpurchase.png" />" alt="거래 이미지" style="width:30%;height:200px;"/>
	</div>
	</div>
	
	<div class="down">
		<div class="buyer">구매자로 작성</div><div class="seller">판매자로 작성</div>
	</div>
</div>
<form id="proposal-form" name="newpurchase" method="post">
<div class="main-2">	
						<div class="teacher-intr content">
						<div style="line-height:180%;font-size:20px;">
						
						<div style="display:none">
							<input class="customer-buyer" type="radio" name="customer" value="구매자"/>구매자
							<input  class="customer-seller" type="radio" name="customer" value="판매자"/>판매자
						</div>
						
                          	<div style="font-weight:bolder;font-size:30px;">
                          		<span class="buyer-show">제공받을 </span>
                          		<span class="seller-show">제공하시는 </span>
                          		서비스를 선택해주세요.
                          	</div>
                          <div style="width:70%;margin:50px auto 0px auto;">
                          	<div class="cate">수학</div>
                          	<div class="cate">외국어</div>
                          	<div class="cate">국어</div>
                          	<div class="cate">사회</div>
                          	<div class="cate">과학</div>
                          	<div class="cate">예체능</div>
                          	<div class="cate" style="width:47%">자소서/입시</div>
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
                    <div style="width:70%; margin:auto;font-weight:bolder;" class="content" >    
                         <div style="font-size:30px;margin-top:40px;">수업 정보</div>
                        <div style="font-size:20px;margin-top:40px;">
                        <table class="price-table">
                        <tr>
                        <td>수업 전체횟수</td>
                        <td>
                        	<input class="count fix-hide" type="text" name="lessonCount" style="border:1px solid black;padding:10px;text-align:right;font-size:20px;width:200px;"/>회
                     	</td>
                     	</tr>
                     	<tr>
                     	<td> 회당 수업시간  </td>
                     	<td>
                      <select name="lessonTime" class="price-time"  style="padding:10px;font-size:20px;">
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
                        <td>가격 </td>
                        <td>
                        	<input name="price" style="width:250px;" class="price-pri fix-hide" type="text" id="price" placeholder="숫자만 입력" />원 &nbsp;
                      		<span class="price-kor"></span>
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
		<div class="content"  style="font-size:30px;font-weight:bolder;width:70%; margin:40px auto 0px auto;line-height:200%;word-break:keep-all;">협의한 수업 시작일자와 종료일자를 입력해주세요.<br/>
			<div style="margin-top:50px;text-align:center;">
			<input type="text" id="testDatepicker" name="startDate" style="font-size:20px;padding:10px;margin-left:20px;" placeholder="시작일"/>&nbsp;&nbsp;  ~ &nbsp;&nbsp;
			<input type="text" id="testDatepicker2" name="endDate" style="font-size:20px;padding:10px;margin-left:20px;" placeholder="종료일"/>  
			</div>
		</div>
		<div class="second">
        <div class="previous3">이전</div>
        <div class="next3">다음</div>
        </div>
</div>
<div class="main-5">
		<div class="content" style="font-weight:bolder;width:70%;margin:40px auto 0px auto;">
		<div style="font-size:30px;">기타 추가사항(선택)</div>
		<div style="font-size:20px;margin:40px 0px 20px 0px;line-height:170%;">추가로 필요한 거래 계약사항이 있으시면 거래 당사자간 협의된 사항을 적어주세요.</div>
		<div style="width:100%;text-align:center;">
			<textarea name="moreDetail" class="fix-hide" rows="10" style="width:70%;font-size:20px;border:1px solid black;padding:20px;"></textarea>
		</div>
		<div style="margin-top:40px;font-size:20px;font-weight:bolder;line-height:170%;width:100%;word-break:keep-all;">
		<input class="permit" type="checkbox" name="permit" style="zoom:2.0;" /> 콕사부 서비스정책과 학원법에 의거한 <span class="refund" style="text-decoration:underline;cursor:pointer">환불정책</span>을 이행할 것에 동의합니다.
		</div>

		
		<div class="refund-content" style="display:none">
                <div style="overflow:scroll;font-size:15px; line-height:140%;margin:20px auto;height:300px;border:1px solid black; padding:10px;">
				<div style="text-align:right; "><span class="refund-close" style="cursor:pointer;background:black;color:white;padding:10px">닫기</span></div>
				가. 레슨 환불기준 원칙<br/>
				<br/>
				학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
				- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
				<br/>
				1. 레슨을 제공할 수 없거나, 레슨 장소를 제공할 수 없게 된 날 : 이미 납부한 레슨비 등을 일한 계산한 금액 환불<br/>
				<br/>
				2. 레슨기간이 1개월 이내의 경우<br/>
				- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br/>
				- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불<br/>
				- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불<br/>
				- 총 레슨시간의 1/2 경과후 : 반환하지 않음<br/>
				<br/>
				3.레슨 기간이 1개월을 초과하는 경우<br/>
				- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br/>
				- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불 * 총 레슨 시간의 레슨비 징수기간 중의 총레슨시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함<br/>
				</div>
				<div style="height:200px;"></div>
		</div>
		
		
		<div class="second">
        <div class="previous4">이전</div>
        <div class="next4">거래 작성</div>
        </div>
        </div>
</div>
</form>
</div>





<div class="proposallist" style="display:none;">
<div style="text-align:left;font-size:50px;"><span class="close-btn2" style="cursor:pointer;padding:30px;margin:30px;">&lt;</span></div>

<div style="width:70%;margin:auto;">

<div class="purchase-update" style="text-align:center;font-size:20px; margin:20px;cursor:pointer;text-decoration:underline">새로운 거래 제안서 작성</div>
<div style="font-size:35px; font-weight:bolder;text-align:center;">거래 제안서</div>
	<div style="margin:50px;font-size:20px;line-height:180%;width:80%;font-weight:bolder;">
		(<span class="proposal-customer cont-stl"></span>)
		<div >작성자 : <span class="proposal-name cont-stl"></span></div>
		<div >서비스 : <span class="proposal-cate cont-stl"></span></div>
		<div >수업횟수 : <span class="proposal-lessonCount cont-stl"></span></div>
		<div >회당 수업시간 : <span class="proposal-lessonTime cont-stl"></span></div>
		<div >수업 시작일 : <span class="proposal-startDate cont-stl"></span></div>
		<div >수업 종료일 : <span class="proposal-endDate cont-stl"></span></div>
		<div >추가 사항 : 
			<br/>
			<span class="proposal-moreDetail cont-stl"></span>
		</div>
		<div >가격 : <span class="proposal-price cont-stl"></span></div>
		<br/>
		<div style="text-align:center;">콕사부 서비스정책과 <span class="refund2" style="text-decoration:underline;cursor:pointer">환불정책</span>을 이행함</div>
		
		<div class="refund-content2" style="display:none">
                <div style="overflow:scroll;font-size:15px; line-height:140%;margin:20px auto;height:300px;border:1px solid black; padding:10px;">
				<div style="text-align:right; "><span class="refund-close2"  style="cursor:pointer;background:black;color:white;padding:10px">닫기</span></div>
				가. 레슨 환불기준 원칙<br/>
				<br/>
				학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
				- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
				<br/>
				1. 레슨을 제공할 수 없거나, 레슨 장소를 제공할 수 없게 된 날 : 이미 납부한 레슨비 등을 일한 계산한 금액 환불<br/>
				<br/>
				2. 레슨기간이 1개월 이내의 경우<br/>
				- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br/>
				- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불<br/>
				- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불<br/>
				- 총 레슨시간의 1/2 경과후 : 반환하지 않음<br/>
				<br/>
				3.레슨 기간이 1개월을 초과하는 경우<br/>
				- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br/>
				- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불 * 총 레슨 시간의 레슨비 징수기간 중의 총레슨시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함<br/>
				</div>
		</div>
		<br/><br/>
		<!-- 거래승낙 또는 레슨 구매하기 -->
		<div style="font-size:15px;width:70%;margin:20px auto;font-weight:normal;">
		
		<div class="purchase-bank" style="text-align:center;font-weight:bolder;font-size:20px;border-top:1px dashed gray;padding-top:30px;">구매하기</div>
		<div class="purchase-bank" style="font-weight:bolder;">무통장 입금</div>
		<div class="purchase-bank" style="font-size:13px;">(환불발생시, 카드거래는 부분환불이 어려워 무통장입금만 제공하고 있습니다.)</div>
		<div class="purchase-bank">
		<table>
		<tr>
			<td>입금계좌 선택</td>
			<td>
			<select class="bank" name="bank" style="padding:5px;font-size:15px;">
				<option>--- 은행선택 ---</option>
				<option>농협은행 3020092810491 (예금주:레슨왕)</option>
				<option>국민은행 3020092810491 (예금주:레슨왕)</option>
				<option>하나은행 3020092810491 (예금주:레슨왕)</option>
				<option>신한은행 3020092810491 (예금주:레슨왕)</option>
				<option>기업은행 3020092810491 (예금주:레슨왕)</option>
			</select>
			</td>
		</tr>
		<tr>
		
				<td>입금자명</td> <td><input type="text" class="depositor" name="depositor" style="font-size:15px;padding:5px;" /></td>
		</tr>
		</table>
		</div>
		</div>
		<div class="customer-div cont-stl"></div>
		<div class="customer-cont"  style="font-weight:bolder"></div>
		<div class="proposal_id" style="display:none"></div>
		<div style="height:200px;"></div>
	</div>
	</div>
</div>

<script>
$(document).ready(function(){
	var message = document.getElementById('message');
	var count = "<c:out value="${count}" />";
	var chatroom_id = "<c:out value="${chatroom_id}" />";
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	$("#chatArea").scrollTop(maxScroll);
	 
	
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
	
	
	
	
	$('.close-btn').click(function(){
		$('.main-2').hide();
		$('.main-3').hide();
		$('.main-4').hide();
		$('.main-5').hide();

		$('.main-1').show();  
		$('.cate').css('background','#FAE0D4');
		$('#proposal-form')[0].reset();
		
		$('.newPurchase').hide();
		$('.pc-tutor').show();
		$('.chat').show();
		
		
	});
	
	$('.close-btn2').click(function(){
		$('.proposallist').hide();
		$('.pc-tutor').show();
		$('.chat').show();
		
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
		    				  alert('거래 제안서가 정상적으로 작성되셨습니다.')
		    			  }
		    			
		    			
		    			
		    			$('.close-btn').trigger('click');
		    			$('.purchase-exist').show();
		    			$('.purchase').hide();
		    			
		    			var mes = {};
		    			mes.message_content = "새로운 거래제안이 있습니다.<br/>거래 제안서를 확인해보세요.<div class='proposal purchase-box' style='cursor:pointer'>거래 제안서 보기</div>";
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
	$('.pc-tutor').hide();
	$('.chat').hide();
});

$(document).on("click", ".purchase-update", function(){
	$('.newPurchase').show();
	$('.proposallist').hide();
});

$(document).on("click", ".purchase-box", function(){
	$('.proposallist').show();
	$('.pc-tutor').hide();
	$('.chat').hide();
	
	$.ajax({
	  url:'./proposallist?id='+chatroom_id,
		  type:'get',
		  error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
		  success:function(data){
			$('.proposal-customer').text(data.customer);
			$('.proposal-name').text(data.name);
			$('.proposal-cate').text(data.cate);
			$('.proposal-lessonCount').text(data.lessonCount);
			$('.proposal-lessonTime').text(data.lessonTime);
			$('.proposal-startDate').text(data.startDate);
			$('.proposal-endDate').text(data.endDate);
			$('.proposal-moreDetail').text(data.moreDetail);
			$('.proposal-price').text(data.price+" ("+viewKorean(data.price)+")");
			
			
			
			if(data.customer=="구매자"){
				$('.proposal-customer').text("서비스 요청");
				$('.purchase-bank').hide();
				$('.customer-div').html('<div style="color:orange;text-align:center;text-decoration:underline;"><span class="accept-proposal" style="cursor:pointer">거래 제안서 승낙</span></div><div>수업을 제공하는 선생님이 거래 제안서를 승낙하면 해당하는 내용으로 서비스를 거래할 수 있습니다.</div>');
			}else if(data.customer=="판매자"){
				$('.proposal-customer').text("판매자");
				$('.customer-div').html('<div class="lesson-purchase" style="cursor:pointer;color:white;width:70%;margin:0px auto 50px auto;border-radius:10px;background:orange;text-align:center; padding:10px;">레슨 구매하기</div>');
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
				  alert("본인의 거래제안서에 본인이 승낙 할수는 없습니다.");
			  }else if(data=="success"){
				  alert("성공적으로 거래를 승낙 하였습니다.");
				  $('.close-btn2').trigger('click');
				  
				  var mes = {};
	    			mes.message_content = "거래제안을 승낙했습니다.<br/>서비스를 구매하실  수 있습니다. <div class='proposal purchase-box' style='cursor:pointer'>거래 제안서 보기</div>";
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
	    			mes.message_content = "서비스를 구매하였습니다.<br/>서비스를 진행해주세요.";
	    			mes.message_sender = sender
	    			mes.chatroom_id = chatroom_id
	    			mes.message_time = new Date();
	    			stompClient.send("/app/message", {atytopic:"message", name: chatroom_id}, JSON.stringify(mes));
				  }else if(data=='fail')
				  	alert('자기자신의 거래 제안서는 구매할 수 없습니다.');
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
       	nextText: '다음 달',
        prevText: '이전 달' 
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
           	nextText: '다음 달',
            prevText: '이전 달' 
     });
        
        $( "#testDatepicker2" ).prop('readonly',true);
        
        $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
    });
    
    
    	$('.price-pri').keyup(function(){
    		$('.price-kor').text("("+viewKorean($(this).val())+")");
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