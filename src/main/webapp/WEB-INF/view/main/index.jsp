<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>콕사부</title>
<meta charset="utf-8">
<meta name="description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다." />
<meta property="og:type" content="website">
<meta property="og:title" content="콕사부">
<meta property="og:site_name" content="콕사부">
<meta property="og:description" content="내가 찾던 레슨을 만나는 곳, 콕사부입니다.">
<meta property="og:image" content="https://www.coksabu.com/resources/images/logo.png">
<meta property="og:url" content="https://www.coksabu.com">
    
    <meta name="naver-site-verification" content="e6966f55fdf78bcca4b767ce7d213cd6f820ac9a" />
    <meta name="google-site-verification" content="p08VIDL4nCSNtPHj4o5tkE5_kxA34KzlSkwzGyOTTzk" />
    <link rel="stylesheet" type="text/css" href= "<c:url value="/resources/slick/slick.css" />" >
  <link rel="stylesheet" type="text/css" href= "<c:url value="/resources/slick/slick-theme.css" />">
  <link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
    <style>
     @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
            font-family:'Malgun Gothic' ;
            
          }
          .jbMenu {
            z-index:3;
            display: inline-block;
            background-color: white;
            padding: 0px;
            width: 100%;
            min-width:550px;
            border-bottom : solid 2px black;

          }
          .top-title{
            float:left;
            height:100%;
            border-right : 2px solid black;
            text-align:center;
          }
          .jbMenu > ul {
            margin:12px 0px 0px 0px;
            padding: 0px;
            list-style:none;
            float:right;
          }
          .jbMenu li{
            display :inline;
            margin-right:20px;
          }
          
         .top-ul a {
            text-decoration:none;
            color :black
          }
          .jbFixed {
            position: fixed;
            top: 0px;
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
          .top-ul a {
            text-decoration:none;
            color :black
          }
          .jbFixed {
            position: fixed;
            top: 0px;
          }
          #inner-fade{
            z-index:1;
          }
          .main-search{
            position:absolute;
            left:50%; 
            transform:translateX(-50%);
            top:300px;
            z-index: 2;
            min-width:600px;
          }
          .main-search>p{
            color:white;
            font-size:40px;
            font-family: 'JejuGothic';
            margin-bottom:20px;
          }
          .main-input{
            float:left;
            width:520px;
            height:60px;
            border: 2px solid #7db9d1;
      -webkit-border-top-left-radius:15px;
      -webkit-border-bottom-left-radius:15px;
      -moz-border-top-left-radius:15px;
      -moz-border-bottom-left-radius:15px;
      border-top-left-radius:15px;
      border-bottom-left-radius:15px;
           margin-right:0px;
           font-size:20px;
          text-indent:1em;
        }
        .search-button{
          width:80px;
            -webkit-height:60px;
            -moz-height:60px;
          height:60px;
          font-size:20px;
          background-color:#7db9d1;
          color:white;
          border: 2px solid #7db9d1;
          -webkit-border-top-right-radius:15px;
          -moz-border-bottom-right-radius:15px;
          border-top-right-radius:15px;
          border-bottom-right-radius:15px;
          margin-left:0px;
          padding:0px;
         }
        .fadeImg{height:450px}
        .category{
          text-align:center;
          margin-top:40px;
          border-spacing:0;
          margin-right:auto;
          margin-left:auto;
          min-width:1000px;
        }
        .categoryTr{
          background-color:#F2F2F2;
        }
        .category td{
          font-family: 'JejuGothic';
          font-size:17px;
          padding:20px 35px;;
          margin:0px;
        }
        .category td>a{
          text-decoration:none;
          color:black;
        }
        .cateTitle{
          margin-left:15%;
          padding:0px;
          font-family: 'JejuGothic';
          font-size:20px;
        }
        .cateTitle > b{
          font-size:28px;
        }
        .white{
          background-color:white;
          border:2px solid black;
        }
        .dispno{
          display:none;
        }
        .dispyes{
          display:block;
        }

		.frame1{
		 	float:left;
		  	margin:0px 40px;
			width:130px;
			padding:5px;
		}
        .frame-cate{
          padding:10px;
          font-family:'JejuGothic';
          font-size:18px;
        }

        .frame1 div{
          font-family:'JejuGothic';
          font-size:15px;
          line-height: 250%;
          padding-left:10px;
        }
        
        .frame1 a{
        	text-decoration:none;
        	color: black;
        }

        .slider {
        width: 70%;
        margin: 20px auto 80px auto;
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
    }
    
    #menu > table{
    	text-align:center;
    	border-spacing:20px;
    }

    .menu-td{
    	border-radius:5px;
    	color:white;
    	background: green;
    	padding:6px;
    }
    
    .menu-td a{
    	color:white;
    	text-decoration:none;
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
    </style>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="<c:url value="/resources/js/jquery.innerfade.js"/>"></script>
    <script src= "<c:url value="/resources/slick/slick.js" />" type="text/javascript" charset="utf-8"></script>
   <script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
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


        $('.fadeImg').css('width',$(document).width());
        
            $("#inner-fade").innerfade({
                animationtype:'fade',
                speed:750,
                timeout:5000,
                type:'sequence',
                containerheight:'450px'
            });

            $('.categoryTr>td').mouseenter(function(){
              $('.white').removeClass();
              $(this).addClass('white');
              
            })
        
            $('.categoryTr>td').mouseenter(function(){
              var tdIndex = $(this).index();
              $('.dispyes').removeClass('dispyes').addClass('dispno');
              $('.cont').eq(tdIndex).removeClass('dispno');
              $('.cont').eq(tdIndex).addClass('dispyes');
            })

            $('.categoryTr>td:first').trigger('mouseenter');

            $(".vertical-center-4").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
    
      $(".vertical").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
      $(".vertical2").slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll: 1
        });
      $(".regular").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll:1 
      });
      
      $(".regular2").slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll:1 
        });
      
      $(".center").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
      
      $('.main-input').colorbox({
          inline:true,
          overlayOpacity:0.5,
          onOpen:function(){
          },
        });
      
      $('.frame1 div').hover(function(){
    	  $(this).css('background','rgb(211, 211, 211)');
      },function(){
    	  $(this).css('background','white');
      })
      

      
      
       });
    </script>
