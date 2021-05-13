<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>수업요청목록 콕사부</title>
<meta charset="utf-8">
 <meta name="description" content="학생 회원들의 수업 요청 목록 페이지" />
 <meta property="og:type" content="website">
<meta property="og:title" content="학생 수업 요청목록">
<meta property="og:site_name" content="학생 수업 요청목록">
<meta property="og:description" content="학생들이 새로운 수업과 새로운 선생님을 찾기 위해 신청한 목록입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com/applylist">
<link rel="canonical" href="https://coksabu.com/applylist">
<link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
<style>
@charset "UTF-8";
 .top-ul a {
            text-decoration:none;
            color :black
          }

	.subject{
		 	margin:12px 0px 0px 0px;
            padding: 0px;
            list-style:none;
           	display:inline-block;
	}
	
	.search{
			width:25%;padding:10px;color:orange;font-weight:bolder;
			font-size:25px;
	}

	.search-table td{
			padding:15px 0px;;
	}
	.list{
		width:100%;margin:0px;
	}
	.list td {
		width:50%;
	}
	#name{
			color: #4C4C4C;
			font-size:20px;
			font-family: 'Apple SD Gothic Neo','Malgun Gothic';
			margin-bottom:15px;
	}
	
	#grade{
			font-size:30px;
			color: #4C4C4C;
			font-family: 'Apple SD Gothic Neo','Malgun Gothic';
			font-weight:bolder;
			margin-bottom:15px;
	}
	
	#subcate{
			font-size:30px;
			margin-bottom:15px;
			line-height:30px;
			color: #4C4C4C;	
			font-weight:bolder;			
			font-family: 'Apple SD Gothic Neo','Malgun Gothic';
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
	}
	
	#locale{
			font-size:25px;
			font-family: 'Apple SD Gothic Neo','Malgun Gothic';
			color:#4C4C4C;
			margin-bottom:15px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
	}
	
	#price{
		font-size:20px;
		font-family: 'Apple SD Gothic Neo','Malgun Gothic';
		color:#4C4C4C;
		margin-bottom:15px;
	}
	.cate1, .cate2, .cate3, .cate4, .cate5, .cate6, .cate7{
		width:25px; height:25px;
	}
	.locale-main, .locale, #gradeform, #sexualform{
		font-size:25px;
		padding:20px;
	}
	.pagemove{
    	margin:30px 0px;
    	text-align:center;
    	font-size:50px;
    }
	.page-a{
	color: gray;font-size:40px;margin:0px 10px;text-decoration:none;
	padding:20px;
	}
	.pagemove-table{
		display:inline-block
	}
	.pagemove-table td{
		border:0.5px solid gray;
	}
	.apply-table{
		width:100%;
		margin:10px auto;
	}
	
	.apply-table td{
		width:30%;
		padding:20px;
		min-height:30px;
		font-size:30px;
		color: black;
		text-align:center;
		border-right:0.2px solid lightgray;
	}
	.c-box-close{
		padding:20px;
	}
