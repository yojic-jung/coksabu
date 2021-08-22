<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>

  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="/resources/summernote/summernote-lite-customize.js"></script>
  <script src="/resources/summernote/summernote-ko-KR-customize.js"></script>
  <link rel="stylesheet" href="/resources/summernote/summernote-lite-customize.css">
  <!--  -->
  <style>
	.top-div{
		width:1200px;
		min-width:1200px;
		margin:auto;
	}
	
	.top-name{
		margin:50px 0px;
		font-size:25px;
		font-weight:bold;
		text-align:center;
		color:#242424;
	}
	
	.left{
		width:50%;
		min-height:600px;
		background:rgb(255,244,220);
		float:left;
		display:inline-block;
		text-align:center;
		padding:10px 0px;
	}
	.right{
		width:50%;
		min-height:600px;
		background:rgb(242,249,255);
		display:inline-block;
		padding:10px 0px;
		text-align:center;
	}
	
	.right-title{
		font-weight:bold;
		padding:10px;font-size:16px;
		margin:0 10px 10px 0;
		color:#002266;
	}
	.latex-show{
		word-break:keep-all;
		font-size:16px;
		line-height:150%;
		width:90%;
		margin:10px auto;
		border-radius:3px;
		border:2px solid #002266;
		background:white;;
		min-height:300px;
		text-align:left;
	}
	.left .container{
		text-align:left;
	}
	.questionAnswer{
		color:#212121;
		width:90%;
		margin:auto;
		line-height:150%;
		border:2px solid rgb(250,229,124);
		border-radius:5px;
		font-size:16px;
		
	}
	.year, .month, .number{
		color:dimgray;
		font-weight:bold;
		padding:10px;font-size:16px;
		margin:0 10px 10px 0;
		border:2px solid rgb(250,229,124);
		border-radius:5px;
	}
	.number{
		width:80px;
		text-align:right;
	}
	.submit{
		padding:10px;font-size:20px;
		margin:20px 0 10px 0;
		background:rgb(255,138,61);
		color:white;
		width:200px;
		cursor:pointer;
		border:none;
		border-radius:10px;
	}
</style>
</head>
<body>
<form method="post" enctype="multipart/form-data" >

</form>

	<div class="top-div">
		<div class="top-name">수능 평가원 기출 해설 만들기</div>
		<div class="left">
			<form method="post">
				<select name="year" class="year">
					<option value="">학년도 선택</option>
					<option value="2021">2021학년도</option>
					<option value="2020">2020학년도</option>
					<option value="2019">2019학년도</option>
					<option value="2018">2018학년도</option>
					<option value="2017">2017학년도</option>
					<option value="2016">2016학년도</option>
					<option value="2015">2015학년도</option>
					<option value="2014">2014학년도</option>
					<option value="2013">2013학년도</option>
					<option value="2012">2012학년도</option>
					<option value="2011">2011학년도</option>
					<option value="2010">2010학년도</option>
				</select>
				
				<select name="month" class="month">
					<option value="">월 선택</option>
					<option value="6">6월</option>
					<option value="9">9월</option>
					<option value="11">수능</option>
				</select>
				
				<input type="number" class="number" name="questionNumber" placeholder="문제번호" />
				<div class="container">
  					<textarea class="summernote questionAnswer" name="questionAnswer"></textarea>    
				</div>
				<br/>
				<input type="submit" class="submit" value="등록하기"/>
			</form>
		</div>
		<div class="right">
			<div class="right-title">LateX 변환화면</div>
			<div class="latex-show"></div>
		</div>
	</div>
	<div style="height:300px;"></div>

<script type="text/x-mathjax-config">
            MathJax.Hub.Config({
              tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
            });
</script>

<script>
$('.summernote').summernote({
	height : 400,
	lang: "ko-KR",
	minHeight : null,
	maxHeight : null,
	focus : true,
	callbacks : {
		onImageUpload : function(files, editor, welEditable) {     
			for (var i = 0; i < files.length; i++) {
				sendFile(files[i], this);
			}
		}
	}
});

function sendFile(file, editor) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '/resources/summerimages',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(url) {
			$(editor).summernote('insertImage', url, function($image) {
				$image.css('width', "25%");
			});
		}
	});
}

	$(document).ready(function(){
		$(".submit").click(function(){
			var year = $(".year option:selected").val();
			var month = $(".month option:selected").val();
			var number = $(".number").val();
			
			if(year==''){
				alert("학년도를 선택해주세요.");
				return false;
			}
			if(month==''){
				alert("시험 시행 월을 선택해주세요.");
				return false;
			}
			if(number=='' || (number<1 || number>30 )){
				alert("문제번호를 숫자만 적어주세요.");
				return false;
			}
		});
	});
	
	$(document).on('input','.note-editable',function(){
  	  	var latexValue = $(this).html();
    	$('.latex-show').html(latexValue);
        MathJax.Hub.Queue(['Typeset',MathJax.Hub,'.latex-show']);  // <-- YOU NEED THIS
      });
</script>
</body>
</html>