</head>
<body>
<div>
  <header>
 <div class="jbMenu">
                <div class="top-title"><a href="./"><img src="<c:url value="/resources/images/logo.png" />" alt="로고" /></a></div>
                
            <sec:authorize access="!isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">레슨목록</a></li>
                    <li><a href="./applylist">요청목록</a></li>
                    <li><a href="./login">로그인</a></li>
                    <li><a href="./signup">회원가입</a></li>
                </ul>
             </sec:authorize>
             <sec:authorize access="isAuthenticated()">
                <ul class="top-ul">
                    <li><a href="./boarder?main=11&subject=11">레슨목록</a></li>
                    <li><a href="./applylist">요청목록</a></li>
                    <li><a href="./lessonapply">레슨요청</a></li>
                    <li><a href="./myroom">마이페이지</a></li>
                    <li><a href="./message">메세지</a></li>
                    <li><a href="<c:url value='j_spring_security_logout' />">로그아웃</a></li>
                </ul>
              </sec:authorize>
          </div>
          
           <div style="display:none; font-size:15px; color:gray; ">
            <div id="menu" >
            <table>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=11" >수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=21">외국어</a></td><td class="menu-td"><a href="./boarder?main=31&subject=31">국어</a></td><td class="menu-td"><a href="./boarder?main=41&subject=41">사회</a></td><td class="menu-td"> <a href="./boarder?main=51&subject=51">과학</a> </td><td class="menu-td"><a href="./boarder?main=61&subject=61">예체능</a></td><td class="menu-td"><a href="./boarder?main=71&subject=71">자소서/입시</a></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=12">초등수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=22">초등영어</a></td><td class="menu-td"><a href="./boarder?main=31&subject=32">초등국어</a></td><td class="menu-td"><a href="./boarder?main=41&subject=42">초등사회</a></td><td class="menu-td"><a href="./boarder?main=51&subject=52">초등과학</a></td><td class="menu-td"><a href="./boarder?main=61&subject=62">미술</a></td><td class="menu-td"><a href="./boarder?main=71&subject=72">자소서첨삭</a></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=13">중등수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=23">중등영어</a></td><td class="menu-td"><a href="./boarder?main=31&subject=33">중등국어</a></td><td class="menu-td"><a href="./boarder?main=41&subject=43">중등사회</a></td><td class="menu-td"><a href="./boarder?main=51&subject=53">중등과학</a></td><td class="menu-td"><a href="./boarder?main=61&subject=63">음악</a></td><td class="menu-td"><a href="./boarder?main=71&subject=73">입시컨설팅</a></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=14">고등수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=24">고등영어</a></td><td class="menu-td"><a href="./boarder?main=31&subject=34">고등국어</a></td><td class="menu-td"><a href="./boarder?main=41&subject=44">고등사회</a></td><td class="menu-td"><a href="./boarder?main=51&subject=54">고등과학</a></td><td class="menu-td"><a href="./boarder?main=61&subject=64">체육</a></td><td></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=15">이과수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=25">수능영어</a></td><td class="menu-td"><a href="./boarder?main=31&subject=35">수능국어</a></td><td class="menu-td"><a href="./boarder?main=41&subject=45">사회탐구</a></td><td class="menu-td"><a href="./boarder?main=51&subject=55">물리</a></td><td></td><td></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=16">문과수학</a></td><td class="menu-td"><a href="./boarder?main=21&subject=26">영어회화</a></td><td class="menu-td"><a href="./boarder?main=31&subject=36">국어논술</a></td><td class="menu-td"><a href="./boarder?main=41&subject=46">한국사</a></td><td class="menu-td"><a href="./boarder?main=51&subject=56">생명</a></td><td></td><td></td>
            </tr>
            
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=17">수학논술</a></td><td class="menu-td"><a href="./boarder?main=21&subject=27">toeic/tofle/teps</a></td> <td></td> <td></td><td class="menu-td"><a href="./boarder?main=51&subject=57">지구과학</a></td><td></td><td></td>
            </tr>
            
            <tr>
            <td class="menu-td"><a href="./boarder?main=11&subject=18">수학경시</a></td><td class="menu-td"><a href="./boarder?main=21&subject=28">일본어</a></td><td></td><td></td><td class="menu-td"><a href="/boarder?main=51&subject=58">화학</a></td><td></td><td></td>
            </tr>

            <tr>
			<td></td><td class="menu-td"><a href="./boarder?main=21&subject=29">중국어</a></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            
            </table>

            </div>
            </div>
          
  </header>
          <div class="main-search">
                <input type="text" class="main-input" href="#menu" placeholder="원하시는 수업을 찾아보세요..."/>
                <button class="search-button">검색</button>
          </div>

        <ul id="inner-fade">
            
            <li><img class="fadeImg" src="<c:url value="/resources/img/main5.png" />"  alt="메인이미지1"/></li>
            <li><img class="fadeImg" src="<c:url value="/resources/img/main3.png" />"  alt="메인이미지2"/></li>
            <li><img class="fadeImg" src="<c:url value="/resources/img/main1.png" />"  alt="메인이미지3"/></li>
        </ul>
      <nav>
        <table class="category">
          <tr class="categoryTr">
          <td><a href="./boarder?main=11&subject=11">수학</a></td>
          <td><a href="./boarder?main=21&subject=21">외국어</a></td>
          <td><a href="./boarder?main=31&subject=31">국어</a></td>
          <td><a href="./boarder?main=41&subject=41">사회</a></td>
          <td><a href="./boarder?main=51&subject=51">과학</a></td>
          <td><a href="./boarder?main=61&subject=61">예체능</a></td>
          <td><a href="./boarder?main=71&subject=71">자소서/입시</a></td>
        </tr>
        </table>
      </nav>
        <div class="a2" style="width:1000px; min-width:1000px;min-height:350px;padding-bottom:20px; border:2px solid black; margin:20px auto 100px auto;">
              <div class='cont dispno'>
                <div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
                	<a href="./boarder?main=11&subject=12"><div>초등수학</div>
                    <a href="./boarder?main=11&subject=13"><div>중등수학</div></a>
                    <a href="./boarder?main=11&subject=14"><div>이과수학</div></a>
                    <a href="./boarder?main=11&subject=15"><div>문과수학</div></a>
                    <a href="./boarder?main=11&subject=16"><div>고등수학</div></a>
                    <a href="./boarder?main=11&subject=17"><div>수학논술</div></a>
                    <a href="./boarder?main=11&subject=18"><div>수학경시</div></a>              
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                <table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
					<c:if test="${status.index>=0 && status.index<3}">
						<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
					</c:if>
					</c:forEach>
				</table>
				</div>
              <div class='cont dispno'>
                 <div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
               			<a href="./boarder?main=21&subject=22"><div>초등영어</div></a>
                        <a href="./boarder?main=21&subject=23"><div>중등영어</div></a>
                        <a href="./boarder?main=21&subject=24"><div>고등영어</div></a>
                        <a href="./boarder?main=21&subject=25"><div>수능영어</div></a>
                        <a href="./boarder?main=21&subject=26"><div>영어회화</div></a>
                        <a href="./boarder?main=21&subject=27"><div>toeic/tofle/teps</div></a>
                        <a href="./boarder?main=21&subject=28"><div>일본어</div></a>
                        <a href="./boarder?main=21&subject=29"><div>중국어</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
           	 	<table class="list">
				<c:forEach var="post" items="${list}" varStatus="status">
					<c:if test="${status.index>=3 && status.index<6}">
						<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
					</c:if>
				</c:forEach>
				</table>
				</div>
              	<div class='cont dispno'>
   				<div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
               			<a href="./boarder?main=31&subject=32"><div>초등국어</div></a>
                        <a href="./boarder?main=31&subject=33"><div>중등국어</div></a>
                        <a href="./boarder?main=31&subject=34"><div>고등국어</div></a>
                        <a href="./boarder?main=31&subject=35"><div>수능국어</div></a>
                        <a href="./boarder?main=31&subject=36"><div>국어논술</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
                <table class="list">
				<c:forEach var="post" items="${list}" varStatus="status">
					<c:if test="${status.index>=6 && status.index<9}">
						<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
					</c:if>
				</c:forEach>
				</table>
				</div>
              <div class='cont dispno'>
   				<div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
              			<a href="./boarder?main=41&subject=42"><div>초등사회</div></a>
                        <a href="./boarder?main=41&subject=43"><div>중등사회</div></a>
                        <a href="./boarder?main=41&subject=44"><div>고등사회</div></a>
                        <a href="./boarder?main=41&subject=45"><div>사회탐구</div></a>
                        <a href="./boarder?main=41&subject=46"><div>한국사</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
                	<table class="list">
					<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=9 && status.index<12}">
		
						<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
						</c:if>
					</c:forEach>
				</table>
				</div>
              <div class='cont dispno'>
   				<div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
               			<a href="./boarder?main=51&subject=52"><div>초등과학</div></a>
						<a href="./boarder?main=51&subject=53"><div>중등과학</div></a>
                        <a href="./boarder?main=51&subject=54"><div>고등과학</div></a>
                        <a href="./boarder?main=51&subject=55"><div>물리</div></a>
                        <a href="./boarder?main=51&subject=56"><div>생명</div></a>
                        <a href="./boarder?main=51&subject=57"><div>화학</div></a>
                        <a href="./boarder?main=51&subject=58"><div>지구과학</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
                	<table class="list">
						<c:forEach var="post" items="${list}" varStatus="status">
						<c:if test="${status.index>=12 && status.index<15}">
	
						<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
						</c:if>
					</c:forEach>
				</table>
	
	</div>
              <div class='cont dispno'>
   				<div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
                		<a href="./boarder?main=61&subject=62"><div>미술</div></a>
                        <a href="./boarder?main=61&subject=63"><div>음악</div></a>
                        <a href="./boarder?main=61&subject=64"><div>체육</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
                <table class="list">
				<c:forEach var="post" items="${list}" varStatus="status">
					<c:if test="${status.index>=15 && status.index<18}">
	
					<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
					</c:if>
				</c:forEach>
				</table>
			</div>
              <div class='cont dispno'>
 				 <div class="frame1">
                  <p class="frame-cate">카테고리</p>
                  <hr/>
                		<a href="./boarder?main=71&subject=72"><div>자소서첨삭</div></a>
                        <a href="./boarder?main=71&subject=73"><div>입시컨설팅</div></a>
                </div>
                <div style="font-family:'JejuGothic'; font-size:20px;margin-top:20px;width:600px">&nbsp;&nbsp;&nbsp;&nbsp;인기 추천 수업</div>
                
                <table class="list">
				<c:forEach var="post" items="${list}" varStatus="status">
					<c:if test="${status.index>=18 && status.index<21}">
					<tr style="width:100%;">
							<td>
							<a href="<c:url value="./boardread?postId=${post.id}"/>">
							<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
							<img src="<c:url value='/img/representImg/${post.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="레슨대표이미지"/>
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
					</c:if>
				</c:forEach>
				</table>
				</div>
	      </div>
        <div class="cateTitle"><p><b>수학</b> 전문가와 수업해보세요.</p></div>
        <section class="vertical-center-4 slider">
            <div><a href="./boarder?main=11&subject=14" ><img src="<c:url value="/resources/img/math2.png" />" alt="이과수학"></a></div>
            <div><a href="./boarder?main=11&subject=15" ><img src="<c:url value="/resources/img/math3.png" />" alt="문과수학"></a></div>
            <div><a href="./boarder?main=11&subject=16" ><img src="<c:url value="/resources/img/math5.png" />" alt="고등수학"></a></div>
            <div><a href="./boarder?main=11&subject=13" ><img src="<c:url value="/resources/img/middlemath.png" />" alt="중등수학"></a></div>
            <div><a href="./boarder?main=11&subject=12" ><img src="<c:url value="/resources/img/elementmath.png" />" alt="초등수학"></a></div>
            <div><a href="./boarder?main=11&subject=18" ><img src="<c:url value="/resources/img/math6.png" />" alt="수학경시"></a></div>
            <div><a href="./boarder?main=11&subject=17" ><img src="<c:url value="/resources/img/mathlogic.png" />" alt="수학논술"></a></div>
        </section> 

        <div class="cateTitle"><p>나에게 맞는 <b>외국어</b> 수업을 찾고 싶다면</p></div>
        <section class="vertical slider">
            <div><a href="./boarder?main=21&subject=25" ><img src="<c:url value="/resources/img/sateng.png" />"  alt="수능영어"/></a></div>
            <div><a href="./boarder?main=21&subject=24" ><img src="<c:url value="/resources/img/higheng.png" />"  alt="고등영어"/></a></div>
            <div><a href="./boarder?main=21&subject=26" ><img src="<c:url value="/resources/img/freetalking.png" />" alt="영어회화" /></a></div>
            <div><a href="./boarder?main=21&subject=22" ><img src="<c:url value="/resources/img/eng1.png" />"  alt="초등영어"/></a></div>
            <div><a href="./boarder?main=21&subject=23" ><img src="<c:url value="/resources/img/eng2.png" />"  alt="중등영어"/></a></div>
            <div><a href="./boarder?main=21&subject=27" ><img src="<c:url value="/resources/img/toeic.png" />" alt="토익/토플/텝스" /></a></div>
            <div><a href="./boarder?main=21&subject=28" ><img src="<c:url value="/resources/img/japan.png" />" alt="일본어" /></a></div>
            <div><a href="./boarder?main=21&subject=29" ><img src="<c:url value="/resources/img/china.png" />" alt="중국어" /></a></div>
          </section>
          
          <div class="cateTitle"><p>나에게 맞는 <b>국어</b> 수업을 찾고 싶다면</p></div>
        <section class="vertical2 slider">
            <div><a href="./boarder?main=31&subject=35" ><img src="<c:url value="/resources/img/kor4.png" />" alt="수능국어" /></a></div>
            <div><a href="./boarder?main=31&subject=34" ><img src="<c:url value="/resources/img/kor3.png" />" alt="고등국어" /></a></div>
            <div><a href="./boarder?main=31&subject=33" ><img src="<c:url value="/resources/img/kor2.png" />" alt="중등국어" /></a></div>
            <div><a href="./boarder?main=31&subject=32" ><img src="<c:url value="/resources/img/kor1.png" />" alt="초등국어" /></a></div>
            <div><a href="./boarder?main=31&subject=36" ><img src="<c:url value="/resources/img/kor5.png" />" alt="국어논술" /></a></div>
          </section>

          <div class="cateTitle"><p><b>사회</b> 선생님을 찾아보세요.</p></div>
          <section class="regular slider">
           <div><a href="./boarder?main=41&subject=46" ><img src="<c:url value="/resources/img/society1.png" />" alt="한국사" /></a></div>
            <div><a href="./boarder?main=41&subject=45" ><img src="<c:url value="/resources/img/social2.png" />" alt="사회탐구" /></a></div>
            <div><a href="./boarder?main=41&subject=44" ><img src="<c:url value="/resources/img/society4.png" />" alt="고등사회" /></a></div>
            <div><a href="./boarder?main=41&subject=43" ><img src="<c:url value="/resources/img/society2.png" />"  alt="중등사회"/></a></div>
            <div><a href="./boarder?main=41&subject=42" ><img src="<c:url value="/resources/img/society3.png" />" alt="초등사회" /></a></div>
          </section>
        
          <div class="cateTitle"><p><b>과학</b> 선생님을 찾아보세요.</p></div>
          <section class="regular2 slider">
            <div><a href="./boarder?main=51&subject=55" ><img src="<c:url value="/resources/img/science3.png" />" alt="물리" /></a></div>
            <div><a href="./boarder?main=51&subject=53" ><img src="<c:url value="/resources/img/science4.png" />" alt="중등과학" /></a></div>
            <div><a href="./boarder?main=51&subject=54" ><img src="<c:url value="/resources/img/science5.png" />" alt="고등과학" /></a></div>
            <div><a href="./boarder?main=51&subject=58" ><img src="<c:url value="/resources/img/science6.png" />" alt="지구과학" /></a></div>
            <div><a href="./boarder?main=51&subject=56" ><img src="<c:url value="/resources/img/science7.png" />" alt="생명" /></a></div>
            <div><a href="./boarder?main=51&subject=52" ><img src="<c:url value="/resources/img/science1.png" />" alt="초등과학"/></a></div>
            <div><a href="./boarder?main=51&subject=57" ><img src="<c:url value="/resources/img/scienceC.png" />" alt="화학"/></a></div>
          </section>
          
          <div class="cateTitle"><p><b>입시전문가</b>와 <b>예체능</b>까지</p></div>
          <section class="center slider">
            <div><a href="./boarder?main=71&subject=73" ><img src="<c:url value="/resources/img/cunsult1.png" />"  alt="입시컨설팅"/></a></div>
            <div><a href="./boarder?main=71&subject=72" ><img src="<c:url value="/resources/img/cunsult2.png" />"  alt="자소서첨삭"/></a></div>
            <div><a href="./boarder?main=61&subject=62" ><img src="<c:url value="/resources/img/arts.png" />"  alt="미술"/></a></div>
            <div><a href="./boarder?main=61&subject=63" ><img src="<c:url value="/resources/img/musics.png" />"  alt="음악"/></a></div>
            <div><a href="./boarder?main=61&subject=64" ><img src="<c:url value="/resources/img/sport.png" />"  alt="체육"/></a></div>
          </section>
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
                개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368<br/>
                TEL. 02-959-1176<br/> 
                  사업자 등록번호 : 654-19-01069 <br/>
		통신판매업 신고 : 2019-서울동대문-0997호<br/>
                  EMAIL. dywlr74@naver.com<br/>
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
                 <a href="./qna" style="text-decoration:none; color:black;"> 고객문의</a><br/> 
                 <a href="./privateData" style="text-decoration:none; color:black;">개인정보처리방침</a>
                </p>
              </div>
            
            <div>
              <p>
              
               <a href="./qna" style="text-decoration:none;font-weight:bolder; color:black;"> 고객센터</a><br/>
                02-959-1176<br/>
                평일 10:00 ~ 16:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>
            <div style="clear:left; text-align:center;font-size:11px;">콕사부는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 거래 정보 및 거래에 대한 책임은 각 판매자가 부담하고, 이에 대하여 콕사부는 일체 책임지지 않습니다.</div>
          </div>
          </div>
        </footer>
       </div>
</body>
</html>