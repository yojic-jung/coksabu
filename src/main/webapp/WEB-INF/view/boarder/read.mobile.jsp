<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>선생님 수업정보, 수업목록 콕사부</title>
 <meta name="description" content="선생님 수업 정보 자세히 보기" />
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=yes" />
   	<link rel="stylesheet" href= "<c:url value="/resources/colorbox.css" />" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link rel="canonical" href="https://coksabu.com/boardread?postId=171">
<style>
@charset "UTF-8";
  body{
		line-height:200%;
    }

   .m-jbFixed {
   	position: fixed;
    top: 0px;
    }
    
    .m-fixed{
	width: 100%;
	padding:10px 20px;
	position: fixed;
	left: 0;
	bottom: 0;
	background:white;
	border:4px solid gray;
}
	
    .right{
    	margin:30px auto;
        width:100%;
    	background:rgb(241, 241, 239);
    	padding:30px;
    }
    .button {
    	text-align:center;
    	width:100%;
    }
    
    .subcate{
    	font-size:40px; color:rgb(4, 94, 155); text-align:center;margin:10px 0px 60px 0px;font-family:'JejuGothic';
    }
    .title{
    	font-size:40px;text-align:center;margin:40px;font-family:'JejuGothic';
    }
    
    .div-title{
    	margin:50px 0px 10px 0px;;
    }
    
    .info{
		 font-weight:bold; 
    }
    
	.purchase {
		cursor:pointer;
		font-size:40px;
		height:150px;
		padding:0px 60px; 
		border-radius:30px;
		 color:white; 
		 background:rgb(60, 59, 61);
		 border:0px;
		width:100%;
	}
	.cunsult{
	cursor:pointer;
		font-size:40px;
		height:150px;
		padding:10px;
		 border-radius:30px;
		  color:white; 
		  background:rgb(252, 187, 9);
		  border:0px;
		width:100%;
	}
	
	.locale{
		padding:10px;color:dimgray;font-size:35px;
		line-height:50px;word-break:keep-all;
	}
	
	.day{
	padding:10px;
	}
	
	.gawe{
	margin:50px 0px 20px 0px;font-size:35px;color:dimgray;
	padding:10px;color:dimgray;font-size:35px;
		line-height:50px;word-break:keep-all;
	}
	
	.trial{
	padding:10px;color:dimgray;font-size:35px;
		line-height:50px;word-break:keep-all;
	}
	.price{
	padding:10px;
	text-align:center;
	font-size:40px;
	}
	.subtitle{
	font-size:35px;margin:150px 0px 20px 0px;font-weight: 800;
	word-break:break-all;
	}
  	.lessonPurchase{
  		text-decoration:none;color:white;
  		
  	}
  	.content{
  	 	width:90%; margin:auto;word-break:break-all;font-size:30px;line-height:50px;
  	}
  	
  	.img-div{
  		width:90%; margin:auto;
  	}
          #dialog{
          width:100%;
          padding:50px;
          font-size:35px;
          font-family:'JejuGothic';
          text-align:center;
          }
          .wish-btn{
          padding:10px;
          border:1px solid black;
          cursor:pointer;
          margin-right:10px;
          }
          .wish-btn2{
          padding:10px;
          border:none;
          background:black;
          color:white;
          cursor:pointer;
          font-size:30px;
          }
          #wishlist{
          font-size:20px;background-color:orange;color:white;cursor:pointer;border:3px solid orange; 
          padding:5px;
          border-radius:15px;
          font-weight:bold;
          }
    .c-box-close{
		padding:20px;
	}
	
		.price-table{
			font-size:40px;
          	width:100%;
          	border:3px solid gray;
          	border-spacing:0px;
          	border-radius:20px;
          }
          
          .price-table label{
          	cursor:pointer;
          }
          
          .price-sub{
           	padding:30px;border-bottom:3px solid #D5D5D5
          }
          .price-content{
          	padding:30px;line-height:150%;color:dimgray;
          }
