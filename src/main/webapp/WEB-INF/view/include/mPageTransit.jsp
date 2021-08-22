<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!-- 메인페이지 데코레이터 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<div class="m-page-transit" style="text-align: center; width: 100%; position: fixed; left: 0px; top: 0px; background: white; height: 100%; z-index: 10;">
		<img src="/resources/img/Spin-1s-124px.svg" style="margin-top: 50%;" />
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
	var linkLocation = "";
	$(document).on("click","a",function(event) {
						//datepicker에서는 효과 미적용
						if ($(this).hasClass("ui-corner-all")) {
							return;
						}
						var broswerInfo = navigator.userAgent;
						//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
						if (broswerInfo.indexOf("APP_WISHROOM_IOS") > -1|| broswerInfo.indexOf("APP_WISHROOM_Android") > -1) {
							event.preventDefault();
							linkLocation = this.href;
							if ($(this).attr("href") != "#") {
								$('.m-page-transit').fadeIn(100);
								setTimeout(function() {redirectPage() }, 100);
							}
						}
					});
	
	$(window).bind("pageshow", function(event) {
		var broswerInfo = navigator.userAgent;
		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
			$('.m-page-transit').fadeOut(200);
		}else{
			$('.m-page-transit').hide();
		}
	    
	});

	  function redirectPage() {
          window.location = linkLocation;
  	  }
	  
	  
	$(document).on("click", '.m-back', function() {
				var broswerInfo = navigator.userAgent;
				//ios 웹뷰, 안드로이드 웹뷰일때만 효과적용
				if (broswerInfo.indexOf("APP_WISHROOM_IOS") > -1 || broswerInfo.indexOf("APP_WISHROOM_Android") > -1) {
					var referpage = document.referrer;
					$('.m-page-transit').fadeIn(100);
					var currenturl = window.location.href;
					if (referpage == '') {
						//아이프레임 존재하는 페이지는 뒤로가기시 애니메이션 효과 없애기
						if (currenturl.indexOf("usersetting") != -1 || currenturl.indexOf("profile") != -1 || currenturl.indexOf("signup") != -1) {
							setTimeout(function() { 
								$('.m-page-transit').hide();
								location.href = './';
							}, 100);
						} else {
							setTimeout(function() {
								location.href = './';
							}, 100);
						}
					} else {
						//아이프레임 존재하는 페이지는 뒤로가기시 애니메이션 효과 없애기
						if (currenturl.indexOf("usersetting") != -1 || currenturl.indexOf("profile") != -1 || currenturl.indexOf("signup") != -1) {
							setTimeout(function() {
								$('.m-page-transit').hide();
								history.back();
							}, 100);
						} else {
							setTimeout(function() {
								history.back();
							}, 100);
						}
					}
					//웹뷰 아닌 그냥 모바일
				} else {
					var referpage = document.referrer;
					if (referpage == '') {
						location.href = './';
					} else {
						history.back();
					}
				}
			});

</script>
</body>
</html>