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
    <link rel="canonical" href="https://coksabu.com/tutorpage">
<style>
@charset "UTF-8";
    .top-ul a {
            text-decoration:none;
            color :black
          }
         
          .update,.delete{
           border-radius:50px;
           border:3px solid #EF904F; 
           color:#EF904F; 
           text-decoration:none;
           padding:15px;
           cursor:pointer;
           margin-right:30px;
          }
        
        .lesson-make2{
            background:rgb(224, 223, 223);
        }
        .div-title{
            width:90%; margin:0px auto; padding:30px 0px 20px 10px;
             font-family:'JejuGothic'; color:rgb(97, 96, 96);
             font-size:40px;
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
        color:black;
        margin-right:10px;
        font-size:22px;
        line-height:150%;
    }


.tutorial-first-back{
			display:none;
			width:100%;
			height:100%;
			background:black;
			opacity:0.3;
			position:fixed;
			top:0px;
			left:0px;
			z-index:90;
			
		}

		.tutorial-first, .tutorial-certi, .tutorial-success{
			width:80%;
			font-family: 'JejuGothic';
			z-index:100;
			position:fixed;top:50%;left:50%;transform: translate(-50%, -50%);
			display:none;
			padding:0px;
			background-image:url(/resources/img/firecracker.png);
			background-repeat : no-repeat;
        	background-size : cover;
			text-align:center;
			border-radius:20px;
			font-size:40px;
			line-height:200%;
		}
		
		
		.tutorial-para{
		text-align:center;
		padding-top:80px;
		background:white;
		border-radius:20px 20px 120px 120px;
		}
		.tutorial-first-title{
			color: #002266;
			font-size:50px;
			margin-bottom:30px;
			font-weight:bold;
		}
		
		.tutorial-btn, .tutorial-btn-certi, .tutorial-end{
			margin:80px auto;
			padding:10px;
			cursor:pointer;
			background:white;
			color:#002266;
			border-radius:20px;
			width:80%;
			font-weight:bolder;
			display:inline-block;
			font-size:50px;
		}

		.tutorial-close, .tutorial-close-certi{
			cursor:pointer;
		}
		
		.tutorial-close-div{
			text-align:right;
			color:white;
			font-size:30px;
			padding:10px;
		}
		

.list{
    	width:100%;
    	margin:auto;
    	border-spacing:0px 30px;
    }