</style> 
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>

        <script>
       $(document).ready(function(){

            var day = "<c:out value="${lesson.day}" />";
            var days = day.split(',');
            for(var i=0; i<days.length; i++){
            	$('.day').append('<span style="border-radius:10px; padding:15px; font-size:30px; background: dimgray; color:white; margin-right:20px;">'+days[i]+'</span>')
            }
            
            var gawe = "<c:out value="${lesson.gawe}" />";
            var gawes = gawe.split(',');
            for(var i=0; i<gawes.length; i++){
            	if(i==gawes.length-1){
					$('.gawe').append(gawes[i]+"");       		
            	}else{
            		$('.gawe').append(gawes[i]+", &nbsp;");	
            	}
            }
            
            var locale = "<c:out value="${pro.locales}" />";
            var locales = locale.split(',');
            for(var i=0; i<locales.length; i++){
            	if(i==locales.length-1){
					$('.locale').append(locales[i]+"");       		
            	}else{
            		$('.locale').append(locales[i]+", ");	
            	}
            	$('.localeL').append('<span class="td-locale">'+locales[i]+'</span>');
            }
            
            var subcate = "<c:out value="${lesson.subCate}" />";
            var subcates = subcate.split(',');
            for(var i=0; i<subcates.length; i++){
            	if(i==subcates.length-1){
					$('.subcate').append(subcates[i]+"");       		
            	}else{
            		$('.subcate').append(subcates[i]+", ");	
            	}
            }
            
            var career = "<c:out value="${lesson.careerDB}" />";
            var careers = career.split('*');
            for(var i=0; i<careers.length; i++){
					$('.career').append(careers[i]+"<br/>");       		
            }
            
            var singular = "<c:out value="${pro.singular}" />";
            singular = singular.replace(',', ', ');
            if(singular != ''){
            }

            
            var ctx = "<c:out value="${pageContext.request.contextPath}" />";
         	var imgPath = "<c:out value="${lesson.contentimg}" />";
         	var img = imgPath.split("*");

 			if(imgPath!=''){
 				for(var i=0; i<img.length; i++){
 	        		var name = 'output'+(i+1);
 	        		var path = ctx+'/resources/mediaImg/'+img[i];
 	        		
 	        		$('.img-div').append('<img id="'+name+'" style="width:100%; height:600px;" src=""/>');
 	        		var nameId = "#"+name;
 	        		$(nameId).attr('src',path);
 	        	}
 			}
            
       });
    </script>
