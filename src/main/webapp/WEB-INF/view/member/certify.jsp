<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>본인/학력 인증하기 콕사부</title>
<meta charset="utf-8">
<meta name="description" content="본인 인증 및 학력 인증하기" />
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 
body{
padding:20px;
 font-family: 'JejuGothic'; 
}
.title1{
	text-align:center;font-weight:bolder;
	margin:20px 0px;
}
        
        .multi1, .multi2, .multi3{
        display:none;
        }
        
        #imgplus1, #imgplus2, #imgplus3{
        	width:40px;height:40px;
        	backgroud:white;
        	border-radius:20px;
        	border:2px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-30px;
        }
        #output1,  #output2, #output3{
        	width:280px;height:200px;
        	border-radius:20px
        }
        .certi{
        	padding:10px;border-radius:10px;
        	width:200px;
        	font-size:20px;
        	background:orange;
        	color:white;
        	border:none;
        }
         .output-content1, .output-content2, .output-content3{
        	word-break:keep-all;
        	width:80%;position:absolute;top:30%;left:50%;transform:translate(-50%,-50%);
        	line-height:180%;
        }
</style>
</head>
<body>
<div class="title1">본인/학력인증</div>
			<div style="font-size:15px;text-align:center;color:orange;margin:20px 0px;line-height:150%;">
				신분증의 주민등록번호 뒷자리는 반드시 가려주시기 바랍니다.<br/>
			       프로필에 대학원을 기재하신 경우<br/>대학원 재학/졸업 증명서를 꼭 첨부하여주시기 바랍니다.
			</div>
				
			<form id="create_form" method="post" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
			
			<input type="text" value="${email}" style="display:none" />
			
			<table style="font-size:15px; width:300px;margin:30px auto;border-spacing:10px;text-align:center;">
				<tr>
					<td>신분증</td>
				</tr>
				<tr>
					<td style="position:relative">
					<img id="output1" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div class="output-content1">주민등록증 또는 운전면허증 또는 여권 가능<br/>(주민번호 뒷번호, 주소<br/>운전면허, 여권번호는 가려주세요.)</div>
					<div style="text-align:right;height:70px;">
					<img id="imgplus1" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div1">
					<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="check1(this);loadFile1(event);" />
					</div>
					</td>
				</tr>
				<tr style="line-height:140%;">
					<td>대학 재학/졸업증명서<br/>(학생증 또는 합격증 이미지 가능)</td>
				</tr>
				<tr>
					<td style="position:relative">
					<div class="output-content2">대학 인증 이미지</div>
					<img id="output2" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div style="text-align:right;height:70px;">
					<img id="imgplus2" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div2">
					<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="check2(this);loadFile2(event);" />
					</div>
					</td>
				</tr>
				<tr style="line-height:140%;">
					<td>대학원  재학/졸업증명서(선택)<br/>(학생증 또는 합격증 이미지 가능)</td>
				</tr>
				<tr>
					<td style="position:relative">
					<img id="output3" src="<c:url value="/resources/certifyImg/certifybackground.png" />"  />
					<div class="output-content3">(선택)<br/>대학원 인증 이미지</div>
					<div style="text-align:right;height:70px;">
					<img id="imgplus3" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div3">
					<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="check3(this);loadFile3(event);" />
					</div>
					</td>
				</tr>
			</table>
    	        
			<div style="text-align:center;margin:40px auto;" class="submit-div">
				<input type="submit" class="certi" value="보내기" />
   			</div>
   			
   		</form>

    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
var ctx = "<c:out value="${pageContext.request.contextPath}" />";

var certifyimg1 = "<c:out value="${cerDB.certifyimg1}" />";
var certifyimg2 = "<c:out value="${cerDB.certifyimg2}" />";
var certifyimg3 = "<c:out value="${cerDB.certifyimg3}" />";

$(document).ready(function(){
	 var status = "<c:out value="${status}" />";
	 
	 if(status=="success"){
		 alert("본인인증 신청을 완료하셨습니다. 완료까지 1-2일 정도 걸릴 수 있습니다.");
		 opener.location.reload();
		 window.close();
	 }else if(status=="fail"){
		 alert("신청이 올바르게 되지 않았습니다. 다시 신청해주시기 바랍니다.");
		 opener.location.reload();
		 window.close();
	 }
	 
	 
	 var certify = "<c:out value="${cerDB.certify}" />";
	 
	 if(certify==1){
		 $('.certi').remove();
		 $('#imgplus1').remove();
		 $('#imgplus2').remove();
		 $('#imgplus3').remove();
		 $(".submit-div").text("인증이 완료되었습니다.")
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
    
    document.fileForm.submit();
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
     
     document.fileForm.submit();
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
     document.fileForm.submit();
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
	
	
	
	  </script>
</body>
</html>