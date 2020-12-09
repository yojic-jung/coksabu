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
.title{
	text-align:center;
}
.sub{
margin:10px;
text-align:center;
font-size:13px;
line-height:150%;
}
 .btn1, .btn2, .btn3{
            padding:10px;
            border-radius:10px;
            font-size:30px;
            background:black;
            color:white;
        }
        
        .multi1, .multi2, .multi3{
        	display:none;
        }
        
        #output1{
        	width:100%;height:320px;margin-right:20px;
        }
        #output2, #output3{
        	width:100%;height:320px;margin-right:20px;
        }
        .del-div1{
        
        	display:inline-block;
        	width:30%;margin:40px 0px;
        	text-align:center
        }
        
        .del-div2, .del-div3{
        	display:inline-block;
        	width:30%;margin:40px 0px;
        	text-align:center
        }
        
        .del1, .del2, .del3{
        	padding:15px; background:black; color:white;
        	border-radius:10px;
        	font-size:20px;
        	cursor:pointer;
        }
        
        .example1{
        	width:90%; height:150px; margin-right:30px;
        }
        .example2,.example3{
        	width:70%; height:260px;margin-right:30px;
        }
        .certi{
        	margin-top:20px;
        	padding:10px;border-radius:10px;
        	background:orange;
        	width:200px;
        	font-size:40px;
        	color:white;
        	border:none;
        }
</style>
</head>
<body>
				 <div style="width:100%;padding:40px; margin:auto;">
			<table style="font-size:32px;font-weight:bolder;padding:30px;width:80%; margin:auto">
				<tr>
					<td style="width:30%;">신분증</td>
					<td style="width:30%;">대학 졸업/재학증명서&nbsp;&nbsp;&nbsp;</td>
					<td style="width:30%;">대학원 증명서 (선택)</td>
				</tr>
				<tr>
					<td><img class="example1" src="<c:url value="/resources/certifyImg/identity.png" />"  /></td>
					<td><img class="example2" src="<c:url value="/resources/certifyImg/education.png" />"  /></td>
					<td><img class="example2" src="<c:url value="/resources/certifyImg/education.png" />"  /></td>
				</tr>
			</table>
			
				</div>
				<div style="font-size:30px;text-align:center;color:orange;margin:10px;line-height:150%;">
				신분증의 주민등록번호 뒷자리는 반드시 가려주시기 바랍니다.<br/>
			프로필에 대학원 기재하신 경우 대학원 재학/졸업증명서를  첨부해주시기 바랍니다.
			</div>
 <div class="title"><button class="btn1">이미지 추가</button></div>
 <br/>
        <div class="img-div">
        </div>
       
        <div>
        	<div class="del-div1"></div>
        	<div class="del-div2"></div>
        	<div class="del-div3"></div>
        </div>
         <br/>
        <div style="text-align:center;color:gray; font-size:28px;">이미지를 취소하고 싶은경우 이미지를 클릭하면 됩니다.</div>
        <form id="create_form" method="post" enctype="multipart/form-data" onSubmit="return CheckForm(this)">
			
			<input type="text" value="${email}" style="display:none" />
			
	        <div class="uploadDiv">
    	        <input name="img" class="multi1" type="file" accept="image/*" onchange="loadFile(event);check(this)" />
    	        <input name="img" class="multi2" type="file" accept="image/*" onchange="loadFile2(event);check(this)" />
    	        <input name="img" class="multi3" type="file" accept="image/*" onchange="loadFile3(event);check(this)" />
    	    </div>
			
				<br/>
				<div style="text-align:center">
			<input type="submit" class="certi" value="보내기" />
   				</div>
   		</form>

    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
var loadFile = function(event) {
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
        

function check(obj){
	var pathpoint = obj.value.lastIndexOf('.');
	var filepoint = obj.value.substring(pathpoint+1,obj.length);
	var filetype = filepoint.toLowerCase();
     // 확장자가 이미지 파일이면 체크를 위해 임시로 로딩합니다.
     if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp'){
     }else{
    	 alert('이미지  파일만 등록해주십시오.(img/gif/png/jpeg/bmp)');
     }
     
		    	
     	document.fileForm.submit();
}            