<title></title>
</head>
<body>

       <section>
       <div style="width:90%;margin:auto; padding-bottom:200px;">
			<div class="right" id="right">
			<div style="text-align:right;margin:20px;"><span id="wishlist" href="#dialog" style="font-size:30px;">장바구니</span></div> 
             <div class="left">
			<c:if test="${empty lesson.title}">
				<div style="font-size:40px; text-align:center;margin-bottom:30px;">삭제된 수업입니다.</div>
			</c:if>
             
               <c:if test="${lesson.visible==0}">
					<div style="font-size:40px;text-align:center;color:#FFBB00;line-height:200%;font-weight:bolder;">판매 중단</div>
					<div style="font-size:40px;text-align:center;color:#FFBB00;line-height:150%;font-weight:bolder;">이 수업은 판매자의 요청으로 판매가 중단된 수업입니다.</div>
			</c:if>
               
                <div style="width:90%;margin:auto;">
                	<img style="width:100%;height:700px;" src="<c:url value="/img/representImg/${lesson.represent}" />"  alt="수업대표이미지"/>
                </div>
			<div class="title" style="line-height:150%;">${lesson.title}</div>
			<div class="subcate">
			</div>
				
		
				
		  <div style="display:none; color:gray; ">
				<div id="dialog" >
  					<p style="font-size:35px;margin-bottom:20px;width:100%;">장바구니로 이동하시겠습니까?</p>
  					<br/>
  					<br/>
  					<a href="./wishlist" style="text-decoration:none; color:black;"><span class="wish-btn">장바구니로</span></a>
  					<span class="wish-btn2">쇼핑계속</span>
  					<div style="width:100%;margin-top:70px;font-size:25px; text-align:right;"><span class="c-box-close">[닫기]</span></div>
				</div>
		</div>
		
		
		<div class="subtitle">구매옵션</div>
		<div style="padding:10px;">
					<table class="price-table">
						<tr>
							<td>
							<label>
							<div class="highlight" style="border-top-right-radius:20px;border-top-left-radius:20px;">
							<div class="price-sub"><input type="radio" name="subCate" value="first" style="width:30px; height:30px;" checked/> ${lesson.subCate0} &nbsp; ${lesson.price3}원</div>
							<div class="price-content" style="border-bottom:1px solid dimgray;">수업횟수 : ${lesson.price1}<br/>회당 수업시간 : ${lesson.price2}</div>
							</div>
							</label>
							</td>
						</tr>
							
						<c:if test="${lesson.subCate1 != 'nonevalue'}">
						<tr>
							<td>
							<label>
							<div class="highlight">
							<div class="price-sub"><input type="radio" name="subCate" value="second" style="width:30px; height:30px;" /> ${lesson.subCate1} &nbsp; ${lesson.opt1price3}원</div>
							<div class="price-content" style="border-bottom:1px solid dimgray;">수업횟수 : ${lesson.opt1price1}<br/>회당 수업시간 : ${lesson.opt1price2}</div>						
							</div>
							</label>
							</td>
						</tr>
							
						</c:if>
						<c:if test="${lesson.subCate2 != 'nonevalue'}">
						<tr>
							<td>
							<label>
							<div class="highlight" style="border-bottom-right-radius:20px;border-bottom-left-radius:20px;">
							<div class="price-sub"><input type="radio" name="subCate" value="third" style="width:30px; height:30px;" /> ${lesson.subCate2} &nbsp; ${lesson.opt2price3}원</div>
							<div class="price-content">수업횟수 : ${lesson.opt2price1}<br/>회당 수업시간 : ${lesson.opt2price2}</div>
							</div>
							</label>
							</td>
						</tr>
						</c:if>
					</table>
				</div>
		
		<div style="margin:20px 0px;padding:10px;font-size:30px;line-height:200%;">콕사부 안내 : 제공하는 수업 외에도 &#39;상담 하기&#39;를 통해 채팅창에서 새로운 수업을 작성하여 거래할 수 있습니다.</div>
		
			
                <div>
                <div class="subtitle">선생님 정보</div>
                <div style="text-align:center;margin-top:40px;font-size:35px;">
					<img style="width:400px; height:400px;border-radius:200px;" src="<c:url value="/img/profileImg/${pro.imgPath}" />" alt="선생님 프로필 이미지"/><br/>
				<br/>${pro.nickname}(${pro.birth}, ${pro.sexual})
				</div>
                
                <c:if test="${pro.certify == 1}"> <div style="margin-top:30px;color:orange; text-align:center;font-size:30px;">본인인증완료 &nbsp; &nbsp; 학력인증완료 </div></c:if>
                <br/>
                <div style="width:90%; margin:auto;font-size:30px;line-height:230%">
               <span class="info" style="margin-right:20px;">학교</span>${pro.universe} ${pro.univsub} (${pro.universer}) <br/>
               <span class="info" style="margin-right:20px;">경력</span><c:if test="${pro.career!=0}">${pro.career}년이상</c:if><c:if test="${pro.career==0}">1년미만</c:if><br/>
            	<c:if test="${pro.academy != ''}"><span class="info" style="margin-right:15px;">대학원</span>${pro.academy} ${pro.academyd}<br/></c:if>
            	<c:if test="${pro.nation != ''}"><span class="info" style="margin-right:20px;">유학</span>${pro.nation} ${pro.nationy}년<br/></c:if>
            	<c:if test="${pro.singular !=null}"><span class="info" style="margin-right:10px;">특이사항</span>${pro.singular}<br/></c:if>
            	<c:if test="${pro.toeic!=null}"><span class="info" style="margin-right:10px;">토익</span>${pro.toeic}점</c:if>
            	<c:if test="${pro.teps!=null}"><span class="info" style="margin-right:10px;">텝스</span>${pro.teps}점</c:if>
            	<c:if test="${pro.tofle!=null}"><span class="info" style="margin-right:10px;">토플</span>${pro.tofle}점</c:if>
            	<c:if test="${pro.hsk!=null}"><span class="info" style="margin-right:10px;">HSK</span>${pro.hsk}급</c:if>
            	<c:if test="${pro.jpt!=null}"><span class="info" style="margin-right:10px;">JPT</span>${pro.jpt}점</c:if>
            	</div>
            	
            	
            	
            	<div class="subtitle" style="margin:150px 0px 20px 0px;">과외가능 지역 </div>
				<div class="locale"></div>		
				<div class="subtitle" style="margin:50px 0px 20px 0px;">과외가능요일 </div>		
				<div class="day"></div>
				<div class="gawe"></div>
				<div class="trial">${lesson.trial}</div>
            	
            	
            	
            	<div class="subtitle">선생님 소개</div>
            	<br/>
            		<div class="content">${lesson.description}</div>

            		
            	<c:if test="${lesson.careerDB != null}">
            	<div class="subtitle">경력 사항</div>
            	<br/>
            		<div class="career content"></div>
            	</c:if>	
            		
            		
            	<div class="subtitle">수업 소개</div>
            	<br/>
            		<div class="content">${lesson.lesson }</div>	
            		
            	<div class="subtitle">미디어</div>
            	<div class="img-div">
            	</div>
<div>

<div class="subtitle" >취소 및 환불 규정</div>
<div class="content">
 가. 수업 환불기준 원칙<br/>
