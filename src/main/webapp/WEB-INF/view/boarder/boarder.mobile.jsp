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
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
 <style>
   html, body{
   	height:100%;
   }
   @charset "utf-8";
 .white{
        background:lightgray;
        color:white;
    }
    
     #m-cate ul{
     list-style:none;
    }
    
    #m-cate li{
    font-size:40px;
        padding:40px;
    }
.m-all-cate{
width : 100%; 
	height : 100%; 
	position : fixed; 
	right : -101%; 
	top:0px;
	z-index : 10; 
	transition: All 0.2s ease; 
	-webkit-transition: All 0.2s ease; 
	-moz-transition: All 0.2s ease; 
	-o-transition: All 0.2s ease; 
overflow:auto; -webkit-overflow-scrolling:touch;
}
#m-cate { 
	width : 35%; 
	height : 150%; 
	background-color : rgb(231, 231, 231); 
	text-align : center; 
	display:inline-block;
	float:left;
	} 
#m-subcate{
width : 65%; 
height : 150%; 
color:black;
background:#F6F6F6;
text-align : center; 
display:inline-block;
}
.m-close-btn{
width : 100%; 
height:150px; 
color:orange;
background:white;
padding:50px;
font-size:50px;

}
.m-all-locale{
	width : 100%; 
height : 100%; 
position : fixed; 
top : 0px; 
right : -100%; 
z-index : 10; 
transition: All 0.2s ease; 
-webkit-transition: All 0.2s ease; 
-moz-transition: All 0.2s ease; 
-o-transition: All 0.2s ease; 
overflow:auto; -webkit-overflow-scrolling:touch;
}
#m-sub-locale{
	width : 65%; 
color:black;
background:white;
text-align : center; 
display:inline-block;
}

    #m-locale ul{
     list-style:none;
    }
    
    #m-locale li{
    font-size:40px;
        padding:40px;
    }
    
#m-locale { 
	width : 35%; 
	background-color : rgb(231, 231, 231); 
	text-align : center; 
	transition: All 0.2s ease; 
	float:left;
	display:inline-block;
	} 


.m-locale-close-btn{
width : 100%; 
height : 150px; 
color:orange;
background:white;
padding:50px;
font-size:50px;

}

.m-cate-btn{
	padding:20px;
	border-radius:20px;
	border:4px solid orange;
	font-size:30px;
	font-weight:bold;
	margin-right:50px;
}
.m-locale-btn{
	padding:20px;
	border-radius:20px;
	border:4px solid orange;
	font-size:30px;
	font-weight:bold;
	margin-right:50px;
}

.m-filter-btn{
	padding:20px;
	border-radius:20px;
	border:4px solid orange;
	font-size:30px;
	font-weight:bold;
}

.m-all-filter{
width : 100%; 
height : 100%; 
	position : fixed; 
	right : -101%; 
	top:0px;
	z-index : 10; 
	transition: All 0.2s ease; 
	-webkit-transition: All 0.2s ease; 
	-moz-transition: All 0.2s ease; 
	-o-transition: All 0.2s ease; 
overflow:auto; -webkit-overflow-scrolling:touch;
}
.m-filter-close-btn{
width : 100%; 
height : 150px; 
color:orange;
background:white;
padding:50px;
font-size:50px;
border-bottom:3px solid gray;

}
#m-filter{
 background:white;
 font-size:40px;
 padding:50px 100px;
 height : 100%; 
}
.m-filter-table {
margin:auto;
margin-bottom:80px;
width:80%;
	border-spacing:0px;
}
.m-filter-table td{
 padding:50px;
 border-bottom:2px solid gray;
}
.career, #array{
	padding:30px;
	font-size:30px;

}
.sexual1, .sexual2, .sexual3{
	width:30px; height:30px;
}
.filter-search{
	padding:30px 50px;
	font-size:40px;
	color:white;
	background:orange;
}
    .subcate{
    	list-style:none;
    }
    .subcate>li{
        padding:40px;
    } 
    .subcate a{
    	text-decoration:none;
    	color:black;
    	 font-size:40px;
    }
    
    
    .sub-locale{
    	list-style:none;
    }
    .sub-locale >li{
        padding:40px;
    } 
    .sub-locale a{
    	text-decoration:none;
    	color:black;
    	 font-size:40px;
    }
    
    .pagemove{
    	margin:30px 0px;
    	text-align:center;
    	font-size:50px;
    }
	.pagemove-span{
		padding:20px;
	}
	.pagemove-table{
		display:inline-block
	}
	.pagemove-table td{
		border:0.5px solid gray;
	}
	.page-a{
	color: gray;font-size:40px;margin:0px 10px;text-decoration:none;
	padding:20px;
	}
    .dispno{
          display:none;
    }
    .dispyes{
          display:inline-block;
        }
        
    .left{
    	width:100%;
    }
    

