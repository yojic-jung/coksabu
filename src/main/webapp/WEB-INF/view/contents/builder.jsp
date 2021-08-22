<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<textarea name="questionAnswer" class="questionAnswer" rows="15"></textarea>
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
	<p class="0"><span id="docs-internal-guid-b6a1e528-7fff-320b-3fca-bf30e26d2d6e"><span style="font-size: 17pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span style="border:none;display:inline-block;overflow:hidden;width:354px;height:27px;"><img alt="<math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot; display=&quot;block&quot; data-is-equatio=&quot;1&quot; data-latex=&quot;2^{\sqrt{3}} \times 2^{2-\sqrt{3}}=2^{\sqrt{3}+2-\sqrt{3}}=2^{2}=4&quot;><msup><mn>2</mn><mrow data-mjx-texclass=&quot;ORD&quot;><msqrt><mn>3</mn></msqrt></mrow></msup><mo>×</mo><msup><mn>2</mn><mrow data-mjx-texclass=&quot;ORD&quot;><mn>2</mn><mo>−</mo><msqrt><mn>3</mn></msqrt></mrow></msup><mo>=</mo><msup><mn>2</mn><mrow data-mjx-texclass=&quot;ORD&quot;><msqrt><mn>3</mn></msqrt><mo>+</mo><mn>2</mn><mo>−</mo><msqrt><mn>3</mn></msqrt></mrow></msup><mo>=</mo><msup><mn>2</mn><mrow data-mjx-texclass=&quot;ORD&quot;><mn>2</mn></mrow></msup><mo>=</mo><mn>4</mn></math>" title="2 raised to the the square root of 3 power times 2 raised to the 2 minus the square root of 3 power equals 2 raised to the the square root of 3 plus 2 minus the square root of 3 power equals 2 squared equals 4" src="https://lh3.googleusercontent.com/Zoi_XBrY_3Iam46minmHYHsFt-3y1Ym7G2bVENsJ-xKyl3Iw-vGy7lNspHoJlbdkq4K8yTCM9c_3TMzlAxozL_6_tY_STzsY2Scw4-bryMNsFKBkOORicMzaTgWIaztgVnDZSg3s" width="354" height="27" style="margin-left:0px;margin-top:0px;"></span></span></span></p><p class="0"><span id="docs-internal-guid-b6a1e528-7fff-320b-3fca-bf30e26d2d6e"><span style="font-size: 17pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span style="border:none;display:inline-block;overflow:hidden;width:354px;height:27px;"><span id="docs-internal-guid-5e472e72-7fff-beb9-15a5-6898ae2dc147"><span style="font-size: 17pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;"><span style="border:none;display:inline-block;overflow:hidden;width:302px;height:41px;"><img alt="<math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot; display=&quot;block&quot; data-is-equatio=&quot;1&quot; data-latex=&quot;\begin{array}{l}\\&amp;#13;&amp;#10;\end{array}\begin{array}{l}\mathbf{f}(\mathbf{x})=\int_{ }^{ }\mathbf{f}^{\prime}(\mathbf{x})\mathbf{d}\mathbf{x}=\mathbf{x}^3-\mathbf{x}^2+\mathbf{C}(\mathbf{f}(\mathbf{1})=\mathbf{1})\\&amp;#13;&amp;#10;\therefore\mathbf{f}(\mathbf{x})=\mathbf{x}^3-\mathbf{x}^2+\mathbf{1}\quad\therefore f(2)=8-4+1=5\end{array}&quot;><mtable columnalign=&quot;left&quot; columnspacing=&quot;1em&quot; rowspacing=&quot;4pt&quot;><mtr><mtd/></mtr></mtable><mtable columnalign=&quot;left&quot; columnspacing=&quot;1em&quot; rowspacing=&quot;4pt&quot;><mtr><mtd><mi mathvariant=&quot;bold&quot;>f</mi><mo stretchy=&quot;false&quot;>(</mo><mi mathvariant=&quot;bold&quot;>x</mi><mo stretchy=&quot;false&quot;>)</mo><mo>=</mo><msubsup><mo data-mjx-texclass=&quot;OP&quot;>∫</mo><mrow data-mjx-texclass=&quot;ORD&quot;/><mrow data-mjx-texclass=&quot;ORD&quot;/></msubsup><msup><mi mathvariant=&quot;bold&quot;>f</mi><mrow data-mjx-texclass=&quot;ORD&quot;><mi data-mjx-alternate=&quot;1&quot;>′</mi></mrow></msup><mo stretchy=&quot;false&quot;>(</mo><mi mathvariant=&quot;bold&quot;>x</mi><mo stretchy=&quot;false&quot;>)</mo><mi mathvariant=&quot;bold&quot;>d</mi><mi mathvariant=&quot;bold&quot;>x</mi><mo>=</mo><msup><mi mathvariant=&quot;bold&quot;>x</mi><mn>3</mn></msup><mo>−</mo><msup><mi mathvariant=&quot;bold&quot;>x</mi><mn>2</mn></msup><mo>+</mo><mi mathvariant=&quot;bold&quot;>C</mi><mo stretchy=&quot;false&quot;>(</mo><mi mathvariant=&quot;bold&quot;>f</mi><mo stretchy=&quot;false&quot;>(</mo><mn mathvariant=&quot;bold&quot;>1</mn><mo stretchy=&quot;false&quot;>)</mo><mo>=</mo><mn mathvariant=&quot;bold&quot;>1</mn><mo stretchy=&quot;false&quot;>)</mo></mtd></mtr><mtr><mtd><mo>∴</mo><mi mathvariant=&quot;bold&quot;>f</mi><mo stretchy=&quot;false&quot;>(</mo><mi mathvariant=&quot;bold&quot;>x</mi><mo stretchy=&quot;false&quot;>)</mo><mo>=</mo><msup><mi mathvariant=&quot;bold&quot;>x</mi><mn>3</mn></msup><mo>−</mo><msup><mi mathvariant=&quot;bold&quot;>x</mi><mn>2</mn></msup><mo>+</mo><mn mathvariant=&quot;bold&quot;>1</mn><mstyle scriptlevel=&quot;0&quot;><mspace width=&quot;1em&quot;/></mstyle><mo>∴</mo><mi>f</mi><mo stretchy=&quot;false&quot;>(</mo><mn>2</mn><mo stretchy=&quot;false&quot;>)</mo><mo>=</mo><mn>8</mn><mo>−</mo><mn>4</mn><mo>+</mo><mn>1</mn><mo>=</mo><mn>5</mn></mtd></mtr></mtable></math>" title="1 lines Line 1: blank 2 lines Line 1: bold f of bold x equals the integral from to of bold f prime of bold x equals bold x cubed minus bold x squared plus bold C of open paren bold f of bold 1 equals bold 1 close paren Line 2: therefore bold f of bold x equals bold x cubed minus bold x squared plus bold 1 therefore f of 2 equals 8 minus 4 plus 1 equals 5" src="https://lh5.googleusercontent.com/sjeFi719qkf2W65oEQmoGQd-zYrl7JRNJq4A-TV4pig81tERG-NU6QLYMFlq7jzfWN8kelvb2Qbo3_HAaoxg0_inSM2_Pd0s2d0_9r3EuKfmqXZHAlh9tvit7fe3vdL4CgUrzkjp" width="302" height="41" style="margin-left: 0px; margin-top: 0px; width: 236.398px; height: 32.0938px;"></span></span></span><br></span></span></span></p><p class="0"><span id="docs-internal-guid-9743a26c-7fff-5c1a-340e-d33cdd46d1cb"><span style="font-size: 17pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span style="border:none;display:inline-block;overflow:hidden;width:204px;height:20px;"><img alt="<math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot; display=&quot;block&quot; data-is-equatio=&quot;1&quot; data-latex=&quot;\cos105^{\circ}\ \cdot sin105^{\circ }&quot;><mi>cos</mi><mo data-mjx-texclass=&quot;NONE&quot;>⁡</mo><msup><mn>105</mn><mrow data-mjx-texclass=&quot;ORD&quot;><mo>∘</mo></mrow></msup><mtext></mtext><mo>⋅</mo><mi>s</mi><mi>i</mi><mi>n</mi><msup><mn>105</mn><mrow data-mjx-texclass=&quot;ORD&quot;><mo>∘</mo></mrow></msup></math>" title="the cosine of 105 degrees times s i n 105 degrees" src="https://lh3.googleusercontent.com/KFtO0K0SL8zALNv71jxBaEocL1ueTXO8qE0xEt4HTWFsvRBFeBG1Ij1A3ri8ZVRcjAsjTCqsXtjhrm73ATvERrXbLbZrJL_PwKLssyeBpYZoINyoo528iX0T80KVhgvQUN-juPoX" width="204" height="20" style="margin-left:0px;margin-top:0px;"></span></span></span><br></p><p class="0"><br></p><p class="0"><span id="docs-internal-guid-b6a1e528-7fff-320b-3fca-bf30e26d2d6e"><span style="font-size: 17pt; font-family: Arial; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span style="border:none;display:inline-block;overflow:hidden;width:354px;height:27px;"><br></span></span></span><br></p>
	
<script type="text/x-mathjax-config">
            MathJax.Hub.Config({
              tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
            });
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>
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
	
	$(document).on('keyup','.questionAnswer',function(){
  	  	var latexValue = $(this).val().replaceAll('\n',"<br/>");
    	$('.latex-show').html(latexValue);
        MathJax.Hub.Queue(['Typeset',MathJax.Hub,'.latex-show']);  // <-- YOU NEED THIS
      });
</script>
</body>
</html>