학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br/>
- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은
교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.<br/>
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
- 수업 시작후 : 반환사유가 발생한 당해 월의 반환 대상 수업비(수업비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 수업비 전액을 합산한 금액 환불

* 총 수업 시간의 수업비 징수기간 중의 총수업시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 수업시간을 기준으로 함<br/>
</div>
</div>
 </div>          	
</div>
					<br/>
			</div>
			
			
			
<div class="m-fixed">
				<table class="button">
					<tr>
						<td>
							<c:if test="${!empty lesson.title}">
								<button class="cunsult">상담 하기</button>
							</c:if>
						</td>
						<td>
						<c:if test="${lesson.visible==0}">
							<div style="font-size:40px;text-align:center;color:#FFBB00;font-weight:bolder;">판매 중단</div>
						</c:if>

               		<c:if test="${lesson.visible==1}">
						<button class="purchase lessonPurchase">구매 하기</button>
					</c:if>
					
						</td>
					</tr>
				</table>
</div>		
			
			
       </section>

       <script>

       
       $(document).ready(function(){
    	   
    	   var email = "<c:out value="${email}" />"
    	   
    	   var postId = "<c:out value="${postId}" />"
    	   
			var radio_idx = $('input[name="subCate"]:checked').index( 'input[name="subCate"]' );
    	   
    	   $('.highlight').eq(radio_idx).css('box-shadow', '0px 0px 0px 5px orange');
    	   $('.price-sub').eq(radio_idx).css('color','orange');
    	   
    	   $('.lessonPurchase').click(function(){
    	   var subCateIdx =  $('input[name="subCate"]:checked').val();
    	
    	   if(email==''){
        		  var a = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
        		  if(a){
        			  window.location="./lessonPurchase?subCate="+subCateIdx+"&postId="+postId;
        			  return false;  
        		  }else{
        			  return false;  
        		  }
    	   }else{
    	        linkLocation = this.href;
    	        if($(this).attr("href")!="#"){
    	        	$('.m-page-transit').fadeIn(100);
    	            setTimeout(function(){
    	            	 window.location="./lessonPurchase?postId="+postId+'&subCate='+subCateIdx;}, 100);
    	        }
    		  
    	   } 
          });   
    	   
    	   
    	   $('.cunsult').click(function(){
    		   
        	   if(email==''){
            		  var a = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
            		  if(a){
            			  window.location ='./chatroom?id='+postId+'&root=read';
            		  }else{
            			  return false;  
            		  }
        	   }else{
        		   $('.m-page-transit').fadeIn(100);
   	            	setTimeout(function(){
   	            			window.location ='./chatroom?id='+postId+'&root=read';}, 100);
        		   
        		   
        	   	} 
               });
    	   
    	   
    	   var full = '<%= (String)request.getParameter("full") %>';
    	   
    	   if(full=="full"){
    		   var a = confirm("장바구니는 최대 8개까지만 담을 수 있습니다. 장바구니를 비워주세요.");
    		   		if(a){
    		   			window.location="./wishlist";
        		  	}else{
        			  return false;  
        		  	}
    	   }
    	   
    	   
    		$('#wishlist').click( function(){
    			if(email==''){
    				var a = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
    				if(a){
    					window.location="./login";
           		  	}else{
           			  return false;  
           		  	}
    			}
    		});
    		if(email!=''){
    		 $('#wishlist').colorbox({
    	          inline:true,
    	          overlayOpacity:0.5,
    	          closeButton:false,
    	          onOpen:function(){
    	        	  $.ajax({
    	        		  url:'./wishApply?postId='+postId,
    	        		  type:'get',
    	        		  error:function(error){
    	        			  alert('처리가 제대로 되지 않았습니다. \n새로고침 후에 다시 시도해주세요.');
    	        		  },
    	        		  success:function(data){
    	        			  if(data=="full"){
    	        				  alert("장바구니는 최대 8개까지 보관됩니다.\n장바구니를 비워주세요.")
    	        			  }else if(data=="count"){
    	        				  alert('이미 장바구니에 추가하셨습니다.');
    	        			  }
    	        			 
    	        		  }
    	        	  })
    	        	  
    	        	   $('.c-box-close').click(function(){
	  		  				$.colorbox.close();
	  	  				})
    	        	  
    	        	  $('.wish-btn2').click(function(){
      	      			$.colorbox.close();
      	        	  });
    	          },
    	        });
    		}
    		
    		
    		
                var jbOffset = $('.m-jbMenu').offset(); //상단메뉴 좌표 가져오는 코드
                    $( window ).scroll( function(){        
                      if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                        $( '.m-jbMenu' ).addClass( 'm-jbFixed' );
                      }
                      else {
                        $( '.m-jbMenu' ).removeClass( 'm-jbFixed' );
                      }
                    });
                
                
                    $('input:radio[name=subCate]').click(function(){
            			$('.highlight').css('box-shadow', '');
            			$('.price-sub').css('color','black');
            			var a = $(this).index('input:radio[name=subCate]');
            			$('.highlight').eq(a).css('box-shadow', '0px 0px 0px 5px orange');
            			$('.price-sub').eq(a).css('color','orange');
            		})
    		
    		
       });
      
       </script>
           
</body>
</html>