$(document).ready(function(){
	
	$('.m-jbMenu').append("본인/학력 인증");
	
	 var status = "<c:out value="${status}" />";
	 
	 if(status=="success"){
		 alert("본인인증 신청을 완료하셨습니다. 완료까지 1-2일 정도 걸릴 수 있습니다.");
		 window.history.go(-2);
	 }else if(status=="fail"){
		 alert("신청이 올바르게 되지 않았습니다. 다시 신청해주시기 바랍니다.");
		 window.history.go(-2);
	 }
	
	
	var ctx = "<c:out value="${pageContext.request.contextPath}" />";
	var imgPath = "<c:out value="${imgPath}" />";
	var img = imgPath.split("*");

	
	if(imgPath!=''){
		for(var i=0; i<img.length; i++){
    		var name = 'output'+(i+1);
    		var path = ctx+'/resources/certifyImg/'+img[i];
    		var del = '<span class="del'+(i+1)+'" data-name="'+img[i]+'">삭제하기</span>';
    		var delDiv = '.del-div'+(i+1);
    		$('.img-div').append('<img id="'+name+'" style="width:30%;" src=""/>');
    		$(delDiv).append(del);
    		var nameId = "#"+name;
    		$(nameId).attr('src',path);
    	}
	}
	
});


$(document).on('click','.del1',function(){
	$.ajax({
		  url:'./delImgPath?name='+$('.del1').attr('data-name'),
		  type:'get',
		  error:function(error){
		  },
		  success:function(data){
		  }
	  });
	$(this).remove();
	$('.del-div1').remove();
	$('#output1').trigger('click');
});

$(document).on('click','.del2',function(){
	$.ajax({
		  url:'./delImgPath?name='+$('.del2').attr('data-name'),
		  type:'get',
		  error:function(error){
		  },
		  success:function(data){
		  }
	  });
	$(this).remove();
	$('.del-div2').remove();
	$('#output2').trigger('click');
});

$(document).on('click','.del3',function(){
	$.ajax({
		  url:'./delImgPath?name='+$('.del3').attr('data-name'),
		  type:'get',
		  error:function(error){
		  },
		  success:function(data){
		  }
	  });
	$(this).remove();
	$('.del-div3').remove();
	$('#output3').trigger('click');
});


$(document).on('click','.btn1',function(){
	//버튼을 클릭하면 자동으로 이미지 파일 생성 하지만 파일 추가하지 않고 취소시 이미지를 삭제해야 하므로 이 작업 진행
	if($('#output1').length==1){
		if($('#output1').attr('src') == ''){
			$('#output1').remove();
		}
	}
	//아웃풋2가 이미지가 등록되어있지 않을시 삭제후 진행
	if($('#output2').length==1){
		if($('#output2').attr('src') == ''){
			$('#output2').remove();
		}
	}
	//아웃풋3가 이미지가 등록되어있지 않을시 삭제후 진행
	if($('#output3').length==1){
		if($('#output3').attr('src') == ''){
			$('#output3').remove();
		}
	}
	
	if($('.multi1').val()=='' && $('#output1').length==0){
		$('.img-div').append('<img id="output1" style="width:30%;display:none;" src=""/>');
   	 	$('.multi1').trigger('click');
	}else if($('.multi2').val()=='' && $('#output2').length==0){
		$('.img-div').append('<img id="output2" style="width:30%;display:none;" src=""/>');
		$('.multi2').trigger('click');
	}else if($('.multi3').val()=='' && $('#output3').length==0){
		$('.img-div').append('<img id="output3" style="width:30%;display:none;" src=""/>');
		$('.multi3').trigger('click');
	}
	});


$(document).on('click','#output1',function(){
	//del1이 있으면 ajax처리해야 하므로 del1이 없을때만 이미지 지워짐
	if($('.del1').length==0){
		$('.multi1').remove();
		$(this).remove();
		$('.uploadDiv').append('<input name="img" class="multi1" type="file" accept="image/*" onchange="loadFile(event);check(this)" />');
	}
});

$(document).on('click','#output2',function(){
	if($('.del2').length==0){
		$('.multi2').remove();
		$(this).remove();
		$('.uploadDiv').append('<input name="img" class="multi2" type="file" accept="image/*" onchange="loadFile2(event);check(this)" />');
	}
});

$(document).on('click','#output3',function(){
	if($('.del3').length==0){
		$('.multi3').remove();
		$(this).remove();
		$('.uploadDiv').append('<input name="img" class="multi3" type="file" accept="image/*" onchange="loadFile3(event);check(this)" />');
	}
});


$(document).on('change','.multi1',function(){
	$('#output1').css('display','');
});

$(document).on('change','.multi2',function(){
	$('#output2').css('display','');
});

$(document).on('change','.multi3',function(){
	$('#output3').css('display','');
});


function CheckForm(memberInfo){
	 var fileCheck = $("#output1").attr('src');
	 var fileCheck2 = $("#output2").attr('src');
	    if(fileCheck=="" || fileCheck2==""){
	        alert("신분증과 학력증명서 파일을 첨부해 주세요");
	        return false;
	    }
     }
	
	
	
	  </script>
</body>
</html>