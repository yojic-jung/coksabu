<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>구매하기 수업목록 콕사부</title>
 <meta name="description" content="수업 구매페이지" />
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
 @font-face { font-family: 'JejuGothic'; 
      src: url(<c:url value="/resources/JejuGothic-Regular.ttf" />) format('truetype'); } 

        * { margin:0px; padding:0px; box-sizing: border-box;}
        body {
            margin: 0px;
            padding: 0px;
          }
          .jbMenu {
            padding:10px;
            z-index:3;
            display: inline-block;
            background-color: white;
            width: 100%;
            border-bottom : solid 1px orange;
          }
          .top-title{
            float:left;
            height:100%;
            text-align:center;
          }
          .top-title a{
          padding : 0px 20px;
          font-family:'Do Hyeon'; 
          color:orange; 
          text-decoration:none;
          font-size:40px;
          }
          .top-right{
          text-align:center;
          margin-right:150px;
          height:60px;
          vertical-align:center;
          font-size:20px;
          font-family:'JejuGothic';
          padding-top:20px;
          clear:right;
          }
          .represent-img{
          	float:left;
          	margin-right:30px;
          }
          .title{
          	
          	width:590px;
          	clear:right;
          	padding:10px;
          }
          .purchase-first{
          padding:10px;
          	width:500px;
          }
          .purchase-second{
          	padding:10px;
          	width:150px;
          }
          .price-content{
          	padding:7px;
          	font-size:12px;
          	font-family:'JejuGothic';
          }
          .payment-method td{
          	width:300px;
          	text-align:center;
          }
          .payment{
          border:none;
          	border-radius:5px;
          	width:200px;
          	padding:10px;
          	font-size:17px;
          	font-family:'JejuGothic';
          	background:orange;
          	color:white;
          }
     .foot{
      width:100%;
      clear:left;
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
    .foot-cate a, .foot-company a{
    text-decoration:none;
    color:black;
    
    }
</style>
</head>
<body>
<div class="jbMenu">
       <div class="top-title"><a href="./">콕사부</a></div>
       <div class="top-right">콕사부를 통해 튜터들과 '<b>안전거래</b>' 할 수 있습니다.</div>
</div>
<form method="post" commandName="memberInfo" onSubmit="return CheckForm(this)">
<div>
	<div style="width:700px;min-width:700px;margin:auto;margin-top:50px;">주문하기</div>
	<div style="width:700px; border:0.5px solid black; min-width:700px;margin:10px auto; min-height:300px;padding:20px;">
		<div class="represent-img"><img style="width:80px; height:80px;" src="<c:url value="/img/representImg/${purchase.represent}" />" /></div>
		<div class="title">
		<span style="font-size:20px;font-family:'JejuGothic'">${purchase.title }</span><br/>
		<br/>
		<span style="font-size:12px;font-family:'JejuGothic'">${purchase.cate }(${purchase.pubSubcate })</span><br/>
		</div>
		
		
		<table style="border-spacing:0px; margin-top:30px;">
		<tr style="width:640px; margin:10px auto; background:rgb(240, 239, 239);padding:7px;font-size:12px;">
		<td class="purchase-first">
		<b>구매정보</b>
		</td>
		<td class="purchase-second">
		<b>가격</b>
		</td>
		</tr>
		<tr>
		<td class="price-content">
		수업 과목  : ${purchase.pubSubcate }
		</td>
		<td rowspan="5">
		 <span style="font-family:'JejuGothic';font-size:17px;"><b>${purchase.pubprice3 }원</b></span>
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		회당 수업시간 : ${purchase.pubprice2 }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		수업시수  : ${purchase.pubprice1 }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		과외 가능 형태 : ${purchase.gawe }
		</td>
		</tr>
		
		<tr>
		<td class="price-content">
		<c:if test="${purchase.trial!=null}">시범 수업 여부  : ${purchase.trial}</c:if>
		</td>
		</tr>
		</table>
		
		<div>
		<div style="width:660px; margin:auto; margin-top:30px; background:rgb(240, 239, 239);padding:10px;font-size:12px;">
			<b>휴대폰 번호</b>
		</div>
		<div style="padding:10px;">
			<input id="buyerPhone" style="padding:5px; font-size:15px;" type="text" name="buyerPhone" value="${phone}" />
		</div>
		</div>
		
		<div>
		<div style="width:660px; margin:auto; margin-top:30px; background:rgb(240, 239, 239);padding:10px;font-size:12px;">
		<b>수업 시작/종료일 지정</b></div>
		<div style="margin:10px; font-size:12px;">선생님과 협의한  시작일자와 종료일자를 입력해주세요.</div>
		<input type="text" id="testDatepicker" name="startDateS" style="font-size:12px;padding:5px;width:110px;margin-left:10px;" placeholder="시작일"/>&nbsp;&nbsp;  ~ 
		<input type="text" id="testDatepicker2" name="endDateS" style="font-size:12px;padding:5px;width:110px;margin-left:10px;" placeholder="종료일"/>  
		</div>
		
		<div>
		<div style="width:660px; margin:auto; margin-top:30px; background:rgb(240, 239, 239);padding:10px;font-size:12px;">
		<b>결제방법</b></div>
		<div style="padding:10px;line-height:200%;">
		무통장 입금<br/>
		<table style="border-spacing:10px;">
		<tr>
		<td>계좌선택</td>
		<td>
		<select id="bank" name="bank" style="padding:5px;font-size:15px;height:30px;">
			<option>--은행선택--</option>
			<option value="농협은행 351-1087-9782-73 정요직(콕사부)">농협은행 351-1087-9782-73</option>
		</select>
		</td>
		</tr>
		<tr>
		<td>입금자명</td>
		<td><input id="depositor" type="text" name="depositor" style="font-size:15px;padding:5px;" placeholder="입금자 성함을 적어주세요."/></td>
		</tr>
		</table>
		</div>
		</div>
	</div>
</div>

<div style="display:none;">
<input type="text" name="title" value="${purchase.title}" />
<input type="text" name="cate" value="${purchase.cate}" />
<input type="text" name="subcateIdx" value="${subcateIdx}" />
<input type="text" name="subcate" value="${purchase.pubSubcate}" />
<input type="text" name="price1" value="${purchase.pubprice1}" />
<input type="text" name="price2" value="${purchase.pubprice2}" />
<input type="text" name="price3" value="${purchase.pubprice3}" />
<input type="text" name="trial" value="${purchase.trial}" />
<input type="text" name="gawe" value="${purchase.gawe}" />
</div>

<div style="margin:40px 0px 60px 0px; text-align:center;line-height:200%; font-weight:bolder">
<c:if test="${purchase.visible==0}">
<div style="font-size:30px;text-align:center;color:#FFBB00;">판매 중단</div>
<div style="text-align:center;color:#FFBB00;">이 수업은 판매자의 요청으로 판매가 중단된 수업입니다.</div>
</c:if>
<c:if test="${purchase.visible==1}">
<input type="submit" class="payment" value="결제하기"/><br/>
</c:if>

콕사부에서는 고객의 휴대폰번호를 공개하지 않습니다.<br/>
서비스 결제전 상대방과 협의 후 연락처를 미리 공유하실것을 추천드립니다.
</div>
</form>
 <footer>
          <div class="foot">
            <hr/>
            <div class="foot-align">
            <div>
              <a href="./"><img src="<c:url value="/resources/images/logo.png" />"/></a>
            </div>
            <div>
      <p>상호 : 콕사부 <br/>
                대표자 : 정요직<br/> 
                개인정보보호담당자 :정요직<br/> 
                주소 : 서울특별시 동대문구 183-368<br/>
                TEL. 02-959-1176<br/> 
                  사업자 등록번호 : 654-19-01069 <br/>
		통신판매업 신고 : 2019-서울동대문-0997호<br/>
                  EMAIL. dywlr74@naver.com<br/>
                  Copyright(c) 콕사부. All Rights Reserved.<br/>
                </p>
            </div>
            <div class="foot-cate">
                <p>
                  <b>카테고리</b><br/>
                  <a href="./boarder?main=11&subject=11"> 수학</a><br/> 
	              <a href="./boarder?main=21&subject=21">외국어</a><br/>
                  <a href="./boarder?main=31&subject=31">국어</a><br/>
                  <a href="./boarder?main=41&subject=41">사회</a><br/>
                  <a href="./boarder?main=51&subject=51">과학</a><br/>
                  <a href="./boarder?main=61&subject=61">예체능</a><br/>
                  <a href="./boarder?main=71&subject=71">입시/자소서</a><br/>
                </p>
              </div>
            <div class="foot-company">
                <p>
                 <a href="./companyInfo"> 회사소개</a><br/>
                <a href="./customer" style="text-decoration:none; color:black;"> 자주하는 질문</a><br/>
                 <a href="./qna" style="text-decoration:none; color:black;">Q&A</a><br/> 
                </p>
              </div>
            
            <div>
         고객센터<br/>
                02-959-1176<br/>
                평일 10:00 ~ 16:00 <br/> 
                (점심 13:00 ~ 14:00)
              </p>
            </div>
          </div>
          </div>
        </footer>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>


$(function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy-mm-dd",
        showButtonPanel: true,
        
        showOn:"both",
        buttonImage: "<c:url value="/resources/images/calendar3.png" />",
        buttonImageOnly:true,
       	minDate:0,
        nextText: '다음 달',
        prevText: '이전 달' 
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
            dateFormat: "yy-mm-dd",
            showButtonPanel: true,
            
            showOn:"both",
            buttonImage: "<c:url value="/resources/images/calendar3.png" />",
            buttonImageOnly:true,
           	minDate:0,
            nextText: '다음 달',
            prevText: '이전 달' 
     });
        
        $( "#testDatepicker2" ).prop('readonly',true);
        
        $("img.ui-datepicker-trigger").prop("style", "margin-left:-28px;top:2px; vertical-align:middle; cursor: Pointer; height:20px;");    
    });

