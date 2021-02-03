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
        width:600px; background:gray; border-radius:4px; margin:auto;
        }
        .bar1{
        width:100px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar2{
        width:200px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar3{
        width:300px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar4{
        width:350px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar5{
        width:400px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .bar6{
        width:450px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        
        .bar7{
        width:550px; background:rgb(44, 184, 26); border-radius:4px;padding:4px;
        }
        .content{
        width:80%;; margin:auto;font-size:30px;
        }
	
	.catetable{
		border:1px solid lightgray;
		border-radius:3px;
		width:100%;
	}
	.catetable td{
	width:100%;
	padding:30px;
	border:1px solid lightgray;
	}
	
	.step-all{
		margin-left:100px;font-family:'JejuGothic';font-size:30px;
	}
	
	.step2, .step3, .step4, .step5, .step6, .step7{
		display:none;
	}

	.btn1, .btn2, .btn3, .btn4 , .btn5, .btn6 , .prev2, .prev3, .prev4, .prev5, .prev6, .prev7{
		border-radius:14px;
		background:rgb(150, 151, 150);
		color:white;
		padding:20px;
		font-size:24px;
		font-family:'JejuGothic';
		cursor:pointer;
		float:right;
		margin-right:20px;
	}
	.btn7{
	margin-top:10px;
	border-radius:14px;
		background:orange;
		color:white;
		padding:20px;
		font-size:24px;
		font-family:'JejuGothic';
		cursor:pointer;
		float:right;
		margin-right:20px;
	} 
	
	.locale-main{
		font-size:30px; color:gray; padding:30px;
	}
	.locale{
	display:none;font-size:30px; color:gray; padding:30px;
	}
	.locale3{
	display:none;font-size:30px; color:gray; padding:30px;width:80%;
	}
	.price-standard, .price-time , .price1, .price2{
		font-size:30px;padding:30px;
	}
</style>    
</head>
<body>
        <% if(session.getAttribute("email")==null) {
%>
<script>
window.location="./";
</script>
<%
}
%>
        <section>
            <div style="background:rgb(46, 46, 46); color:rgb(219, 218, 218);">
               
                <div style="text-align:center; font-size:40px;padding-top:30px">
                   수업 요청
                </div>
                <div style="font-size:30px; padding:30px; text-align:center">
                  수업 요청을 통해 수업 가능한 선생님들의<br/> 지원서를 받아볼 수 있습니다. 
                </div>
            </div>
            
            <div style="padding:20px 20px 150px 20px;">
            <div style="width:90%; background:white; margin:auto; padding:20px 20px 50px 20px;">
            <div>
            <form method="post">
            <input name="email" id="email" type="hidden" value="${email}" />
            
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
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="수학" /> 수학</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="외국어" /> 외국어</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="국어" /> 국어</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="사회" /> 사회</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="과학" /> 과학</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="예체능" /> 예체능</label></td></tr>
            <tr class="cate"><td><label style="cursor:pointer"><input type="radio" name="cate" value="자소서/입시" /> 자소서/입시</label></td></tr>
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
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="수학논술" /> 수학논술</label></td></tr>
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
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="국어논술" /> 국어논술</label></td></tr>
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
            <tr><td><label style="cursor:pointer"><input type="checkbox" class="subcate" value="음악" /> 음악</label></td></tr>
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
            <table class="catetable">
            <tr><td style="line-height:250%;">
            학년&nbsp;
				<select id="grade" name="grade" style="padding:30px;color:gray; font-size:30px; font-family:'JejuGothic'">
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
				<br/>
				성별&nbsp;
				<select name="sexual" style="padding:30px; font-size:30px;color:gray; font-family:'JejuGothic'">
                        	<option>남</option>
                        	<option>여</option>
                </select>
			</td></tr>
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
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="월"> 월</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="화"> 화</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="수"> 수</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="목"> 목</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="금"> 금</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="토"> 토</label></td></tr>
            <tr><td><label style="cursor:pointer"><input name="day" type="checkbox" value="일"> 일</label></td></tr>
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
            <div style="margin-bottom:20px; font-size:20px; color:dimgray;line-height:200%;">세부지역은 읍면동까지만 적어주세요.</div>
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
            <table class="catetable">
            <tr><td>희망가격<br/>
            <div style="margin-top:10px;line-height:200%;font-size:20px; font-family:'JejuGothic';padding:20px;">
            
            <span style="color:gray; font-size:30px; font-family:'JejuGothic'">수업기준&nbsp;
                      <select name="month" class="price-standard">
                        <option>한달 12회</option>
                        <option>한달 8회</option>
                        <option>한달 4회 </option>
                        <option>1회</option>
                      </select>
                      <br/><br/>
                     회당 수업시간  
                      <select name="gawetime" class="price-time">
                          <option>60분</option>
                          <option>90분</option>
                          <option>2시간</option>
                          <option>2시간 30분</option>
                          <option>3시간</option>
                          <option>4시간</option>
                        </select>
                        </span>
            <br/><br/>
           <span style="color:gray; font-size:30px;font-family:'JejuGothic'">가격
           <div style="text-align:center">
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
                		</div>
                		</span> 
                		</div>
 			</td></tr>
            <tr><td>선생님에게 남기고 싶은 말 또는 희망사항(<span class="message-length">0</span>/200) <br/>
            <div style="margin-top:10px;">
            <textarea name="message" class="message" rows="6" cols="30" style="font-size:30px"></textarea>
            <input type="text" name="visible" value="1" style="display:none;" />
            </div>
            </td></tr>
            </table>
            <br/>
            <input type="submit" class="btn7" value="요청하기" /><span class="prev7">이전단계</span>
            <br/><br/>
            </div>
            </div>
            
            </form>
            </div>
            </div>
            <div style=" height:400px;"></div>
            </div>
           </section>
           
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
	
 });
 </script>
</body>
</html>
