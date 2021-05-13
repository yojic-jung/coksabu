<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>본인/학력 인증하기 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="본인 인증 및 학력 인증하기" />
<link rel="canonical" href="https://coksabu.com/certify">
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
body{
padding:20px;
 font-family: 'JejuGothic'; 
}
.title1{
	text-align:center;font-weight:bolder;
	margin:20px;
}
        
        .multi1, .multi2, .multi3{
        display:none;
        }
        
        #imgplus1{
        	width:120px;height:120px;
        	backgroud:white;
        	border-radius:60px;
        	border:4px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-80px;
        }
        
       #imgplus2, #imgplus3{
        	width:120px;height:120px;
        	backgroud:white;
        	border-radius:60px;
        	border:4px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-80px;
        }
        #output1,  #output2, #output3{
        	width:90%;height:60vw;border-radius:20px;
        }
        .certi{
        	display:none;
        	
        }
        .submit-div{
        	font-size:35px;
        }
        
        
        .certi-submit-div{
          width:100%;
          position: fixed;left: 0;bottom: 0;
          padding:30px;
          background:white;
          border-top:3px solid lightgray;
           text-align:center;
           font-size:50px;
           color:#F4C60B;
          }
           .certi-btn{
           color:white;
           font-family: 'JejuGothic';
   			 text-align:center;color:white;
   			 background: #F4C60B; font-size:50px;
  			 padding:50px;
  			 border-radius:30px;
  			 width:90%;margin:auto;
   			}
		
        .output-content1, .output-content2, .output-content3{
        	word-break:keep-all;
        	width:80%;position:absolute;top:30%;left:50%;transform:translate(-50%,-50%);
        	line-height:180%;
        }
</style>
</head>
<body>
			<div style="font-size:35px;text-align:center;color:orange;margin:30px;line-height:150%;">
				신분증의 주민등록번호 뒷자리는 반드시 가려주세요.<br/>
			       프로필에 대학원을 기재하신 경우 대학원 재학/졸업 증명서를 꼭 첨부하여주시기 바랍니다.
			</div>
				
			
			<c:if test="${cerDB.denyReason!=null}">
				<div style="font-size:50px;margin:60px 0px 30px 0px;text-align:center;color: #980000;">반려사유</div>
				<div style="font-size:40px;margin:auto; width:90%;color: #980000;">${cerDB.denyReason}</div>
			</c:if>
			
			
			<form id="create_form" method="post" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
			
			<input type="text" value="${email}" style="display:none" />
			
			<table style="font-size:40px; width:90%;margin:50px auto 0px auto;border-spacing:40px;text-align:center;">
				<tr>
					<td style="line-height:140%;">신분증<br/><span style="font-size:35px;">(이미지는 10MB이하 파일로 등록해주세요.)</span></td>
				</tr>
				<tr>
					<td style="position:relative">
					<img id="output1" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div class="output-content1">주민등록증 또는 운전면허증 또는 여권 가능<br/>(주민번호 뒷번호, 주소<br/>운전면허, 여권번호는 가려주세요.)</div>
					<div style="width:90%;text-align:right;height:150px;">
					<img id="imgplus1" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div1">
					<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" /><br/>
					</div>
					</td>
				</tr>
				
				<tr>
					<td style="line-height:140%;">대학 재학/졸업증명서<br/>(학생증 및 합격증 이미지 가능)</td>
				</tr>
				<tr>
					<td style="position:relative">
					<div class="output-content2">대학 인증 이미지</div>
					<img id="output2" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div style="width:90%;text-align:right;height:150px;">
					<img id="imgplus2" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div2">
					<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="check2(this);loadFile2(event);" />
					</div>
					</td>
				</tr>
					
				<tr>
					<td style="line-height:140%;">대학원 재학/졸업증명서 (선택)<br/>(학생증 및 합격증 이미지 가능)</td>
				</tr>
				<tr>
					<td style="position:relative">
					<div class="output-content3">(선택)<br/>대학원 인증 이미지</div>
					<img id="output3" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div style="width:90%;text-align:right;height:150px;">
					<img id="imgplus3" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div3">
					<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />
					</div>
					</td>
				</tr>
				
			</table>
    	        
			<div class="certi-submit-div">
					<div class="certi-btn">
						인증 신청하기
					</div>
					<input type="submit" class="certi" value="보내기" />
   			</div>
   			
   		</form>
   		<img id="spinner" src="<c:url value='/resources/img/spinner.svg' />" style="position:fixed; left:50%; transform:translate(-50%, -50%);top:50%; z-index:99;display:none;"/>
   		<div style="height:300px;"></div>

    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
var ctx = "<c:out value="${pageContext.request.contextPath}" />";

var certifyimg1 = "<c:out value="${cerDB.certifyimg1}" />";
var certifyimg2 = "<c:out value="${cerDB.certifyimg2}" />";
var certifyimg3 = "<c:out value="${cerDB.certifyimg3}" />";

