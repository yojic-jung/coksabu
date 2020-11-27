<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><decorator:title /></title>
<decorator:head />
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script src="https://spin.js.org/spin.js"></script>
<script src="resources/colorbox-master/colorbox-master/jquery.colorbox.js"></script>
<script>
$(window).on("beforeunload",function(){
	var broswerInfo = navigator.userAgent;
	
	if(broswerInfo.indexOf("APP_WISHRROM_Android")>-1){
			$(".progressbar").show();
			$(".progressbar").css({"background":"orange"});
			var i=0;
			var progressbar = setInterval(function(){
				i+=24;
				$(".progressbar").css({"width":i+"%"});
				
				if(i==96){
					clearInterval(progressbar);
				}
			},100);
		}
});
</script>
<div class="progressbar" style="position: fixed;left: 0;top:5px;border:none;height:7px;z-index:15;"></div>
<decorator:body />
        <script>
        	$('.progressbar').hide();
        </script>
</body>
</html>