.list{
    	width:90%;
    	margin:auto;
    	border-spacing:0px 80px;
    }
.list td{
	line-height:200%;
	padding-bottom:20px;
	border-bottom:1px solid gray;
}

.list a{
	text-decoration:none;
	color:black; 
}
#pst{
		vertical-align:top;padding:0px; width:100%;
		position: relative
	}

	#categories{
		width:100%; 
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		padding:10px 60px;
		color:Grey;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
	}

    #name{
		font-family:'JejuGothic';
		font-weight:bold;
		font-size:30px;
		color: DimGrey;
		padding:10px 20px;
	}
	
	#title{
		font-family:'JejuGothic';
		font-weight:bold;
		color: black;
		font-size: 30px;
		padding:10px 20px;
	}
	#universe{
		font-family:'JejuGothic';
		font-weight:bold;
		color: dimgray;
		font-size: 30px;
		padding:10px 20px;
	}
#price{
		font-family:Arial;
		font-weight:bold;
		font-size:30px;
		margin-top:5px;
		padding:10px 20px;
		color:black;
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
	
	.locale-main{
		font-size:30px; color:gray; padding:25px;margin-right:30px;
	}
	.locale{
		display:none;font-size:30px; color:gray; padding:25px;
	}
	

   </style>

  
</head>
<body>

  	<div style="padding:50px 0px 30px 50px;background:rgb(238, 238, 238);padding-bottom:60px;">
  	<div style="margin:0px 0px 60px 0px; font-size:40px;font-family:JejuGothic;">원하시는 수업을 찾아보세요.</div>
  	<span class="m-cate-btn">카테고리</span> <span class="m-locale-btn">지역:전체</span> <span class="m-filter-btn">상세검색</span>
  	</div>
  	
  	<div class="m-all-cate">
  	<div class="m-close-btn"> &lt; 닫기</div> 
  	<div id="m-cate"> 
			<ul>
                    <li>수학</li>
                    <li>외국어</li>
                    <li>국어</li>
                    <li>사회</li>
                    <li>과학</li>
                    <li>예체능</li>
                    <li>자소서/입시</li>
           </ul>
	</div> 

	<div id="m-subcate">
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
                       
						<li><a href="./boarder?main=41&subject=451">생활과윤리</a></li>
                        <li><a href="./boarder?main=41&subject=452">사회문화</a></li>
                        <li><a href="./boarder?main=41&subject=453">한국지리</a></li>
                        <li><a href="./boarder?main=41&subject=454">세계지리</a></li>
                        <li><a href="./boarder?main=41&subject=455">윤리와사상</a></li>
                        <li><a href="./boarder?main=41&subject=456">동아시아사</a></li>
                        <li><a href="./boarder?main=41&subject=457">법과정치</a></li>
                        <li><a href="./boarder?main=41&subject=458">세계사</a></li>
                        <li><a href="./boarder?main=41&subject=459">경제</a></li>

                        <li><a href="./boarder?main=41&subject=46">한국사</a></li>
                </ul>
                <ul class="subcate dispno">
                        <li><a href="./boarder?main=51&subject=51">전체</a></li>
						<li><a href="./boarder?main=51&subject=52">초등과학</a></li>
						<li><a href="./boarder?main=51&subject=53">중등과학</a></li>
                        <li><a href="./boarder?main=51&subject=54">고등과학</a></li>
                        <li><a href="./boarder?main=51&subject=55">물리</a></li>
                        <li><a href="./boarder?main=51&subject=56">생명과학</a></li>
                        <li><a href="./boarder?main=51&subject=57">화학</a></li>
                        <li><a href="./boarder?main=51&subject=58">지구과학</a></li>
                        
                        <li><a href="./boarder?main=51&subject=552">물리2</a></li>
                        <li><a href="./boarder?main=51&subject=562">생명과학2</a></li>
                        <li><a href="./boarder?main=51&subject=572">화학2</a></li>
                        <li><a href="./boarder?main=51&subject=582">지구과학2</a></li>
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
    </div>
  	
  	
  	
  	
  	<div class="m-all-locale">
  	<div class="m-locale-close-btn"> &lt; 닫기</div> 
  	<div id="m-locale"> 
			<ul>
					<li>지역전체</li>
                    <li>서울</li>
                    <li>경기</li>
                    <li>인천</li>
                    <li>강원</li>
                    <li>대전</li>
                    <li>세종</li>
                    <li>충남</li>
                    <li>충북</li>
                    <li>부산</li>
                    <li>울산</li>
                    <li>경남</li>
                    <li>경북</li>
                    <li>대구</li>
                    <li>전남</li>
                    <li>전북</li>
                    <li>제주</li>
                    <li></li>
                    <li></li>
                    <li></li>
           </ul>
	</div> 
  	
  	<div id="m-sub-locale">
  	<ul class="sub-locale dispno">
                                <li><a href="#">지역전체</a></li>
         </ul>
        <ul class="sub-locale dispno">
            					<li><a href="#">서울전체</a></li>
                                <li><a href="#">강남</a></li>
                                <li><a href="#">강동</a></li>
                                <li><a href="#">강북</a></li>
                                <li><a href="#">강서</a></li>
                                <li><a href="#">관악</a></li>
                                <li><a href="#">광진</a></li>
                                <li><a href="#">구로</a></li>
                                <li><a href="#">금천</a></li>
                                <li><a href="#">노원</a></li>
                                <li><a href="#">도봉</a></li>
                                <li><a href="#">동대문</a></li>
                                <li><a href="#">동작</a></li>
                                <li><a href="#">마포</a></li>
                                <li><a href="#">서대문</a></li>
                                <li><a href="#">서초</a></li>
                                <li><a href="#">성동</a></li>
                                <li><a href="#">성북</a></li>
                                <li><a href="#">송파</a></li>
                                <li><a href="#">양천</a></li>
                                <li><a href="#">영등포</a></li>
                                <li><a href="#">용산</a></li>
                                <li><a href="#">은평</a></li>
                                <li><a href="#">종로</a></li>
                                <li><a href="#">중구</a></li>
                                <li><a href="#">중랑구</a></li>  
								<li></li>         
								<li></li>
								<li></li>
								<li></li>      
         </ul>
         <ul class="sub-locale dispno ">
            <li><a href="#">경기전체</a></li>
                                <li><a href="#">가평</a></li>
                                <li><a href="#">고양시 덕양구</a></li>
                                <li><a href="#">고양시 일산동구</a></li>
                                <li><a href="#">고양시 일산서구</a></li>
                                <li><a href="#">과천시</a></li>
                                <li><a href="#">광명시</a></li>
                                <li><a href="#">광주시</a></li>
                                <li><a href="#">구리시</a></li>
                                <li><a href="#">군포시</a></li>
                                <li><a href="#">김포시</a></li>
                                <li><a href="#">남양주시</a></li>
                                <li><a href="#">동두천시</a></li>
                                <li><a href="#">부천시</a></li>
                                <li><a href="#">성남시 분당구</a></li>
                                <li><a href="#">성남시 수정구</a></li>
                                <li><a href="#">성남시 중원구</a></li>
                                <li><a href="#">수원시 권선구</a></li>
                                <li><a href="#">수원시 영통구</a></li>
                                <li><a href="#">수원시 장안구</a></li>
                                <li><a href="#">수원시 팔달구</a></li>
                                <li><a href="#">시흥시</a></li>
                                <li><a href="#">안산시 단원구</a></li>
                                <li><a href="#">안산시 상록구</a></li>
                                <li><a href="#">안성시</a></li>
                                <li><a href="#">안양시 동안구</a></li>
                                <li><a href="#">안양시 만안구</a></li>
                                <li><a href="#">양주시</a></li>
                                <li><a href="#">양평군</a></li>
                                <li><a href="#">여주시</a></li>
                                <li><a href="#">연천구</a></li>
                                <li><a href="#">오산시</a></li>
                                <li><a href="#">용인시 기흥구</a></li>
                                <li><a href="#">용인시 수지구</a></li>
                                <li><a href="#">용인시 처인구</a></li>
                                <li><a href="#">의왕시</a></li>
                                <li><a href="#">의정부시</a></li>
                                <li><a href="#">이천시</a></li>
                                <li><a href="#">파주시</a></li>
                                <li><a href="#">평택시</a></li>
                                <li><a href="#">포천시</a></li>
                                <li><a href="#">하남시</a></li>
                                <li><a href="#">화성시</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>
        
         <ul class="sub-locale dispno">
            <li><a href="#">인천전체</a></li>
                                <li><a href="#">강화군</a></li>
                                <li><a href="#">계양구</a></li>
                                <li><a href="#">남동구</a></li>
                                <li><a href="#">동구</a></li>
                                <li><a href="#">미추홀구</a></li>
                                <li><a href="#">부평구</a></li>
                                <li><a href="#">서구</a></li>
                                <li><a href="#">연수구</a></li>
                                <li><a href="#">옹진군</a></li>
                                <li><a href="#">중구</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>
        <ul class="sub-locale dispno">
            <li><a href="#">강원전체</a></li>
            <li><a href="#">강릉</a></li>
            <li><a href="#">고성</a></li>
            <li><a href="#">동해</a></li>
            <li><a href="#">삼척</a></li>
            <li><a href="#">속초</a></li>
            
            <li><a href="#">양구</a></li>
            <li><a href="#">양양</a></li>
            <li><a href="#">영월</a></li>
            <li><a href="#">원주</a></li>
            <li><a href="#">인제</a></li>
            
            <li><a href="#">정선</a></li>
            <li><a href="#">철원</a></li>
            <li><a href="#">춘천</a></li>
            <li><a href="#">태백</a></li>
            <li><a href="#">평창</a></li>
            
            <li><a href="#">홍천</a></li>
            <li><a href="#">화천</a></li>
            <li><a href="#">횡성</a></li>
            <li></li>
            <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>
        <ul class="sub-locale dispno">
            <li><a href="#">대전전체</a></li>
            <li><a href="#">대덕구</a></li>
            <li><a href="#">동구</a></li>
            <li><a href="#">서구</a></li>
            <li><a href="#">유성구</a></li>
            <li><a href="#">중구</a></li> 
            
        </ul>
        <ul class="sub-locale dispno">
            <li><a href="#">세종</a></li>
        </ul>
        <ul class="sub-locale dispno">
            <li><a href="#">충청전체</a></li>
            <li><a href="#">계룡</a></li>
            <li><a href="#">공주</a></li>
            <li><a href="#">금산</a></li>
            <li><a href="#">논산</a></li>
            <li><a href="#">당진</a></li>
            
            <li><a href="#">보령</a></li>
            <li><a href="#">부여</a></li>
            <li><a href="#">서산</a></li>
            <li><a href="#">서천</a></li>
            <li><a href="#">아산</a></li>
            <li><a href="#">예산</a></li>
            
            <li><a href="#">천안시 동남구</a></li>
            <li><a href="#">천안시 서북구</a></li>
            <li><a href="#">청양군</a></li>
            <li><a href="#">태안군</a></li>
            <li><a href="#">홍성군</a></li> 
            <li></li>
            <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>
        <ul class="sub-locale dispno">
                <li><a href="#">충북전체</a></li>
                <li><a href="#">괴산군</a></li>
                <li><a href="#">단양군</a></li>
                <li><a href="#">보은군</a></li>
                <li><a href="#">영동군</a></li>
                <li><a href="#">옥천군</a></li>
                
                <li><a href="#">음성군</a></li>
                <li><a href="#">제천시</a></li>
                <li><a href="#">증평군</a></li>
                <li><a href="#">진천군</a></li>
                <li><a href="#">청주시 상당구</a></li>
                <li><a href="#">청주시 서원구</a></li>
                
                <li><a href="#">청주시 청원구</a></li>
                <li><a href="#">청주시 흥덕구</a></li>
                <li><a href="#">층주시</a></li>
                <li></li>
                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>

        <ul class="sub-locale dispno">
            <li><a href="#">부산전체</a></li>
                                <li><a href="#">강서구</a></li>
                                <li><a href="#">금정구</a></li>
                                <li><a href="#">기장구</a></li>
                                <li><a href="#">남구</a></li>
                                <li><a href="#">동구</a></li>
                                
                                <li><a href="#">동래구</a></li>
                                <li><a href="#">부산진구</a></li>
                                <li><a href="#">북구</a></li>
                                <li><a href="#">사상구</a></li>
                                <li><a href="#">사하구</a></li>
                                <li><a href="#">서구</a></li>
                                
                                <li><a href="#">수영구</a></li>
                                <li><a href="#">연제구</a></li>
                                <li><a href="#">영도구</a></li>
                                <li><a href="#">중구</a></li>
                                <li><a href="#">해운대구</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>

        <ul class="sub-locale dispno">
            <li><a href="#">울산전체</a></li>
                                <li><a href="#">남구</a></li>
                                <li><a href="#">동구</a></li>
                                <li><a href="#">북구</a></li>
                                <li><a href="#">울주군</a></li>
                                <li><a href="#">중구</a></li>
        </ul>

        <ul class="sub-locale dispno">
        <li><a href="#">경남전체</a></li>
                                <li><a href="#">거제시</a></li>
                                <li><a href="#">거창군</a></li>
                                <li><a href="#">고성군</a></li>
                                <li><a href="#">김해시</a></li>
                                <li><a href="#">남해군</a></li>
                                
                                <li><a href="#">밀양시</a></li>
                                <li><a href="#">사천시</a></li>
                                <li><a href="#">산청군</a></li>
                                <li><a href="#">양산시</a></li>
                                <li><a href="#">의령군</a></li>
                                <li><a href="#">진주시</a></li>
                                
                                <li><a href="#">창녕군</a></li>
                                <li><a href="#">창원시 마산합포구</a></li>
                                <li><a href="#">창원시 마산회원구</a></li>
                                <li><a href="#">창원시 성산구</a></li>
                                <li><a href="#">창원시 의창구</a></li>
                                <li><a href="#">창원시 진해구</a></li>
                                
                                <li><a href="#">통영시</a></li>
                                <li><a href="#">하동군</a></li>
                                <li><a href="#">함안군</a></li>
                                <li><a href="#">함양군</a></li>
                                <li><a href="#">합천군</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
                            </ul>

        <ul class="sub-locale dispno">
                <li><a href="#">경북전체</a></li>
                                <li><a href="#">경산시</a></li>
                                <li><a href="#">경주시</a></li>
                                <li><a href="#">고령군</a></li>
                                <li><a href="#">구미시</a></li>
                                <li><a href="#">군위군</a></li>
                                
                                <li><a href="#">김천시</a></li>
                                <li><a href="#">문경시</a></li>
                                <li><a href="#">봉화군</a></li>
                                <li><a href="#">상주시</a></li>
                                <li><a href="#">성주군</a></li>
                                <li><a href="#">안동시</a></li>
                                
                                <li><a href="#">영덕군</a></li>
                                <li><a href="#">영양군</a></li>
                                <li><a href="#">영주시</a></li>
                                <li><a href="#">영천시</a></li>
                                <li><a href="#">예천군</a></li>
                                <li><a href="#">울릉군</a></li>
                                
                                <li><a href="#">울진군</a></li>
                                <li><a href="#">의성군</a></li>
                                <li><a href="#">청도군</a></li>
                                <li><a href="#">청송군</a></li>
                                <li><a href="#">칠곡군</a></li>
                                <li><a href="#">포항시 남구</a></li>
                                
                                <li><a href="#">포항시 북구</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>

        <ul class="sub-locale dispno">
                <li><a href="#">대구전체</a></li>
                <li><a href="#">남구</a></li>
                <li><a href="#">달서구</a></li>
                <li><a href="#">달성군</a></li>
                <li><a href="#">동구</a></li>
                <li><a href="#">북구</a></li>
                
                <li><a href="#">서구</a></li>
                <li><a href="#">수성구</a></li>
                <li><a href="#">중구</a></li>
        </ul>

        <ul class="sub-locale dispno">
                <li><a href="#">광주전체</a></li>
                <li><a href="#">광산구</a></li>
                <li><a href="#">남구</a></li>
                <li><a href="#">동구</a></li>
                <li><a href="#">북구</a></li>
                <li><a href="#">서구</a></li>
        </ul>
        <ul class="sub-locale dispno">
                <li><a href="#">전남전체</a></li>
                                <li><a href="#">강진군</a></li>
                                <li><a href="#">고흥군</a></li>
                                <li><a href="#">곡성군</a></li>
                                <li><a href="#">광양시</a></li>
                                <li><a href="#">구례군</a></li>
                                
                                <li><a href="#">나주시</a></li>
                                <li><a href="#">담양군</a></li>
                                <li><a href="#">목포시</a></li>
                                <li><a href="#">무안군</a></li>
                                <li><a href="#">보성군</a></li>
                                <li><a href="#">순천시</a></li>
                                
                                <li><a href="#">신안군</a></li>
                                <li><a href="#">여수시</a></li>
                                <li><a href="#">영광군</a></li>
                                <li><a href="#">영암군</a></li>
                                <li><a href="#">완도군</a></li>
                                <li><a href="#">장성군</a></li>
                                
                                <li><a href="#">장흥군</a></li>
                                <li><a href="#">진도군</a></li>
                                <li><a href="#">함평군</a></li>
                                <li><a href="#">해남군</a></li>
                                <li><a href="#">화순군</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>

        <ul class="sub-locale dispno">
                <li><a href="#">전북전체</a></li>
                                <li><a href="#">고창군</a></li>
                                <li><a href="#">군산시</a></li>
                                <li><a href="#">김제시</a></li>
                                <li><a href="#">남원시</a></li>
                                <li><a href="#">무주군</a></li>
                                
                                <li><a href="#">부안군</a></li>
                                <li><a href="#">순창군</a></li>
                                <li><a href="#">완주군</a></li>
                                <li><a href="#">익산시</a></li>
                                <li><a href="#">임실군</a></li>
                                <li><a href="#">장수군</a></li>
                                
                                <li><a href="#">전주시 덕진구</a></li>
                                <li><a href="#">전주시 완산구</a></li>
                                <li><a href="#">정읍시</a></li>
                                <li><a href="#">진안군</a></li>
                                <li></li>
                                <li></li>         
								<li></li>
								<li></li>
								<li></li>
        </ul>

        <ul class="sub-locale dispno">
                <li><a href="#">제주전체</a></li>
                <li><a href="#">서귀포시</a></li>
                <li><a href="#">제주시</a></li>
        </ul>

