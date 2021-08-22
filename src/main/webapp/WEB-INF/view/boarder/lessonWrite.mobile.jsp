<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>수업만들기, 콕사부 </title>
 <meta name="description" content="수업만들기 페이지" />
<meta charset="utf-8">
<link rel="canonical" href="https://coksabu.com/lessonWrite">
    <style>
   	 	* { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            padding-bottom:20px;
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

        .div-title{
            width:800px; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
        
        #imgplus{
        	width:100px;height:100px;
        	backgroud:white;
        	border-radius:40px;
        	border:4px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-80px;
        	right:-300px;
    	}
    	
		.menu{
			width:100%;
		}
		
       .menu td{
        font-family: 'JejuGothic'; 
        float:left;
        text-align:center;
        padding:30px 0px;
         width:16.5%;
        cursor:pointer;
      }
      .menu-td{
        background:#FBEADC;
        color:white;
        font-size:35px;
        font-weight:bolder;
        color:#EF904F;
      }
      .td-trans{
        background:white;
        color:rgb(63, 63, 61);
        border-top: 5px solid #FBEADC;
         color:#EF904F;
      }
      
      .price-table{
      border-spacing:20px 60px;
      }

		.btn-div{
			width:100%;
		font-size:50px;
		font-weight:bolder;
		position: fixed;
		left: 0;
		bottom: 0;
		text-align:center;
		}

		.btn1{
			width:100%;
			text-align:center;
			position:fixed; bottom:0px; left:0px;
			font-size:50px; padding:30px 0px;
			background:#F4C60B;
        	color:white;
			background:#F4C60B;
        	color:white;
		}
		
		.btn2, .btn3, .btn4, .btn5, .make-lesson{
			width:50%;
			text-align:center;
			font-size:50px; padding:30px 0px;
			background:#F4C60B;
        	color:white;
			background:#F4C60B;
			display:inline-block;
		}	
		
		.prev2, .prev3, .prev4, .prev5, .prev5, .prev6 {
			width:50%;
			text-align:center;
			font-size:50px; padding:30px 0px;
			border-top:10px solid #F4C60B;
        	color:#F4C60B;
        	background:white;
        	float:left;
        	display:inline-block;
		}
		

      .btn{
        border-radius:5px;
        cursor:pointer;
        
      }
      
      .img-add{
      	padding:20px;
      	border-radius:15px;
      	background:black;
      	font-size:40px;
      	color:white;
      	cursor:pointer;
      }
      
      .save{
      background:orange;
      display:none;
      border:none;
      }
      .btnc{
        font-size:35px;
        border-radius:10px;
        padding:15px;
        background: rgb(75, 74, 74);
        color:white;
        cursor:pointer;
      }
      .x-btn{
      	font-size:40px;
            padding:10px;
            color:#D5D5D5;
      }
      .service-cate {
        padding:30px;
        font-size:50px; border-radius:20px;
       	width:70%;
       	 color:dimgray;border:5px solid #BDBDBD;background:#F9F9F9;
        margin-top:20px;
        
      }
      
      .seg-table td{
      	padding:0px 10px;
      }
      
      .seg-table tr:nth-child(1) td{
      	padding-bottom:40px;
      	text-align:center;
      }
      
      .seg-table tr:nth-child(2n) td{
      	padding-bottom:60px;
      }
      .seg-table td:nth-child(2n){
      	background:#EBEBEB
      }
       .seg-table td:nth-child(2n+1){
      	background:#F6F6F6;
      }
      .seg-table select{
      	font-size:35px;
      }
      
      .seg-cate{
      	width:100%; padding:15px;
        font-size:35px; border-radius:2px;
        line-height:250%;
        margin-top:10px;
      }

      .teacher-intr{
      	font-size:40px;
        font-family: 'JejuGothic'; 
        width:90%;
        min-height:400px;
        margin:30px auto;
        line-height:180%;
      }
      .career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
        padding:10px;
        font-size:40px;
        margin:10px;
      }

      .career-disc{
        width:70%;
        font-size:40px;
        padding:10px;
      }
	
	  .career-box{
		border:0.5px solid gray; 
		width:100%;
		min-height:150px; 
		margin-top:20px;
		font-size:25px;
		padding:10px;
		color:gray;
		line-height:300%;
		}
		
	.car{
		 	margin:20px;
            font-size:30px;
            padding:10px;
            border-radius:50px;
            background:#F2F3F7;
            display:inline-block;
	}
	
      .del-btn{
        color:white;
        background:rgb(63, 63, 61);
        border-radius:3px;
        padding:3px;
      }
      
      #output1, #output2, #output3, #output4{
     	width:50%; height:400px;margin:2%;
      }
      .multi1, .multi2, .multi3, .multi4{
      display:none;
      }
      .img-div{
      width:100%;
      text-align:center;
      	min-height:200px;
      }

input[type="checkbox"]{
	width:20px;height:20px;
}

.pri-neg-able{
      	border-bottom-left-radius:10px;
      	border-top-left-radius:10px;
      }
      .pri-neg-disable{
      	border-bottom-right-radius:10px;
      	border-top-right-radius:10px;
      }
	.pri-neg-able, .pri-neg-disable{
		display:inline-block;
		border:1px solid gray;
		background:#F6F6F6;
		width:40%;
		padding:20px;
		cursor:pointer;
	}
	.radio-back{
		background: #F29661;
		color:white;
	}

	.negotiation-possible, .negotiation-notpossible{
		display:none;
	}
	
    </style>
