<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>튜터페이지 콕사부</title>
    <meta charset="utf-8">
     <meta name="description" content="선생님 프로필 및 수업정보" />
    <link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
    <style>
		body{
			background:rgb(233, 232, 232);
		}
        .top-ul a {
           text-decoration:none;
           color :black
         }
        .div-title{
            width:800px; margin:auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
        }
        .menu td{
        font-family: 'JejuGothic'; 
        width:100px;
        float:left;
        text-align:center;
        padding:10px;
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
        font-size:13px;
        border-radius:5px;
        padding:5px;
        cursor:pointer;
        background:rgb(75, 74, 74);
        color:white;
        float:right;
      }
      .btnc{
        font-size:13px;
        border-radius:5px;
        padding:5px;
        background:rgb(75, 74, 74);
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
        width:120px; padding:5px;
        font-size:14px; border-radius:2px;
        margin-top:10px;
      }
      .seg-cate{
      	width:500px; padding:5px;
        font-size:12px; border-radius:2px;
        line-height:170%;
        margin-top:10px;
      }

      .teacher-intr{
        font-family: 'JejuGothic'; 
        width:480px;
        min-height:400px;
        margin:30px auto;
        line-height:130%;
      }
      .career-op, .career-op1, .career-op2, .career-op3, .career-op4 {
        padding:3px;
        font-size:13px;
        margin-top:10px;
      }
      .career-disc{
        width:180px;
      }
	  .career-box{
		border:0.5px solid gray; 
		width:430px;
		min-height:50px; 
		margin-top:20px;
		font-size:13px;
		padding:6px;
		color:gray;
		}
      .del-btn{
        color:white;
        background:rgb(63, 63, 61);
        border-radius:3px;
        padding:3px;
      }
    .td-locale{
        background: rgb(151, 149, 149);
        color:white;
        border-radius:5px;
        padding:5px;
        margin-right:10px;
        font-size:12px;
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
    #pst:hover{
box-shadow:0px 0px 4px 4px LightGoldenRodYellow;
}
    </style>


</head>
<body>
  
        <section>
            
            <div style="background:rgb(233, 232, 232); padding:30px;">
            
                <div class="div-title">프로필</div>
                <div style="width:800px; background:white; margin: auto; padding:20px;">
                
                <c:if test="${!empty pro.universe}" >
                        <table style="font-family:JejuGothic; font-size: 16px;border-spacing:0px; ">
                            <tr>
                                <td rowspan="3"> <img style="width:140px; height:140px; border-radius:70px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                                <td style="color:rgb(87, 87, 87); padding:0px 5px 0px 20px;font-size:22px">${pro.nickname}님 (${pro.birth})</td>
                            </tr>
                            <tr>
                                <td style="color:rgb(151, 149, 149);padding:0px 5px 0px 20px;">
                                <c:choose>
									<c:when test="${pro.academy ne '' and pro.academy != null}">
										${pro.academy} ${pro.academyd}
									</c:when>
									<c:otherwise>
										${pro.universe} ${pro.univsub}
									</c:otherwise>
								</c:choose>                                
								&nbsp;&nbsp;경력 <c:if test="${pro.career!=0}">${pro.career}년이상</c:if><c:if test="${pro.career==0}">1년미만</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="locale" style="padding:0px 5px 0px 20px;line-height:20px;">${pro.locales}</td>
                            </tr>
                        </table>
                </c:if>
                
                <c:if test="${empty pro.universe}" >
                	<div style="font-size:15px;padding:15px;font-family:'JejuGothic';padding:40px 10px 40px 10px;">튜터회원이 아닌 경우 프로필이 존재하지 않습니다.</div>
                </c:if>
                
                        <div style="text-align:right;font-size:15px; color:rgb(117, 116, 116);">
                          <c:if test="${pro.certify==1}" >
                          <b style="color:rgb(212, 210, 77)">본인인증완료&nbsp;&nbsp;학력인증완료&nbsp;&nbsp;</b>
                            </c:if>
                           
                        </div>
                </div>
                <c:if test="${size!=null}" >
                <div class="div-title">수업 목록 (${size}/3)</div>
                        <div style="width:800px; background:white; margin:auto; padding:20px;">
                    <c:choose>
						<c:when test="${size != 0}" >
                            <div style="min-height:300px;">
						
					<table class="list">
						<c:forEach var="lesson" items="${list}" >
							<tr style="width:100%;">
								<td>
								<a href="<c:url value="./boardread?postId=${lesson.id}"/>">
								<div id="pst" style="vertical-align:top;padding:0px; margin:20px 10px;">
								<img src="<c:url value='/img/representImg/${lesson.represent}' />" style="width:180px; height:180px; magin-top:0px;border-radius:20px;" alt="수업대표이미지"/>
								</div>
								</a>
								</td>
								<td style="vertical-align:top;padding-top:30px;width:100%;">
								<a href="<c:url value="./boardread?postId=${lesson.id}"/>" style="text-decoration:none;">
								<div id="categories">${lesson.subcate}</div>
								<div id="name"> ${lesson.nickname}(${lesson.birth}, ${lesson.sexual})&nbsp;&nbsp;경력 <c:if test="${lesson.career!=0}">${lesson.career}년</c:if><c:if test="${post.lesson==0}">1년미만</c:if></div>
								<div id="universe"> ${lesson.universe} ${lesson.univsub}</div>
								<div id="title"> ${lesson.title}</div>
								<div id="price" >${lesson.subCate0} ${lesson.price3}원 <c:if test="${lesson.subCate1 !='nonevalue' }">/ ${lesson.subCate1} ${lesson.opt1price3}원</c:if> <c:if test="${lesson.subCate2!='nonevalue' }">/ ${lesson.subCate2} ${lesson.opt2price3}원</c:if></div>
								</a>
							</td>
							</tr>
   		 				</c:forEach>
   		 			</table>
                            
                            </div>
                            </c:when>
                            <c:otherwise>
                            	<div style="font-family:JejuGothic; font-size: 16px;">제공 수업이 없습니다.</div>
                            </c:otherwise>
                        </c:choose>
                        </div>
                   </c:if>
            </div>
            
        </section>
      
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>
        <script>
          $(document).ready(function(){
        	  
         });
        </script>
</body>
</html>