</div>
</div>
<div>
     <form method="post">    
    <div class="m-all-filter">
  	<div class="m-filter-close-btn"> &lt; 닫기</div> 
  	<div id="m-filter"> 
  	<table class="m-filter-table">
  		<tr>
  		<td>경력</td>
  		<td>
  			<select class="career" id="career" name="career">
                   			<option value="0">무관</option>
                    		<option value="1">1년이상</option>
                    		<option value="2">2년이상</option>
                    		<option value="3">3년이상</option>
                    		<option value="5">5년이상</option>
                    		<option value="7">7년이상</option>
                    		<option value="10">10년이상</option>
            </select>
  		</td>
  		</tr>
  		<tr>
  		<td>성별</td>
  		<td>
  						<label style="cursor:pointer;margin:20px;"><input type="radio" name="sexual" class="sexual1" value="">무관</label>&nbsp;
            			<label style="cursor:pointermargin:20px;"><input type="radio" name="sexual" class="sexual2" value="남">남</label>&nbsp;
            			<label style="cursor:pointer"><input type="radio" name="sexual" class="sexual3" value="여">여</label>&nbsp;
            							
        </td>
  		</tr>
  		<tr>
  		<td>정렬</td>
  		<td>
  						<select id="array" name="array">
                			<option value="readcount">조회수</option>
                			<option value="id">최신순</option>
                		</select>
  		</td>
  		</tr>
  	</table>
  	<div style="text-align:center;"><span class="filter-search">검색하기</span></div>
  	</div>
  	</div>


      
     <div style="width:80%; margin:40px auto; font-size:30px;line-height:150%; display:none;">
            <select class="locale-main locale1" name="locale1">
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
             <select class="locale locale2">
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
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
                                <option value="">대전전체</option>
                                <option>대덕구</option>
                                <option>동구</option>
                                <option>서구</option>
                                <option>유성구</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale locale2" >
                                <option>세종</option>
                        </select>
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
                                <option value="">울산전체</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>울주군</option>
                                <option>중구</option>
                        </select>
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
                                <option value="">광주전체</option>
                                <option>광산구</option>
                                <option>남구</option>
                                <option>동구</option>
                                <option>북구</option>
                                <option>서구</option>
                        </select>
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2" >
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
                        
                        <select class="locale locale2">
                                <option value="">제주전체</option>
                                <option>서귀포시</option>
                                <option>제주시</option>
                        </select>
                        <input type="submit" value="검색" style="margin:0px 0px 0px 40px; padding:25px; font-size:30px;" class="submit-btn"/>
                        </div>
                        
            		</form>
        		</div>
            
        
        <div style="width:100%;min-height:600px; margin:auto;padding-bottom:240px">
        <div class="left">
