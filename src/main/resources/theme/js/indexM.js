!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '2787801881458923');
fbq('track', 'PageView');

 window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-413632618');

  function GetCookie(sName){
 		/*저장되어있는 쿠키 정보 불러오기
 		오픈 페이지에서 부여하는 쿠키의 이름 및 값을 aCookie라는 변수에 저장.
 		여기서는 test_cookie=1이란 값이 저장 */
 		var aCookie = document.cookie.split("; ");
 		
 		for(var i=0; i<aCookie.length; i++){
 			var aCrumb = aCookie[i].split("=");
 			if(sName == aCrumb[0]){
 				return unescape(aCrumb[1]);
 			}
 		}
 		return null;
 	}

 	function startPromote(){
 		var broswerInfo = navigator.userAgent;
    	if( !(broswerInfo.indexOf("APP_WISHROOM_IOS") > -1) && !(broswerInfo.indexOf("APP_WISHROOM_Android") > -1) ){
    		$('.cok-intro').show();
 			$('.cok-intro-back').show();
    	}
 		
 			
 	}
 	
 	function SetCookie(sName, sValue){
 		var date = new Date();
       date.setTime(date.getTime() + (1*24*60*60*1000));
		document.cookie = sName + "=" + escape(sValue)+";expires="+date.toGMTString();
	}
 	
 	
 	
 	
    
    $(document).on("click","a",function(event){
    	var broswerInfo = navigator.userAgent;
    	if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    		event.preventDefault();
            linkLocation = this.href;
            $('.m-page-transit').fadeIn(100);
            setTimeout(function(){redirectPage()}, 100);
    	}
    });
    
    
    $(document).ready(function(){
                $('.fadeImg').css('width',$(document).width());
                
                $("#inner-fade").innerfade({
                    animationtype:'fade',
                    speed:750,
                    timeout:8000,
                    type:'sequence',
                    containerheight:'400px'
                });
            
                $(".intro-close1").click(function() { 
            		$('.cok-intro').remove();
            		$('.cok-intro-back').remove();
            		SetCookie('promoteCookie','1');
        		});
            
            	$(".intro-close2").click(function() { 
            		$('.cok-intro').remove();
            		$('.cok-intro-back').remove();
        		});
            	
            	
            	
            	$(".teach-intro").click(function() { 
            		$('.intro-text').hide();
            		$('.teach-text1').show();
        		});
            	
            	$(".teach-next1").click(function() { 
            		$('.teach-text1').hide();
            		$('.teach-text2').show();
        		});
            	
            	$(".teach-next2").click(function() { 
            		$('.teach-text2').hide();
            		$('.teach-text3').show();
        		});
            	
            	$(".teach-next3").click(function() { 
            		$('.teach-text3').hide();
            		$('.teach-text4').show();
            	});
              	
              	$(".teach-end").click(function() { 
              		$('.cok-intro').remove();
              		$('.cok-intro-back').remove();
            	});
            	
            	
            	$(".student-intro").click(function() { 
            		$('.intro-text').hide();
            		$('.student-text1').show();
        		});
            	
            	$(".student-next1").click(function() { 
            		$('.student-text1').hide();
            		$('.student-text2').show();
        		});
            	
            	$(".student-next2").click(function() { 
            		$('.student-text2').hide();
            		$('.student-text3').show();
        		});
            	
            	$(".student-end").click(function() { 
            		$('.cok-intro').remove();
            		$('.cok-intro-back').remove();
        		});
            	
            	
            	$(".m-btn").click(function() { 
            		$("#m-menu").animate({
            			left:"0px"
            		},100, function(){
            		});

            		$("#m-menu2").animate({
            			left:"70%"
            		},100, function(){
            		});
            	});

            	$(".m-close").click(function() { 
            		$("#m-menu").animate({
            			left:"-71%"
            		},100, function(){

            		});

            		$("#m-menu2").animate({
            			left:"-70%"
            		},100, function(){
            		});
            	});

            	$("#m-menu2").click(function() { 
            		$("#m-menu").animate({
            			left:"-71%"
            		},100, function(){

            		});

            		$("#m-menu2").animate({
            			left:"-70%"
            		},100, function(){
            		});
            	});
            
    	});
    

    	
    	$(window).bind("pageshow", function(event) {
    		var broswerInfo = navigator.userAgent;
    		if(broswerInfo.indexOf("APP_WISHROOM_IOS")>-1 || broswerInfo.indexOf("APP_WISHROOM_Android")>-1){
    			$('.m-page-transit').fadeOut(200);
    		}else{
    			$('.m-page-transit').hide();
    		}
    	    
    	});
    	
    	  var naverLogin = new naver.LoginWithNaverId(
      	  		{
      	  			clientId: "0PgcZhDTwaod8UwQsoKX",
      	  			callbackUrl: "https://coksabu.com/loginCallBackNaver",
      	  			isPopup: false, /* 팝업을 통한 연동처리 여부 */
      	  			loginButton: {color: "green", type: 3, height: 170} /* 로그인 버튼의 타입을 지정 */
      	  		}
      	  	);
      	  	
      	  	naverLogin.init();
      	  	
      	  	$(document).on("click",".naver-customize",function(event){
      	  	  naverLogin.init(); 
      	  	  location.href = naverLogin.generateAuthorizeUrl();
      		});



      	  function redirectPage() {
              window.location = linkLocation;
      	  }