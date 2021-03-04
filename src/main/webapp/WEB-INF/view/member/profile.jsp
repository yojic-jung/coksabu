<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>프로필 튜터페이지 콕사부</title>
  <meta name="description" content="선생님 프로필 설정하기" />
    <meta charset="utf-8">
    <style>
    
    .profile-title{
    background:rgb(63, 63, 61);
    color:white;
    padding:35px;
    font-size:35px;
    text-align:center;
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
        .login-form{
              min-height:410px;
              width:600px;
              margin:20px auto;
              font-size:15px;
          }
          .login-logo{
            width:200px;
            margin:auto;
            margin-bottom: 20px;
          }
          .service-cate{
              border-spacing:0px;
          }
          .service-cate td:first-child{
            width:110px;
          }
          .service-cate td{
            padding:10px;
            border-bottom:1px solid black;
            line-height:200%;
            background:rgb(241, 239, 239);
            font-size:14px;
          }
          .locale-main{
            width:80px; color:gray;font-size:15px; padding :5px;  
        }
          .locale{
            color:gray;font-size:15px; padding : 5px;  
          }
          .locale-btn{
              padding:4px;

          }
         
          .locale-box{
           width:400px;padding:10px; margin-top:20px; border:1px solid gray;
           line-height:30px;
          }
          
          .pro-table {
          width:450px;
          margin-top:80px;
          border-spacing:10px 30px;
          font-size:18px;
          color:gray;
          font-family: 'JejuGothic';
          }
          
          .pro-table td:first-child{
          	width:80px;
          }
          
          .pro-table2{
          width:480px;
          margin-top:80px;
          font-size:15px;
          border-spacing:10px 30px;
          color:gray;
          font-family: 'JejuGothic';
          }
          
           .pro-table2 input{
           width:120px;
           padding:5px;
           font-size:15px;
           }
		
		.pro-table2 td:first-child{
			width:70px;
		}
		
		.pro-table2 td:nth-child(4n+3){
			width:40px;
		}
        
        .pro-table2 td:nth-child(even){
        width:140px;
		}  

		.pro-table3 {
          width:450px;
          margin-bottom:80px;
          border-spacing:10px 30px;
          font-size:15px;
          color:gray;
          font-family: 'JejuGothic';
          }

          .disp{
              /* 지표클래스 */
          }
          .my-btn{
            margin:5px;
            display:inline-block;
            font-size:15px;
          }
    .foot{
      width:100%;
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
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>

</head>
<body>
<script>
	
	
    var loc = "<c:out value="${locale}" />"
    if(loc!=""){
    	var locale = loc.split(",");
    	
    	
    	$(document).ready(function(){
    		for(var i=0; i<locale.length; i++){
    			  $('.locale-box').append('<div class="my-btn">' 
    	                 +locale[i]+' <button class="x-btn">x</button></div>');
    	             $('.locale-box').append('<input name="locales" style="display:none;" class="my-locale" type="checkbox" value="'
    	             +locale[i]+'" checked />');
    		}
    	});
    }
    
    var universe = "<c:out value="${pro.universe}" />";
    var universer = "<c:out value="${pro.universer}" />";
    var univsub = "<c:out value="${pro.univsub}" />";
    var career = "<c:out value="${pro.career}" />";
    var sexual = "<c:out value="${pro.sexual}" />";
    
    var academy = "<c:out value="${pro.academy}" />";
    var academyd = "<c:out value="${pro.academyd}" />";
    var nation = "<c:out value="${pro.nation}" />";
    var nationy = "<c:out value="${pro.nationy}" />";
    var toeic = "<c:out value="${pro.toeic}" />";
    var tofle = "<c:out value="${pro.tofle}" />";
    var teps = "<c:out value="${pro.teps}" />";
    var hsk = "<c:out value="${pro.hsk}" />";
    var jpt = "<c:out value="${pro.jpt}" />";
    var singular = "<c:out value="${pro.singular}" />";
    
    var sin = singular.split(",");
    
    $(document).ready(function(){
    	    	
    	$('#univid').val(universe);
    	$('#univsub').val(univsub);
    	if(universer != ""){
    		$('#universer').val(universer).attr("selected",true);
       	 	$('#career').val(career).attr("selected",true);	
    	}
    	 if($('.sexual1').val()==sexual){
    		 $('.sexual1').trigger('click');
    	 }else if($('.sexual2').val()==sexual){
    		 $('.sexual2').trigger('click');
    	 }
    	 
    	$('#academy').val(academy);
     	$('#academyd').val(academyd);
     	$('#nation').val(nation);
     	$('#nationy').val(nationy);
     	$('#toeic').val(toeic);
     	$('#tofle').val(tofle);
     	$('#teps').val(teps);
     	$('#jpt').val(jpt);
     	$('#hsk').val(hsk);
     	
     	for(var i=0; i<sin.length; i++){
			$('input[value="'+sin[i]
			+'"]').attr('checked',true);
		}
     	
    });

		</script>
        <section>
        <div class="profile-title">
      	  	<a href="./tutorpage" style="color:white;text-decoration:none;"><span style="float:left;clear:right;font-size:21px;">&lt;뒤로가기</span></a>
      		 프로필 작성
        </div>
            <div style="background:rgb(233, 232, 232); padding:10px; min-height: 500px;">
                <div class="login-form" style="background:white; padding:20px 50px ">
                    <div style="margin:auto;width:500px;">
                    <form:form class="teacher2-submit" method="post" commandName="profile" name="profile" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
                        
                    <input name="email" id="email" type="hidden" value="${email}" />
                   
                    <div style="color:gray;font-family: 'JejuGothic';font-size:18px; margin-top:40px; ">프로필 설정</div>
                    
                    <div style="margin:50px 0px 40px 0px;text-align:center;">
                    <c:if test="${pro.imgPath == null}" >
                    	<img id="output" style="width:300px; height:300px;border-radius:150px;margin-bottom:10px;" 
                                src="<c:url value="/resources/images/pro.png"  />"  alt="프로필 대체"/>
                    </c:if>
                    <c:if test="${pro.imgPath != null }">
                        <img id="output" style="width:300px; height:300px;border-radius:150px;margin-bottom:10px" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="프로필 아미지"/>
                   	</c:if>
                        <br/>
                        <span class="file-wrapper">
                        <input type="file" name="img" id="img" accept="image/*" onchange="check(this);loadFile(event);" />
						</span>
                    </div>
                    
                    <div style="color:gray; font-size:18px;font-family:'JejuGothic'; margin:100px 0px 20px 0px;">서비스 가능지역(최대 5개)</div>
                    <div>
                        <select class="locale-main">
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
                
                        <select class="locale" style="display:none;">
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
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
                                <option>대덕구</option>
                                <option>동구</option>
                                <option>서구</option>
                                <option>유성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale" style="display:none;">
                                <option>세종</option>
                        </select>
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>울주군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
                                <option>남구</option>
                                <option>달서구</option>
                                <option>달성군</option>
                                <option>동구</option>
                                <option>북구</option>
                                
                                <option>서구</option>
                                <option>수성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale" style="display:none;">
                                <option>광산구</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>서구</option>
                        </select>
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
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
                        
                        <select class="locale" style="display:none;">
                                <option>서귀포시</option>
                                <option>제주시</option>
                        </select>
                        
                        <input type="button" class="locale-btn" value="추가"/><br/>
                        <div class="locale-box" style=" "></div> 
                    </div>
                     
                    <table class="pro-table">
                     <tr>
                     	<td>성별</td>
                     	<td>
                     		<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual1" value="남">남</label>&nbsp;&nbsp;
            				<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual2" value="여">여</label>&nbsp;
                     	</td>
                     </tr>
                     <tr>
                     	<td>대학</td>
                     	<td>
                     		<input style="width:180px;padding:5px;font-size:15px;" name="universe" type="text" id="univid" onclick="openIdChk()"/>
							<input type="button" value="대학검색"  style="font-size:15px;padding:5px;" onclick="openIdChk()"/> 
                     	</td>
                     </tr>
                     <tr>
                     	<td colspan="2" style="color: black;font-size:15px;">
                     		<c:if test="${pro.universe!=null}">
							대학/학과를 수정하시는 경우 <span style="color:orange">본인/학력인증</span> 다시 해주시기 바랍니다.
							</c:if>
                     	</td>
                     </tr>
                     <tr>
                     	 <td>학과</td>
                	     <td>
                	     	  <input style="width:150px;font-size:15px;padding:5px;" type="text" id="univsub" name="univsub" />
                	     </td>
                     </tr>
                     <tr>
                     	 <td>재학유무</td>
                	     <td>
                	     	<select style="font-size:15px;padding:5px; color:gray;font-family: 'JejuGothic'; padding:5px" name="universer" id="universer">
    						<option>재학</option>
    						<option>휴학</option>
    						<option>중퇴</option>
    						<option>자퇴</option>
    						<option>졸업</option>
    						</select>
                	     </td>
                     </tr>
                     <tr>
                     	 <td>과외경력</td>
                	     <td>
                	     	<select name="career" id="career" style=" padding:5px;font-size:15px;color:gray;font-family: 'JejuGothic'; padding:5px" >
    	    					<option value="0">1년미만</option>
                    			<option value="1">1년이상</option>
	                    		<option value="2">2년이상</option>
	                    		<option value="3">3년이상</option>
                    			<option value="5">5년이상</option>
                    			<option value="7">7년이상</option>
                    			<option value="10">10년이상</option>		
    						</select>
                	     </td>
                     </tr>
                   </table>
                     
                    <table class="pro-table2">
                    	<tr>
                    		<td colspan="4" style="font-size:18px;">추가입력(선택)</td>
                    	</tr>
                    	<tr>
                    		<td>대학원</td>
                    		<td><input type="text" id="academy" name="academy" /></td>
                    		<td>학과</td>
                    		<td><input type="text" name="academyd" id="academyd"  /></td>
                    		
                    	</tr>
                    	<c:if test="${pro.universe!=null}">
							<tr><td  colspan="4"  style="color: black;font-size:15px;">
							대학원/학과를 수정하시는 경우 <span style="color:orange">본인/학력인증</span> 다시 해주시기 바랍니다.
							</td></tr>
						</c:if>
                    	
                    	<tr>
                    		<td>유학국가</td>
                    		<td><input type="text" name="nation" id="nation"/></td>
                    		<td>기간</td>
                    		<td><input type="number" name="nationy" style="width:80px;" id="nationy"/>년</td>
                    	</tr>
                    	<tr>
                    		<td colspan="4" ><br/>어학점수</td>
                    	</tr>
                    	<tr>
                    		<td>토익</td>
                    		<td><input type="number" name="toeic" id="toeic" style="width:80px;"/>점</td>
                    		<td>HSK</td>
                    		<td><input type="number" name="hsk" id="hsk"  style="width:80px;"/>급</td>
                    	</tr>
                    	<tr>
                    		<td>텝스</td>
                    		<td><input type="number" name="teps" id="teps" style="width:80px;"/>점</td>
                    		<td>JPT</td>
                    		<td><input type="number" id="jpt" name="jpt" style="width:80px;"/>점</td>
                    	</tr>
                    	<tr>
                    		<td>토플</td>
                    		<td colspan="3"><input type="number" name="tofle" id="tofle" style="width:80px;"/>점</td>
                    	</tr>
                    </table>
                    
                    <table class="pro-table3">
                    	<tr>
                    		<td colspan="3">특이사항</td>
                    	</tr>
                    	<tr>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="학원강사경력" />학원강사경력</label></td>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="특목고 졸업"/>특목고 졸업</label></td>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="외고 졸업"/>외고 졸업</label></td>
                    	</tr>
                    	<tr>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="영어경시대회"/>영어경시대회</label> </td>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="과학경시대회"/>과학경시대회</label></td>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="예술고 졸업"/>예술고 졸업</label></td>
                    	</tr>
                    	<tr>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="수학경시대회"/>수학경시대회 </label></td>
                    		<td><label style="cursor:pointer"><input type="checkbox" name="singular" id="singular" value="논술대회"/>논술대회 </label></td>
                    	</tr>
                    </table>
                   
                   	
                   	
                   	 
                   	
                   	
                   	
                   	
                   	
                   	
                      <div style="text-align:center;">
                      <input style="color:white; background:rgb(105, 104, 104); font-size:15px; 
                      padding:15px;border-radius:10px; width:350px;margin:20px 0px;" type="submit" value="프로필 설정 완료"/>
                    	</div>
                    </form:form>    
                    </div>
                </div>
            </div>
        </section>
       
            

    <script>
 	 $(document).ready(function(){
  		 
 		 
 		 $('.menu-title').append("프로필 설정");
 		 
         $('.locale-main').change(function(){
             $(".disp").removeClass('disp');
             $('.locale').hide();
             var opIndex = $('.locale-main>option:selected').index();
             if(opIndex==0){
                 $('.locale').hide();
             }else{
                 $('.locale').eq(opIndex-1).addClass("disp").show();
             }
         });


         $('.locale-btn').click(function(){
             var main = $('.locale-main>option:selected').val();
             var sub = $('.disp>option:selected').val();
             if(main=='선택'){
                 alert('지역을 선택해주시기 바랍니다.');
                 return false;
             }
             if($('.x-btn').length > 4){
                 alert('5개 이상 선택할 수 없습니다.');
                 return false;
             }
             var bool = true;
             $('.my-locale').each(function(idx, item){
                 if(item.value == (main+' '+sub) ){
                     alert('이미 추가된 지역입니다.');
                     bool = false;
                     return false;
                 }
             });
             if(bool == false){
                 return false;
             }

             $('.locale-box').append('<div class="my-btn">' 
                 +main+" "+sub+' <button class="x-btn">x</button></div>');
             $('.locale-box').append('<input name="locales" style="display:none;" class="my-locale" type="checkbox" value="'
             +main+' '+sub+'" checked />');
             
         });
         
         $(document).on("click", ".x-btn", function(){
         
             var btnIndex = $(".x-btn").index(this);
             $('.my-locale').eq(btnIndex).remove();
             $('.my-btn').eq(btnIndex).remove();
         });
     });
    
       function CheckForm(memberInfo){
   		 
    	   var form = memberInfo;
    	   
    	   var imgpath = "<c:out value="${pro.imgPath}"/>"
           
           
           if($('#img').val()!='' || imgpath!=''){
           	
           }else{
           	alert('프로필 이미지를 등록해주세요.');
           	return false;
           }
    	   
    	   
            if($('.my-locale').length==0){
                alert('서비스 가능지역을 추가해주세요.');
                return false;
            }
			
            if($('input:radio[class="sexual1"]:checked').length==0){
            	if($('input:radio[class="sexual2"]:checked').length==0){
                	alert('성별을 체크해주세요.');
                	return false;
                }
            }
            
           
            
            var ti1 = /^[ㄱ-ㅎ |ㅏ-ㅣ |가-힣|a-z|A-Z|1-10 |() ]{1,15}$/
            if(!check2(ti1, form.univid, "대학명을 입력해주세요.15글자 미만")) {
  	           return false;
  	       }
            
            var ti2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|1-10|() ]{1,10}$/
            
           
            
            if(!check2(ti2, form.univsub, "학과명을 입력해주세요. (10글자 미만)")) {
     	           return false;
     	       }
            
            if($('input[name="academy"]').val().length >=15 ){
            	alert('대학원명은 15글자 미만으로 입력해주세요.');
            	return false;
            }
            if($('input[name="academyd"]').val().length>=15){
            	alert('대학원 학과은 15글자 미만으로 입력해주세요.');
            	return false;
            }
            
            if($('input[name="nation"]').val().length>=10){
            	alert('유학국가명은 10글자 미만으로 입력해주세요.');
            	return false;
            }
            
            
            if($('input[name="nationy"]').val().length>3 | $('input[name="nationy"]').val() < 0){
            	alert('유학 기간은 숫자만 2글자 이내로 적어주세요.');
            	return false;
            }
           
            
            if($('input[name="toeic"]').val()> 990 |$('input[name="toeic"]').val()<0 ){
            	alert('토익 점수는 990점 이하로 입력해주시기 바랍니다.(없으신 경우 입력 안하셔도 됩니다.)');
            	return false;
            }
            if($('input[name="HSK"]').val()>6 | $('input[name="HSK"]').val() < 0){
            	alert('HSK급수는 1급부터 6급까지만 존재합니다.(없으신 경우 입력 안하셔도 됩니다.)');
            	return false;
            }
            if($('input[name="teps"]').val().length>=4 | $('input[name="teps"]').val() <0){
            	alert('텝스 점수는 올바르게 입력해주시기 바랍니다.(없으신 경우 입력 안하셔도 됩니다.)');
            	return false;
            }
            if($('input[name="JPT"]').val()> 990 |$('input[name="JPT"]').val() <0){
            	alert('JPT 점수는 990점 이하로 입력해주시기 바랍니다.(없으신 경우 입력 안하셔도 됩니다.)');
            	return false;
            }
            if($('input[name="tofle"]').val()> 120 |$('input[name="tofle"]').val()<0){
            	alert('토플 점수는 120점 이하로 입력해주시기 바랍니다.(없으신 경우 입력 안하셔도 됩니다.)');
            	return false;
            }
            if($('input[name="singular"]:checked').length >6 ){
            	alert('특이사항은 6개까지 선택할 수 있습니다.');
            	return false;
            }
            
            var a = window.name;
       		if(a=='child')
            opener.parent.location = opener.parent.location;
       }
       var loadFile = function(event) {
   	    var reader = new FileReader();
   	    reader.onload = function(){
   	      var output = document.getElementById('output');
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
   	  
   	function openIdChk(){
   		window.name="parentForm";
   		window.open("./subCheckForm", "chkForm", "width=500, height=500, resizable = no, scrollbars=no");
   		//수정
   	}
   	
    function check(obj){
    	var file = obj.files;

    	// file[0].size 는 파일 용량 정보입니다.
    	if(file[0].size > 1024*1024*10){
    		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
    		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
    		  document.getElementsByName("img")[0].value = ""; 
    		  return false;
    	}
    	
    	var pathpoint = obj.value.lastIndexOf('.');
    	var filepoint = obj.value.substring(pathpoint+1,obj.length);
    	var filetype = filepoint.toLowerCase();
         // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
         if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
         }else{
        	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
        	 document.getElementsByName("img")[0].value = ""; 
         }
    }            
      </script>
</body>
</html>