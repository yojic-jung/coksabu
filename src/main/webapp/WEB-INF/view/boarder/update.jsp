<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>수업수정 콕사부</title>
 <meta name="description" content="나의수업 수정하기 페이지" />
<meta charset="utf-8">

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
          .update{
           border-radius:5px;
           border:1px solid gray; 
           background:gray; 
           color:white; 
           text-decoration:none;
           padding:3px;
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
        
        #represent{
        	display:none;
        }
        
        #imgplus{
        	width:50px;height:50px;
        	backgroud:white;
        	border-radius:15px;
        	border:2px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-50px;
        }
        

        .menu td{
        font-family: 'JejuGothic'; 
        width:120px;
        float:left;
        text-align:center;
        padding:20px;
        cursor:pointer;
      }
      .menu-td{
        background:rgb(63, 63, 61);
        color:white;
      }
      .td-trans{
        background:white;
        color:rgb(63, 63, 61);
        border-top: 5px solid rgb(63, 63, 61);
      }
      .btn{
        margin:0px 10px;
        font-size:15px;
        border-radius:5px;
        padding:10px;
        cursor:pointer;
        background:rgb(75, 74, 74);
        color:white;
      }
      .save{
       background:orange;
      width:200px;
      border:none;
       font-size:15px;
        border-radius:5px;
        padding:10px;
      }
      .btnc{
        font-size:13px;
        border-radius:5px;
        padding:5px;
         background: rgb(75, 74, 74);
        color:white;
        cursor:pointer;
      }
      .x-btn{
      	margin-left:10px;
      	font-size:10px;
      	padding:2px;
      	border-radius:5px;
      	background:rgb(63, 63, 61);
        color:white;
        cursor:pointer;
      }
      .service-cate {
        width:150px; padding:7px;
        font-size:18px; border-radius:2px;
        margin-top:10px;
        height:40px;
      }
      .seg-cate{
      	width:650px; padding:7px;
        font-size:18px; border-radius:2px;
        line-height:170%;
        margin-top:10px;
      }
	  
	  .btn-div{
	  	width:650px;text-align:center;
	  	margin:20px auto;
	  }
      
      .teacher-intr{
        font-size:20px;
        font-family: 'JejuGothic'; 
        width:650px;
        min-height:400px;
        margin:30px auto;
        line-height:180%;
      }
      .career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
        padding:7px;
        font-size:18px;
        margin-top:10px;
      }

      .career-disc{
        width:300px;
      }
	
	  .career-box{
		border:0.5px solid gray; 
		width:600px;
		min-height:50px; 
		margin-top:20px;
		font-size:18px;
		padding:6px;
		color:gray;
		}
      .del-btn{
        color:white;
        background:rgb(63, 63, 61);
        border-radius:3px;
        padding:3px;
      }
      .del-div{
      	text-align:center;
      	width:180px; margin:10px;
      }
      .del1, .del2, .del3, .del4{
     	cursor:pointer;
      	border-radius:5px;
      	padding:3px;
      	color:white;
      	background:dimgray;
      	font-size:10px;
      	text-decoration:none;
      }

    .td-locale{
        background: rgb(151, 149, 149);
        color:white;
        border-radius:5px;
        padding:5px;
        margin-right:10px;
        font-size:12px;
    }
    
    #output1, #output2, #output3, #output4{
     	width:180px; height:180px;margin:10px;
      }
      .multi1, .multi2, .multi3, .multi4{
      display:none;
      }
      .img-add{
      	padding:10px;
      	border-radius:15px;
      	background:black;
      	color:white;
      	cursor:pointer;
      }
      .img-div{
      	min-height:200px;
      	width:480px;margin:auto;
      }
      
      .price-standard, .price-time, .price-standard2, .price-time, .price-time2, .price-pri{
      	font-size:18px;padding:7px;height:40px;
      }
    </style>
