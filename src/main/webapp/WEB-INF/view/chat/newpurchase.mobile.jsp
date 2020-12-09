<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>거래양식 작성 콕사부</title>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<style>
	body{
		height:100%;padding:0px;
		margin:0px;
	}
	
	html{
		height:100%;padding:0px;
		margin:0px;
	}

	.main-2, .main-3, .main-4, .main-5{
		display:none;
	}
	.buyer{
		font-size:50px;
		background:white;
		color:orange;
		font-weight:bolder;
		padding:30px 0px 90px 0px;
		width:50%;
		display:inline-block;
		float:left;
		border-top:5px solid orange;
	}
	
	.seller{
		font-size:50px;
		background: orange;
		color:white;
		font-weight:bolder;
		padding:30px 0px 90px 0px;
		width:50%;
		display:inline-block;
	}
	
	.second{
		width:100%;
		font-size:50px;
		font-weight:bolder;
		position: fixed;
		left: 0;
		bottom: 0;
		text-align:center;
	}
	
	.down{
		width:100%;
		position: fixed;
		left: 0;
		bottom: 0;
		text-align:center;
		font-size:30px;
	}
	
	.previous1, .previous2, .previous3, .previous4{
		padding:30px 0px 90px 0px;
		background:#EAEAEA;
		width:50%;
		display:inline-block;
		float:left
	}
	
	.next1, .next2, .next3{
	padding:30px 0px 90px 0px;
	background:#353535;
	color:white;
	width:50%;
	display:inline-block;
	}
	
	 .next4{
	padding:30px 0px 90px 0px;
	background:orange;
	color:white;
	width:50%;
	display:inline-block;
	}
	
	.teacher-intr{
      	font-size:35px;
        font-family: 'JejuGothic'; 
        width:80%;
        margin:80px auto 0px auto;
        line-height:180%;
      }
      
      .cate{
      	width:23%;margin:1px;
      	display:inline-block;
      	background:#FAE0D4;
      	padding:50px 0px;
      	font-size:40px;
      	text-align:center;
      }
      
	 .service-cate {
        padding:15px;
        font-size:30px; border-radius:10px;
        margin-top:20px;
      }
      
      .seg-table{
      	width:100%;
      	border-spacing:0px;
      }
      
      .seg-table td{
      	width:33%;
      }
      
      .seg-cate{
      	width:100%; padding:15px;
        font-size:40px; border-radius:2px;
        line-height:250%;
        margin-top:10px;
      }
      
      .seg-title{
      	font-size:35px; margin:30px 0px 0px 0px;
      	font-weight:bolder;
      }
      
       .price-table{
      border-spacing:0px 40px;
      width:100%;
      }
	.price-pri{
		width:80%;
		border:1px solid black
		;text-align: right;
		padding:20px; 
		font-size:50px;
	}
      .ui-datepicker{ width: 80%;font-size:50px; }
      }
</style>
</head>
<body>
<div style="text-align:right;font-size:50px;"><span class="close-btn" style="padding:30px;margin:30px;">x</span></div>
<div class="main-1">
	<div class="content" style="font-size:50px;padding:30px;line-height:180%;width:80%;margin:auto;word-break:keep-all;">
	선생님이 판매하는 수업이<br/>고객의 요구와 맞지 않아 변동이 필요한 경우
	고객의 요구에 맞춘 1대1 맞춤형 거래 양식을 새롭게 작성하여 거래 할 수 있습니다.
	</div>
	<div class="down">
		<div class="buyer">구매자로 작성</div><div class="seller">판매자로 작성</div>
	</div>
