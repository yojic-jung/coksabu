<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <title>수업목록 콕사부</title>
 <meta name="description" content="선생님 수업 목록" />
<meta property="og:type" content="website">
<meta property="og:title" content="선생님 수업목록">
<meta property="og:site_name" content="선생님 수업목록">
<meta property="og:description" content="선생님이 올린 수업 목록 페이지">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://coksabu.com/boarder?main=11&subject=11">
     <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href= "<c:url value="/resources/slick/slick.css" />" >
  <link rel="stylesheet" type="text/css" href= "<c:url value="/resources/slick/slick-theme.css" />">
  <link rel="canonical" href="https://coksabu.com/boarder?main=11&subject=11">
    <style>
    

    .white{
        background:lightgray;
        color:white;
    }
    .border-cate{
        width:580px;
        margin: auto;
    }
    .main-cate a{
    text-decoration:none;color:black;
    }
    .main-cate{
        text-decoration:none;
        display:inline;
    }
    .main-cate>li{
        display:inline-block;
        padding:15px;
    }
    .lower-cate{
        width:580px;
        margin: auto;
        border : 1px solid black;
        border-top:none;
    }
    .subcate>li{
        padding:15px;
        display:inline-block;
    } 
    .subcate a{
    	text-decoration:none;
    	color:black;
    }
    
   
    .dispno{
          display:none;
    }
    .dispyes{
          display:inline-block;
        }
        
    .list a{
		   text-decoration:none;
		   color:black; 
    }
    .profile-img{
    	position: absolute;
    	top:135px;
    	left:5px;
    	z-index:2;
    }
    
    
    .left{
    	float:left;
    	width:800px;
    	margin-right:30px;
    }
    
   #categories{
font-family:'JejuGothic';
font-weight:bold;
font-size:16px;
color:Grey;
padding:5px;
}
    #name{
font-family: 'JejuGothic';
font-weight:bold;
font-size:14px;
padding:5px;
color:black;
}
  #universe{
font-family: 'JejuGothic';
font-weight:bold;
color: DimGrey;
font-size:14px;
padding:5px;
}
#title{
font-family:'JejuGothic';
font-weight:900;
color: black;
font-size: 18px;
margin-top:7px;
padding:5px;
}

#price{
font-family:Arial;
font-weight:bold;
font-size:16px;
padding:5px;
margin-top:5px;
color: black;
}
.list td{
	border-bottom:1px solid gray;
} 

#pst:hover{
box-shadow:0px 0px 4px 4px LightGoldenRodYellow;
}

    .right{
    float:left;
    clear:right;
    width:200px;
    background:rgb(241, 241, 241);
    padding:5px;
    border-radius:15px;
    }
	.right-title{
	font-size:15px;
	font-family:'JejuGothic';
	text-align:center;
	padding-top:20px;
	color:orange;
	}
	.title-content{
	width:180px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
	.right-content{
	width:120px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;padding-left:5px;ling-height:160%;
	}
	 .pagemove{
    	clear:both;width:220px;margin:50px auto;
    }
	.page-a{
		padding:10px;color:gray;font-size:18px; text-decoration:none;
	}
	.pagemove-table td{
		border:0.5px solid gray;
	}
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  
    <script>
       $(document).ready(function(){
        var jbOffset = $( '.jbMenu' ).offset(); //상단메뉴 좌표 가져오는 코드
            $( window ).scroll( function() {        
              if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                $( '.jbMenu' ).addClass( 'jbFixed' );
              }
              else {
                $( '.jbMenu' ).removeClass( 'jbFixed' );
              }
            });

         
            $('.main-cate>li').mouseenter(function(){
            	$('.main-cate a').css('color','black');
            	var trIndex = $(this).index();
                $('.subcate').hide();
                $('.subcate').eq(trIndex).show();
                $('.white').removeClass();
                $(this).addClass('white');
                $(this).find('a').css('color','white');
              });
            
            $('nav').hover(function(){},function(){
            	if(main!=null){
            		$('.main-cate li').each(function(){
                    	if($(this).find('a').text()==main){
                    		idx=$(this).index();
                    		$(this).trigger('mouseenter');
                    	}
                    });
            	}
            })
            
            
            
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
            
            var main = "<c:out value="${main}" />";
            var subject = "<c:out value="${subject}" />";
            
            if(subject=="수학" |subject=="외국어" |subject=="국어" |subject=="사회" |subject=="과학" |subject=="예체능" |subject=="자소서/입시" ){
            	subject ="전체";
            }
           
            var idx="";
            $('.main-cate li').each(function(){
            	if($(this).find('a').text()==main){
            		idx=$(this).index();
            		$(this).trigger('mouseenter');
            	}
            });
            
            $('.subcate').eq(idx).each(function(){
            	$(this).find('a').each(function(){
            		if($(this).text()==subject){
                		$(this).css('font-weight', 'bolder');
                	}
            	})
            });
           
            var locale1 = "<c:out value="${form.locale1}" />";
            var locale2 = "<c:out value="${form.locale2}" />";
            var career = "<c:out value="${form.career}" />";
            var sexual = "<c:out value="${form.sexual}" />";
            var array = "<c:out value="${form.array}" />";
            
            //폼값 검색 없이 들어온 경우를 위해 
            $('.sexual1').trigger('click');
            
            //폼값 검색 했을때(예외. 지역전체로 검색한 경우 까지 포함됨)
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
			if(career !=""){
				$('#career').val(career).attr('selected', true);
			}            
            if($('.sexual1').val() == sexual){
            	$('.sexual1').val(sexual).trigger('click');
            }else if($('.sexual2').val() == sexual){
            	 $('.sexual2').val(sexual).trigger('click');
            }else if($('.sexual3').val() == sexual){
            	 $('.sexual3').val(sexual).trigger('click');
            }
            
            if(array !=""){
				$('#array').val(array).attr('selected', true);
			}
            
            $('.page-a').click(function(){
        		var href = $(this).attr("href");
        		href=href+"&locale1P="+encodeURIComponent(locale1)+"&locale2P="+encodeURIComponent(locale2)+"&sexualP="+encodeURIComponent(sexual);
        		$(this).prop('href',href);
        	});
       });
    </script>