function CheckForm(memberInfo){ 
	 var form = memberInfo;
	 var tel = /^[0-9]{10,11}$/
	
	 
	if(!check(tel, form.buyerPhone, "휴대폰 번호는 하이픈(-)을 제외한 숫자만 적어주세요.")){
	    return false;
	}
	 
	if($('#testDatepicker').val().length==0){
		alert('수업 시작 날짜를 입력해주세요.');
		return false;
	}
	
	if($('#testDatepicker2').val().length==0){
		alert('수업 종료 날짜를 입력해주세요.');
		return false;
	}
	
	
	var ago  = $('#testDatepicker').val();
	var last = $("#testDatepicker2" ).val();
	age = ago.replace(',','');
	last = last.replace(',','');
	if(ago>last){
	   alert('수업 종료일은 수업시작일보다 뒤에 있어야 합니다.');
	   return false;
	}
	
	
	var idx = $("#bank option").index( $("#bank option:selected") );
	if(idx==0){
		alert('입금하실 은행을 선택해주세요.');
		return false;
	}

	var dep = $('#depositor').val().length;
	if(dep==0 || dep>30){
		alert("입금자명을 입력해주시기 바랍니다.")
		return false;
	}
	
	
	   
	
}

function check(re, what, message) {
if(re.test(what.value)) {
    return true;
}
alert(message);
what.value = "";
what.focus();
//return false;
}

</script>
</body>
</html>