</div>
<form method="post">
<div class="main-2">	
						<div class="teacher-intr content">
						<div style="line-height:180%;font-size:35px;">
						
						<div style="">
							<input class="customer-buyer" type="radio" name="customer" value="구매자"/>구매자
							<input  class="customer-seller" type="radio" name="customer" value="판매자"/>판매자
						</div>
						
                          	<div style="font-weight:bolder;">
                          		<span class="buyer-show">제공받을 </span>
                          		<span class="seller-show">제공하시는 </span>
                          		서비스를 선택해주세요.
                          	</div>
                          <div style="width:100%;margin-top:50px;">
                          	<div class="cate">수학</div>
                          	<div class="cate">외국어</div>
                          	<div class="cate">국어</div>
                          	<div class="cate">사회</div>
                          	<div class="cate">과학</div>
                          	<div class="cate">예체능</div>
                          	<div class="cate" style="width:48%">자소서/입시</div>
                          </div>
                          
                          <div style="">
                          	<input type="radio" name="cate" class="check" value="수학"/>수학 
                          	<input type="radio" name="cate" class="check" value="외국어"/>외국어 
                          	<input type="radio" name="cate" class="check" value="국어"/>국어  
                          	<input type="radio" name="cate" class="check" value="사회"/>사회  
                          	<input type="radio" name="cate" class="check" value="과학"/>과학 
                          	<input type="radio" name="cate" class="check" value="예체능"/>예체능 
                          	<input type="radio" name="cate" class="check" value="자소서/입시"/>자소서/입시 
                          </div>
                          
                          <div class="seg-cate" style="display:none">
                         	 <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                         	 <table class="seg-table">
                         	 <tr>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="초등수학"> 초등수학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="중등수학"> 중등수학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="이과수학"> 이과수학</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="문과수학"> 문과수학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="고등수학"> 고등수학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="수학논술"> 수학논술</label></td>
                            </tr>
                            <tr>
                            <td colspan="3"><label><input style="zoom:2.0;" type="checkbox" value="수학경시"> 수학경시</label></td>
                          	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                           <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                            <table class="seg-table">
                         	 <tr>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="초등영어"> 초등영어</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="중등영어"> 중등영어</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="고등영어"> 고등영어</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="수능영어"> 수능영어</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="영어회화"> 영어회화</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="일본어"> 일본어</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="중국어"> 중국어</label></td>
                            <td colspan="2"><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="toeic/tofle/teps"> toeic/tofle/teps</label></td>
                         	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                       <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                        	<table class="seg-table">
                         	 <tr>
                        	<td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="초등국어"> 초등국어</label></td>
                        	<td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="중등국어"> 중등국어</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="고등국어"> 고등국어</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="수능국어"> 수능국어</label></td>
                            <td colspan="2"><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="국어논술"> 국어논술</label></td>
                          	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                       <div  class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                       		<table class="seg-table">
                         	<tr>
                        	<td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="초등사회"> 초등사회</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="중등사회"> 중등사회</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="고등사회"> 고등사회</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="사회탐구"> 사회탐구</label></td>
                            <td colspan="2"><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="한국사"> 한국사</label></td>
                          	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                          <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                          	<table class="seg-table">
                         	<tr>
                        	<td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="초등과학"> 초등과학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="중등과학"> 중등과학</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="고등과학"> 고등과학</label></td>
                            </tr>
                            <tr>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="물리"> 물리</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="생명"> 생명</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="화학"> 화학</label></td>
                            </tr>
                            <tr>
                            <td colspan="3"><label><input name="subCate" style="zoom:2.0;" type="checkbox" value="지구과학"> 지구과학</label></td>
                          	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                        <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                            <table class="seg-table">
                         	<tr>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="미술"> 미술</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="음악"> 음악</label></td>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="체육"> 체육</label></td>
                         	</tr>
                          	</table>
                          </div>

                          <div class="seg-cate" style="display:none">
                          <div class="seg-title" >세부 카테고리를 선택 해주세요.</div>
                             <table class="seg-table">
                         	<tr>
                            <td><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="자소서첨삭"> 자소서첨삭</label></td>
                            <td colspan="2"><label><input name="subCate" style="zoom:2.0;"type="checkbox" value="입시컨설팅"> 입시컨설팅</label></td>
                          	</tr>
                          	</table>
                          </div>
                        </div>
                    </div>
                    <div class="second">
        			<div class="previous1">이전</div>
        			<div class="next1">다음</div>
        			</div>