<title>수업 만들기</title>
</head>
<body>
				<div style="list-style:none;width:100%; ">    
                   
                  <!-- 메뉴 -->
                  <div style="width:100%;">
                    <table class="menu">
                      <tr>
                      <td class="menu-td">서비스</td>
                      <td class="menu-td">제목</td>
                      <td class="menu-td">정보</td>
                      <td class="menu-td">소개</td>
                      <td class="menu-td">미디어</td>
                      <td class="menu-td">안내</td>
                      </tr>
                    </table>

                  </div>

                  <form:form commandName="card" method="post" enctype="multipart/form-data"  onSubmit="return checkLesson(this)">
					<input name="email" type="hidden" value="<%= (String)session.getAttribute("email") %>"/>
                  <!-- 선생님 소개 -->
                    <div class="teacher-intr" >
                    
                        <div style="margin-top:20px;line-height:180%;font-size:40px;">
                          	서비스 카테고리<br/>
                          <select name="cate" class="service-cate" id="service-cate">
                            <option>--선택--</option>
                            <option>수학</option>
                            <option>외국어</option>
                            <option>국어</option>
                            <option>사회</option>
                            <option>과학</option>
                            <option>예체능</option>
                            <option>입시(자소서/논술/면접)</option>
                          </select>
                        </div>
                        
                        <div style="min-height:300px;">
                         <div class="service-table" style="margin-top:80px;display:none;">
                         
                        	<table class="seg-table" style="border-spacing:0px;font-size:30px;width:100%;">
                        		<tr>
                        			<td>제공 수업1</td><td>제공 수업2(선택)</td><td>제공 수업3(선택)</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        			<td>
                        			<select>
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                     	 	 			<option>고등수학</option>
                      	   	  			<option>문과수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select>
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                     	 	 			<option>고등수학</option>
                      	   	  			<option>문과수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select>
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                      	   	  			<option>문과수학</option>
                     	     			<option>고등수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        			<select>
                        	 	 		<option>초등영어</option>
                        	 			<option>중등영어</option>
                     	 	  			<option>고등영어</option>
                      	   	  			<option>수능영어</option>
                     	      			<option>영어회화</option>
                          	  			<option>toeic/tofle/teps</option>
                          	  			<option>중국어</option>
                          	  			<option>일본어</option>
                        			</select>
                        		</td>
                        		<td>
                        			<select>
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등영어</option>
                        	 			<option>중등영어</option>
                     	 	  			<option>고등영어</option>
                      	   	  			<option>수능영어</option>
                     	      			<option>영어회화</option>
                          	  			<option>toeic/tofle/teps</option>
                          	  			<option>중국어</option>
                          	  			<option>일본어</option>
                        			</select>
                        		</td>
                        		<td>
                        			<select>
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등영어</option>
                        	 			<option>중등영어</option>
                     	 	  			<option>고등영어</option>
                      	   	  			<option>수능영어</option>
                     	      			<option>영어회화</option>
                          	  			<option>toeic/tofle/teps</option>
                          	  			<option>중국어</option>
                          	  			<option>일본어</option>
                        			</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        		<select>
                        	  		<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	 	 	<option value="nonevalue">선택없음</option>
                        	 	 	<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        		<select>
                        	  		<option>초등사회</option>
                        	  		<option>중등사회</option>
                     	 	  		<option>고등사회</option>
                      	   	  		
									<option>생활과윤리</option>
                     	      		<option>사회문화</option>
                     	      		<option>한국지리</option>
                     	      		<option>세계지리</option>
                     	      		<option>윤리와사상</option>
                     	      		<option>동아시아사</option>
                     	      		<option>법과정치</option>
                     	      		<option>세계사</option>
                     	      		<option>경제</option>
				
                     	      		<option>한국사</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등사회</option>
                        	  		<option>중등사회</option>
                     	 	  		<option>고등사회</option>
									<option>생활과윤리</option>
                     	      		<option>사회문화</option>
                     	      		<option>한국지리</option>
                     	      		<option>세계지리</option>
                     	      		<option>윤리와사상</option>
                     	      		<option>동아시아사</option>
                     	      		<option>법과정치</option>
                     	      		<option>세계사</option>
                     	      		<option>경제</option>
                     	      		<option>한국사</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등사회</option>
                        	  		<option>중등사회</option>
                     	 	  		<option>고등사회</option>
									<option>생활과윤리</option>
                     	      		<option>사회문화</option>
                     	      		<option>한국지리</option>
                     	      		<option>세계지리</option>
                     	      		<option>윤리와사상</option>
                     	      		<option>동아시아사</option>
                     	      		<option>법과정치</option>
                     	      		<option>세계사</option>
                     	      		<option>경제</option>
                     	      		<option>한국사</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        		<select>
                        	  		<option>초등과학</option>
                        	  		<option>중등과학</option>
                     	 	  		<option>고등과학</option>
                      	   	  		<option>물리</option>
                     	      		<option>화학</option>
                          	  		<option>생명과학</option>
                          	  		<option>지구과학</option>
                          	  		<option>물리2</option>
                     	      		<option>화학2</option>
                          	  		<option>생명과학2</option>
                          	  		<option>지구과학2</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등과학</option>
                        	  		<option>중등과학</option>
                     	 	  		<option>고등과학</option>
                      	   	  		<option>물리</option>
                     	      		<option>화학</option>
                          	  		<option>생명과학</option>
                          	  		<option>지구과학</option>
                          	  		<option>물리2</option>
                     	      		<option>화학2</option>
                          	  		<option>생명과학2</option>
                          	  		<option>지구과학2</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등과학</option>
                        	  		<option>중등과학</option>
                     	 	  		<option>고등과학</option>
                      	   	  		<option>물리</option>
                     	      		<option>화학</option>
                          	  		<option>생명과학</option>
                          	  		<option>지구과학</option>
                          	  		<option>물리2</option>
                     	      		<option>화학2</option>
                          	  		<option>생명과학2</option>
                          	  		<option>지구과학2</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        		<select>
                        	  		<option>미술</option>
                        	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        	  		<option>음악</option>
                        	  		<option>악기</option>
                        	  		<option>성악</option>
                        	  		<option>국악</option>
                     	 	  		<option>체육</option>
                     	 	  		
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>미술</option>
                        	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        	  		<option>음악</option>
                        	  		<option>악기</option>
                        	  		<option>성악</option>
                        	  		<option>국악</option>
                     	 	  		<option>체육</option>
                     	 	  		
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>미술</option>
                        	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        	  		<option>음악</option>
                        	  		<option>악기</option>
                        	  		<option>성악</option>
                        	  		<option>국악</option>
                     	 	  		<option>체육</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td>
                        		<select>
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        	  		<option>면접</option>
                        	  		<option>수학논술</option>
                        	  		<option>인문논술</option>
                        	  		<option>국어논술</option>
                        	  		<option>과학논술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        	  		<option>면접</option>
                        	  		<option>수학논술</option>
                        	  		<option>인문논술</option>
                        	  		<option>국어논술</option>
                        	  		<option>과학논술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select>
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        	  		<option>면접</option>
                        	  		<option>수학논술</option>
                        	  		<option>인문논술</option>
                        	  		<option>국어논술</option>
                        	  		<option>과학논술</option>
                        		</select>
                        		</td>
                        		</tr>
                        		
                        		<tr>
                        			<td style="font-size:30px;color:dimgray;">
                        			수업기준
                        			</td>
                        			<td></td><td></td>
                        		</tr>
                        		
                        		<tr>
                        			<td>
                        			<select name="price1" class="price-standard">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        			<td>
                        			<select name="opt1price1" class="price-standard opt1price1">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        			<td>
                        			<select name="opt2price1" class="price-standard opt2price1">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        		</tr>
                        		<tr>
                        			<td style="font-size:30px;color:dimgray;">
                        			회당 수업시간
                        			</td>
                        			<td></td><td></td>
                        		</tr>
                        		<tr>
                        			<td>
                        			<select name="price2" class="price-time">
                          				<option>60분</option>
                          				<option>90분</option>
                          				<option>2시간</option>
                          				<option>2시간 30분</option>
                          				<option>3시간</option>
                          				<option>4시간</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select name="opt1price2" class="price-time opt1price2">
                          				<option>60분</option>
                          				<option>90분</option>
                          				<option>2시간</option>
                          				<option>2시간 30분</option>
                          				<option>3시간</option>
                         				<option>4시간</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select name="opt2price2" class="price-time opt2price2">
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
                        			<td style="font-size:30px;color:dimgray;">
                        			수업가격
                        			</td>
                        			<td></td><td></td>
                        		</tr>
                        		<tr>
                        			<td>
                        			<input name="price3" style="text-align: right;font-size:35px;padding: 10px; width:80%;" class="price-pri1" type="text" id="price" placeholder="숫자만 입력"  />원
                      				<br/>
                      				<span class="price-kor1"></span>
                        			</td>
                        			<td>
                        			<input name="opt1price3" style="text-align: right;font-size:35px;padding:10px; width:80%;" class="price-pri2 opt1price3" type="text" id="opt1price3" placeholder="숫자만 입력"/>원
                      				<br/>
                      				<span class="price-kor2"></span>
                        			</td>
                        			<td>
                        			<input name="opt2price3" style="text-align: right; font-size:35px;padding:10px; width:80%;" class="price-pri3 opt2price3" type="text" id="opt2price3" placeholder="숫자만 입력"/>원
                      				<br/>
                      				<span class="price-kor3"></span>
                        			</td>
                        		</tr>
                        	</table>
                        	<div style="font-size:40px;text-align:center;margin-top:100px;">
                        		<label><div class="pri-neg-able"><input type="radio" class="negotiation-possible" name="priNegotiation" value="yes"/>가격협의 가능</div></label><label><div class="pri-neg-disable"><input type="radio" class="negotiation-notpossible" name="priNegotiation" value="no"/>가격협의 불가</div></label>
                        	</div>
                        	<div style="text-align:center;font-size:30px;color:dimgray;">협의가능 여부를 선택해주세요.</div>
                        </div>
                        	
                        </div>
                        
                      <br/>
                     <div class="btn1 btn">다음단계</div>
                    </div>
                    
                    <!-- 선생님 -->
                    <div class="teacher-intr" >
                    <div style="font-size:40px;" >
                    		수업 대표 이미지<br/>
                    		<span style="color:gray; font-size:40px;margin:15px 0px 15px 0px;">수업을 대표하는 이미지나 선생님 사진을 넣어주세요.</span><br/>
                    	<img id="output" style="width:400px; height:400px;" src="<c:url value="/resources/profileImg/pro.png"  />"  alt="수업대표이미지"/>
                        <br/>
                        <label for="represent"> <img id="imgplus" src="<c:url value="/resources/images/imgplus.png" />"  /> </label>
                        <input type="file" name="represent" id="represent" accept="image/*" style="display: none;" onchange="check(this);loadFile(event)" />
                    </div>
                    
                    
                     <div style="line-height:200%;font-size:40px;">제목</div>
                        <span style="color:gray; font-size:40px;">제목을 30글자 미만으로 적어주세요.(<span class="title-length">0</span>/30)</span><br/>
                        <input name="title" type="text" id="lesson-title" style="margin-top:10px;width:100%;
                         padding:20px; font-size:50px; border-radius:20px; border:3px solid dimgray;" placeholder="수업제목을 30자 내외로 적어주세요." value="${lesson.title}" />
                      <div style="height:400px;"></div>
                     <div class="btn-div"> <span class="prev2 btn">이전단계</span>  <span class="btn2 btn">다음단계</span></div>
                    </div>
                    
                  <!-- 수업 소개 -->
                    <div class="teacher-intr" >
                    <div style="margin-bottom:20px;">수업 가능 요일</div>
                    <div style="margin-bottom:100px;">
                   <span style="color:gray; font-size:50px; margin-top:10px;"> 
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="월" /> 월</label> &nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="화" /> 화</label> &nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="수" /> 수 </label>&nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="목" /> 목</label> &nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="금" /> 금</label> &nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="토" /> 토 </label>&nbsp;
                    <label style="cursor:pointer"><input type="checkbox" name="day" value="일" /> 일</label></span>
                    </div>
                   <div style="margin-bottom:20px;"> 수업 형태</div>
                   <div style="margin-bottom:100px;">
                   <span style="color:gray; font-size:50px; margin-top:10px;">
                   <label style="cursor:pointer"><input type="checkbox" name="gawe" value="개인 과외 가능" /> 개인 과외 가능 </label>&nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="gawe" value="화상 과외 가능" /> 화상 과외 가능</label></span>
                   </div>
                   <div style="margin-bottom:20px;">시범수업</div>
                   <div style="margin-bottom:100px;">
                   <span style="color:gray; font-size:50px; margin-top:10px;">
                   <label style="cursor:pointer"><input type="checkbox" name="trial" class="free" value="시범수업 무료" /> 시범수업 무료</label></span>
                   </div>
                        <div style="margin-bottom:20px;">수업 소개</div>
                        <div style="margin-bottom:500px;">
                         <span style="color:gray; font-size:35px; margin-top:10px">수업 형태나 학습목표, 커리큘럼에 대해<br/>자세히 적어주세요.(<span class="lesson-length">0</span>/500)</span>
                         <br/>
                        <textarea name="lesson" id="lesson-intr" rows="10" cols="40" style="padding:15px;font-size:35px; line-height:140%;overflow-y:scroll;margin-top:10px;">${lesson.lesson}</textarea>
                        </div>
                        <div class="btn-div"> <span class="prev3 btn">이전단계</span> <span class="btn3 btn">다음단계</span></div>
                    </div>
                   
                  <!-- 경력사항 -->
                    <div class="teacher-intr" >
                        선생님 경력<br/>
                        <span style="color:gray; font-size:35px;">경력이 없으신 경우 생략가능합니다.</span><br/>
                        <div class="career"  id="career" >
                        
                        </div>
                        <div style="display:inline-block;margin:10px auto; text-align:right; ">
                        
                        </div>
                        <div class="career-box" >
                        </div>
                        <br/>
                        선생님 소개<br/>
                        <span style="color:gray; font-size:35px; margin-top:10px">선생님의 지도성향이나 학습방식, 경력 등을<br/>자세하게 서술해주세요.(<span class="teach-length">0</span>/500)</span><br/>
                        <textarea id="careerDesc" name="description" rows="10" cols="40" style="font-size:35px;padding:15px; line-height:140%;overflow-y:scroll;margin-top:10px;"></textarea>
                        <br/><br/> 
                        <div class="btn-div"> <span class="prev4 btn">이전단계</span> <span class="btn4 btn">다음단계</span></div>
                    </div>
                   
                  <!-- 미디어 -->
                    <div class="teacher-intr" id="teacher-intr" >
                    <div style="text-align:center; font-family:'JejuGothic'; font-size:40px;">
                    	수업과 관련된 이미지를 등록하여<br/>수업을 어필해보세요. (선택)
                    </div>
                    <div style="text-align:center;margin:30px;">
                    <span class="img-add">이미지 추가</span>
                    <br/><br/>
                    <span style="font-size:35px;color:gray;">
                    이미지는 최대 4장까지 업로드 가능합니다.<br/>
                     이미지 취소를 원할 경우 해당 이미지를 클릭하세요.
                     </span>
                     <div style="color:gray;font-size:35px;">(이미지는 10MB이하 파일로 등록해주세요.)</div>
                    </div>
                    <div class="img-div">
                    
                    </div>
                    <div class="uploadDiv">
                      		<input name="contentimg" type="file" class="multi1" accept="image/*" onchange="check1(this);loadFile1(event);" />
                      		<input name="contentimg" type="file" class="multi2" accept="image/*" onchange="check22(this);loadFile2(event);"/>
                      		<input name="contentimg" type="file" class="multi3" accept="image/*" onchange="check3(this);loadFile3(event);" />
                      		<input name="contentimg" type="file" class="multi4" accept="image/*" onchange="check4(this);loadFile4(event);" />
              		</div>
                          <div>
                          <br/>
                           <div class="btn-div"> <span class="prev5 btn">이전단계</span> <span class="btn5 btn">다음단계</span></div>
                        </div>
                    </div>
                  
					<!-- 정책안내 -->
                  <div class="teacher-intr" id="teacher-intr" >
                  <div>콕사부 정책</div>
                   <div style="font-size:25px; line-height:130%;margin:20px auto;;border:1px solid black; padding:10px;">
                    안전거래를 통해 거래가 이루어진 경우 수업료의 5%가 안전결제 서비스 사용료로 부과됩니다.<br/>(직거래시 안전결제 서비스 사용료는 부과되지 않음.)<br/>서비스의 안전한 거래를 위하여 판매금을 서비스가 종료된 날짜를 기준으로 1-3일 후에 입금됨을 알립니다.<br/>입금 받을 계좌는 [마이페이지] -> [내 계정 정보 수정하기] 페이지에서 등록 할 수 있습니다.
                  </div>
				   <br/>
                  <div>취소 및 환불규정</div>
                  <div style="overflow:scroll;font-size:25px; line-height:140%;margin:20px auto;height:600px;border:1px solid black; padding:10px;">
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
<br/>
<div class="btn-div">
<span class="prev6 btn">이전단계</span> 
<label for="save" class="make-lesson">수업 만들기</label>
                    <input id="save" class="save btn" type="submit" value="동의하고 수업 만들기"/> 
                  </div>
                  </div>	
						
                  </form:form>
                </div>
                
                <img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;display:none;"/>
                
                <div style="height:200px;"></div>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>    
            <script>
            $(document).ready(function(){
            	
            	$('.m-jbMenu').append("수업 만들기");
            	
          	  var error = "<c:out value="${error}" />";
          	  
          	  if(error == "error"){
          		  alert("수업은 최대 3개까지만 등록 가능합니다.")
          		  window.history.back();
          	  }else if(error == "notPer1"){
          		  alert("입시(자소서/논술/면접) 영역을 제외한 다른 영역에서는 수업횟수를 한달 4,8,12회에서 선택해주세요.");
          		  window.history.back();
          	  }
          	  
          	  
          	
          	  
          		  var ipsiOpts = '<option class="onlyIpsi">3회분</option><option class="onlyIpsi">2회분</option><option class="onlyIpsi">1회분</option>'
            	  $('.service-cate').change(function(){
            		  if($('.service-cate>option:selected').index()!=0 && $('.service-cate>option:selected').index()!=7){
            			$('.onlyIpsi').remove();
            			$('.service-table').show();
            		  }else if($('.service-cate>option:selected').index()==7){
            			$('.service-table').show();
            			$('.price-standard').append(ipsiOpts);
            		  }else{
            			$('.service-table').hide();
            		  }
            	  });
          	  
          	  
              $('.teacher-intr').each(function(idx, item){
                    if(idx !=0){
                      $(this).hide();
                    }
                  });

                  $('.menu td').click(function(){
                    $('.td-trans').removeClass('td-trans');
                    $(this).addClass('td-trans');
                    var tdIdx = $(this).index();
                    $('.teacher-intr').each(function(idx, item){
                      if(tdIdx==idx){
                        $('.teacher-intr').eq(idx).show();
                      }else{
                        $('.teacher-intr').eq(idx).hide();
                      }
                    });
                  });
                  
                  $('.menu td:first').trigger('click');
                  
                  
                  $('.negotiation-possible').click(function(){
                	  $('.pri-neg-disable').removeClass('radio-back');
                	  $('.pri-neg-able').addClass('radio-back');
                  });
                  
				  $('.negotiation-notpossible').click(function(){
					  $('.pri-neg-able').removeClass('radio-back');
					  $('.pri-neg-disable').addClass('radio-back');
                  });
                  
                  
                  $('.btn1').click(function(){
                	  var re2 = /^[0-9]{1,}$/;
                	  var price = document.getElementById('price');
                	  var opt1price3 = document.getElementById('opt1price3');
                	  var opt2price3 = document.getElementById('opt2price3');
                	  var subcate1 = $('select[name=subCate1]>option:selected').index();
                	  var subcate2 = $('select[name=subCate2]>option:selected').index();
                	  
                	  var opIdx2 = $('.service-cate>option:selected').index();
                      if( opIdx2==0){
                          alert('제공하는 서비스를 선택해주세요.');
                      }else if(!check2(re2, price, "제공수업1의 가격을 숫자만 포함하여 입력해주세요.")){
                      }else if($('#price').val() > 2000000){
                       	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업1의 가격을 수정해주세요.")
                      }else if($('#price').val() < 10000){
                       	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업1의 가격을 수정해주세요.");
                      }else if(subcate1 != 0 && !check2(re2, opt1price3, "제공수업2의 가격을 숫자만 포함하여 입력해주세요.")){
                      }else if(subcate1 != 0 && $('#opt1price3').val() > 2000000){
                    	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업2의 가격을 수정해주세요.")
                      }else if(subcate1 != 0 && $('#opt1price3').val() < 10000){
                    	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업2의 가격을 수정해주세요.")
                      }else if(subcate2 != 0 && !check2(re2, opt2price3, "제공수업3의 가격을 숫자만 포함하여 입력해주세요.")){
                      }else if(subcate2 != 0 && $('#opt2price3').val() > 2000000){
                    	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업3의 가격을 수정해주세요.")
	                  }else if(subcate2 != 0 && $('#opt2price3').val() < 10000){
	                	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업3의 가격을 수정해주세요.")
	                  }else if(!$('input[name="priNegotiation"]').is(':checked')){
	                	  alert("'가격협의가능' 및 '가격협의불가' 중 하나를 선택해주세요. ")
	                  }else{
                    	 $('.menu td').eq(1).trigger('click');
                     }
                  })

                  $('.btn2').click(function(){
                	  var re1 = /^.{1,30}$/;
                	  var lessonTitle = document.getElementById('lesson-title');
                	  
                	  if($('#represent').val()==''){
                		  alert("수업 대표 이미지를 등록해주세요.");
                	  }else if(!check2(re1, lessonTitle, "제목을 30글자 내외로 작성해주세요.")) {
            	       }else{
            	    	   $('.menu td').eq(2).trigger('click');
            	       }
                  })

                  $('.btn3').click(function(){
                	  var lessonIntr = document.getElementById('lesson-intr');
                	  	 if($('input:checkbox[name="day"]:checked').length == 0){
                         	alert("수업 가능 요일을 체크해주세요.");
                     	 }else if($('input:checkbox[name="gawe"]:checked').length == 0){
                         	alert("개인과외, 화상과외 가능여부를 체크해주세요.");
                     	 }else if(lessonIntr.value.length<30){
                           alert('수업소개글을 최소 30글자 이상 작성해주세요.');
                         }else if(lessonIntr.value.length>500){
                            alert('수업소개글은 최대 500글자 미만입니다.');
                          }else{
                        	  $('.menu td').eq(3).trigger('click');    	  
                          }
                  });

                  $('.btn4').click(function(){
                	  var careerDesc = document.getElementById('careerDesc');
                	  if(careerDesc.value.length==0){
                          alert('선생님소개를 작성해주세요.');
                        }else if(careerDesc.value.length<30){
                          alert('선생님소개란을 최소 30글자 이상 작성해주세요.');
                        }else if(careerDesc.value.length>500){
                          alert('선생님소개는 최대 500글자 미만입니다.');
                        }else{
                        	$('.menu td').eq(4).trigger('click');
                        }
                  })
				  
                  $('.btn5').click(function(){
                          $('.menu td').eq(5).trigger('click');
                   });
                   
                   
                  $('.prev2').click(function(){
                	  $('.menu td').eq(0).trigger('click');
                  });
                  $('.prev3').click(function(){
                	  $('.menu td').eq(1).trigger('click');
                  });
                  $('.prev4').click(function(){
                	  $('.menu td').eq(2).trigger('click');
                  });
                  $('.prev5').click(function(){
                	  $('.menu td').eq(3).trigger('click');
                  });
                  $('.prev6').click(function(){
                	  $('.menu td').eq(4).trigger('click');
                  });
                  
                  
                  $('.service-cate').change(function(){
                      $('.seg-cate').each(function(){
                    	  $(this).hide();
                      });
                    	  
                      $('.seg-cate select').each(function(){
                		  $(this).attr("name","");
                	  });
                      var opIndex = $('.service-cate>option:selected').index();
                      
                      if(opIndex==0){
                        $('.seg-cate').hide();
                      }else{
                        $('.seg-cate').eq(opIndex-1).show();
                        $('.seg-cate').eq(opIndex-1).find('select').each(function(index, item){
                        		$(this).attr("name","subCate"+index);
                        });
                      }
                    });    
                  
                   
              var a ='<select class="career-op1">';
              for(var i=1990; i<2022; i++){
                a+='<option>'+i+'</option>';
              }
              a+='</select>';

              var b='<select class="career-op2">';
              for(var i=1; i<13; i++){
            	if(i<10){
            		 b +='<option>'+0+i+'</option>';
            	}else{
            		 b +='<option>'+i+'</option>';
            	}
               
              }
              b+='</select>';

              var c ='<select class="career-op3">';
              for(var i=1990; i<2022; i++){
                c+='<option>'+i+'</option>';
              }
              c+='</select>';

              var d='<select class="career-op4">';
              for(var i=1; i<13; i++){
            	  if(i<10){
             		 d +='<option>'+0+i+'</option>';
             	}else{
             		 d +='<option>'+i+'</option>';
             	}
              }
              d+='</select>';
              
              var k = '<div class="career-line">'+ a+'-'+b +' ~ '+c+'-'+d +'<br/> <input class="career-op career-disc" id="career-disc" type="text" /> &nbsp;&nbsp;&nbsp;<span class="btnc career-add">경력추가</span>'
              $('#career').append(k);
            });        
            
            $(document).on('keyup','#lesson-title',function(){
          	  var inputLength = $(this).val().length;
            	var remain = inputLength;
            	$('.title-length').html(remain);
              });
            
            $(document).on('keyup','#lesson-intr',function(){
            	  var inputLength = $(this).val().length;
              	var remain = inputLength;
              	$('.lesson-length').html(remain);
                });
            
            $(document).on('keyup','#careerDesc',function(){
            	  var inputLength = $(this).val().length;
              	var remain = inputLength;
              	$('.teach-length').html(remain);
                });
            
                        
            $(document).on('click','.del-btn',function(){
              var idx = $('.del-btn').index(this);
                $('.career-line').eq(idx).remove();
            });
            
            
            $(document).on('click','.career-add',function(){
            	var re3 =  /[*\|<>]/; 
          	  var careerDisc = document.getElementById('career-disc');
          	  
          	  if( re3.test(careerDisc.value) ){
              	  alert("경력창에 특수문자(*)는 사용할수 없습니다." );
              	  return false;
                }
          	  
          	  if($('#career-disc').val().length>=31 | $('#career-disc').val().length <= 1){
          		  alert('경력 창은 2글자 이상 30글자 이하로 작성하여 주시기 바랍니다.')
          		  return false;
          	  }
          	  
          	  if($('.ycareer').length>=10){
          		  alert('경력은 최대 10개까지 생성 가능합니다.');
          		  return false;
          	  }
          	  
          	
          	  
          	  var car1 = $('.career-op1>option:selected').val();
                var car2 = $('.career-op2>option:selected').val();
                var car3 = $('.career-op3>option:selected').val();
                var car4 = $('.career-op4>option:selected').val();
                var car5 = $('.career-op').val();
                
                var carFirst = car1+car2;
                var carSecond = car3+car4;

                if(carFirst>carSecond){
                	alert('경력시작 날짜가 종료날짜보다 뒤에 있을 수 없습니다.');
                	return false;
                }
                
                var career = car1+"."+car2+"~"+car3+"."+car4+" "+car5;
                var career1 = '<div class="car">'+car1+"."+car2+"~"+car3+"."+car4+" "+car5+'<span class="x-btn">X</span></div>';
                var career2 ='<input name="ycareer" class="ycareer" type="text" style="display:none;" value="'+career+'" />';
                
                $('.career-box').append(career1);
                
                $('.career-box').append(career2);
                
               });
                  
        
            
            $('.price-pri').keyup(function(){
        		$('.price-kor').text("("+viewKorean($(this).val())+")" );
        	});
            
            	
            $(document).on("click", ".x-btn", function(){
                var btnIndex = $(".x-btn").index(this);
                $('.car').eq(btnIndex).remove();
                $('.ycareer').eq(btnIndex).remove();
            });
            
            
            $(document).on('click', 'input:checkbox[name="subCate"]', function(){
          	  if($('input:checkbox[name="subCate"]:checked').length >= 4){
                	alert("세부 카테고리는 최대 3개까지 선택 가능합니다.");
            	  	return false;
            	 }
            });
            
            
            $('.delete-a').click(function(){
          	    var confirmflag = confirm("해당하는 수업을 삭제하시겠습까?");

          	    if(confirmflag){
          			return true;
          	       //확인 버튼 클릭 true 
          	    }else{
          			return false;
          	      //취소 버튼 클릭 false
          	    }
          	});

            
            
            $(document).on('click','.img-add',function(){
            	//버튼을 클릭하면 자동으로 이미지 파일 생성 하지만 파일 추가하지 않고 취소시 이미지를 삭제해야 하므로 이 작업 진행
            	if($('#output1').length==1){
            		if($('#output1').attr('src') == ''){
            			$('#output1').remove();
            		}
            	}
            	//아웃풋2가 이미지가 등록되어있지 않을시 삭제후 진행
            	if($('#output2').length==1){
            		if($('#output2').attr('src') == ''){
            			$('#output2').remove();
            		}
            	}
            	//아웃풋3가 이미지가 등록되어있지 않을시 삭제후 진행
            	if($('#output3').length==1){
            		if($('#output3').attr('src') == ''){
            			$('#output3').remove();
            		}
            	}
            	//아웃풋4가 이미지가 등록되어있지 않을시 삭제후 진행
            	if($('#output4').length==1){
            		if($('#output4').attr('src') == ''){
            			$('#output4').remove();
            		}
            	}
            	
            	if($('.multi1').val()=='' && $('#output1').length==0){
            		$('.img-div').append('<img id="output1" style="width:50%;display:none;" src=""/>');
               	 	$('.multi1').trigger('click');
            	}else if($('.multi2').val()=='' && $('#output2').length==0){
            		$('.img-div').append('<img id="output2" style="width:50%;display:none;" src=""/>');
            		$('.multi2').trigger('click');
            	}else if($('.multi3').val()=='' && $('#output3').length==0){
            		$('.img-div').append('<img id="output3" style="width:50%;display:none;" src=""/>');
            		$('.multi3').trigger('click');
            	}else if($('.multi4').val()=='' && $('#output4').length==0){
            		$('.img-div').append('<img id="output4" style="width:50%;display:none;" src=""/>');
            		$('.multi4').trigger('click');
            	}
       		});
          	  
          	 $(document).on('click','#output1',function(){
             	//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
             		$('.multi1').remove();
             		$(this).remove();
             		$('.uploadDiv').append('<input name="contentimg" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />');
             });

             $(document).on('click','#output2',function(){
             		$('.multi2').remove();
             		$(this).remove();
             		$('.uploadDiv').append('<input name="contentimg" class="multi2" type="file" accept="image/*" onchange="check22(this);loadFile2(event);" />');
             });
             
             $(document).on('click','#output3',function(){
             		$('.multi3').remove();
             		$(this).remove();
             		$('.uploadDiv').append('<input name="contentimg" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />');
             });
          	  
             $(document).on('click','#output4',function(){
              		$('.multi4').remove();
              		$(this).remove();
              		$('.uploadDiv').append('<input name="contentimg" class="multi4" type="file" accept="image/*" onchange="check4(this);loadFile4(event);" />');
              });
          	  
          	 $(document).on('change','.multi1',function(){
             	$('#output1').css('display','');
             });
             
             $(document).on('change','.multi2',function(){
             	$('#output2').css('display','');
             });
             
             $(document).on('change','.multi3',function(){
             	$('#output3').css('display','');
             });
          	  
             $(document).on('change','.multi4',function(){
              	$('#output4').css('display','');
              });
            
            
            
            
             function checkLesson(member){
              	   var re1 = /^.{1,30}$/;
                   var re2 = /^[0-9]{1,}$/;
                   
                   var serviceCate = document.getElementById('service-cate');
                   var teacherInt = document.getElementById('teacher-int');
                   var lessonTitle = document.getElementById('lesson-title');
                   var lessonIntr = document.getElementById('lesson-intr');
                   var price = document.getElementById('price');
                   var careerDesc = document.getElementById('careerDesc');
                   
                   var price = document.getElementById('price');
             	   var opt1price3 = document.getElementById('opt1price3');
             	   var opt2price3 = document.getElementById('opt2price3');
             	   var subcate1 = $('select[name=subCate1]>option:selected').index();
             	   var subcate2 = $('select[name=subCate2]>option:selected').index();
             	  
             	   var opIdx2 = $('.service-cate>option:selected').index();
                   
             	   if( opIdx2==0){
                       alert('제공하는 서비스를 선택해주세요.');
                       $('.menu td:first').trigger('click');
                       return false;
                   }
                   
                   if(!check2(re2, price, "제공수업1의 가격을 숫자만 포함하여 입력해주세요.")){
                	   $('.menu td:first').trigger('click');
                       return false;
                   }
                   
    			   if($('#price').val() > 2000000){
                    	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업1의 가격을 수정해주세요.")
                    	  $('.menu td:first').trigger('click');
                          return false;
                   }
                   
                   if($('#price').val() < 10000){
                    	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업1의 가격을 수정해주세요.");
                    	  $('.menu td:first').trigger('click');
                          return false;
                   }
                   
                   
                   if(subcate1 != 0 && !check2(re2, opt1price3, "제공수업2의 가격을 숫자만 포함하여 입력해주세요.")){
                	   $('.menu td:first').trigger('click');
                       return false;
                   }
                   
                   if(subcate1 != 0 && $('#opt1price3').val() > 2000000){
                 	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업2의 가격을 수정해주세요.");
                 	 $('.menu td:first').trigger('click');
                      return false;
                   }
    			   if(subcate1 != 0 && $('#opt1price3').val() < 10000){
                 	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업2의 가격을 수정해주세요.");
                 	 $('.menu td:first').trigger('click');
                     return false;
                   }
                   
                   if(subcate2 != 0 && !check2(re2, opt2price3, "제공수업3의 가격을 숫자만 포함하여 입력해주세요.")){
                	   $('.menu td:first').trigger('click');
                       return false;
                   }
                   
                   if(subcate2 != 0 && $('#opt2price3').val() > 2000000){
                 	  alert("수업가격은 최대 200만원을 넘을 수 없습니다. \n 제공수업3의 가격을 수정해주세요.");
                 	 $('.menu td:first').trigger('click');
                     return false;
                   }
                  
                   if(subcate2 != 0 && $('#opt2price3').val() < 10000){
                 	  alert("수업가격은 최소 1만원을 이상입니다. \n 제공수업3의 가격을 수정해주세요.");
                 	 $('.menu td:first').trigger('click');
                     return false;
                   }
                   
                   if(!$('input[name="priNegotiation"]').is(':checked')){
                    	  alert("'가격협의가능' 및 '가격협의불가' 중 하나를 선택해주세요. ")
                    	  $('.menu td:first').trigger('click');
                        return false;
                      }
                   
                  
                  if($('#represent').val()==''){
                	  alert("수업 대표 이미지를 등록해주세요.");
                	  $('.menu td').eq(1).trigger('click');
                	  return false;
                  }
                  
                  if(!check2(re1, lessonTitle, "[수업제목]페이지의 제목을 30글자 내외로 작성해주세요.")) {
                	   $('.menu td').eq(1).trigger('click');
         	           return false;
         	       }

                  if($('input:checkbox[name="day"]:checked').length == 0){
                   	alert("[수업정보]페이지의 수업 가능 요일을 체크해주세요.");
                   	$('.menu td').eq(2).trigger('click');
               	  	return false;
               	  }
                 
                  if($('input:checkbox[name="gawe"]:checked').length == 0){
                   	alert("[수업정보]페이지의 개인과외, 화상과외 가능여부를 체크해주세요.");
                	$('.menu td').eq(2).trigger('click');
               	  	return false;
               	  }
                 
                   
                  if(lessonIntr.value.length<30){
                     alert('[수업정보]페이지의 수업소개글을 최소30글자 이상 작성해주세요.');
                     $('.menu td').eq(2).trigger('click');
                     return false;
                   }
                  if(lessonIntr.value.length>500){
                      alert('[수업정보]페이지의 수업소개글은 최대 500글자 미만입니다.');
                  	$('.menu td').eq(2).trigger('click');
                      return false;
                    }
                  if(careerDesc.value.length<30){
                      alert('[선생님소개]페이지의 선생님소개를 최소 30글자 이상 작성해주세요.');
                  	$('.menu td').eq(3).trigger('click');
                      return false;
                    }
                  if(careerDesc.value.length>500){
                      alert('[선생님소개]페이지의 선생님소개는 최대 500글자 미만입니다.');
                  	$('.menu td').eq(3).trigger('click');
                      return false;
                    }
                  
                  var broswerInfo = navigator.userAgent;
           	      //ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
           	      if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
           	            $('#spinner').show();
          	      }
                  
               } 

          
           
           
           var loadFile = function(event) {
          	    var reader = new FileReader();
          	    reader.onload = function(){
          	      var output = document.getElementById('output');
          	      output.src = reader.result;
          	    };
          	    reader.readAsDataURL(event.target.files[0]);
          	  };
           
          	var loadFile1 = function(event) {
        	    var reader = new FileReader();
        	    reader.onload = function(){
        	      var output = document.getElementById('output1');
        	      output.src = reader.result;
        	    };
        	    reader.readAsDataURL(event.target.files[0]);
        	  };	  
          	  
          	var loadFile2 = function(event) {
        	    var reader = new FileReader();
        	    reader.onload = function(){
        	      var output = document.getElementById('output2');
        	      output.src = reader.result;
        	    };
        	    reader.readAsDataURL(event.target.files[0]);
        	  };
            
        	  var loadFile3 = function(event) {
          	    var reader = new FileReader();
          	    reader.onload = function(){
          	      var output = document.getElementById('output3');
          	      output.src = reader.result;
          	    };
          	    reader.readAsDataURL(event.target.files[0]);
          	  };
              
          	var loadFile4 = function(event) {
        	    var reader = new FileReader();
        	    reader.onload = function(){
        	      var output = document.getElementById('output4');
        	      output.src = reader.result;
        	    };
        	    reader.readAsDataURL(event.target.files[0]);
        	  };
            
        	 
          	  
           function check2(re, what, message) {
              if(re.test(what.value)) {
                return true;
              }
              alert(message);
              what.value = "";
              what.focus();
              //return false;
           }
           
           function check(obj){
        	   var file = obj.files;

           	// file[0].size 는 파일 용량 정보입니다.
           	if(file[0].size > 1024*1024*10){
           		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
           		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           		document.getElementsByName("represent")[0].value = ""; 
           		  return false;
           	}
        	   
              	var pathpoint = obj.value.lastIndexOf('.');
              	var filepoint = obj.value.substring(pathpoint+1,obj.length);
              	var filetype = filepoint.toLowerCase();
                   // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
                   if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
                   }else{
                	   alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
                     	document.getElementsByName("represent")[0].value = ""; 

   					return false;
                   }
              }            
           
           function check1(obj){
            	   var file = obj.files;

               	// file[0].size 는 파일 용량 정보입니다.
               	if(file[0].size > 1024*1024*10){
               		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
               		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
               		$("#output1").trigger('click');
               		  return false;
               	}
               	
              	var pathpoint = obj.value.lastIndexOf('.');
              	var filepoint = obj.value.substring(pathpoint+1,obj.length);
              	var filetype = filepoint.toLowerCase();
                   // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
                   if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
                   }else{
                	   alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
                     	$("#output1").trigger('click');
                     	 return false;
                   }
              }    
           
           function check22(obj){
        	   var file = obj.files;

              	// file[0].size 는 파일 용량 정보입니다.
              	if(file[0].size > 1024*1024*10){
              		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
              		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
              		$("#output2").trigger('click');
              		  return false;
              	}
              	
              	var pathpoint = obj.value.lastIndexOf('.');
              	var filepoint = obj.value.substring(pathpoint+1,obj.length);
              	var filetype = filepoint.toLowerCase();
                   // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
                   if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
                   }else{
                	   alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
                     	$("#output2").trigger('click');
                     	 return false;
                   }
                   
              	
              }    
           
           function check3(obj){
        	   var file = obj.files;

              	// file[0].size 는 파일 용량 정보입니다.
              	if(file[0].size > 1024*1024*10){
              		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
              		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
              		$("#output3").trigger('click');
              		  return false;
              	}
              	
              	var pathpoint = obj.value.lastIndexOf('.');
              	var filepoint = obj.value.substring(pathpoint+1,obj.length);
              	var filetype = filepoint.toLowerCase();
                   // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
                   if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
                   }else{
                	   alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
                     	$("#output3").trigger('click');
                     	 return false;
                   }
                   
              
              }    
           
           function check4(obj){
        	   var file = obj.files;

              	// file[0].size 는 파일 용량 정보입니다.
              	if(file[0].size > 1024*1024*10){
              		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
              		alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
              		$("#output4").trigger('click');
              		  return false;
              	}
              	
              	var pathpoint = obj.value.lastIndexOf('.');
              	var filepoint = obj.value.substring(pathpoint+1,obj.length);
              	var filetype = filepoint.toLowerCase();
                   // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
                   if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
                   }else{
                	   alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
                     	$("#output4").trigger('click');
                     	 return false;
                   }
           }
           
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
           
           
           $(window).bind("pageshow", function(event) {
           		$('#spinner').hide();
	       });
             </script>
</body>
</html>