<title>수업 수정</title>
</head>
<body>
			<div style="list-style:none; background:rgb(63, 63, 61);padding:0px; ">
                   <div>
					<span style="float:left;clear:right;font-size:20px; padding:15px;">
						<a href="./tutorpage" style="color:white;text-decoration:none;">&lt;뒤로가기</a></span>
                    <table class="menu" style="width:740px;margin:auto;">
                      <tr>
                      <td class="menu-td">서비스</td>
                      <td class="menu-td">수업제목</td>
                      <td class="menu-td">수업정보</td>
                      <td class="menu-td">선생님소개</td>
                      <td class="menu-td">미디어</td>
                      <td class="menu-td">정책안내</td>
                      </tr>
                    </table>

                  </div>
               </div>
                  <div style="list-style:none;width:740px;margin:auto; ">    
                  <!-- 메뉴 -->

                  <form:form commandName="card" method="post" enctype="multipart/form-data"  onSubmit="return checkLesson(this)">
					<input name="id" type="hidden" value="${lesson.id}"/>
					<input name="email" type="hidden" value="<%= (String)session.getAttribute("email") %>"/>
                  <!-- 선생님 소개 -->
                    <div class="teacher-intr" >
                    
                        <div style="margin-top:20px;line-height:180%;">
                          	서비스 카테고리<br/>
                          	 <span style="margin-bottom:5px;font-size:18px;"> ※카테고리별 가격이 다르다면 수업을 별도로 만드시기 바랍니다.</span><br/>
                          <select name="cate" class="service-cate" id="service-cate">
                            <option>--선택--</option>
                            <option>수학</option>
                            <option>외국어</option>
                            <option>국어</option>
                            <option>사회</option>
                            <option>과학</option>
                            <option>예체능</option>
                            <option>자소서/입시</option>
                          </select>
                          
                          <select name="cate" class="service-cate2" id="service-cate" style="display:none">
                            <option>--선택--</option>
                            <option>수학</option>
                            <option>외국어</option>
                            <option>국어</option>
                            <option>사회</option>
                            <option>과학</option>
                            <option>예체능</option>
                            <option>자소서/입시</option>
                          </select>
                          
                          
                          <div style="margin-top:40px;">
                        	<table style="font-size:15px;border-spacing:20px 15px;width:100%;">
                        		<tr>
                        			<td></td><td>제공 수업1</td><td>제공 수업2</td><td>제공 수업3</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        			<td style="font-size:15px">세부 카테고리</td>
                        			<td>
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                     	 	 			<option>고등수학</option>
                      	   	  			<option>문과수학</option>
                     	     			<option>고등수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학논술</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                     	 	 			<option>고등수학</option>
                      	   	  			<option>문과수학</option>
                     	     			<option>고등수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학논술</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	 	 		<option value="nonevalue">선택없음</option>
                        	 	 		<option>초등수학</option>
                        	  			<option>중등수학</option>
                     	 	 			<option>고등수학</option>
                      	   	  			<option>문과수학</option>
                     	     			<option>고등수학</option>
                          	  			<option>이과수학</option>
                          	  			<option>수학논술</option>
                          	  			<option>수학경시</option>
                        			</select>
                        			</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        			<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                     	      		<option>국어논술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	 	 	<option value="nonevalue">선택없음</option>
                        	 	 	<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                     	      		<option>국어논술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>초등국어</option>
                        	  		<option>중등국어</option>
                     	 	  		<option>고등국어</option>
                      	   	  		<option>수능국어</option>
                     	      		<option>국어논술</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option>미술</option>
                        	  		<option>음악</option>
                     	 	  		<option>체육</option>
                     	 	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>미술</option>
                        	  		<option>음악</option>
                     	 	  		<option>체육</option>
                     	 	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>미술</option>
                        	  		<option>음악</option>
                     	 	  		<option>체육</option>
                     	 	  		<option>유아미술</option>
                     	 	  		<option>초등미술</option>
                     	 	  		<option>중등미술</option>
                     	 	  		<option>고등미술</option>
                     	 	  		<option>성인미술</option>
                        		</select>
                        		</td>
                        		</tr>
                        		<tr class="seg-cate" style="display:none" >
                        		<td style="font-size:15px">세부 카테고리</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        		</select>
                        		</td>
                        		<td>
                        		<select style="font-size:15px;padding:7px;height:40px; width:130px;">
                        	  		<option value="nonevalue">선택없음</option>
                        	  		<option>자소서첨삭</option>
                        	  		<option>입시컨설팅</option>
                        		</select>
                        		</td>
                        		</tr>
                        		
                        		<tr>
                        			<td>수업기준</td>
                        			<td>
                        			<select name="price1" class="price-standard" style="font-size:15px;padding:7px;height:40px; width:130px;">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        			<td>
                        			<select name="opt1price1" class="price-standard opt1price1" style="font-size:15px;padding:7px;height:40px; width:130px;">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        			<td>
                        			<select name="opt2price1" class="price-standard opt2price1" style="font-size:15px;padding:7px;height:40px; width:130px;">
                        				<option>한달 12회</option>
                        				<option>한달 8회</option>
                        				<option>한달 4회 </option>
                     				</select>
                        			</td>
                        		</tr>
                        		<tr>
                        			<td>회당수업시간</td>
                        			<td>
                        			<select name="price2" class="price-time"  style="font-size:15px;padding:7px;height:40px; width:130px;">
                          				<option>60분</option>
                          				<option>90분</option>
                          				<option>2시간</option>
                          				<option>2시간 30분</option>
                          				<option>3시간</option>
                          				<option>4시간</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select name="opt1price2" class="price-time opt1price2"  style="font-size:15px;padding:7px;height:40px; width:130px;">
                          				<option>60분</option>
                          				<option>90분</option>
                          				<option>2시간</option>
                          				<option>2시간 30분</option>
                          				<option>3시간</option>
                         				<option>4시간</option>
                        			</select>
                        			</td>
                        			<td>
                        			<select name="opt2price2" class="price-time opt2price2"  style="font-size:15px;padding:7px;height:40px; width:130px;">
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
                        			<td>가격</td>
                        			<td>
                        			<input name="price3" style="text-align: right;;padding: 7px; width:130px;font-size:15px;" class="price-pri1" type="text" id="price" placeholder="숫자만 입력"  value="${lesson.price3}" />원
                      				<br/>
                      				<span class="price-kor1"></span>
                        			</td>
                        			<td>
                        			<input name="opt1price3" style="text-align: right;;padding: 7px; width:130px;font-size:15px;" class="price-pri2 opt1price3" type="text" id="opt1price3" placeholder="숫자만 입력" value="${lesson.opt1price3}" />원
                      				<br/>
                      				<span class="price-kor2"></span>
                        			</td>
                        			<td>
                        			<input name="opt2price3" style="text-align: right;;padding: 7px; width:130px;font-size:15px;" class="price-pri3 opt2price3" type="text" id="opt2price3" placeholder="숫자만 입력"  value="${lesson.opt2price3}"/>원
                      				<br/>
                      				<span class="price-kor3"></span>
                        			</td>
                        		</tr>
                        		
                        	</table>
                        	
                        </div>
                          
                        </div><br>
                        
                     <div class="btn-div"> <span class="btn1 btn">다음단계</span></div>
                    </div>
                    
                    <!-- 선생님 -->
                    <div class="teacher-intr" >
                    <div>
                    		수업 대표 이미지<br/>
                    		<span style="color:gray; font-size:18px;margin:15px 0px 15px 0px;">수업을 대표하는 이미지나 선생님 사진을 넣어주세요.</span> <br/>
                        <img id="output" style="width:240px; height:240px;" src="<c:url value="/img/representImg/${lesson.represent}" />"  alt="수업대표이미지"/>
                        <br/>
                    	<div style="width:240px;text-align:right;">
							<img id="imgplus" src="<c:url value="/resources/images/imgplus.png" />"  />
						</div>
                        <input type="file" name="represent" id="represent" accept="image/*" onchange="check(this);loadFile(event)" />
                        
                    	</div>
                    
                     <div>
                        <br/> 
                        제목<br/>
                        <span style="color:gray; font-size:18px;">제목을 30글자 미만으로 적어주세요.(<span class="title-length">0</span>/30)</span><br/>
                        <input name="title" type="text" id="lesson-title" style="margin-top:10px;width:570px;
                         padding:7px; font-size:18px;" placeholder="수업제목을 30자 내외로 적어주세요." value="${lesson.title}" />
                      </div>
                      <div>
                        <br/> <br/>

                      </div>
                      <div class="btn-div"><span class="prev2 btn">이전단계</span>  <span class="btn2 btn">다음단계</span> </div>
                    </div>
                    
                  <!-- 수업 소개 -->
                    <div class="teacher-intr" >
                    수업 가능 요일 <br/>
                   <span style="color:gray; font-size:18px; margin-top:10px;"> 
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="월" /> 월</label> &nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="화" /> 화</label> &nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="day" value="수" /> 수 </label>&nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="목" /> 목</label> &nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="금" /> 금</label> &nbsp;
                   <label style="cursor:pointer"> <input type="checkbox" name="day" value="토" /> 토 </label>&nbsp;
                    <label style="cursor:pointer"><input type="checkbox" name="day" value="일" /> 일</label></span>
                    <br/><br/>
                    수업 형태<br/>
                   <span style="color:gray; font-size:18px; margin-top:10px;">
                   <label style="cursor:pointer"><input type="checkbox" name="gawe" value="개인 과외 가능" /> 개인 과외 가능 </label>&nbsp;
                   <label style="cursor:pointer"><input type="checkbox" name="gawe" value="화상 과외 가능" /> 화상 과외 가능</label></span>
                   <br/><br/>
                   시범수업<br/>
                   <span style="color:gray; font-size:18px; margin-top:10px;">
                   <label style="cursor:pointer"><input type="checkbox" name="trial" class="free" value="시범수업 무료" /> 시범수업 무료</label></span>
                   <br/><br/>
                        수업 소개 <br/>
                         <span style="color:gray; font-size:18px; margin-top:10px">수업 형태나 학습목표, 커리큘럼에 대해 자세히 적어주세요.(<span class="lesson-length">0</span>/500)</span>
                        <textarea name="lesson" id="lesson-intr" rows="10" cols="75" style="font-size:15px;padding:5px; line-height:160%;overflow-y:scroll;margin-top:10px;">${lesson.lesson}</textarea>
                        <br/><br/>
                        <div class="btn-div"><span class="prev3 btn">이전단계</span>  <span class="btn3 btn">다음단계</span> </div>
                    </div>
                   
                  <!-- 경력사항 -->
                    <div class="teacher-intr" >
                        선생님 경력<br/>
                        <span style="color:gray; font-size:18px;">경력이 없으신 경우 생략가능합니다.</span><br/>
                        <div class="career"  id="career" >
                        
                        </div>
                        <div style="width:600px;margin:10px auto; text-align:right; ">
                        <span class="btnc career-add">경력추가</span>
                        </div>
                        <div class="career-box" >
                        </div>
                        <br/>
                        
                          선생님 소개<br/>
                        <span style="color:gray; font-size:18px; margin-top:10px">선생님의 지도성향이나 학습방식, 경력 등을 자세하게 서술해주세요.(<span class="teach-length">0</span>/500)</span><br/>
                        <textarea id="careerDesc" name="description" rows="10" cols="75" style="font-size:15px; padding:5px; line-height:140%;overflow-y:scroll;margin-top:10px;">${lesson.description}</textarea>
                        <br/><br/>    
                        <div class="btn-div"><span class="prev4 btn">이전단계</span>  <span class="btn4 btn">다음단계</span> </div>
                    </div>
                   
                  <!-- 미디어 -->
                    <div class="teacher-intr" id="teacher-intr" >
                       <div style="text-align:center; font-family:'JejuGothic'; font-size:16px;">
                    	수업과 관련된 이미지를 등록하여 수업을 홍보해보세요. (선택)
                    	</div>
                    	<div style="text-align:center;margin:30px;">
                    	<span class="img-add">이미지 추가</span>
                    	<br/><br/>
                    	<span style="font-size:12px;color:gray;">
                    	이미지는 최대 4장까지 업로드 가능합니다<br/>.
                   		이미지 취소를 원할 경우 해당 이미지를 클릭하면 됩니다.
                     	</span><br/>
                    	</div>
                    
					
					<div class="img-div">
        			</div>
        
        			<div class="uploadDiv">
                      		<input name="contentimg" type="file" class="multi1" accept="image/*" onchange="check1(this);loadFile1(event);" />
                      		<input name="contentimg" type="file" class="multi2" accept="image/*" onchange="check22(this);loadFile2(event)"/>
                      		<input name="contentimg" type="file" class="multi3" accept="image/*" onchange="check3(this);loadFile3(event)" />
                      		<input name="contentimg" type="file" class="multi4" accept="image/*" onchange="check4(this);loadFile4(event)" />
					</div>
					
					<div>
        				<div class="del-div1"></div>
        				<div class="del-div2"></div>
        				<div class="del-div3"></div>
        				<div class="del-div4"></div>
        			</div>
                          <div>
                            <br/>
                         <div class="btn-div"><span class="prev5 btn">이전단계</span>  <span class="btn5 btn">다음단계</span> </div>
                        </div>
                    </div>
                  
                  <!-- 정책안내 -->
                  <div class="teacher-intr" id="teacher-intr" >
                   <div>콕사부 정책</div>
                  <div style="font-size:15px; line-height:130%;margin:20px auto;;border:1px solid black; padding:10px;">
                   콕사부의 중개 수수료는 20%이며 이를 제외한 80%는 선생님에게 전달됩니다.<br/>(수수료는 수수료 이벤트와  같은 경우에 한시적으로 달라질 수 있음.)<br/> 서비스의 안전한 거래를 위하여 판매금을 서비스가 종료된 날짜를 기준으로 1-3일 후에 입금됨을 알립니다.<br/>입금 받을 계좌는 [마이페이지] -> [내 계정 정보 수정하기] 페이지에서 등록 할 수 있습니다.
                  </div>
                  <div>취소 및 환불규정</div>
                  <div style="overflow:scroll;font-size:15px; line-height:130%;margin:20px auto;height:240px;border:1px solid black; padding:10px;">
