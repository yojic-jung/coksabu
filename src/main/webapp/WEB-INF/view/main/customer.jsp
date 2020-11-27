<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<title>자주하는 질문 고객센터 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="고객센터, 자주하는 질문" />
<meta name="description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="콕사부">
<meta property="og:site_name" content="콕사부">
<meta property="og:description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/customer">
<link rel="canonical" href="https://coksabu.com/customer">
<style>
 .div-title{
            width:1000px; margin:auto; padding:50px 0px 50px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
  .first{
  padding:60px;
  font-size:35px;
  line-height:180%;
 text-align:center;
 color:white;
 background-image:url(<c:url value="/resources/images/customer.png" />);
 background-repeat:no-repeat;
 background-position:center center; 
 -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
 }
 .left{
 	width:150px;margin:auto; float:left;
 	line-height:180%;
 	
 }
 .right{
 font-size:13px;
 	 width:700px;margin:auto; clear: right;
        padding:40px;
      	 border:1px solid rgb(180, 179, 179);
 }
 .first-q, .second-q, .third-q, .fourth-q{
 	cursor:pointer;
 	padding:10px;
 	border:1px solid black;
 }
  .first-a, .second-a, .third-a, .fourth-a{
  line-height:150%;
  
  background:rgb(230, 228, 228);
  padding:15px;
 	
 }
 
 .qa{
 margin-bottom:30px;
 }
 
 .yes{
 	display:visible;
 }
 .no{
 	display:none;
 }
 </style>
</head>

<body>
<div class="first">
<div>고객센터</div>
</div>
	<div class="div-title">
	<div class="left">
	<div style="font-size:20px;padding:5px;"><b>고객센터</b>
	<hr style="width:100px;"/></div>
	<div><a href="./customer" style="text-decoration:none; color:black;">자주하는 질문</a></div>
	<div><a href="./qna" style="text-decoration:none; color:black;">고객문의</a></div>
	<div><a href="./myqna" style="text-decoration:none; color:black;">나의 질문내역</a></div>
	</div>
	
	<div class="right">
	<div style="font-size:16px;margin-bottom:20px;"><b>콕사부 자주하는질문</b></div>
	<div class="qa">
	<div class="first-q">Q. 콕사부 선생님 수수료는 어떻게 되나요?</div>
	<div class="first-a">레슨을 판매하기 위해서는 유료서비스를 가입해야하며 이 유료서비스에 레슨판매, 수업요청서 발신 등을 할 수 있습니다.
	레슨 판매가 이루어질 경우 거래 건당 10%의 수수료가 발생되며 판매금액의 10%를 제외한 90% 금액이 판매자님의 계좌에 입금됩니다.</div>
	</div>
	
	<div class="qa">
	<div class="second-q">Q. 콕사부 선생님 닉네임, 나이, 학력 등의 사항은 비공개로 할 수 없나요?</div>
	<div class="second-a">콕사부는 고객들에게 신뢰할 수 있는 정보를 제공하기 위해 선생님들의 닉네임, 나이, 학력을 공개하고 있습니다.<br/>
	 이는 일반 유형의 물건을 파는 웹사이트와는 달리 무형의 재능을 파는 재능마켓 특성상  닉네임, 나이, 학력 등의 정보가 서비스의 신뢰도를 판단하는데 중요한 정보가 됨으로 이를 공개하고 있습니다. 따라서 콕사부는 서비스 이용시(또는 회원가입시) 이러한 정책을 동의한 회원에 한에 서비스가 시행됩니다.</div>
	</div>

	<div class="qa">
	<div class="third-q">Q. 프로필 작성 후 본인인증, 학력인증은 의무적으로 해야하나요? </div>
	<div class="third-a">본인인증과 학력인증은 의무사항은 아닙니다.<br/>
	 다만, 본인인증과 학력인증을 진행한 선생님의 레슨에 '본인인증완료', '학력인증완료' 문구를 넣어드림으로써 서비스를 이용하는 고객들에게
	 선생님의 정보가 인증됨을 알려드립니다. <br/>
	 인증절차를 시행하지 않아도 서비스 이용에 위의 문구가 붙지 않는것 외에 불이익은 없습니다. <br/>
	본인인증과 학력인증에 사용되는 이미지는 인증절차를 제외한 어느곳에서도사용되지 않습니다. 
</div>
	</div>
	
	<div class="qa">
	<div class="fourth-q">Q. 환불은 어떻게 받을수 있나요?</div>
	<div class="fourth-a">환불 절차는 학원법에 의거하여 처리됩니다.<br/>
학원법에 의하면<br/>
- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br/>
- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불<br/>
- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불<br/>
- 총 레슨시간의 1/2 경과후 : 반환하지 않음<br/>
으로 구성되어있습니다.<br/>
 따라서 구매시 입력한 시작날짜를 기준으로 위의 법에 의거하여 환불절차가 시행됩니다.<br/>
다만, 콕사부는 레슨시작후 교습기간의 2/3 경과하면 콕사부가 보관하는 레슨비를 선생님에게 전달하므로<br/>
 교습기간의 2/3가 지난후에 환불 신청을 할 경우, 환불 기간이 길어질 수 있음을 알려드립니다.
</div>
	</div>
	</div>
</div>

 	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script>
    $(document).ready(function(){
    	
    	$('.first-a').addClass('no');
    	$('.second-a').addClass('no');
    	$('.third-a').addClass('no');
    	$('.fourth-a').addClass('no');
    	
    	
    	$('.first-q').click(function(){
    		if($('.first-a').hasClass('no')){
    			$('.first-a').removeClass('no');
    			$('.first-a').addClass('yes');
    		}else if($('.first-a').hasClass('yes')){
    			$('.first-a').removeClass('yes');
    			$('.first-a').addClass('no');	
    		}
    	});

    	
    	$('.second-q').click(function(){
    		if($('.second-a').hasClass('no')){
    			$('.second-a').removeClass('no');
    			$('.second-a').addClass('yes');
    		}else if($('.second-a').hasClass('yes')){
    			$('.second-a').removeClass('yes');
    			$('.second-a').addClass('no');	
    		}
    	});
    	
    	
    	$('.third-q').click(function(){
    		if($('.third-a').hasClass('no')){
    			$('.third-a').removeClass('no');
    			$('.third-a').addClass('yes');
    		}else if($('.third-a').hasClass('yes')){
    			$('.third-a').removeClass('yes');
    			$('.third-a').addClass('no');	
    		}

    	});
    	
    	
    	$('.fourth-q').click(function(){
    		if($('.fourth-a').hasClass('no')){
    			$('.fourth-a').removeClass('no');
    			$('.fourth-a').addClass('yes');
    		}else if($('.fourth-a').hasClass('yes')){
    			$('.fourth-a').removeClass('yes');
    			$('.fourth-a').addClass('no');	
    		}

    	});
    	
    	
    	
    });
    
    </script>
</body>
</html>