<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>요청완료 콕사부</title>
 <meta name="description" content="수업 요청 완료" />
    <style>
        .top-ul a {
            text-decoration:none;
            color :black
        }

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
			width:320px;
			font-family: 'JejuGothic';
			z-index:100;
			position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
			display:none;
			padding:0px;
			background-image:url(/resources/img/firecracker.png);
			background-repeat : no-repeat;
        	background-size : cover;
			text-align:center;
			border-radius:20px;
			font-size:18px;
		}
		
		
		.tutorial-para{
		text-align:center;
		padding-top:30px;
		line-height:180%;
		background:white;
		border-radius:20px 20px 120px 120px;
		}
		
		.tutorial-first-title{
			color: #002266;
			font-size:18px;
			margin-bottom:30px;
			font-weight:bold;
		}
		
		.tutorial-btn1, .tutorial-btn2{
			margin:auto;
			padding:10px;
			cursor:pointer;
			background:white;
			color:#002266;
			border-radius:20px;
			width:220px;
			font-weight:bolder;
			display:inline-block;
		}
		.tutorial-btn1{
			background:white;
			color:#002266;
			margin:30px auto;
		}
		.tutorial-btn2{
			margin-bottom:30px;
			background:white;
			color:#002266;
		}
        .tutorial-close{
			cursor:pointer;
		}
		
		.tutorial-close-div{
			margin-top:30px;
			text-align:right;
			color:white;
			font-size:14px;
			padding:5px;
		}

    </style>
    </head>
<body>
 
        <section>
            <div style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:14px;">
                <div style="text-align:center; font-size:30px;padding:35px">
                   수업 요청완료
                </div>
            </div>
            
            <div style="padding:30px;">
            <div style="width:800px;ackground:white; margin: auto; padding:80px 20px 150px 20px;">
            <div style="width:800px;font-size:25px; margin:50px auto;line-height:150%;text-align:center;">
            <div style="font-family:'JejuGothic'">
            	"수업요청"이 완료 되었습니다.<br/><br/>
                <a class="go-mypage" href="./mypage" style="color:gray;font-weight:bolder;cursor:pointer">[마이페이지] [수업요청내역]</a>을 통해 선생님 지원서 내역을<br/>확인할 수 있습니다. 
            </div>
            <br/>
            <br/>
            <div style="color:dimgray;">
            <span style="color: rgb(226, 193, 6);"><b><i>콕사부 사이트를 통해 결제를 하는 경우</i></b></span><br/>
            <b style="color: rgb(226, 193, 6);">환불 정책</b>과 콕사부의 <b style="color: rgb(226, 193, 6);">소비자 보호정책</b>을 받을 수 있습니다. <br/>
            <div style="font-size:24px; color:gray ">
            <br/>
          	<b>tip.콕사부를 통해 결제하지 않고 직거래하는 경우,<br/>환불 및 소비자 보호정책을 받기 어렵습니다.</b><br/>
          	</div>
          	</div>
            </div>
            </div>
            </div>
            
            
<div class="tutorial-first-back"></div>
<div class="tutorial-first">
    	<div class="tutorial-para">
    		<div class="tutorial-first-title">수업요청서가 작성되었습니다.</div>
    		<div>
    		앱을 통해 실시간 알림을 받을수 있으며<br/>
    		요청서 작성 외에도, [수업목록]에서<br/>
    		선생님들을 직접 찾을수도 있습니다.</div>
    	</div>
    	<div>
    		<a href="./mypage?cok_tutorial=first_student" />
    		<div class="tutorial-btn1">
    			선생님 지원내역 보기
    		</div>
    		</a>
    		<a href="./boarder?main=11&subject=11&cok_tutorial=first_student" />
    		<div class="tutorial-btn2">
    			직접 선생님 찾아보기
    		</div>
    		</a>
    	</div>
    	<div class="tutorial-close-div"><span class="tutorial-close">[닫기x]</span></div>
</div>            
            
            
            </section>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script>
       
       $(document).ready(function(){
    	   $('.tutorial-close').click(function(){
    		   $('.tutorial-first').remove();
        	   $('.tutorial-first-back').remove();
        	   SetCookie('tutorial','end')
    	});
       })
       
       if(getRequestParam().cok_tutorial== "first_student"){
        	   if(GetCookie("tutorial")!="end"){
        		   $('.tutorial-first').toggle(500);
        	 	   $('.tutorial-first-back').show();
        	   }
           }
       
       
       function getRequestParam(){
    	    var url = document.location.href;
    	    var qs = url.substring(url.indexOf('?') + 1).split('&');
    	    for(var i = 0, result = {}; i < qs.length; i++){
    	        qs[i] = qs[i].split('=');
    	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    	    }
    	    return result;
    	}
       
       function SetCookie(sName, sValue){
   	   		var date = new Date();
   	   		date.setTime(date.getTime() + (1*24*60*60*1000));
   	   		document.cookie = sName + "=" + escape(sValue)+";expires="+date.toGMTString();
   	   }
       
       function GetCookie(sName){
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
       </script>
</body>
</html>