</div>
<div  class="main-3">
                    <div style="width:80%; margin:auto;" class="content" >    
                         <div style="font-size:35px;font-weight:bolder;margin-top:80px;">수업 정보</div>
                        <div style="font-size:50px;margin-top:50px;">
                        <table class="price-table">
                        <tr>
                        <td>수업 전체횟수</td>
                        <td>
                        	<input class="count fix-hide" type="text" name="lessonCount" style="border:1px solid black;padding:20px;text-align:right;font-size:50px;width:200px;"/>회
                     	</td>
                     	</tr>
                     	<tr>
                     	<td> 회당 수업시간  </td>
                     	<td>
                      <select name="lessonTime" class="price-time"  style="padding:20px;font-size:50px;">
                          <option>60분</option>
                          <option>90분</option>
                          <option>2시간</option>
                          <option>2시간 30분</option>
                          <option>3시간</option>
                          <option>4시간</option>
                        </select>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="2">가격 </td>
                        </tr>
                        <tr>
                        <td colspan="2" style="width:100%;text-align:right;">
                        	<input name="price" class="price-pri fix-hide" type="text" id="price" placeholder="숫자만 입력" />원
                      		<div class="price-kor" style="margin:30px;"></div>
                      	</td>
                      </tr>
                    </table>
                      </div>
                      </div>
                      <div class="second">
                      	<div class="previous2">이전</div>
                      	<div class="next2">다음</div>
                      </div>
</div>
<div class="main-4">
		<div class="content"  style="font-size:45px;width:80%; margin:80px auto 0px auto;line-height:200%;word-break:keep-all;">협의한 수업 시작일자와 종료일자를 입력해주세요.<br/>
			<div style="line-height:250%;margin-top:80px;">
			<input type="text" id="testDatepicker" name="startDate" style="font-size:50px;padding:15px;margin-left:20px;" placeholder="시작일"/>&nbsp;&nbsp;  ~ <br/>
			<input type="text" id="testDatepicker2" name="endDate" style="font-size:50px;padding:15px;margin-left:20px;" placeholder="종료일"/>  
			</div>
		</div>
		<div class="second">
        <div class="previous3">이전</div>
        <div class="next3">다음</div>
        </div>
</div>
<div class="main-5">
		<div class="content" style="width:80%;margin:80px auto 0px auto;">
		<div style="font-size:50px;">기타 추가사항(선택)</div>
		<div style="font-size:40px;margin:50px 0px 20px 0px;line-height:170%;">추가로 필요한 거래 계약사항이 있으시면<br/> 거래 당사자간 협의된 사항을 적어주세요.</div>
		<div style="width:100%;">
			<textarea name="moreDetail" class="fix-hide" rows="10" style="width:100%;font-size:40px;border:1px solid black;padding:30px;"></textarea>
		</div>
		<div  style="margin-top:20px;font-size:35px;line-height:170%;width:100%;" class="buyer-show">판매자가 거래제안서를 승낙한 경우 거래를 진행할 수 있습니다.</div>
		
		<div style="margin-top:80px;font-size:40px;font-weight:bolder;line-height:170%;width:100%;word-break:keep-all;">
		<label> <input class="permit" type="checkbox" name="permit" style="zoom:2.0;" /> 콕사부 서비스정책과 학원법에 의거한 환불정책을 이행할 것에 동의합니다.</label>
		</div>
		<input class="finish" type="submit"/>
		<div class="second">
        <div class="previous4">이전</div>
        <div class="next4">거래 작성</div>
        </div>
        </div>
