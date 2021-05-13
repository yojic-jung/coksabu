<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매확정 거래 콕사부</title>
 <meta name="description" content="구매 성공, 최종 구매내역 및 선생님 정보 안내" />
<meta charset="utf-8">
<title>콕사부</title>
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          .jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 1px orange;
          }
          .top-title{
            float:left;
            height:100%;
            text-align:center;
          }
          .top-right{
          text-align:center;
          margin-right:150px;
          height:60px;
          vertical-align:center;
          font-size:20px;
          font-family:'JejuGothic';
          padding-top:20px;
          clear:right;
          }
          .message{
          
           background-image:url(<c:url value="/resources/images/message2.png" />);
           background-repeat:no-repeat;
           width:400px;height:160px;padding:10px 40px 30px 70px;; clear:right;
           margin-left:180px;
           font-size:14px; 
           line-height:200%;
           
          }
          
          .account-table{
          	border-spacing:0px; background:#EAEAEA;margin: 30px auto; width:420px;
          	
          }
          
          .account-table td{
          	padding:15px;
          	border:0.5px solid gray;
          }
          .first{
          	font-family: 'Apple SD Gothic Neo','Malgun Gothic';
          	font-size:12px;
          }
           .second{
          	font-family:'JejuGothic';
          	font-size:14px;
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
<div class="jbMenu">
       <div class="top-title"><a href="./"><img style="width:150px; height:60px;" src="<c:url value="/resources/images/logo.png" />"  alt="로고"/></a></div>
       <div class="top-right">주문이 완료 되었습니다.</div>
</div>

<div style="width:700px; margin:60px auto; font-family:'JejuGothic';">
	<div style="width:190px;float:left;text-align:center;">
	<img style="width:150px; height:150px;border-radius:75px;" src="<c:url value="/img/profileImg/${imgpath}" />"  alt="선생님 프로필이미지"/><br/>
	${sellernickname} 선생님
	</div>
	<div class="message" style="font-size:15px;" >
	${buyername}님 수업을 신청해주셔서 감사합니다.<br/> 결제 완료되면 서비스가 진행됩니다.<br/> 아래의 결제정보를 확인해주세요.
	</div>
</div>

<hr style="width:700px; margin:0px auto 30px auto; border:0.7px solid black;"/>

<div style="width:500px; margin:auto;font-family:'JejuGothic';text-align:center;border:0.7px solid gray;">
<div style="font-size:20px; padding:30px; color:orange;">수업 신청이 완료 되었습니다.</div>
<div>결제금액을 아래의 계좌로 입금해주세요.</div>

<table class="account-table" >
<tr>
<td class="first">은행</td>
<td class="second">${bank1 }</td>
</tr>

<tr>
<td class="first">계좌번호</td>
<td class="second">${bank2 }</td>
</tr>

<tr>
<td class="first">예금주</td>
<td class="second">${bank3 }</td>
</tr>

<tr>
<td class="first">금액</td>
<td class="second">${price3 }</td>
</tr>

<tr>
<td class="first">입금기한</td>
<td class="second">${depositDay}</td>
</tr>

<tr>
<td class="first">입금자명</td>
<td class="second">${depositor}</td>
</tr>

</table>

	<div style="margin:20px 0px;">수업시작 전까지 입금을 만료해주시기 바랍니다.</div>
</div>
<div style="text-align:center;margin:50px auto;">
		<a href="./purchaselist" style="color:white;text-decoration:none;">
		<button style="width:200px; color:white; padding:20px; background:rgb(34, 36, 51);border:none;">완료</button>
		</a>
</div>
<footer>
          <div class="foot">
            <hr/>
            <div class="foot-align">
            <div>
              <a href="./"><img src="<c:url value="/resources/images/logo.png" />" alt="로고"/></a>
            </div>
            <div>
              <p>상호 : 콕사부 <br/>
                대표자 : 정요직<br/> 
                주소 : 서울특별시 노원구 석계로13길 <br/>
                TEL. 02-000-0000<br/> 
                  사업자 등록번호 : 000-00-00000 <br/>
                  EMAIL. aaa777@naver.com<br/>
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
                 <a href="./qna" style="text-decoration:none; color:black;">Q&A</a><br/> 
                </p>
              </div>
            
            <div>
              <p>
                고객센터<br/>
                02-000-0000<br/>
                평일 10:00 ~ 16:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>
          </div>
          </div>
        </footer>


</body>
</html>