가. 수업 환불기준 원칙<br/>
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
                   <div class="btn-div"> <span class="prev6 btn">이전단계</span> <input class="save btn" type="submit" value="수정하기"/> </div>
                  </div>

                  </form:form>
                </div>
                
                <div style="height:200px;"></div>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>    
            <script>
            $(document).ready(function(){
            	 $('.teacher-intr').each(function(idx, item){
                     if(idx !=0){
                       $(this).hide();
                     }
                   });
            	
            	 $("#imgplus").click(function(){
             		$('#represent').trigger("click");
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
            	 
            	 
            	 
            	 $('.btn1').click(function(){
            		var re2 = /^[0-9]{1,}$/;
               	  	var price = document.getElementById('price');
               	  	var opt1price3 = document.getElementById('opt1price3');
               	  	var opt2price3 = document.getElementById('opt2price3');
               	  	var subcate1 = $('select[name=subCate1]>option:selected').index();
               	  	var subcate2 = $('select[name=subCate2]>option:selected').index();
               	  
            		 if(!check2(re2, price, "제공수업1의 가격을 숫자만 포함하여 입력해주세요.")){
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
	                  }else{
                   	 $('.menu td').eq(1).trigger('click');
                    }
                 })

                 $('.btn2').click(function(){
               	  var re1 = /^.{1,30}$/;
               	  var lessonTitle = document.getElementById('lesson-title');
               	  
               	  if(!check2(re1, lessonTitle, "제목을 30글자 내외로 작성해주세요.")) {
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
                     	 }else if(lessonIntr.value.length<100){
                           alert('수업소개글을 최소 100글자 이상 작성해주세요.');
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
                       }else if(careerDesc.value.length<100){
                         alert('선생님소개란을 최소 100글자 이상 적어주세요.');
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
                  
                  
                  
                   $('.menu td:first').trigger('click');
                   
         			
                   var cate = "<c:out value="${lesson.cate}" />";
                   $('.service-cate').val(cate).prop("selected",true);
                   $('.service-cate').val(cate).prop("disabled",true);
                   $('.service-cate2').val(cate).prop("selected",true);
                   
                   
                   var opIdx = $('.service-cate>option:selected').index();
                   if(opIdx==-1){
                   	$('.service-cate').val('--선택--').trigger('change');
                   }
                   else{
                   	$('.seg-cate').eq(opIdx-1).show();
                   	$('.seg-cate').eq(opIdx-1).find('select').each(function(index, item){
                		$(this).prop("name","subCate"+index);
                	});
                   	
                       var subcate0 = "<c:out value="${lesson.subCate0}" />";
                       var subcate1 = "<c:out value="${lesson.subCate1}" />";
                       var subcate2 = "<c:out value="${lesson.subCate2}" />";
                       
                       $('select[name=subCate0]').each(function(index, item){
                    	   $(this).val(subcate0).prop("selected", true);
                       });
                       $('select[name=subCate1]').each(function(index, item){
                    	   $(this).val(subcate1).prop("selected", true);
                       });
                       $('select[name=subCate2]').each(function(index, item){
                    	   $(this).val(subcate2).prop("selected", true);
                       });
                   }
                   
                     
                   var price1 = "<c:out value="${lesson.price1}" />";
                   var price2 = "<c:out value="${lesson.price2}" />";
                   var opt1price1 = "<c:out value="${lesson.opt1price1}" />";
                   var opt1price2 = "<c:out value="${lesson.opt1price2}" />";
                   var opt2price1 = "<c:out value="${lesson.opt2price1}" />";
                   var opt2price2 = "<c:out value="${lesson.opt2price2}" />";
                   $('select[name=price1]').each(function(idx, item){
                	   $(this).val(price1).prop("selected",true);
                   })
                   $('select[name=price2]').each(function(idx, item){
                	   $(this).val(price2).prop("selected",true);
                   })
                   $('select[name=opt1price1]').each(function(idx, item){
                	   $(this).val(opt1price1).prop("selected",true);
                   })
                   $('select[name=opt1price2]').each(function(idx, item){
                	   $(this).val(opt1price2).prop("selected",true);
                   })
                   $('select[name=opt2price1]').each(function(idx, item){
                	   $(this).val(opt2price1).prop("selected",true);
                   })
                   $('select[name=opt2price2]').each(function(idx, item){
                	   $(this).val(opt2price2).prop("selected",true);
                   })
                   
                   
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
                     
                     var k = '<div class="career-line">'+ a+'-'+b +' ~ '+c+'-'+d +' <input class="career-op career-disc" id="career-disc" type="text" />'
                     $('#career').append(k);

                     var careerDB = "<c:out value="${lesson.careerDB}" />";
                     if(careerDB!=""){
                     	var careerDB2= careerDB.split("*");
                     	for(var i=0; i<careerDB2.length; i++){
                     		 var careerU = '<div class="car">'+careerDB2[i]+'<span class="x-btn">x</span></div>';
                              var careerU2 ='<input name="ycareer" class="ycareer" type="text" style="display:none;" value="'+careerDB2[i]+'" />';
                              $('.career-box').append(careerU);
                              
                              $('.career-box').append(careerU2);
                     	}
                     }
                     
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
                   
                   
                       var day = "<c:out value="${lesson.day}" />";
                       var days = day.split(',');
                       $('input[name="day"]').each(function(){
                       	for(var i=0; i<days.length; i++){
                       		if($(this).val()==days[i])
                             	  $(this).attr("checked",true);
                       	}
                       });
                       var gawe = "<c:out value="${lesson.gawe}" />";
                       var gawes = gawe.split(',');
                       $('input[name="gawe"]').each(function(){
                       	for(var i=0; i<gawes.length; i++){
                       		if($(this).val()==gawes[i])
                             	  $(this).attr("checked",true);
                       	}
                       });
                       var trial = "<c:out value="${lesson.trial}" />";
                       if(trial=="시범수업 무료"){
                    		 $('.free').attr("checked",true);
                    	 }
                       
                       
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
                       	  
                       	  if($('#career-disc').val().length>=26 | $('#career-disc').val().length <= 1){
                       		  alert('경력 창은 2글자 이상 25글자 이하로 작성하여 주시기 바랍니다.')
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
                             var career1 = '<div class="car">'+car1+"."+car2+"~"+car3+"."+car4+" "+car5+'<span class="x-btn">x</span></div>';
                             var career2 ='<input name="ycareer" class="ycareer" type="text" style="display:none;" value="'+career+'" />';
                             
                             $('.career-box').append(career1);
                             
                             $('.career-box').append(career2);
                             
                            });
                               
                     
                         
                         	$('.price-pri').keyup(function(){
                         		$('.price-pri').val($.number($(this).val()));
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
                         	
                             
                            var ctx = "<c:out value="${pageContext.request.contextPath}" />";
                         	var imgPath = "<c:out value="${lesson.contentimg}" />";
                         	var img = imgPath.split("*");

                 			if(imgPath!=''){
                 				for(var i=0; i<img.length; i++){
                 	        		var name = 'output'+(i+1);
                 	        		var path = ctx+'/resources/mediaImg/'+img[i];
                 	        		var del = '<span class="del'+(i+1)+'" data-name="'+img[i]+'">삭제</span>';
                 	        		var delDiv = '.del-div'+(i+1);
                 	        		
                 	        		$('.img-div').append('<img id="'+name+'" style="width:170px;" src=""/>');
                 	        		$('.img-div').append(del);
                 	        		var nameId = "#"+name;
                 	        		$(nameId).attr('src',path);
                 	        	}
                 			}
            });
            
            var postId = "<c:out value="${lesson.id}" />";
            
            $(document).on('click','.del1',function(){
            	$.ajax({
      			  url:'./delimg?id='+postId+'&name='+$('.del1').attr('data-name'),
          		  type:'get',
          		  error:function(error){
          		  },
          		  success:function(data){
          		  }
          	  });
            	
            	$(this).remove();
            	$('.del-div1').remove();
            	$('#output1').trigger('click');
            });
            
            $(document).on('click','.del2',function(){
            	$.ajax({
            		 url:'./delimg?id='+postId+'&name='+$('.del2').attr('data-name'),
          		  type:'get',
          		  error:function(error){
          		  },
          		  success:function(data){
          		  }
          	  });
            	$(this).remove();
            	$('.del-div2').remove();
            	$('#output2').trigger('click');
            });
            
            $(document).on('click','.del3',function(){
            	$.ajax({
            		 url:'./delimg?id='+postId+'&name='+$('.del3').attr('data-name'),
          		  type:'get',
          		  error:function(error){
          		  },
          		  success:function(data){
          		  }
          	  });
            	$(this).remove();
            	$('.del-div3').remove();
            	$('#output3').trigger('click');
            });
            
            $(document).on('click','.del4',function(){
            	$.ajax({
            		 url:'./delimg?id='+postId+'&name='+$('.del4').attr('data-name'),
          		  type:'get',
          		  error:function(error){
          		  },
          		  success:function(data){
          		  }
          	  });
            	$(this).remove();
            	$('.del-div4').remove();
            	$('#output4').trigger('click');
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
            		$('.img-div').append('<img id="output1" style="width:180px;display:none;" src=""/>');
               	 	$('.multi1').trigger('click');
            	}else if($('.multi2').val()=='' && $('#output2').length==0){
            		$('.img-div').append('<img id="output2" style="width:180px;display:none;" src=""/>');
            		$('.multi2').trigger('click');
            	}else if($('.multi3').val()=='' && $('#output3').length==0){
            		$('.img-div').append('<img id="output3" style="width:180px;display:none;" src=""/>');
            		$('.multi3').trigger('click');
            	}else if($('.multi4').val()=='' && $('#output4').length==0){
            		$('.img-div').append('<img id="output4" style="width:180px;display:none;" src=""/>');
            		$('.multi4').trigger('click');
            	}
       		});
            
            
            $(document).on('click','#output1',function(){
            	//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
            	if($('.del1').length==0){
            		$('.multi1').remove();
            		$(this).remove();
            		$('.uploadDiv').append('<input name="contentimg" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event)" />');
            	}
            });

            $(document).on('click','#output2',function(){
            	if($('.del2').length==0){
            		$('.multi2').remove();
            		$(this).remove();
            		$('.uploadDiv').append('<input name="contentimg" class="multi2" type="file" accept="image/*" onchange="check22(this);loadFile2(event)" />');
            	}
            });
            
            $(document).on('click','#output3',function(){
            	if($('.del3').length==0){
            		$('.multi3').remove();
            		$(this).remove();
            		$('.uploadDiv').append('<input name="contentimg" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event)" />');
            	}
            });
            
            $(document).on('click','#output4',function(){
            	if($('.del4').length==0){
            		$('.multi4').remove();
            		$(this).remove();
            		$('.uploadDiv').append('<input name="contentimg" class="multi4" type="file" accept="image/*" onchange="check4(this);loadFile4(event);" />');
            	}
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
            	   var opt1price3 = document.getElementById('opt1price3');
            	   var opt2price3 = document.getElementById('opt2price3');
            	   var subcate1 = $('select[name=subCate1]>option:selected').index();
            	   var subcate2 = $('select[name=subCate2]>option:selected').index();
                  
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
                
                  
                 if(lessonIntr.value.length<100){
                    alert('[수업정보]페이지의 수업소개글을 최소100글자 이상 작성해주세요.');
                	$('.menu td').eq(2).trigger('click');
                    return false;
                  }
                 if(lessonIntr.value.length>500){
                     alert('[수업정보]페이지의 수업소개글은 최대 500글자 미만입니다.');
                 	$('.menu td').eq(2).trigger('click');
                     return false;
                   }
                 if(careerDesc.value.length<100){
                     alert('[선생님소개]페이지의 선생님소개를 최소 100글자 이상 작성해주세요.');
                 	$('.menu td').eq(3).trigger('click');
                     return false;
                   }
                 if(careerDesc.value.length>500){
                     alert('[선생님소개]페이지의 선생님소개는 최대 500글자 미만입니다.');
                 	$('.menu td').eq(3).trigger('click');
                     return false;
                   }
                 
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
            
             </script>
</body>
</html>