<c:choose>
	<c:when test="${listModel.hasList == false }" >
	<table class="list">
	<tr>
	<td colspan="4" style="padding:40px; font-size:40px;">
	해당 요청에 대한 수업이 없습니다. <br>더욱 다양한 선생님들을 모시도록 하겠습니다.
	</td>
	</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table class="list">
	<c:forEach var="post" items="${listModel.list}">
	<tr>
	<td style="width:30%;">
	<a href="./boardread?postId=${post.id}">
	<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:100%; height:250px;border-radius:20px; "/><br/>
	</td>
	<td>
	<a href="./boardread?postId=${post.id}">
	<div>
	<div id="title"> ${post.title}</div>
	<div id="name">${post.nickname}(${post.birth}, ${post.sexual})&nbsp;&nbsp;경력 <c:if test="${post.career!=0}">${post.career}년</c:if><c:if test="${post.career==0}">1년미만</c:if></div>
	<c:choose>
		<c:when test="${post.academy ne '' and post.academy != null}">
			<div id="universe"> ${post.academy} ${post.academyd}</div>
		</c:when>
		<c:otherwise>
			<div id="universe"> ${post.universe} ${post.univsub}</div>
		</c:otherwise>
	</c:choose>	
	<div id="price" > ${post.subCate0} ${post.price3}원 <c:if test="${post.subCate1 !='nonevalue' }">/ ${post.subCate1} ${post.opt1price3}원</c:if> <c:if test="${post.subCate2!='nonevalue' }">/ ${post.subCate2} ${post.opt2price3}원</c:if></div>
	</div>
	</a>
	</td>
	</tr>
	</c:forEach>
	
	</table>
	
	
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

  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script>
    
    $(window).bind("pageshow", function(event) {
    	if ( event.originalEvent && event.originalEvent.persisted) {// BFCahe
    		//모바일 사파리에서 뒤로가기시 뒤로가기전 화면을 그대로 보여줘서 애니메이션 효과를 제거
    		$('.m-close-btn').trigger("click");
    		$('.m-locale-close-btn').trigger("click");
    		$('.m-filter-close-btn').trigger("click");
       	}
    });
    
       $(document).ready(function(){
    	   
    	   $(".m-cate-btn").click(function() { 
       		$(".m-all-cate").animate({
       			right:"0%"
       		},100, function(){
       		});

       	});

       	$(".m-close-btn").click(function() { 
       		$(".m-all-cate").animate({
       			right:"-101%"
       		},100, function(){

       		});

       		$(this).animate({
       			right:"-100%"
       		},100, function(){
       		})
       	});
    	   
    	   
            $('#m-cate li').click(function(){
            	var index = $(this).index();
            	$('.subcate').hide();
                $('.subcate').eq(index).show();
              });
            
            ////////////////
            
       $(".m-locale-btn").click(function() { 
       		$(".m-all-locale").animate({
       			right:"0%"
       		},100, function(){
       		});
       	});

       	$(".m-locale-close-btn").click(function() { 
       		$(".m-all-locale").animate({
       			right:"-101%"
       		},100, function(){

       		});
       	});
    	   
        var mLocaleH =  $('#m-locale').height();
            $('#m-locale li').click(function(){
            	var index = $(this).index();
            	$('.sub-locale').hide();
                $('.sub-locale').eq(index).show();
                
                $('#m-locale').css('height', mLocaleH);
                if($('#m-locale').height()>$('.sub-locale').eq(index).height()){
                	$('.sub-locale').eq(index).css('height', mLocaleH);
				}else{
					$('#m-locale').css('height', $('.sub-locale').eq(index).height() );
                }
              });
           
            $('.sub-locale a').click(function(){
            	var localeIdx = $(this).parents('ul').index();
				var subLocale =$('#m-locale li').eq(localeIdx).text();   
				
		
				if($(this).text() == '지역전체'){
					$('.locale-main').val("");
					$('.locale').attr('name','');
				}else if(subLocale=='서울전체'||subLocale=='경기전체'||subLocale=='인천전체'||subLocale=='강원전체'||
						subLocale=='대전전체'||subLocale=='세종전체'||subLocale=='충남전체'||subLocale=='충북전체'||
						subLocale=='부산전체'||subLocale=='울산전체'||subLocale=='경남전체'||subLocale=='경북전체'||
						subLocale=='대구전체'||subLocale=='전남전체'||subLocale=='전북전체'||subLocale=='제주전체'){
					
					$('.locale-main').val( $('#m-locale li').eq(localeIdx).text() ).attr("selected",true) 
					$("select[name='locale2']").val("");
					
				}else{
					$('.locale-main').val($('#m-locale li').eq(localeIdx).text()).change();
					$("select[name='locale2']").val($(this).text()).change();
				}
				$('.submit-btn').trigger('click');
            });
        
            
            
    		///////
			
    		$(".m-filter-btn").click(function() { 
           		$(".m-all-filter").animate({
           			right:"0%"
           		},100, function(){
           		});
           	});

           	$(".m-filter-close-btn").click(function() { 
           		$(".m-all-filter").animate({
           			right:"-101%"
           		},100, function(){

           		});
           	});
    				
    		$('.filter-search').click(function(){
				$('.submit-btn').trigger('click');    			
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
           
            $('.m-cate-btn').text(main+":"+subject);
            
            
            
            $('#m-cate li').each(function(){
            	if($(this).text()==main){
            		
            	}
            });
            
            $('#m-sub-cate').trigger('click');
            
            var idx="";
            $('#m-cate li').each(function(){
            	if($(this).text()==main){
            		idx=$(this).index();
            		$(this).trigger('click');
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
            
            
            
            
            var idxL="";
            $('#m-locale li').each(function(){
            	if($(this).text()==locale1){
            		idxL=$(this).index();
            		$(this).trigger('click');
            	}
            	if( locale1===""){
            		 $('#m-locale li').eq(0).trigger('click');
            	}
            });
            
            $('.sub-locale').eq(idxL).find('li').each(function(){
            	$(this).find('a').each(function(){
            		if($(this).text()==locale2){
                		$(this).css('font-weight', 'bolder');
                	}
            		if(locale2==""){
            			$(this).parents('ul').find('li').eq(0).css('font-weight', 'bolder');
                	}
            	})
            });
            
            
            
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
            	//지역전체가 아닌경우
            	if(lidx!=0){
            		
            		$('.m-locale-btn').text(locale1+":"+locale2);
            		
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
            
            
            
            
            var jbOffset = $('.m-jbMenu').offset(); //상단메뉴 좌표 가져오는 코드
            $( window ).scroll( function() {        
              if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                $( '.m-jbMenu' ).addClass( 'm-jbFixed' );
              }
              else {
                $( '.m-jbMenu' ).removeClass( 'm-jbFixed' );
              }
            });
        
            $('.page-a').click(function(){
        		var href = $(this).attr("href");
        		href=href+"&locale1P="+encodeURIComponent(locale1)+"&locale2P="+encodeURIComponent(locale2)+"&sexualP="+encodeURIComponent(sexual);
        		$(this).prop('href',href);
        	});

          
       });
    </script>
</body>
</html>