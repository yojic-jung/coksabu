<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
     <meta name="description" content="선생님 프로필 등록페이지2" />
    <style>
      @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          .login-form{
              min-height:410px;
              width:410px;
              margin:60px auto;
          }
          .login-logo{
            width:200px;
            margin:auto;
            margin-bottom: 20px;
          }
          .service-cate{
              border-spacing:0px;
              width:350px;
          }

          .service-cate td{
          
            padding:10px;
            border-bottom:1px solid black;
            line-height:200%;
            background:rgb(241, 239, 239);
            font-size:14px;
          }
          #output{
          	width:300px;
          	height:300px;
          }
          .locale-main{
            width:80px; color:gray;font-size:15px; padding : 5px;  
        }
          .locale{
            width:80px; color:gray;font-size:15px; padding : 5px;  
          }
          .locale-btn{
              padding:4px;

          }

          .disp{
              /* 지표클래스 */
          }
          .my-btn{
              margin:5px;
            display:inline-block;
            font-size:12px;
          }
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
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
  <section style="min-height:500px">
    <div class="login-form">
        
    <form:form class="teacher2-submit" commandName="profile" name="profile" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
        
    <input name="email" id="email" type="hidden" value="${email}" />
    <div class="login-logo"><img style="width:200px" src="<c:url value="/resources/images/logo.png" />" /></div>
    
    <div style="color:gray;font-family: 'JejuGothic'; margin:40px 0px 15px 0px; ">프로필 설정(선택)</div>
    
    <div style="margin:20px 0px 40px 0px;">
       
       <c:if test="${imgPath != null }">
		<img id="output" src="<c:url value="/img/images/${imgPath}" />" />
		</c:if>
		<c:if test="${imgPath == null }">
		<img id="output" src="<c:url value="/resources/images/pro.png"  />" />
		</c:if>
        
        <input type="file" name="img" id="img" accept="image/*" onchange="loadFile(event)" />
    
    </div>
    
    <div style="color:gray;font-family: 'JejuGothic'; margin:15px 0px; ">서비스 카테고리</div>
    
    <span style="font-size:13px;font-family: 'JejuGothic'; color:rgb(151, 151, 151);">제공하는 서비스를 체크해주세요.</span>
    
    <div>
        <table class="service-cate">
        <tr>
            <td rowspan="4">서비스</td>
        </tr>
        <tr>
        	<td><input name="category" id="category" type="checkbox" value="수학" />수학</td>
        	<td><input name="category" id="category" type="checkbox" value="외국어" />외국어</td>
        	<td><input name="category" id="category" type="checkbox" value="국어" />국어<br/></td>
        </tr>
        <tr>
        	<td><input name="category" id="category" type="checkbox" value="사회" />사회</td>
        	<td><input name="category" id="category" type="checkbox" value="과학" />과학</td>
        	<td><input name="category" id="category" type="checkbox" value="예체능" />예체능</td>
        </tr>
        <tr>
        	<td><input name="category" id="category" type="checkbox" value="자소서/입시" />자소서/입시</td>
        	<td></td>
        	<td></td>
        </tr>      
        </table>
    </div>
    <div style="color:gray;font-family: 'JejuGothic'; margin:40px 0px 20px 0px;">서비스 가능지역(최대 5개)</div>
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
        <div class="locale-box" style="width:350px; height:60px; margin-top:20px; border:1px solid gray; "></div> 
    </div>
    	<br/>
    	<div style="color:gray;font-family: 'JejuGothic'; margin:10px 0px; ">
                    	성별&nbsp;&nbsp;
                    	<span style="font-size:12px;">
                    	<input type="radio" name="sexual" class="sexual1" value="남">남&nbsp;&nbsp;
            			<input type="radio" name="sexual" class="sexual2" value="여">여&nbsp;
            			</span>
            			</div>
    	<span style="color:gray; font-family:'JejuGothic'; margin:10px 0px; ">대학</span>
    					<input style="width:150px;" name="universe" type="text" id="univid" onclick="openIdChk()"/>
						<input type="button" value="대학검색"  onclick="openIdChk()"/>
						<div style="color:gray;font-family: 'JejuGothic'; margin:10px 0px; ">
						학과  <input style="width:150px;" type="text" id="univsub" name="univsub" />
    					&nbsp;&nbsp;<span style="font-size:13px;">재학유무 </span>
    					<select style="font-size:13px; color:gray;font-family: 'JejuGothic'; padding:5px" name="universer">
    						<option>재학</option>
    						<option>휴학</option>
    						<option>중퇴</option>
    						<option>자퇴</option>
    						<option>졸업</option>
    					</select>
    					</div>
    					<span style="color:gray;font-family: 'JejuGothic'; margin:10px 0px; ">과외경력</span>
    					<select name="career" style="font-size:13px; color:gray;font-family: 'JejuGothic'; padding:5px" >
    	    				<option value="0">1년미만</option>
                    		<option value="1">1년이상</option>
                    		<option value="2">2년이상</option>
                    		<option value="3">3년이상</option>
                    		<option value="5">5년이상</option>
                    		<option value="7">7년이상</option>
                    		<option value="10">10년이상</option>		
    				</select>
    	<br/>
    	<br/>
    	<div style="color:gray;font-family: 'JejuGothic'; margin:10px 0px; ">한줄 선생님소개</div>
    	<span style="font-size:13px;font-family: 'JejuGothic'; color:rgb(151, 151, 151);">자신을 설명할 수 있게 한줄로 써주세요.(30글자 이하)</span>
    	<input type="text" name="intr" id="intro" maxlength="33" style="width:350px;font-size:12px;padding:5px;" placeholder="ex)단기간 프리토킹수업, 영어마스터샘입니다."/>
    	<br/>
    
      <input style="color:white; background:rgb(105, 104, 104); font-size:15px; 
      padding:15px;border-radius:10px; width:350px;margin:20px 0px;" type="submit" value="프로필 설정 완료"/>
    </form:form>    
    </div>
  </section>    
      <script>
      $(document).ready(function(){
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
              $('.locale-box').append('<input name="locale" style="display:none;" class="my-locale" type="checkbox" value="'
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
     	   
            if($('input[type="checkbox"]:checked').length==0){
                alert('제공하는 서비스를 선택해주세요.');
                return false;
            }
            if($('.my-locale').length==0){
                alert('서비스 가능지역을 추가해주세요.');
                return false;
            }

            var ti1 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|1-10|() ]{1,15}$/
            if(!check(ti1, form.univid, "대학명을 입력해주세요. (15글자 미만)")) {
  	           return false;
  	       }
            
            var ti2 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|1-10|() ]{1,10}$/
            
            if(!check(ti2, form.univsub, "학과명을 입력해주세요. (10글자 미만)")) {
     	           return false;
     	       }
            
            var intro = document.getElementById('intro');
            
            if(intro.value==""){
                alert('한줄 자기소개를 입력해주세요.')
                return false;
              }
            
            var a = window.name;
       		if(a=='child')
            opener.parent.location = opener.parent.location;
       }
       
      	function check(re, what, message) {
       	    if(re.test(what.value)) {
       	        return true;
       	    }
       	    alert(message);
       	    what.value = "";
       	    what.focus();
       	    //return false;
       	}
       
       var loadFile = function(event) {
   	    var reader = new FileReader();
   	    reader.onload = function(){
   	      var output = document.getElementById('output');
   	      output.src = reader.result;
   	    };
   	    reader.readAsDataURL(event.target.files[0]);
   	  };
  	function openIdChk(){
   		window.name="parentForm";
   		window.open("../subCheckForm", "chkForm", "width=500, height=300, resizable = no, scrollbars=no");
   		//수정
   	}
      </script>

</body>
</html>