$(document).ready(function(){
	$('.m-jbMenu').append("본인/학력 인증");
	
	 var status = "<c:out value="${status}" />";
	 
	 if(status=="success"){
		 alert("본인인증 신청을 완료하셨습니다. 완료까지 1-2일 정도 걸릴 수 있습니다.");
		 if(getRequestParam().cok_tutorial == "first_certi"){
			 window.location.href="/tutorpage?cok_tutorial=tutorial_success";
		 }else{
			 window.location.href="/tutorpage";
		 }
		 
	 }else if(status=="fail"){
		 alert("신청이 올바르게 되지 않았습니다. 다시 신청해주시기 바랍니다.");
		 window.location.href="/tutorpage";
	 }
	 
	 
	 var certify = "<c:out value="${cerDB.certify}" />";
	 
	 if(certify==1){
		 $('.certi').remove();
		 $('#imgplus1').remove();
		 $('#imgplus2').remove();
		 $('#imgplus3').remove();
		 $('.certi-btn').remove();
		 $(".certi-submit-div").text("인증이 완료 되었습니다.")
	 }
	 
	
	 if(certifyimg1 !=null && certifyimg1 !=''){
		 $('#output1').attr('src', ctx+"/resources/certifyImg/"+certifyimg1);
		 $(".output-content1").remove();
	 }
	 if(certifyimg2 !=null && certifyimg2 !=''){
		 $('#output2').attr('src', ctx+"/resources/certifyImg/"+certifyimg2); 
		 $(".output-content2").remove();
	 }
	 if(certifyimg3 !=null && certifyimg3 !=''){
		 $('#output3').attr('src', ctx+"/resources/certifyImg/"+certifyimg3);
		 $(".output-content3").remove();
	 }
});



$("#imgplus1").click(function(){
	$('.multi1').trigger("click");
});

$("#imgplus2").click(function(){
	$('.multi2').trigger("click");
});

$("#imgplus3").click(function(){
	$('.multi3').trigger("click");
});

$('.certi-btn').click(function(){
	
	var broswerInfo = navigator.userAgent;
	//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
	            $('#spinner').show();
    }
	
	$('.certi').trigger("click");
});

$(document).on('change','.multi1',function(){
	var pathpoint = $('.multi1').val().lastIndexOf('.');
	var filepoint = $('.multi1').val().substring(pathpoint+1,$('.multi1').val().length);
	var filetype = filepoint.toLowerCase();
     // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
 
	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
    }else{
   	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
   	$('.multi1').remove();
   	$('#input-div1').append('<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />');
   	 return false;
    }
});

$(document).on('change','.multi2',function(){
	var pathpoint = $('.multi2').val().lastIndexOf('.');
	var filepoint = $('.multi2').val().substring(pathpoint+1,$('.multi2').val().length);
	var filetype = filepoint.toLowerCase();
     // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
 
	 if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
     }else{
    	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
    	$('.multi2').remove();
    	$('#input-div2').append('<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="check2(this);loadFile2(event);" />');
    	 return false;
     }
});

$(document).on('change','.multi3',function(){
	var pathpoint = $('.multi3').val().lastIndexOf('.');
	var filepoint = $('.multi3').val().substring(pathpoint+1,$('.multi3').val().length);
	var filetype = filepoint.toLowerCase();
     // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
 
     if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
     }else{
    	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
    	$('.multi3').remove();
    	$('#input-div3').append('<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />');
    	 return false;
     }
     
});


var loadFile1 = function(event) {
	    var reader = new FileReader();
	    reader.onload = function(){
	      var output = document.getElementById('output1');
	      output.src = reader.result;
	    };
	    $(".output-content1").remove();
	    reader.readAsDataURL(event.target.files[0]);
    };   

var loadFile2 = function(event) {
  	 var reader = new FileReader();
  	 reader.onload = function(){
  	     var output = document.getElementById('output2');
  	     output.src = reader.result;
  	 };
  	$(".output-content2").remove();
  	 reader.readAsDataURL(event.target.files[0]);
     }; 
    
 var loadFile3 = function(event) {
  	    var reader = new FileReader();
  	    reader.onload = function(){
  	      var output = document.getElementById('output3');
  	      output.src = reader.result;
  	    };
  	  $(".output-content3").remove();
  	    reader.readAsDataURL(event.target.files[0]);
        };    

        function check1(obj){
      	   var file = obj.files;

           	// file[0].size 는 파일 용량 정보입니다.
           	if(file[0].size > 1024*1024*10){
           		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
           		   alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. "); 
           		$('.multi1').remove();
           	   	$('#input-div1').append('<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />');
           	
           	   	return false;
           	}
            }            
         
         function check2(obj){
      	   var file = obj.files;

           	// file[0].size 는 파일 용량 정보입니다.
           	if(file[0].size > 1024*1024*10){
           		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
           		  alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           		$('.multi2').remove();
             	$('#input-div2').append('<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="check2(this);loadFile2(event);" />');
           		  return false;
           	}
           }    
         
         function check3(obj){
      	   var file = obj.files;

           	// file[0].size 는 파일 용량 정보입니다.
           	if(file[0].size > 1024*1024*10){
           		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
           		 alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           		$('.multi3').remove();
             	$('#input-div3').append('<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />');
           		  return false;
           	}
            }    
        
        
function CheckForm(memberInfo){
	var file1= $('.multi1').val();
	var file2= $('.multi2').val();
	var file3= $('.multi3').val();
	
	if(!file1){
		if(certifyimg1 ==null || certifyimg1 ==''){
		alert("신분증을 등록해주세요.");
		return false;
		}
	}
	if(!file2){
		if(certifyimg2 ==null || certifyimg2 ==''){
		alert("대학 재학/졸업 증명서 또는 학생증을 등록해주세요.");
		return false;
		}
	}
    }
	
	
$(window).bind("pageshow", function(event) {
		$('#spinner').hide();
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
</script>
</body>
</html>