</head>
<body>
 
        <nav>
                <div class="border-cate">
                <ul class="main-cate">
                    <li><a href="./boarder?main=11&subject=11">수학</a></li>
                    <li><a href="./boarder?main=21&subject=21">외국어</a></li>
                    <li><a href="./boarder?main=31&subject=31">국어</a></li>
                    <li><a href="./boarder?main=41&subject=41">사회</a></li>
                    <li><a href="./boarder?main=51&subject=51">과학</a></li>
                    <li><a href="./boarder?main=61&subject=61">예체능</a></li>
                    <li><a href="./boarder?main=71&subject=71">자소서/입시</a></li>
                </ul>
                </div>
                <hr style="border : solid 2px orange" />
                <div class="lower-cate">
                 <ul class="subcate dispno">
                    <li><a href="./boarder?main=11&subject=11">전체</a></li>
                    <li><a href="./boarder?main=11&subject=12">초등수학</a></li>
                    <li><a href="./boarder?main=11&subject=13">중등수학</a></li>
                    <li><a href="./boarder?main=11&subject=14">이과수학</a></li>
                    <li><a href="./boarder?main=11&subject=15">문과수학</a></li>
                    <li><a href="./boarder?main=11&subject=16">고등수학</a></li>
                    <li><a href="./boarder?main=11&subject=17">수학논술</a></li>
                    <li><a href="./boarder?main=11&subject=18">수학경시</a></li>                    
                 </ul>
                 <ul class="subcate dispno">
                        <li><a href="./boarder?main=21&subject=21">전체</a></li>
                        <li><a href="./boarder?main=21&subject=22">초등영어</a></li>
                        <li><a href="./boarder?main=21&subject=23">중등영어</a></li>
                        <li><a href="./boarder?main=21&subject=24">고등영어</a></li>
                        <li><a href="./boarder?main=21&subject=25">수능영어</a></li>
                        <li><a href="./boarder?main=21&subject=26">영어회화</a></li>
                        <li><a href="./boarder?main=21&subject=27">toeic/tofle/teps</a></li>
                        <li><a href="./boarder?main=21&subject=28">일본어</a></li>
                        <li><a href="./boarder?main=21&subject=29">중국어</a></li>
                </ul>
                
                 <ul class="subcate dispno">
                        <li><a href="./boarder?main=31&subject=31">전체</a></li>
                        <li><a href="./boarder?main=31&subject=32">초등국어</a></li>
                        <li><a href="./boarder?main=31&subject=33">중등국어</a></li>
                        <li><a href="./boarder?main=31&subject=34">고등국어</a></li>
                        <li><a href="./boarder?main=31&subject=35">수능국어</a></li>
                        <li><a href="./boarder?main=31&subject=36">국어논술</a></li>
                </ul>
                <ul class="subcate dispno">
                        <li><a href="./boarder?main=41&subject=41">전체</a></li>
                        <li><a href="./boarder?main=41&subject=42">초등사회</a></li>
                        <li><a href="./boarder?main=41&subject=43">중등사회</a></li>
                        <li><a href="./boarder?main=41&subject=44">고등사회</a></li>
                        <li><a href="./boarder?main=41&subject=45">사회탐구</a></li>
                        <li><a href="./boarder?main=41&subject=46">한국사</a></li>
                </ul>
                <ul class="subcate dispno">
                        <li><a href="./boarder?main=51&subject=51">전체</a></li>
						<li><a href="./boarder?main=51&subject=52">초등과학</a></li>
						<li><a href="./boarder?main=51&subject=53">중등과학</a></li>
                        <li><a href="./boarder?main=51&subject=54">고등과학</a></li>
                        <li><a href="./boarder?main=51&subject=55">물리</a></li>
                        <li><a href="./boarder?main=51&subject=56">생명</a></li>
                        <li><a href="./boarder?main=51&subject=57">화학</a></li>
                        <li><a href="./boarder?main=51&subject=58">지구과학</a></li>
                </ul>
                <ul class="subcate dispno">
                		<li><a href="./boarder?main=61&subject=61">전체</a></li>
                        <li><a href="./boarder?main=61&subject=62">미술</a></li>
                        <li><a href="./boarder?main=61&subject=63">음악</a></li>
                        <li><a href="./boarder?main=61&subject=64">체육</a></li>
                </ul>
                <ul class="subcate dispno">
                		<li><a href="./boarder?main=71&subject=71">전체</a></li>
                        <li><a href="./boarder?main=71&subject=72">자소서첨삭</a></li>
                        <li><a href="./boarder?main=71&subject=73">입시컨설팅</a></li>
                </ul>
            </div>
        </nav>
        <div>
     <form method="post">     
     <div style="width:1030px; margin:20px auto; font-size:25px;line-height:150%">
            콕사부에서 원하는 선생님을 찾아보세요.<br/>
            내 주변에서 찾기&nbsp;&nbsp;
            <select class="locale-main" name="locale1" style="font-size:15px; color:gray; padding:5px;">
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
             <select class="locale" style="display:none;font-size:15px; color:gray; padding:5px;" >
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
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
                                <option value="">대전전체</option>
                                <option>대덕구</option>
                                <option>동구</option>
                                <option>서구</option>
                                <option>유성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
                                <option>세종</option>
                        </select>
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
                                <option value="">울산전체</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>울주군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
                                <option value="">광주전체</option>
                                <option>광산구</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>서구</option>
                        </select>
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale"  style="display:none;font-size:15px; color:gray; padding:5px;">
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
                        
                        <select class="locale" style="display:none;font-size:15px; color:gray; padding:5px;">
                                <option value="">제주전체</option>
                                <option>서귀포시</option>
                                <option>제주시</option>
                        </select>
                        <input type="submit" value="검색" style="margin:5px 10px 0px 0px; padding:5px;"/>
                        </div>
                        <hr style="width:100%;"/>
                        <div style="width:1030px; margin:8px auto 0px auto; font-size:25px;line-height:150%;font-size:12px;">
            			<b>상세검색</b> &nbsp;&nbsp;&nbsp;
           					 경력  
            			<select class="career" id="career" name="career">
                   			<option value="0">무관</option>
                    		<option value="1">1년이상</option>
                    		<option value="2">2년이상</option>
                    		<option value="3">3년이상</option>
                    		<option value="5">5년이상</option>
                    		<option value="7">7년이상</option>
                    		<option value="10">10년이상</option>
            			</select>
                			&nbsp;&nbsp;&nbsp;
            			성별&nbsp;&nbsp;
            			<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual1" value="">무관</label>&nbsp;
            			<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual2" value="남">남</label>&nbsp;
            			<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual3" value="여">여</label>&nbsp;
            			&nbsp;&nbsp;&nbsp;
                		정렬
                		<select id="array" name="array">
                			<option value="readcount">조회수</option>
                			<option value="id">최신순</option>
                		</select>
            		</div>
            		</form>
        		</div>
            
        
        <div style="min-height:300px; width:1030px; margin:10px auto; font-size:12px;">
        <div class="left" style="min-height:300px;">
