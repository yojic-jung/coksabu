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
	margin:20px;
}
        
        .multi1, .multi2, .multi3{
        display:none;
        }
        
        #imgplus1, #imgplus2, #imgplus3{
        	width:30px;height:30px;
        	backgroud:white;
        	border-radius:15px;
        	border:2px solid lightgray;
        	cursor:pointer;
        	position:relative;
        	top:-30px;
        }
        #output1{
        	width:210px;height:180px;
        }
        #output2, #output3{
        	width:130px;height:180px;
        }
        .certi{
        	padding:10px;border-radius:10px;
        	background:orange;
        	color:white;
        	border:none;
        }
</style>
</head>
<body>
<div class="title1">본인/학력인증</div>
			<div style="font-size:15px;text-align:center;color:orange;margin:10px;line-height:150%;">
				신분증의 주민등록번호 뒷자리는 반드시 가려주시기 바랍니다.<br/>
			       프로필에 대학원을 기재하신 경우 대학원 재학/졸업 증명서를 꼭 첨부하여주시기 바랍니다.
			</div>
				
			<form id="create_form" method="post" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
			
			<input type="text" value="${email}" style="display:none" />
			
			<table style="font-size:12px; width:560px;margin:30px auto 0px auto;border-spacing:10px;">
				<tr style="text-align:center;">
					<td>신분증</td>
					<td>대학 졸업/재학증명서<br/>(학생증 가능)</td>
					<td>대학원 증명서 (선택)</td>
				</tr>
				<tr style="text-align:right">
					<td style="width:210px;">
					<img id="output1" src="<c:url value="/resources/certifyImg/identity.png" />"  />
					<div>
					<img id="imgplus1" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div1">
					<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="loadFile1(event);check1(this)" />
					</div>
					</td>
					
					<td style="width:130px;">
					<img id="output2" src="<c:url value="/resources/certifyImg/education.png" />"  />
					<div>
					<img id="imgplus2" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div2">
					<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="loadFile2(event);check2(this)" />
					</div>
					</td>
					
					<td style="width:130px;">
					<img id="output3" src="<c:url value="/resources/certifyImg/education.png" />"  />
					<div>
					<img id="imgplus3" src="<c:url value="/resources/images/imgplus.png" />"  />
					</div>
					<div id="input-div3">
					<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="loadFile3(event);check3(this)" />
					</div>
					</td>
				</tr>
			</table>
    	        
			<div style="text-align:center" class="submit-div">
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
	 }
	 if(certifyimg2 !=null && certifyimg2 !=''){
		 $('#output2').attr('src', ctx+"/resources/certifyImg/"+certifyimg2); 
	 }
	 if(certifyimg3 !=null && certifyimg3 !=''){
		 $('#output3').attr('src', ctx+"/resources/certifyImg/"+certifyimg3);
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
   	$('#input-div1').append('<input name="certifyimg1" class="multi1" type="file" accept="image/*" onchange="loadFile1(event);" />');
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
    	$('#input-div2').append('<input name="certifyimg2" class="multi2" type="file" accept="image/*" onchange="loadFile2(event);" />');
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
    	$('#input-div3').append('<input name="certifyimg3" class="multi3" type="file" accept="image/*" onchange="loadFile3(event);" />');
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
	    reader.readAsDataURL(event.target.files[0]);
    };   

var loadFile2 = function(event) {
  	 var reader = new FileReader();
  	 reader.onload = function(){
  	     var output = document.getElementById('output2');
  	     output.src = reader.result;
  	 };
  	 reader.readAsDataURL(event.target.files[0]);
     }; 
    
 var loadFile3 = function(event) {
  	    var reader = new FileReader();
  	    reader.onload = function(){
  	      var output = document.getElementById('output3');
  	      output.src = reader.result;
  	    };
  	    reader.readAsDataURL(event.target.files[0]);
        };    

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