.list td{
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
</head>
<body>
  
        <section>
            
            <div style="min-height:1400px;">
            
            <c:choose>
            <c:when test="${pro ==null}">
             <div style=" background:#F7F7F7;padding-bottom:30px;">
            	<div class="div-title">프로필</div>
                <div style="width:90%;background:white;border:3px solid dimgray;border-radius:10px; margin: auto; padding:40px;text-align:center;">
                <div style="margin-top:30px;font-size:30px;">프로필을 작성하지 않으셨습니다. <a href="./profile" style="text-decoration:none; color:black;"><b>"프로필"</b></a>을 작성해주세요.</div>
                <a href="./profile" style="text-decoration:none;">
                <div style="font-size:40px;width:90%;margin:80px auto 30px auto;border-radius:50px; padding:30px; background: #EF904F; color:white;">
                <b> 지금 프로필 작성하기 </b>
                </div>
                </a>
                </div>
             </div>   
            </c:when>
            <c:when test="${pro !=null }">
            <div style=" background:#F7F7F7;padding-bottom:30px;">
                <div style="width:90%;margin: auto;">
                        <table style="width:100%;font-family:JejuGothic; font-size:35px;border-spacing:50px;text-align: center; ">
                            <tr>
                                <td> <img style="width:300px;height:300px;border-radius:150px;" 
                                src="<c:url value="/img/profileImg/${pro.imgPath}" />"  alt="본인 프로필 이미지"/></td>
                            </tr>
                            <tr>
                            	<td style="color:rgb(87, 87, 87);font-size:40px">${pro.nickname}님 (${pro.birth})</td>
                            </tr>
                            <tr>
                                <td style="line-height:160%;color:rgb(151, 149, 149);">
								<c:choose>
									<c:when test="${pro.academy ne '' and pro.academy != null}">
										${pro.academy} ${pro.academyd}
									</c:when>
									<c:otherwise>
										${pro.universe} ${pro.univsub}
									</c:otherwise>
								</c:choose>                                
								&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 경력 <c:if test="${pro.career!=0}">${pro.career}년이상</c:if><c:if test="${pro.career==0}">1년미만</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td class="locale" style="line-height:150%;word-break:keep-all;">${pro.locales}</td>
                            </tr>
                        </table>
                        <div style="color:#FFBB00;font-size:40px; text-align:center;">
                        	<c:if test="${pro.certify==0}" >
                          		<b>본인/학력인증을 해주세요.<br/>
                          		인증이 완료되어야 수업이 노출되며 지원서 발송도 가능합니다.</b>
                            </c:if>
                            <c:if test="${pro.certify==1}" >
                          		<b style="color:rgb(212, 210, 77)">본인인증완료&nbsp;&nbsp;학력인증완료&nbsp;&nbsp;</b>
                            </c:if>
                            <c:if test="${pro.certify==2}" >
                          		<b><span style="color: #FF3636">인증 실패.</span> 프로필 확인후 정확한 증명서 제출하기 바랍니다.&nbsp;&nbsp;</b>
                            </c:if>
                            <c:if test="${pro.certify==3}" >
                          		<b><span style="color: orange">&quot;심사 중&quot;</span> 인증 심사에는 1~2일 정도 걸릴 수 있습니다.&nbsp;&nbsp;</b>
                            </c:if>
                        </div>
                </div>
                </div>
                 <div style="text-align:center;width:80%;margin:50px auto;border-radius:20px; border:2px dashed dimgray;font-size:40px;">
                            <a href="./certify?email=${email}"  style="text-decoration:none;color:black">
                            <div class="certify" style="width:90%;margin:50px auto;cursor:pointer; border-radius:50px; padding:30px; background: #EF904F; color:white;">
                                  	 <b> 본인/학력 인증하기 </b>
                            </div>
                            </a>
                            
                            <a href="./profile"  style="text-decoration:none;color:black">
                            <div class="profile" style="width:90%;margin:50px auto;border-radius:50px; padding:30px; background: #EF904F; color:white;">
                                  	  <b> 프로필 수정하기 </b>
                            </div>
                            </a>
                            
                            <a href="./lessonWrite"  style="text-decoration:none;color:black">
                            <div class="lesson-make lesson-permit" style="text-align:center;width:90%;margin:50px auto;border-radius:50px; padding:30px; background: #EF904F; color:white;">
                                    	<b> 수업 만들기 </b>
                            </div>
                            </a>
                        </div>
                <div class="div-title" style="margin-top:100px;">수업 목록 (${size}/3)</div>
                        <div style="width:90%;background:white;;border:1px solid lightgray;border-radius:10px; margin:auto; padding:40px;">
                            
						<c:if test="${size != 0}" >
                            <div style="min-height:300px;width:100%">
						
					<table style="border-spacing:0px 40px;width:100%">
						
						<c:forEach var="lesson" items="${list}" >
						<tr>
							<td colspan="2" style="position:relative;">
							<c:if test="${lesson.visible==0 }">
							<div style="position:absolute;top:100px;z-index:3;font-weight:bolder;line-height:150%; font-size:30px;color:#FF5E00">
							판매중단,<br/>
							삭제요청된 수업으로 진행중인 거래가 있는지 확인 후 삭제 처리됩니다.
							</div>
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
							<td style="width:30%;">
								<a href="./boardread?postId=${lesson.id}" style="text-decoration:none;">
								<img src="<c:url value='/img/representImg/${lesson.represent}' />" style="width:100%; height:250px;border-radius:20px; "/><br/>
								</a>
						</td>
						<td>
							<a href="./boardread?postId=${lesson.id}" style="text-decoration:none;">
							<div>
							<div id="title"> ${lesson.title}</div>
							<div id="name">${lesson.nickname}(${lesson.birth}, ${lesson.sexual})&nbsp;&nbsp;경력 <c:if test="${lesson.career!=0}">${lesson.career}년</c:if><c:if test="${lesson.career==0}">1년미만</c:if></div>
							<div id="universe"> ${lesson.universe} ${lesson.univsub}</div>
							<div id="price" > ${lesson.subCate0} ${lesson.price3}원 <c:if test="${lesson.subCate1 !='nonevalue' }">/ ${lesson.subCate1} ${lesson.opt1price3}원</c:if> <c:if test="${lesson.subCate2!='nonevalue' }">/ ${lesson.subCate2} ${lesson.opt2price3}원</c:if></div>
							</div>
							</a>
						</td>
						</tr>

						<tr>
							<td colspan="2" style="border-bottom:1px solid gray;">
							<c:if test="${lesson.visible==1 }">
							<div style="font-size:30px;margin:30px auto 100px auto;padding:0px;text-align:center;">
							<span class="update">수정하기<input type="text" class="idval" style="display:none;" value="${lesson.id}" ></span>
							<a class="delete-a" href="./deletelesson?id=${lesson.id} " style="text-decoration:none;"><span class="delete">삭제하기</span></a></div>
							</c:if>
							</td>
						</tr>
   		 				</c:forEach>
    				
   		 			</table>
                            
                            </div>
                            </c:if>
                        </div>
            </c:when>
            </c:choose>
            
            <div style="height:300px;"></div>
            </div>

<div class="tutorial-first-back"></div>
    <div class="tutorial-first">
    	<div class="tutorial-para">
    		<div class="tutorial-first-title">이제, 나의 수업을 만들어보세요.</div>
    		<div>
    		입력양식에 따라 차근차근<br/>나의 수업을 채워 넣어보세요.
    		</div>
    	</div>
    	<div>
    		<a href="./lessonWrite?cok_tutorial=first_lesson" style="text-decoration:none;">
    			<div class="tutorial-btn">수업 작성하기</div>
    		</a>
    	</div>
    	<div class="tutorial-close-div"><span class="tutorial-close">[닫기x]</span></div>
    </div>    
    
    <div class="tutorial-certi">
    	<div class="tutorial-para">
    		<div class="tutorial-first-title">마지막 단계,<br/> 본인/학력인증을 완료하면<br/>수업이 정상적으로 노출되며<br/>학생의 과외요청에<br/>알림을 받을 수 있습니다.</div>
    	</div>
    	<div>
	    	<a href="./certify?email=${email}&cok_tutorial=first_certi" style="text-decoration:none;">
    			<div class="tutorial-btn-certi">인증하기</div>
    		</a>
    	</div>
    	<div class="tutorial-close-div"><span class="tutorial-close-certi">[닫기x]</span></div>
    </div>    
    
    
    <div class="tutorial-success">
    	<div class="tutorial-para">
    		<div class="tutorial-first-title">모든 단계를 완료하였습니다.</div>
    		<div>
    		본인학력인증 검수 후<br/>인증이 완료되면<br/>모든 서비스가 적용됩니다.
    		</div>
    	</div>
    	<div>
    			<div class="tutorial-end">튜토리얼 종료</div>
    	</div>
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
        	  
        	  
        	  
          
          $('.update').click(function(){
        	 var updateUrl = './update?id='+$(this).find('.idval').val();
        	 window.location = updateUrl;
          });
          
          var email = "<c:out value="${email}" />";
          
          
          
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
          
          $('.tutorial-close').click(function(){
        	  $('.tutorial-first').hide();
          	  $('.tutorial-first-back').hide();
          	  SetCookie('tutorial','end')
          });
          
          $('.tutorial-close-certi').click(function(){
        	  $('.tutorial-certi').hide();
          	  $('.tutorial-first-back').hide();
          		SetCookie('tutorial','end')
          });
          
          
          $('.tutorial-end').click(function(){
        	  $('.tutorial-success').hide();
          	  $('.tutorial-first-back').hide();
          });    
         });
          
          function getRequestParam(){
       	    var url = document.location.href;
       	    var qs = url.substring(url.indexOf('?') + 1).split('&');
       	    for(var i = 0, result = {}; i < qs.length; i++){
       	        qs[i] = qs[i].split('=');
       	        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
       	    }
       	    return result;
       	}
          
          if(getRequestParam().cok_tutorial=="first_lesson"){
          	if(GetCookie("tutorial")!="end"){
          	   $('.tutorial-first').toggle(500)
             	   $('.tutorial-first-back').show();
          	}
          }
          
          if(getRequestParam().cok_tutorial=="first_certi"){
          	if(GetCookie("tutorial")!="end"){
        	   		$('.tutorial-certi').toggle(500)
         	   		$('.tutorial-first-back').show();
          	}
          }
          
          if(getRequestParam().cok_tutorial=="tutorial_success"){
          	if(GetCookie("tutorial")!="end"){
          		$('.tutorial-success').toggle(500)
              	$('.tutorial-first-back').show();
              	SetCookie('tutorial','end')
          	}
          }

          
          function SetCookie(sName, sValue){
      		var date = new Date();
      		date.setTime(date.getTime() + (1*24*60*60*1000));
      		document.cookie = sName + "=" + escape(sValue)+";expires="+date.toGMTString();
      	}
      	
      	function GetCookie(sName){
      		/*저장되어있는 쿠키 정보 불러오기
      		오픈 페이지에서 부여하는 쿠키의 이름 및 값을 aCookie라는 변수에 저장.
      		여기서는 test_cookie=1이란 값이 저장 */
      		var aCookie = document.cookie.split("; ");
      		//검색을 원하는 쿠키명(test_cookie)과 저장되어 있는 쿠키의 이름이 일치하는지 확인
      		for(var i=0; i<aCookie.length; i++){
      			var aCrumb = aCookie[i].split("=");
      			if(sName == aCrumb[0]){
      				return unescape(aCrumb[1]);
      			}
      		}
      		return null;
      	}	
        </script>
</body>
</html>