<c:choose>
	<c:when test="${listModel.hasList == false }" >
	<table border="0" class="list">
	<tr>
	<td colspan="4" style="min-height:300px;">
	게시글이 없습니다.
	</td>
	</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table border="0" class="list">
	<c:forEach var="post" items="${listModel.list}">
		<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="수업대표이미지"/>
							</div>
							</a>
							</td>
							<td style="vertical-align:top;padding-top:30px;width:100%;">
							<a href="<c:url value="./boardread?postId=${post.id}"/>" style="text-decoration:none;">
							<div id="categories">${post.subcate}</div>
							<div id="name"> ${post.name}(${post.birth}, ${post.sexual})&nbsp;&nbsp;경력 <c:if test="${post.career!=0}">${post.career}년</c:if><c:if test="${post.career==0}">1년미만</c:if></div>
							<div id="universe"> ${post.universe} ${post.univsub}</div>
							<div id="title"> ${post.title}</div>
							<div id="price" >${post.subCate0} ${post.price3}원 <c:if test="${post.subCate1 !='nonevalue' }">/ ${post.subCate1} ${post.opt1price3}원</c:if> <c:if test="${post.subCate2!='nonevalue' }">/ ${post.subCate2} ${post.opt2price3}원</c:if></div>
							</a>
							</td>
						</tr>
		</c:forEach>
	
	</table>
	</div>
	
	
	
	
	
	
	
	
	<div class="right">
	<div class="right-title">최신 등록 수업</div>
	<table border="0" class="new">
	<c:forEach var="post" items="${postNewList}">
	<tr>
	<td>
	<div id="newTeacher" style="border-bottom:1px solid silver; vertical-align:top;padding:25px 5px; width:180px; margin:0px auto">
	<c:set var="query"
		value="postId=${post.id}" />
	
	<a href="<c:url value="./boardread?${query}"/>" style="text-decoration:none; color:black;">
	<div class="title-content" style="font-size:13px;font-family:'JejuGothic';margin-bottom:10px;text-indent:15px">${post.title}</div>
	<img class="newTeacher-img" src="<c:url value='/img/profileImg/${post.imgpath}' />" style="border-radius:10px;width:50px; height:70px; magin-top:0px;float:left;"/>
	 </a>
	
	<div class="right-content">${post.name}(${post.birth}, ${post.sexual})<br/>
	경력 <c:if test="${post.career!=0}">${post.career}년</c:if><c:if test="${post.career==0}">1년미만</c:if><br/>
	${post.universe} ${post.univsub}<br/>
	${post.subCate0}&nbsp;${post.price3}원<br/>
	<c:if test="${post.subCate1 !='nonevalue' }">${post.subCate1} ${post.opt1price3}원<br/></c:if>
	<c:if test="${post.subCate2!='nonevalue' }">${post.subCate2} ${post.opt2price3}원<br/></c:if>
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
		<td><a class="page-a" href="<c:url value="./boarder?p=${beginPage-1}&main=${mainR}&subject=${subjectR}&careerP=${form.career}&arrayP=${form.array}"/>" >&lt;</a></td> 
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
	<c:choose>
	<c:when test="${pno==p || (p==null && pno==1)}" >
	<td><a class="page-a" href="<c:url value="./boarder?p=${pno}&main=${mainR}&subject=${subjectR}&careerP=${form.career}&arrayP=${form.array}"/>" style="color: black;font-weight:bold;">${pno}</a></td>
	</c:when>
	<c:otherwise>
	<td><a class="page-a" href="<c:url value="./boarder?p=${pno}&main=${mainR}&subject=${subjectR}&careerP=${form.career}&arrayP=${form.array}" />" >${pno}</a></td>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
		 <td><a class="page-a" href="<c:url value="./boarder?p=${endPage+1}&main=${mainR}&subject=${subjectR}&careerP=${form.career}&arrayP=${form.array}"/>">&gt;</a></td>
	</c:if>
	</tr>
	</table>
	</div>
	</c:otherwise>
</c:choose>
</div>       
</div>       


</body>
</html>