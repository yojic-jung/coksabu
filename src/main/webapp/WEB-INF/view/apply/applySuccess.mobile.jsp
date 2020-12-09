<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>요청완료 콕사부</title>
 <meta name="description" content="수업 요청 완료" />
 <link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
    <style>
    html, body, section{ height:100%; overflow:hidden }
    
          .top-ul a {
            text-decoration:none;
            color :black
          }

    </style>
    </head>
<body>
<script>
$(document).ready(function(){
	$('.m-foot').remove();
})
</script>
 
        <section>
            <div style="background:rgb(46, 46, 46); color:rgb(219, 218, 218); font-size:30px;">
                <div style="text-align:center; font-size:50px;padding:35px">
                   수업 요청완료
                </div>
            </div>
            
            <div style="padding:120px 0px;margin-bottom:100px;height:100%;">
            <div style="width:90%; background:white; margin: auto; padding:20px;">
            <div style="width:90%; margin:50px auto;line-height:180%;line-height:150%;text-align:center;">
            <div style="font-size:35px;font-family:'JejuGothic';line-height:180%;">
            	"수업요청"이 완료 되었습니다.<br/><br/>
                [마이페이지] [수업요청내역] 페이지에서 <br/>
                나의 수업 요청 내역을 확인할 수 있습니다.  <br/> <br/>
                
                <a href="./mypage" style="color:orange;font-weight:bolder;cursor:pointer;font-size:40px;">요청내역 확인하기</a> <br/>
                
            </div>
            <br/>
            <br/>
            <div style="font-size:30px;olor:dimgray;line-height:200%;">
           <span style=" color: rgb(226, 193, 6);"><b><i>콕사부 사이트를 통해 결제를 하는 경우</i></b></span><br/>
           <b style="color: rgb(226, 193, 6);font-size:30px;">환불 정책</b>과 콕사부의 <b style="color: rgb(226, 193, 6);">소비자 보호정책</b>을 받을 수 있습니다. <br/>
            <div style="color:gray ">
            <br/>
          	<b>tip.콕사부를 통해 결제하지 않고 직거래하는 경우<br/>환불 및 소비자 보호정책을 받기 어렵습니다.</b><br/>
          	</div>
          	</div>
            </div>
            </div>
            </div>
            
            </section>
 
</body>
</html>