</div>
</form>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="resources/jquery-number-master/jquery.number.min.js"></script>    
    <script>
    $(document).ready(function(){
    	var winH =$(window).height();
    	
    	$('.content').css('height', winH);
    	
    	$('.fix-hide').focus(function(){
    		$('.down').hide();
    		$('.second').hide();
    	});
    	
    	$('.fix-hide').blur(function(){
    		$('.down').show();
    		$('.second').show();
    	});
    	
    	
    	
    	
    	$('.close-btn').click(function(){
    		history.back();
    	});
    	
    	$('.buyer').click(function(){
    			$('.main-1').hide();
        		$('.main-2').show();
        		
        		
        		$('.buyer-show').show();
        		$('.seller-show').hide();
        		
        		$('.customer-buyer').trigger("click");
    		
    	});
    	
    	$('.seller').click(function(){
    			$('.main-1').hide();
        		$('.main-2').show();
        	
        		$('.buyer-show').hide();
        		$('.seller-show').show();
        		
        		$('.customer-seller').trigger("click");
    	});
    	
    	$('.next1').click(function(){
    		
    		if($('.check').is(':checked')!=true){
    			alert('서비스를 선택해주세요.');
    		}else if($('input:checkbox[name=subCate]').is(':checked')!=true){
    			alert('세부 카테고리를 선택해주세요.');
    		}else{
    			$('.main-2').hide();
        		$('.main-3').show();
    		}
    		
    	});
    	
    	$('.previous1').click(function(){
    		$('.main-2').hide();
    		$('.main-1').show();
    	});
    	
    	$('.next2').click(function(){
    		var regexp = /^[0-9]*$/

    		if(!regexp.test($('.count').val() ) ){
    			alert("수업 전체 횟수는 숫자만 입력하세요");
    			$('.count').val("");
    			
    		}else if(!regexp.test($('#price').val().replace(/,/gi , '')) ) {
    			alert("가격은 숫자만 입력하세요");
    			$('#price').val("");
    		}else if( $('.count').val() >100 || $('.count').val() <1 ){
    			alert("수업 전체 횟수를 올바르게 입력해주시기 바랍니다.(숫자만, 최소1 최대99)")
    			$('.count').val("");
    		}else if($('#price').val().replace(/,/gi , '') > 2000000){
             	  alert("가격은 최대 200만원을 넘을 수 없습니다.")
             	 $('#price').val("");
            }else if($('#price').val().replace(/,/gi , '') < 10000){
                	  alert("가격은 최소 1만원을 이상입니다.");
                	  $('#price').val("");
      	    }else{
      	    	$('.main-3').hide();
        		$('.main-4').show();
      	    }
    		
    	});
    	
    	$('.next3').click(function(){
    		
    		var ago  = $('#testDatepicker').val();
    		var last = $("#testDatepicker2" ).val();
    		age = ago.replace(',','');
    		last = last.replace(',','');
    		
    		if(ago.length==0 ){
    			alert("수업 시작일자를 선택해주세요.");
            }else if( last.length==0 ){
            	alert("수업 종료일자를 선택해주세요.");
      	    }else if(ago>last){
     		   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
   		 	}else{
      	    	$('.main-4').hide();
        		$('.main-5').show();
      	    }
    		
    	});
    	
    	
    	$('.next4').click(function(){
   		 		$('.finish').trigger("click")
    	});
    	
    	$('.finish').click(function(){
    		var regexp = /^[0-9]*$/
    		
    		var ago  = $('#testDatepicker').val();
    		var last = $("#testDatepicker2" ).val();
    		age = ago.replace(',','');
    		last = last.replace(',','');
    		
    		if($('.check').is(':checked')!=true){
    			alert('서비스를 선택해주세요.');
    			return false;
    		}else if($('input:checkbox[name=subCate]').is(':checked')!=true){
    			alert('세부 카테고리를 선택해주세요.');
    			return false;
    		}else if(!regexp.test($('.count').val() ) ){
        		alert("수업 전체 횟수는 숫자만 입력하세요");
        		$('.count').val("");
        		return false;
        	}else if(!regexp.test($('#price').val().replace(/,/gi , '')) ) {
        		alert("가격은 숫자만 입력하세요");
        		$('#price').val("");
        		return false;
        	}else if( $('.count').val() >100 || $('.count').val() <1 ){
        		alert("수업 전체 횟수를 올바르게 입력해주시기 바랍니다.(숫자만, 최소1 최대99)")
        		$('.count').val("");
        		return false;
        	}else if($('#price').val().replace(/,/gi , '') > 2000000){
                alert("가격은 최대 200만원을 넘을 수 없습니다.")
                $('#price').val("");
                return false;
            }else if($('#price').val().replace(/,/gi , '') < 10000){
                alert("가격은 최소 1만원을 이상입니다.");
                $('#price').val("");
                return false;
            }else if(ago.length==0 ){
    			alert("수업 시작일자를 선택해주세요.");
    			return false;
            }else if( last.length==0 ){
            	alert("수업 종료일자를 선택해주세요.");
            	return false;
      	    }else if(ago>last){
     		   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
     		  return false;
   		    }else if($('.permit').is(':checked') != true ){
   		    	alert("환불정책 동의를 해주세요.");
   		    	return false;
   		    }else{
      	    }
    	});
    	
    	
    	$('.previous2').click(function(){
    		$('.main-3').hide();
    		$('.main-2').show();
    	});
    	
    	
    	$('.previous3').click(function(){
    		$('.main-4').hide();
    		$('.main-3').show();
    	});
    	
    	$('.previous4').click(function(){
    		$('.main-5').hide();
    		$('.main-4').show();
    	});
    	
    });
    
    $(".cate").on("click", function() {
    	 $(".cate").css('background','#FAE0D4'); 
    	$(this).css('background','orange');
    	 var opIndex = $(this).index();  
    	 $('.check').eq(opIndex).trigger("click");
    	 
    	 $('.seg-cate').each(function(){
          	  $(this).hide();
            	});
          	  
       	$('.seg-cate input').each(function(){
      		  $(this).prop("checked", false);
      	  		});
       	
        $('.seg-cate').eq(opIndex).show();
        
    	 
    	});
    
    
    
    $(function() {
        $( "#testDatepicker" ).datepicker({
        	changeMonth: true, 
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy. mm.dd",
            showButtonPanel: true,
            
            showOn:"both",
            buttonImage: "<c:url value="/resources/images/calendar3.png" />",
            buttonImageOnly:true,
           	minDate:0,
           	nextText: '&gt;',
            prevText: '&lt;' 
     });
        
        $( "#testDatepicker" ).prop('readonly',true);
        
        $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
    });

        $(function() {
            $( "#testDatepicker2" ).datepicker({
            	changeMonth: true, 
                dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
                monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dateFormat: "yy. mm.dd",
                showButtonPanel: true,
                
                showOn:"both",
                buttonImage: "<c:url value="/resources/images/calendar3.png" />",
                buttonImageOnly:true,
               	minDate:0,
                nextText: '&gt;',
                prevText: '&lt;' 
         });
            
            $( "#testDatepicker2" ).prop('readonly',true);
            
            $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
        });
        
        
        	$('.price-pri').keyup(function(){
        		$('.price-kor').text(viewKorean($(this).val()));
        	});
        	
        	

            function viewKorean(num) { 
            	var hanA = new Array("","일","이","삼","사","오","육","칠","팔","구","십");
            	var danA = new Array("","십","백","천","","십","백","천","","십","백","천","","십","백","천"); 
            	var result = ""; 
            	for(i=0; i<num.length; i++) { 
            		str = ""; 
            		han = hanA[num.charAt(num.length-(i+1))]; 
            		if(han != "") str += han+danA[i]; 
            		if(i == 4) str += "만"; 
            		if(i == 8) str += "억"; 
            		if(i == 12) str += "조"; 
            		result = str + result; 
            		}
            		if(num != 0) result = result + "원"; 
            		return result ; 
            	}

            
    </script>

</body>
</html>