</style>
     <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
     <script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
     <script>
     $(document).ready(function(){
    	 $('.locale-main').change(function(){
    		    $(".disp").removeClass('disp');
    		    $('.locale').hide();
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
    	 
    	 
    	 var locale1 = "<c:out value="${form.locale1}" />";
    	 var locale2 = "<c:out value="${form.locale2}" />";
    	 var cate = "<c:out value="${form.cate}" />";
    	 var grade = "<c:out value="${form.grade}" />";
    	 var sexual = "<c:out value="${form.sexual}" />";
         if(locale1 != ""){
         	$('.locale-main').val(locale1).attr("selected",true);
         	var lidx;
         	$('.locale-main>option').each(function(){
         		if($(this).text()==locale1){
         			lidx = $(this).index()
         		}
         	});
         	if(lidx!=0){
         		$('.locale').eq(lidx-1).show().attr('name','locale2');
                 $('.locale').eq(lidx-1).val(locale2).attr("selected",true);	
         	}
         	
         }
         
         if($('.cate1').val() == cate){
         	$('.cate1').val(cate).trigger('click');
         }else if($('.cate2').val() == cate){
         	 $('.cate2').val(cate).trigger('click');
         }else if($('.cate3').val() == cate){
         	 $('.cate3').val(cate).trigger('click');
         }else if($('.cate4').val() == cate){
         	 $('.cate4').val(cate).trigger('click');
         }else if($('.cate5').val() == cate){
         	 $('.cate5').val(cate).trigger('click');
         }else if($('.cate6').val() == cate){
         	 $('.cate6').val(cate).trigger('click');
         }else if($('.cate7').val() == cate){
         	 $('.cate7').val(cate).trigger('click');
         }
         
         
         if(grade !=""){
				$('#gradeform').val(grade).attr('selected', true);
			}   
         
         if(sexual !=""){
				$('#sexualform').val(sexual).attr('selected', true);
			}  
         
         
         $('.page-a').click(function(){
      		var href = $(this).attr("href");
      		href=href+"&locale1P="+encodeURIComponent(locale1)+"&locale2P="+encodeURIComponent(locale2)+"&sexualP="+encodeURIComponent(sexual)+"&gradeP="+encodeURIComponent(grade)+"&cateP="+encodeURIComponent(cate);
      		$(this).prop('href',href);
      		});

         });

</script>
</head>


<body>
 
	<section>
		<div style="padding:50px;width:100%;background:rgb(241, 241, 239)">
		<div style="font-family:'JejuGothic'; font-size:30px; width:100%;text-align:center">
		학생의 "수업요청"에 선생님의 지원서를 넣어보세요.
		</div>
		<br/>
		<div style="width:80%;margin:auto;font-family:'JejuGothic'; font-size:30px; color:gray;">
		<form method="post" onSubmit="return CheckForm(this)">
		<table class="search-table">
		<tr>
		<td class="search">		
		지역 
		</td>
		<td>
		<select class="locale-main" name="locale1" style=" color:gray;">
							<option value="">지역전체</option>
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
             <select class="locale" style="display:none; color:gray;" >
                                <option value="">서울전체</option>
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
                        <select class="locale"  style="display:none;">
                                <option value="">경기전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">인천전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">강원전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">대전전체</option>
                                <option>대덕구</option>
                                <option>동구</option>
                                <option>서구</option>
                                <option>유성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;">
                                <option>세종</option>
                        </select>
                        
                        <select class="locale"  style="display:none;">
                                <option value="">충청전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">충북전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">부산전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">울산전체</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>울주군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;">
                                <option value="">경남전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">경북전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">대구전체</option>
                                <option>남구</option>
                                <option>달서구</option>
                                <option>달성군</option>
                                <option>동구</option>
                                <option>북구</option>
                                
                                <option>서구</option>
                                <option>수성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;">
                                <option value="">광주전체</option>
                                <option>광산구</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>서구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;">
                                <option value="">전남전체</option>
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
                        
                        <select class="locale"  style="display:none;">
                                <option value="">전북전체</option>
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
                                <option value="">제주전체</option>
                                <option>서귀포시</option>
                                <option>제주시</option>
                        </select>
                        </td>
                        </tr>
						<tr>
						<td class="search">
                       	 수업 
                       	 </td>
                       	 <td style="line-height:200%;">
                        	<label style="cursor:pointer"><input class="cate1" type="radio" name="cate" value="수학"/>수학</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<label style="cursor:pointer"><input class="cate2" type="radio" name="cate" value="외국어" />외국어</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<label style="cursor:pointer"><input class="cate3" type="radio" name="cate" value="국어" />국어</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<label style="cursor:pointer"><input class="cate4" type="radio" name="cate" value="사회" />사회</label><br/>
                        	<label style="cursor:pointer"><input class="cate5" type="radio" name="cate" value="과학" />과학</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<label style="cursor:pointer"><input class="cate6" type="radio" name="cate" value="예체능" />예체능</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<label style="cursor:pointer"><input class="cate7" type="radio" name="cate" value="자소서/입시" />자소서/입시</label>
                        </td>
                        </tr>
                        <tr>
                        <td class="search">학생정보</td>
                        <td style="line-height:200%;">
                        	학년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<select id="gradeform" name="grade" style="color:gray;">
                        		<option value="">--무관--</option>
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
                        	학생성별&nbsp;&nbsp;
                        	<select id="sexualform" name="sexual" style="color:gray; ">
                        		<option value="">무관</option>
                        		<option value="남">남</option>
                        		<option value="여">여</option>
                        	</select>
                        </td>
                        </tr>
                        </table>
                        <div style="text-align:center;width:100%;margin-top:30px">
                        <input type="submit" value="검색" style="font-weight:bold;padding:20px;width:250px;background:orange;color:white;border:none;border-radius:14px;font-size:25px;"/>
                        </div>
                        </form>
		</div>
		</div>
		 <hr/>
		 <div style="width:100%; margin:10px auto; padding-bottom:250px;font-size:12px;">
		 
		
<c:choose>
	<c:when test="${listModel.hasList == false }" >
	 <div style="min-height:600px;">
	 <div style="width:100%;margin:auto; margin-top:60px;padding:50px;font-size:30px; font-family:'JejuGothic';">
	 해당하는 조건의 "수업요청"이 없습니다.
	 </div>
	 </div>
	</c:when>
	<c:otherwise>
	<div style="min-height:600px;">
	 <table border="0" class="list">
	<c:forEach var="apply" items="${listModel.list}">
	<tr style="width:100%;">
	<td>
	<c:if test="${apply.visible==0}">
	<div id="pst" style="border:1px solid silver;background:rgb(231, 231, 231);vertical-align:top;padding:30px; width:70%; margin:30px auto;">
	</c:if>	
		
	<c:if test="${apply.visible!=0}">
	<div id="pst" style="border:1px solid silver;vertical-align:top;padding:30px; width:50%; margin:30px auto;">
	</c:if>
		
		<div href="#applyform" class="student" style="text-decoration:none; color:black;cursor:pointer;">
		<div style="padding:0px;font-family:'JejuGothic';;">
		<div id ="name" class="name">${apply.name} 학생
		
		<c:if test="${apply.visible==0}">
		<span style="font-weight:normal;font-size:24px;color: dimgray; float:right; clear:right;margin-right:10px;">
		모집마감</span>
		</c:if>
		
		</div>
		<div id="grade">${apply.grade}</div>
		<div id="subcate">${apply.subcate}</div>
		<div id="locale">${apply.locale} ${apply.locale3}</div>
		<div id="price">희망가격 <span style="color:black;font-size:30px;font-weight:bold">${apply.price1} ~ ${apply.price2}</span></div>
		
		
		<!-- 컬러박스 -->
		<div class="apply-read" style="display:none;">
			<div style="width:100%; min-height:250px; font-family:'JejuGothic';color:dimgray;background:rgb(252, 251, 251);">
				
				<div style="width:100%; background:rgb(241, 241, 239);padding:30px;">
					<div style="margin:20px 0px; font-size:30px; text-align:center">${apply.name}(${apply.sexual})</div>
					<div style="margin:20px 0px;color:orange; font-size:40px;text-align:center">${apply.subcate}</div>
					<div style=" margin:20px 0px 10px 0px; font-size:30px;font-weight:bolder; text-align:center"></div>
				</div>
				<hr style=" border:1px solid lightgray; margin:auto"/> 

				<table class="apply-table">
				<tr>
				<td style="word-break:keep-all;word-wrap:break-word;">${apply.locale} ${apply.locale3 }</td>
				<td>${apply.day}</td>
				<td style="border:none;">${apply.grade}<br/>
				</td>
				</tr>
				</table>
				
				<div style="width:100%; background:rgb(241, 241, 239);padding:10px;">
				<div style="margin:20px 0px 10px 0px; font-size:30px;font-weight:bolder; text-align:center">희망 가격 ${apply.price1} ~ ${apply.price2}</div>
				<div style="margin:10px 0px 10px 0px; font-size:30px;font-weight:bolder; text-align:center">(${apply.month}, 회당 ${apply.gawetime} )</div>
				</div>
				
				<div style="padding:40px; color:orange;line-height:150%;font-size:30px;">${apply.message}</div>
				
				<div style="text-align:center;padding:30px;">
				<span class="applybtn" style="font-size:30px;border-radius:15px; padding:25px; color:white;background: orange; cursor:pointer" >
				지원하기
				<input class="lessonId" style="display:none;" type="text" value="${apply.id}"/>
				</span></div>
				<div style="width:100%;font-size:25px; text-align:right;"><span class="c-box-close">[닫기]</span></div>
			</div>
		</div>
		</div>
	</div>
	</div>
	</td>
	</tr>	
		
	</c:forEach>
	</table>
	</div>
	<div class="pagemove" style="padding-top:60px;">
	<table class="pagemove-table">
	<tr>
	<c:if test="${beginPage > 5}">
		<td><a class="page-a" href="<c:url value="./applylist?p=${beginPage-1}" />">&lt;</a></td>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
		<td><a class="page-a" href="<c:url value="./applylist?p=${pno}"/>"  style="color: black;">${pno}</a></td>
	</c:when>
	<c:otherwise>
		<td><a class="page-a" href="<c:url value="./applylist?p=${pno}" />" >${pno}</a></td>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		<td><a class="page-a" href="<c:url value="./applylist?p=${endPage+1}"/>">&gt;</a></td>
	</c:if>
	</tr>
	</table>
	</div>
	</c:otherwise>
</c:choose>
		<div style="height:150px;"></div>
		<div style="display:none; font-size:30px; color:gray; width:80%;">
            <div id="applyform" >
            </div>
        </div>
		 
		 </div>
	</section>
	
<script>
$(document).ready(function(){
    $('.student').colorbox({
        inline:true,
        width:'80%',
        closeButton:false,
        overlayOpacity:0.5,
        onOpen:function(){
          $('#applyform').append( $(this).find('.apply-read').html() );
          $('.c-box-close').click(function(){
	  		  $.colorbox.close();
	  	  })
        },
        onClosed:function(){
       	 $('#applyform').empty();
        }
      });
    
});

$(document).on('click','.applybtn',function(){
	
	<% if(session.getAttribute("email") == null){ %>
	var a = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
	if(a){
		 window.location="./login";
	}else{
		return false;
	}
	<% }else{ %>
	 var url = 'teacherApply?id='+$(this).find('.lessonId').val()
	 window.location=url;
	 <% } %>
});

function CheckForm(memberInfo){
	var idx=-1;
	$('input[name="cate"]').each(function(){
		if($(this).is(':checked')){
			idx=$(this).index();
		}
	})
	
	if(idx=="-1"){
		alert("수업 과목명을 체크 해주세요.")		
		return false;
	}
	
}


</script>
</body>
</html>