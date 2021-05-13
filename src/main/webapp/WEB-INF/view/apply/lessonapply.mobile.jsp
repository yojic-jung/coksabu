<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>수업요청 학생전용 콕사부</title>
    <meta charset="utf-8">
     <meta name="description" content="선생님에게 수업요청을 작성하는 페이지" />
 <meta property="og:type" content="website">
<meta property="og:title" content="수업요청">
<meta property="og:site_name" content="수업요청 하기">
<meta property="og:description" content="학생들이 새로운 수업과 새로운 선생님을 찾기 위해  수업신청서를 작성하는 곳입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/apply">
     
<style>
@charset "UTF-8";
          .top-ul a {
            text-decoration:none;
            color :black
          }

          .mypage{
              list-style:none;
              padding:20px;
          }
          
        .mypage>li{
            font-family: 'JejuGothic';
            padding:20px;
            display:inline;
        }
        
        .bar{
        width:100%; background:gray; border-radius:4px; margin:auto;
        }
        .bar1{
        width:20%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar2{
        width:40%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar3{
        width:60%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar4{
        width:70%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar5{
        width:80%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar6{
        width:90%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        
        .bar7{
        width:100%; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .content{
        width:100%;; margin:auto;font-size:40px;
        }
	
	.catetable{
		border:1px solid lightgray;
		border-radius:3px;
		width:100%;
	}
	.catetable td{
	padding:30px;
	border:1px solid lightgray;
	}
	
	.step-all{
		font-family:'JejuGothic';font-size:40px;
	}
	
	.step2, .step3, .step4, .step5, .step6, .step7{
		display:none;
	}

	.btn1{
		text-align:center;
		background:#EF904F;
		color:white;
		padding:50px;
		font-size:50px;
		font-family:'JejuGothic';
		width:100%;
		position:fixed;
		bottom:0px;
		left:0px;
	}

	.btn2, .btn3, .btn4 , .btn5, .btn6 {
		border-top:5px solid #EF904F;
		text-align:center;
		background:#EF904F;
		color:white;
		padding:50px;
		font-size:50px;
		font-family:'JejuGothic';
		width:50%;
		position:fixed;
		bottom:0px;
		right:0px;
	}
	
	.prev2, .prev3, .prev4, .prev5, .prev6, .prev7{
		text-align:center;
		border-top:5px solid #EF904F;
		background:white;
		color: #EF904F;
		padding:50px;
		font-size:50px;
		font-family:'JejuGothic';
		width:50%;
		position:fixed;
		bottom:0px;
		left:0px;
	}
	.btn7{
	border-top:5px solid #EF904F;
		text-align:center;
		background:#EF904F;
		color:white;
		padding:50px;
		font-size:50px;
		font-family:'JejuGothic';
		width:50%;
		position:fixed;
		bottom:0px;
		right:0px;
		-webkit-appearance: none;
	} 
	
	.locale-main{
		font-size:40px; color:gray; padding:30px 50px;margin-right:30px;
	}
	.locale{
	display:none;font-size:40px; color:gray; padding:30px;
	}
	.locale3{
	display:none;font-size:40px; color:gray; padding:30px;
	}
	.price-standard, .price-time , .price1, .price2{
		font-size:40px;padding:30px;
	}
	
	input[type="radio"]{
		margin:10px;
-ms-transform: scale(2); /* IE */

-moz-transform: scale(2); /* FF */

-webkit-transform: scale(2); /* Safari and Chrome */

-o-transform: scale(2); /* Opera */

padding: 5px;
	}
	input[type=checkbox] {
margin:10px;
-ms-transform: scale(2); /* IE */

-moz-transform: scale(2); /* FF */

-webkit-transform: scale(2); /* Safari and Chrome */

-o-transform: scale(2); /* Opera */

padding: 5px;

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
			width:80%;
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
			font-size:40px;
		}
		
		
		.tutorial-para{
		text-align:center;
		padding-top:60px;
		line-height:180%;
		background:white;
		border-radius:20px 20px 120px 120px;
		}
		.tutorial-first-title{
			color: #002266;
			margin-bottom:30px;
			font-weight:bold;
		}
		
		.tutorial-btn{
			line-height:200%;
			margin:80px auto;
			padding:10px;
			cursor:pointer;
			background:white;
			color:#002266;
			border-radius:20px;
			width:80%;
			font-weight:bolder;
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
<% if(session.getAttribute("email")==null) { %>
<script>
window.location="./applynologin";
</script>
<% } %>
        <section>
            <div style="background:#FFF2E6; color:dimgray;">
               
                <div style="font-size:30px; padding:30px; text-align:center">
                  수업 요청을 통해 수업 가능한 선생님들의<br/> 지원서를 받아볼 수 있습니다. 
                </div>
            </div>
            
            <div style="padding:20px 0px 150px 0px;">
            <div style="width:90%; background:white; margin:auto; padding:20px 0px 50px 0px;">
            <div>
            <form method="post">
            
            <div class="step1">
            
            <div class="step-all">1단계</div>
            <br/>
            <div class="bar">
            <div class="bar1"></div>
            </div>
            <div class="content">
            <br/>
            학생이 받고 싶은 수업은 무엇인가요?<br/>
            <br/>
            <table class="catetable">
            <tr class="cate"><td><label style="cursor:pointer;"><input type="radio" name="cate" value="수학" /> 수학</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="외국어" /> 외국어</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="국어" /> 국어</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="사회" /> 사회</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="과학" /> 과학</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="예체능" /> 예체능</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="입시(자소서/논술/면접)" /> 입시(자소서/논술/면접)</label></td></tr>
            </table>
            <br/>
            <span class="btn1">다음단계</span>
            <br/><br/>
            </div>
            
            </div>
            
            <div class="step2" style="display:none;" >
            
            <div class="step-all" >2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등수학" /> 초등수학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등수학" /> 중등수학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등수학" /> 고등수학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="문과수학" /> 문과수학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="이과수학" /> 이과수학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="수학경시" /> 수학경시</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            
            
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등영어" /> 초등영어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등영어" /> 중등영어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등영어" /> 고등영어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="수능영어" /> 수능영어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="영어회화" /> 영어회화</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="toeic/tofle/teps" /> toeic/tofle/teps</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중국어" /> 중국어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="일본어" /> 일본어</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등국어" /> 초등국어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등국어" /> 중등국어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등국어" /> 고등국어</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="수능국어" /> 수능국어</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등사회" /> 초등사회</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등사회" /> 중등사회</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등사회" /> 고등사회</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="사회탐구" /> 사회탐구</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="한국사" /> 한국사</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등과학" /> 초등과학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등과학" /> 중등과학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등과학" /> 고등과학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="물리" /> 물리</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="생명" /> 생명</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="화학" /> 화학</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="지구과학" /> 지구과학</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="미술" /> 미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="유아미술" /> 유아미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="초등미술" /> 초등미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="중등미술" /> 중등미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="고등미술" /> 고등미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="성인미술" /> 성인미술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="음악" /> 음악</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="악기" /> 악기</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="성악" /> 성악</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="국악" /> 국악</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="체육" /> 체육</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step2" >
            <div class="step-all">2단계</div>
            <br/>
            <div class="bar">
            <div class="bar2"></div>
            </div>
            <div class="content">
            <br/>
            세부 수업을 정해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="자소서첨삭" /> 자소서첨삭</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="입시컨설팅" /> 입시컨설팅</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="면접" /> 면접</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="수학논술" /> 수학논술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="인문논술" /> 인문논술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="국어논술" /> 국어논술</label></td></tr>
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="과학논술" /> 과학논술</label></td></tr>
            </table>
            <br/>
            <span class="btn2">다음단계</span><span class="prev2">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step3" >
            <div class="step-all" >3단계</div>
            <br/>
            <div class="bar">
            <div class="bar3"></div>
            </div>
            <div class="content">
            <br/>
            학생의 학년과 성별을 선택해주세요.<br/>
            <br/>
            <table class="catetable" >
            <tr>
            	<td style="border:none;">학년</td>
            	<td style="border:none;">
				<select id="grade" name="grade" style="width:100%;padding:30px;color:gray; font-size:40px; font-family:'JejuGothic'">
					<option>--선택--</option>
					<option>초등저학년(1~3학년)</option>
					<option>초등고학년(4~6학년)</option>
					<option>중등1,2학년</option>
					<option>중등3학년</option>
					<option>고등1,2학년</option>
					<option>고등3학년</option>
					<option>재(N)수생</option>
					<option>성인</option>
				</select>
				</td>
			</tr>
			<tr>
            	<td style="border:none;">성별</td>
            	<td style="border:none;">
				<select name="sexual" style="width:50%;padding:30px; font-size:40px;color:gray; font-family:'JejuGothic'">
                        	<option>남</option>
                        	<option>여</option>
                </select>
				</td>
			</tr>
            </table>
            <br/>
            <span class="btn3">다음단계</span><span class="prev3">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step4" >
            <div class="step-all" >4단계</div>
            <br/>
            <div class="bar">
            <div class="bar4"></div>
            </div>
            <div class="content">
            <br/>
            가능한 요일을 선택해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="월"> 월요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="화"> 화요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="수"> 수요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="목"> 목요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="금"> 금요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="토"> 토요일</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="일"> 일요일</label></td></tr>
            </table>
            <br/>
            <span class="btn4">다음단계</span><span class="prev4">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step5" >
            <div class="step-all" >5단계</div>
            <br/>
            <div class="bar">
            <div class="bar5"></div>
            </div>
            <div class="content">
            <br/>
            가능한 시간대를 선택해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td><label style="cursor:pointer"><input name="time" type="checkbox" value="아침 9-12시"> 아침 9-12시</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="time" type="checkbox" value="낮 12-3시"> 낮 12-3시</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="time" type="checkbox" value="낮 3-6시"> 낮 3-6시</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="time" type="checkbox" value="저녁 6-8시"> 저녁 6-8시</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="time" type="checkbox" value="저녁 8-10시"> 저녁 8-10시</label></td></tr>
            </table>
            <br/>
            <span class="btn5">다음단계</span><span class="prev5">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step6" >
            <div class="step-all" >6단계</div>
            <br/>
            <div class="bar">
            <div class="bar6"></div>
            </div>
            <div class="content">
            <br/>
            수업받을 지역을 선택해주세요.<br/>
            <br/>
            <table class="catetable">
            <tr><td>
            <div style="margin-bottom:20px; font-size:35px; color:dimgray;line-height:200%;">세부지역은 읍면동까지만 적어주세요.</div>
            <select class="locale-main" name="locale1">
							<option>선택</option>
                            <option>서울</option>
                            <option>경기</option>
                            <option>인천</option>
                            <option>강원</option>
                            <option>대전</option>
                            <option>세종</option>
                            <option>충남</option>
                            <option>충북</option>
                            <option>부산</option>
                            <option>울산</option>
                            <option>경남</option>
                            <option>경북</option>
                            <option>대구</option>
                            <option>광주</option>
                            <option>전남</option>
                            <option>전북</option>
                            <option>제주</option>
            </select>
             <select class="locale" >
                                <option>강남</option>
                                <option>강동</option>
                                <option>강북</option>
                                <option>강서</option>
                                <option>관악</option>
                                <option>광진</option>
                                <option>구로</option>
                                <option>금천</option>
                                <option>노원</option>
                                <option>도봉</option>
                                <option>동대문</option>
                                <option>동작</option>
                                <option>마포</option>
                                <option>서대문</option>
                                <option>서초</option>
                                <option>성동</option>
                                <option>성북</option>
                                <option>송파</option>
                                <option>양천</option>
                                <option>영등포</option>
                                <option>용산</option>
                                <option>은평</option>
                                <option>종로</option>
                                <option>중구</option>
                                <option>중랑구</option>
                        </select>
                        <select class="locale" >
                                <option>가평</option>
                                <option>고양시 덕양구</option>
                                <option>고양시 일산동구</option>
                                <option>고양시 일산서구</option>
                                <option>과천시</option>
                                <option>광명시</option>
                                <option>광주시</option>
                                <option>구리시</option>
                                <option>군포시</option>
                                <option>김포시</option>
                                <option>남양주시</option>
                                <option>동두천시</option>
                                <option>부천시</option>
                                <option>성남시 분당구</option>
                                <option>성남시 수정구</option>
                                <option>성남시 중원구</option>
                                <option>수원시 권선구</option>
                                <option>수원시 영통구</option>
                                <option>수원시 장안구</option>
                                <option>수원시 팔달구</option>
                                <option>시흥시</option>
                                <option>안산시 단원구</option>
                                <option>안산시 상록구</option>
                                <option>안성시</option>
                                <option>안양시 동안구</option>
                                <option>안양시 만안구</option>
                                <option>양주시</option>
                                <option>양평군</option>
                                <option>여주시</option>
                                <option>연천구</option>
                                <option>오산시</option>
                                <option>용인시 기흥구</option>
                                <option>용인시 수지구</option>
                                <option>용인시 처인구</option>
                                <option>의왕시</option>
                                <option>의정부시</option>
                                <option>이천시</option>
                                <option>파주시</option>
                                <option>평택시</option>
                                <option>포천시</option>
                                <option>하남시</option>
                                <option>화성시</option>
                        </select>
                        
                        <select class="locale">
                                <option>강화군</option>
                                <option>계양구</option>
                                <option>남동구</option>
                                <option>동구</option>
                                <option>미추홀구</option>
                                <option>부평구</option>
                                <option>서구</option>
                                <option>연수구</option>
                                <option>옹진군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale">
                                <option>강릉</option>
                                <option>고성</option>
                                <option>동해</option>
                                <option>삼척</option>
                                <option>속초</option>
                                
                                <option>양구</option>
                                <option>양양</option>
                                <option>영월</option>
                                <option>원주</option>
                                <option>인제</option>
                                
                                <option>정선</option>
                                <option>철원</option>
                                <option>춘천</option>
                                <option>태백</option>
                                <option>평창</option>
                                
                                <option>홍천</option>
                                <option>화천</option>
                                <option>횡성</option>
                        </select>
                        
                        <select class="locale">
                                <option>대덕구</option>
                                <option>동구</option>
                                <option>서구</option>
                                <option>유성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale">
                                <option>세종</option>
                        </select>
                        
                        <select class="locale">
                                <option>계룡</option>
                                <option>공주</option>
                                <option>금산</option>
                                <option>논산</option>
                                <option>당진</option>
                                
                                <option>보령</option>
                                <option>부여</option>
                                <option>서산</option>
                                <option>서천</option>
                                <option>아산</option>
                                <option>예산</option>
                                
                                <option>천안시 동남구</option>
                                <option>천안시 서북구</option>
                                <option>청양군</option>
                                <option>태안군</option>
                                <option>홍성군</option>
                        </select>
                        
                        <select class="locale">
                                <option>괴산군</option>
                                <option>단양군</option>
                                <option>보은군</option>
                                <option>영동군</option>
                                <option>옥천군</option>
                                
                                <option>음성군</option>
                                <option>제천시</option>
                                <option>증평군</option>
                                <option>진천군</option>
                                <option>청주시 상당구</option>
                                <option>청주시 서원구</option>
                                
                                <option>청주시 청원구</option>
                                <option>청주시 흥덕구</option>
                                <option>층주시</option>
                        </select>
                        
                        <select class="locale" >
                                <option>강서구</option>
                                <option>금정구</option>
                                <option>기장구</option>
                                <option>남구</option>
                                <option>동구</option>
                                
                                <option>동래구</option>
                                <option>부산진구</option>
                                <option>북구</option>
                                <option>사상구</option>
                                <option>사하구</option>
                                <option>서구</option>
                                
                                <option>수영구</option>
                                <option>연제구</option>
                                <option>영도구</option>
                                <option>중구</option>
                                <option>해운대구</option>
                        </select>
                        
                        <select class="locale">
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>울주군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale">
                                <option>거제시</option>
                                <option>거창군</option>
                                <option>고성군</option>
                                <option>김해시</option>
                                <option>남해군</option>
                                
                                <option>밀양시</option>
                                <option>사천시</option>
                                <option>산청군</option>
                                <option>양산시</option>
                                <option>의령군</option>
                                <option>진주시</option>
                                
                                <option>창녕군</option>
                                <option>창원시 마산합포구</option>
                                <option>창원시 마산회원구</option>
                                <option>창원시 성산구</option>
                                <option>창원시 의창구</option>
                                <option>창원시 진해구</option>
                                
                                <option>통영시</option>
                                <option>하동군</option>
                                <option>함안군</option>
                                <option>함양군</option>
                                <option>합천군</option>
                        </select>
                        
                        <select class="locale">
                                <option>경산시</option>
                                <option>경주시</option>
                                <option>고령군</option>
                                <option>구미시</option>
                                <option>군위군</option>
                                
                                <option>김천시</option>
                                <option>문경시</option>
                                <option>봉화군</option>
                                <option>상주시</option>
                                <option>성주군</option>
                                <option>안동시</option>
                                
                                <option>영덕군</option>
                                <option>영양군</option>
                                <option>영주시</option>
                                <option>영천시</option>
                                <option>예천군</option>
                                <option>울릉군</option>
                                
                                <option>울진군</option>
                                <option>의성군</option>
                                <option>청도군</option>
                                <option>청송군</option>
                                <option>칠곡군</option>
                                <option>포항시 남구</option>
                                
                                <option>포항시 북구</option>
                        </select>
                        
                        <select class="locale">
                                <option>남구</option>
                                <option>달서구</option>
                                <option>달성군</option>
                                <option>동구</option>
                                <option>북구</option>
                                
                                <option>서구</option>
                                <option>수성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale">
                                <option>광산구</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>서구</option>
                        </select>
                        
                        <select class="locale">
                                <option>강진군</option>
                                <option>고흥군</option>
                                <option>곡성군</option>
                                <option>광양시</option>
                                <option>구례군</option>
                                
                                <option>나주시</option>
                                <option>담양군</option>
                                <option>목포시</option>
                                <option>무안군</option>
                                <option>보성군</option>
                                <option>순천시</option>
                                
                                <option>신안군</option>
                                <option>여수시</option>
                                <option>영광군</option>
                                <option>영암군</option>
                                <option>완도군</option>
                                <option>장성군</option>
                                
                                <option>장흥군</option>
                                <option>진도군</option>
                                <option>함평군</option>
                                <option>해남군</option>
                                <option>화순군</option>
                        </select>
                        
                        <select class="locale">
                                <option>고창군</option>
                                <option>군산시</option>
                                <option>김제시</option>
                                <option>남원시</option>
                                <option>무주군</option>
                                
                                <option>부안군</option>
                                <option>순창군</option>
                                <option>완주군</option>
                                <option>익산시</option>
                                <option>임실군</option>
                                <option>장수군</option>
                                
                                <option>전주시 덕진구</option>
                                <option>전주시 완산구</option>
                                <option>정읍시</option>
                                <option>진안군</option>
                        </select>
                        
                        <select class="locale">
                                <option>서귀포시</option>
                                <option>제주시</option>
                        </select>
                        <br/><br/>
                        <input class="locale3" type="text" name="locale3" placeholder="읍/면/동까지만 적어주세요." />
                        </td>
                        </tr>
                        
            </table>
            <br/>
            <span class="btn6">다음단계</span><span class="prev6">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            <div class="step7" >
            <div class="step-all" >7단계</div>
            <br/>
            <div class="bar">
            <div class="bar7"></div>
            </div>
            <div class="content">
            <br/>
            가격과 남기고 싶은 말 또는 희망사항을 적어주세요.<br/>
            <br/>
            <table class="catetable" style="margin-top:10px;line-height:200%;font-size:35px; font-family:'JejuGothic';padding:10px;">
            <tr>
            	<td>희망 수업횟수</td>
            	<td>
            		<select name="month" class="price-standard">
                        <option>한달 12회</option>
                        <option>한달 8회</option>
                        <option>한달 4회 </option>
                        <option>1회</option>
                      </select>
            	</td>
            <tr>
            
            <tr>
            	<td>회당 수업시간</td>
            	<td>
            		<select name="gawetime" class="price-time">
                          <option>60분</option>
                          <option>90분</option>
                          <option>2시간</option>
                          <option>2시간 30분</option>
                          <option>3시간</option>
                          <option>4시간</option>
                    </select>
            	</td>
            <tr>
            
            <tr>
            	<td>희망 가격</td>
            	<td>
            		<select class="price1" id="price1" name="price1">
							<option value="무관">무관</option>
                    		<option value="10만원">10만원</option>
                    		<option value="20만원">20만원</option>
                    		<option value="30만원">30만원</option>
                    		<option value="40만원">40만원</option>
                    		<option value="50만원">50만원</option>
                    		<option value="60만원">60만원</option>
                    		<option value="70만원">70만원</option>
                    		<option value="80만원">80만원</option>
                    		<option value="90만원">90만원</option>
                    		<option value="100만원">100만원</option>
                		</select>
                		~
                		<select class="price2" id="price2" name="price2">
                    		<option value="10만원">10만원</option>
                    		<option value="20만원">20만원</option>
                    		<option value="30만원">30만원</option>
                    		<option value="40만원">40만원</option>
                    		<option value="50만원">50만원</option>
                    		<option value="60만원">60만원</option>
                    		<option value="70만원">70만원</option>
                    		<option value="80만원">80만원</option>
                    		<option value="90만원">90만원</option>
                    		<option value="100만원">100만원</option>
                    		<option value="무관">무관</option>
                    	</select>
            	</td>
            <tr>
						
            <tr>
            	<td colspan="2">선생님에게 남기고 싶은 말 또는 희망사항(<span class="message-length">0</span>/200)</td>
            </tr>
            <tr>
            <td colspan="2">
            <textarea name="message" class="message" rows="8" style="font-size:35px;width:100%;"></textarea>
            <input type="text" name="visible" value="1" style="display:none;" />
            </td>
            </tr>
            </table>
            <br/>
            <input type="submit" class="btn7" value="요청하기" /><span class="prev7">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            </form>
            </div>
            </div>
            
    <div class="tutorial-first-back"></div>
    <div class="tutorial-first">
    	<div class="tutorial-para">
    		<div class="tutorial-first-title">수업요청을 통해<br/>수업 가능한 선생님들의<br/>지원서를 받을 수 있습니다.</div>
    	</div>
    	<div>
    		<div class="tutorial-btn">
    			요청서 작성하기
    		</div>
    	</div>
    	<div class="tutorial-close-div"><span class="tutorial-close">[닫기x]</span></div>
    </div>
            
            <div style=" height:400px;"></div>
            </div>
           </section>
           
           <img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;display:none;"/>
           
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>
 <script>
 $(document).ready(function(){
	 
	 $('.m-foot').remove();
	 
	 var error = "<c:out value="${error}" />";
	  
	  if(error == "error"){
		  alert("수업 요청이 실패 되었습니다. 다시 시도해주세요.")
	  }
	 
 		var limit = "<c:out value="${limit}" />";
	  
	  if(limit == "limit"){
		  alert("수업 요청은 3개까지만 가능합니다. [마이페이지][수업요청내역]에서 기존 수업요청을 삭제하고 다시 요청해주시기 바랍니다.");
		  window.location.href="./mypage";
	  }
	 
	  $(document).on('keyup','.message',function(){
      	  var inputLength = $(this).val().length;
        	var remain = inputLength;
        	$('.message-length').html(remain);
          });
	  
	 var idx=-1;
	$('.btn1').click(function(){
		$('.cate').each(function(){
			if($(this).find('input[name="cate"]').is(':checked')){
				idx=$(this).index();
			}
		})
		if(idx=="-1"){
			alert("원하시는 수업을 체크 해주세요.")				
		}else{
			$('.subcate').attr('name', '');
			$('.step1').hide();
			$('.step2').eq(idx).show();
			$('.step2').eq(idx).find('.subcate').each(function(){
				$(this).attr('name', 'subcate');
			})
		}
	});
	
	
	$('.prev2').click(function(){
		$('.step2').hide();
		$('.step1').show();
	});
	
	$('.btn2').click(function(){
		if($('input[name="subcate"]:checked').index()=="-1"){
			alert("수업을 선택해주세요.")
		}else if($('input[name="subcate"]:checked').length > "3"){
			alert("수업은 3개까지 선택할 수 있습니다.")
		}else{
		$('.step2').hide();
		$('.step3').show();
		}
});
	
	$('.prev3').click(function(){
		$('.step3').hide();
		$('.step2').eq(idx).show();
});
	
	$('.btn3').click(function(){
		if($('#grade option:selected').index()=="0"){
			alert("학년을 선택해주세요.")
		}else{
		$('.step3').hide();
		$('.step4').show();
		}
});
	
	$('.prev4').click(function(){
		$('.step4').hide();
		$('.step3').show();
});
	
	$('.btn4').click(function(){
		if($('input[name="day"]:checked').length==0){
			alert('요일을 선택해주세요.');
		}else{
			$('.step4').hide();
			$('.step5').show();
		}
});
	
	$('.prev5').click(function(){
		$('.step5').hide();
		$('.step4').show();
});
	
	$('.btn5').click(function(){
		if($('input[name="time"]:checked').length==0){
			alert('시간대를 선택해주세요.');
		}else{
			$('.step5').hide();
			$('.step6').show();
		}
});
	
	$('.prev6').click(function(){
		$('.step6').hide();
		$('.step5').show();
});
	
	$('.btn6').click(function(){
		if($('.locale-main option:selected').index()=="0"){
			alert("지역을 선택해주세요.")
		}else if($('.locale3').val().length>15){
			alert('세부 지역명은 15글자 미만으로 작성해주세요.')
		}else{
		$('.step6').hide();
		$('.step7').show();
		}
});
	
	$('.prev7').click(function(){
		$('.step7').hide();
		$('.step6').show();
});
	
	$('.btn7').click(function(){
		if($('.message').val().length>200){
			alert('남기고 싶은 말씀을 200글자 미만으로 적어주세요.');
			return false;
		}
		var broswerInfo = navigator.userAgent;
 	    //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
 	    if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
            $('#spinner').show();
        }
 	    
	});
	
	$('.locale-main').change(function(){
	    $(".disp").removeClass('disp');
	    $('.locale').hide();
	    $('.locale3').show();
	    var opIndex = $('.locale-main>option:selected').index();
	    $('.locale').attr('name','');
	    if(opIndex==0){
	    	$('.locale').attr('name','');
	        $('.locale').hide();
	    }else{
	    	
	        $('.locale').eq(opIndex-1).addClass("disp").show();
	    	$('.locale').eq(opIndex-1).attr('name','locale2');
	    }
	});
	
	$('.tutorial-btn').click(function(){
 		$('.tutorial-first').remove();
   		$('.tutorial-first-back').remove();
	});

	$('.tutorial-close').click(function(){
	   $('.tutorial-first').remove();
	   $('.tutorial-first-back').remove();
	   SetCookie('tutorial','end')
	});
	
 });
 
	$(window).bind("pageshow", function(event) {
		$('#spinner').hide();
	});
	
	
	if(getRequestParam().cok_tutorial=="first_student"){
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
	
 </script>
</body>
</html>
