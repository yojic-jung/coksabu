<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>수업 등록 성공 콕사부</title>
 <meta name="description" content="수업 등록확인 안내 페이지" />
</head>
<body>
<script>
alert('수업이 정상적으로 등록되셨습니다.');

if(getRequestParam().cok_tutorial=="first_lesson"){
	if(GetCookie("tutorial")!="end"){
		location.href="./tutorpage?cok_tutorial=first_certi";
	}else{
		location.href="./tutorpage";
	}
}else{
	location.href="./tutorpage";
}
	

function getRequestParam(){
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for(var i = 0, result = {}; i < qs.length; i++){
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
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