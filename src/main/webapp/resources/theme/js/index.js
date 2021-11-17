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
  gtag('config', 'G-4EM47WXQJ0');
  gtag('config', 'AW-413632618');

  
  
 $(document).ready(function(){
        var jbOffset = $( '.jbMenu' ).offset(); //상단메뉴 좌표 가져오는 코드
            $( window ).scroll( function() {        
              if ( $( document ).scrollTop() > jbOffset.top ) { //scrollTop() 요청한 스크롤바의 수직위치 반환
                $( '.jbMenu' ).addClass( 'jbFixed' );
              }
              else {
                $( '.jbMenu' ).removeClass( 'jbFixed' );
              }
            });

        
        
            $("#inner-fade").innerfade({
                animationtype:'fade',
                speed:750,
                timeout:8000,
                type:'sequence',
                containerheight:'600px'
            });

            $('.categoryTr>td').mouseenter(function(){
              $('.white').removeClass();
              $(this).addClass('white');
              
            })
        
            $('.categoryTr>td').mouseenter(function(){
              var tdIndex = $(this).index();
              $('.dispyes').removeClass('dispyes').addClass('dispno');
              $('.cont').eq(tdIndex).removeClass('dispno');
              $('.cont').eq(tdIndex).addClass('dispyes');
            })

            $('.categoryTr>td:first').trigger('mouseenter');

            $(".vertical-center-4").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
    
      $(".vertical").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
      $(".vertical2").slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll: 1
        });
      $(".regular").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll:1 
      });
      
      $(".regular2").slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll:1 
        });
      
      $(".center").slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1
      });
      
      $('.main-input').colorbox({
          inline:true,
          overlayOpacity:0.5,
          onOpen:function(){
          },
        });
      
      $('.frame1 div').hover(function(){
    	  $(this).css('background','rgb(211, 211, 211)');
      },function(){
    	  $(this).css('background','white');
      })
      
      
      
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
  	
      
       });
 
var currentUrlNaver = window.location.href;
var callbackUrlNaver = '';
if(currentUrlNaver.indexOf("www.coksabu.com") != -1){
	callbackUrlNaver = "https://www.coksabu.com/loginCallBackNaver";
}else{
	callbackUrlNaver = "https://coksabu.com/loginCallBackNaver";
}
 
 var naverLogin = new naver.LoginWithNaverId(
	  		{
	  			clientId: "0PgcZhDTwaod8UwQsoKX",
	  			callbackUrl: callbackUrlNaver,
	  			isPopup: false, /* 팝업을 통한 연동처리 여부 */
	  			loginButton: {color: "green", type: 3, height: 170} /* 로그인 버튼의 타입을 지정 */
	  		}
	  	);
	  	
	  	/* 설정정보를 초기화하고 연동을 준비 */
	  	naverLogin.init();
	  	
	  	$(document).on("click",".naver-customize",function(event){
	  	  naverLogin.init(); 
	  	  location.href = naverLogin.generateAuthorizeUrl();
		}); 

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
     	//쿠키가 없을 경우 오픈창을 띄우는 스크립트 
     	function startPromote(){
     			$('.cok-intro').show();
     			$('.cok-intro-back').show();
     	}
     	
     	function SetCookie(sName, sValue){
     		var date = new Date();
     		date.setTime(date.getTime() + (1*24*60*60*1000));
   			document.cookie = sName + "=" + escape(sValue)+";expires="+date.toGMTString();
     	}
       
       