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

          .top-ul a {
            text-decoration:none;
            color :black
          }

         
          .update,.delete{
           border-radius:5px;
           border:1px solid gray; 
           background:gray; 
           color:white; 
           text-decoration:none;
           padding:3px;
           cursor:pointer;
          }
        
        .lesson-make2{
            background:rgb(224, 223, 223);
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
            
            <c:if test="${certify == 0 }" >
            	<div style="min-height:250px; padding:50px">
            		<div style="width:600px; margin:auto;font-size:20px;">
            			"수업"을 만들기 위해서는 콕사부 인증정보를 설정하셔야 합니다. 
            			<br/><br/>
            			<div style="text-align:center;">
            			<a href="./lessoncertify"><button style="padding:5px; font-size:20px;background:white;">인증하기</button></a>
            			</div>
            		</div>
            	</div>
            </c:if>
            <c:if test="${pro ==null && certify!=0 }">
            <div class="div-title">프로필</div>
                <div style="width:800px; background:white; margin: auto; padding:20px;text-align:center;">
                <div style="margin-top:30px;">프로필을 작성하지 않으셨습니다. <a href="./profile" style="text-decoration:none; color:black;"><b>"프로필"</b></a>을 작성해주세요.</div>
                <div style="text-align:center; padding:30px">
                <a href="./profile" style="text-decoration:none;"><button style="width:200px; padding:10px; color:white; background:dimgray;border-radius:10px;">지금 프로필 작성하기</button></a>
                </div>
                </div>
            </c:if>
            <c:if test="${pro !=null }">
                <div class="div-title">프로필</div>
                <div style="width:800px; background:white; margin: auto; padding:20px;">
                        <table style="font-family:JejuGothic; font-size: 15px;border-spacing:0px; ">
                            <tr>
                                <td rowspan="3"> <img style="width:140px; height:140px; border-radius:70px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                                <td style="color:rgb(87, 87, 87); padding:0px 5px 0px 20px;font-size:22px">${pro.nickname}님 (${pro.birth})</td>
                            </tr>
                            <tr>
                                <td style="color:rgb(151, 149, 149);padding:0px 5px 0px 20px;">
                                ${pro.universe} ${pro.univsub} &nbsp;&nbsp;경력 <c:if test="${pro.career!=0}">${pro.career}년이상</c:if><c:if test="${pro.career==0}">1년미만</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="locale" style="word-break:keep-all;line-height:25px;padding:0px 5px 0px 20px;">${pro.locales}</td>
                            </tr>
                        </table>
                        <div style="text-align:right;font-size:15px; margin-top:25px;color:rgb(117, 116, 116);">
                          <c:if test="${pro.certify==0}" >
                          	<b style="color: orange">본인 학력 인증을 해주세요.&nbsp;&nbsp;</b>
                           </c:if>
                          <c:if test="${pro.certify==1}" >
                          	<b style="color:rgb(212, 210, 77)">본인인증완료&nbsp;&nbsp;학력인증완료&nbsp;&nbsp;</b>
                          </c:if>
                          <c:if test="${pro.certify==2}" >
                          	<b><span style="color: #FF3636">&quot;인증 실패&quot;</span> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</b>
                           </c:if>
                           <c:if test="${pro.certify==3}" >
                            <b><span style="color: orange">&quot;심사 중&quot;</span> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</b>
                           </c:if>
                            <span class="certify" style="cursor:pointer; border-radius:3px; padding:5px; border:1px solid rgb(117, 116, 116); background:dimgray; color:white;">
                                  	 <b> 본인/학력 인증 </b>
                            </span>
                            &nbsp;&nbsp;
                            <a href="./profile"  style="text-decoration:none;color:black">
                            <span class="profile" style="border-radius:3px; padding:5px; border:1px solid rgb(117, 116, 116); background:dimgray; color:white;">
                                  	  <b> 프로필 수정하기 </b>
                            </span>
                            </a>
                            
                            
                           
                        </div>
                        <div style="text-align:center;margin-top:20px;line-height:180%;">
                        
                            <c:if test="${pro.certify==0}" >
                          		<b style="color: orange;font-size:15px;">인증이 완료되어야 수업이 노출되며 지원서 발송도 가능합니다.</b>
                            </c:if>
                            <c:if test="${pro.certify==2}" >
                          		<b style="font-size:15px;">프로필 확인후 정확한 증명서 제출하시기 바랍니다.</b>
                            </c:if>
                            <c:if test="${pro.certify==3}" >
                          		<b style="font-size:15px;">인증 심사에는 1~2일 정도 걸릴 수 있습니다.</b>
                            </c:if>
                         </div>
                </div>
                <div class="div-title">수업 목록 (${size}/3)</div>
                        <div style="width:800px; background:white; margin:auto; padding:20px;">
                            <div class="lesson-make lesson-permit" href="#lesson" style="margin:auto; width: 690px; border:1px dashed gray;cursor:pointer">
                               <div style="text-align:center; margin:15px auto; font-size:20px; color:rgb(158, 158, 158)">
                                    
                                    <b>
                                    	<span style="font-size:13px;" >수업은 최대 3개까지 만들기가 가능합니다.</span>
                                    <br/>
                                    +<br/>
                                    	수업 만들기
                                    </b>
                               </div>
                            </div>
						<c:if test="${size != 0}" >
                            <div style="min-height:300px;">
						
					<table class="list" style="border-spacing:0px 15px;">
						
						<c:forEach var="lesson" items="${list}" >
						<tr>
							<td colspan="2">
							<c:if test="${lesson.visible==0 }">
							<div style="position:relative;">
							<span style="position: absolute; z-index:3; left:30px; top:80px;font-weight:bolder;line-height:180%;color:#FF5E00">
							판매중단,<br/>
							삭제요청된 수업으로 진행중인 거래가 있는지 확인후 삭제 처리됩니다.
							</span>
							</c:if>
						</td>
						</tr>
						<c:choose>
							<c:when test="${lesson.visible!=0 }">
								<tr>		
							</c:when>
							<c:otherwise>
								<tr style="opacity:0.2;">		
							</c:otherwise>
						</c:choose>
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
						<tr>
						<td colspan="2" style="padding-bottom:20px; border-bottom:1px solid gray;text-align:right;">
							<c:if test="${lesson.visible==1 }">
							<div style="font-size:12px;padding:0px;">
							<span class="update">수정하기<input type="text" class="idval" style="display:none;" value="${lesson.id}" ></span>
							<a class="delete-a" href="./deletelesson?id=${lesson.id} " style="text-decoration:none;"><span class="delete">삭제하기</span></a>
							</div>
							</c:if>
						</td>
						</tr>
   		 				</c:forEach>
    					
   		 			</table>
                            
                            </div>
                            </c:if>
                        </div>
            </c:if>
            </div>
            
        </section>
      
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
        <script src="resources/jquery-number-master/jquery.number.min.js"></script>
        <script>
          $(document).ready(function(){
        	
        	  $('.tutor2').css('color','orange');
        	  
        	  var error = "<c:out value="${error}" />";
        	  
        	  if(error == "error"){
        		  alert("수업은 최대 3개까지만 등록 가능합니다.")
        	  }
        	  
        	  var delError = "<c:out value="${delError}" />";
        	  
        	  if(delError=="delError"){
        		  alert("삭제 처리가 되지 않았습니다. 새로고침 후에 다시 시도해 주시기 바랍니다.");
        	  }
        	  
        	  
        	  
            $('.lesson-make').hover(function(){
                $(this).addClass('lesson-make2');
            }, function(){
                $(this).removeClass('lesson-make2');
            });

          $('.lesson-make').click(function(){
        	 window.location='./lessonWrite';
          });
            
          
          $('.update').click(function(){
        	 var updateUrl = './update?id='+$(this).find('.idval').val();
        	 window.location=updateUrl;
          });
          
          var email = "<c:out value="${email}" />";
          
          $('.certify').click(function(){
         	 var url = './certify?email='+email;
         	 window.open(url,'', 'width=700, height=550');
           });
          
          
          $('.delete-a').click(function(){
        	    var confirmflag = prompt("해당하는 수업을 삭제하시려면 \'삭제\' 라고 입력해주세요");

        	    if(confirmflag=='삭제'){
        			return true;
        	       //확인 버튼 클릭 true 
        	    }else{
        			return false;
        	      //취소 버튼 클릭 false
        	    }
        	});
          
         });
        </script>
</body>
</html>