# coksabu
> **위 프로젝트는 콕사부 서비스의 웹서비스를 구현한 프로젝트입니다.  
> 콕사부는 선생님과 학생의 과외를 연결하는 중개플랫폼입니다.**  

<br/>

## 개발기간
> 개발 : 20.06 ~ 22.12  
> 운영 : 20.12 ~ 21.07  

<br/>

## Environments
<img src="https://img.shields.io/badge/amazonec2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white"><img src="https://img.shields.io/badge/amazonrds-527FFF?style=for-the-badge&logo=amazonrds&logoColor=white"><img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=white">  

<img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white"><img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"><img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white"><img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"><img src="https://img.shields.io/badge/springsecurity-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white"><img src="https://img.shields.io/badge/mybaits-59666C?style=for-the-badge&logo=mybaits &logoColor=white">  

<img src="https://img.shields.io/badge/mariadb-1F305F?style=for-the-badge&logo=mariadb&logoColor=white">

<br/>

## 주요기능
#### * 로그인
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/0b8567a0-edb0-432d-a260-d98527796aa3" width="180" >  

※로그인 권한 관리는 스프링 시큐리티를 통해 세션과 쿠키 방식으로 사용되며 sns(naver, apple)로그인 방식은 토큰을 받아 인증한 이후 세션과 쿠키를 생성함  
[시큐리티 설정]:(https://github.com/yojic-jung/coksabu/blob/master/src/main/resources/spring-security.xml)  
[애플로 로그인 콜백](https://github.com/yojic-jung/coksabu/blob/master/src/main/java/com/coksabu/yojic/lesson/member/controller/MemberController.java#L1211) : 애플로 받은 사용자 json토큰 정보를 전자서명 과정을 거쳐 프로젝트에서 제공하는 세션 쿠키방식으로 커스터마이징 하여 로그인 처리하는 함수  

#### * 수업요청
①  홈에서 하단 메뉴바 [수업요청] 클릭   ->  ② 각 단계에 선택조건 맞게 클릭   ->   ③ 요청완료 확인  
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/e25c72a9-87a1-453e-b554-559c5f29e47f" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/820a817d-05e8-4508-a42a-75d2775e4886" width="200" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/fa740c61-88d5-4f4a-9f83-1a73c31f04a4" width="180" >  
  
* [관련 기능 mvc패턴 패키지](https://github.com/yojic-jung/coksabu/tree/master/src/main/java/com/coksabu/yojic/lesson/apply)  
<br/><br/>
#### * 수업목록 및 채팅
①  홈에서 하단 메뉴바 [카테고리] 클릭   ->  ② 원하는 과목 및 수업 클릭   ->   ③ 채팅상담  
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/0eb593bd-3073-4091-9a4d-e75b0788d06c" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/45252387/118808b0-9b11-487d-9635-6e032ccb70d7" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/41fdd99f-1dae-4221-a076-9299c93faebf" width="180" >  
  
* [소켓 통신 config](https://github.com/yojic-jung/coksabu/blob/master/src/main/java/com/coksabu/yojic/lesson/chat/socketconfig/WebSocketConfig.java) : 소켓 설정 및 xss필터링 설정
* [채팅 컨트롤러](https://github.com/yojic-jung/coksabu/blob/master/src/main/java/com/coksabu/yojic/lesson/chat/socketconfig/GreetingController.java)  
<br/><br/>
#### * 거래제안서 작성
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/c818ca01-44c7-4917-9468-fed05df1d32d" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/bf33a422-30f2-4410-aa06-ecebbc172cbd" width="180" >  
<br/><br/>
#### * 프로필 및 수업만들기
①  홈에서 하단 메뉴바 [마이페이지] 클릭   ->  ② 프로필 수정하기   ->   ③ 수업 만들기  
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/90eb5230-c061-4950-8af4-935ac0f8bd20" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/8a151dd1-fffc-415e-b5fd-72b9e811c428" width="180" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://github.com/yojic-jung/coksabu/assets/45252387/f7cd4e85-158f-4b22-93d5-e84a410cf288" width="200" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
  
* [관련 기능 mvc패턴 패키지](https://github.com/yojic-jung/coksabu/tree/master/src/main/java/com/coksabu/yojic/lesson/member)  
<br/><br/><br/>

## 라이브러리
* spring-security-web
* mybatis
* javax.mail
* spring-websocket
* iamport-rest-client-java
* retrofit
* javax.mail
* spring-mobile-device
* lucy-xss
* jsonwebtoken  
<br/><br/>

## API
* 네이버아이디로 로그인
* 애플로 로그인
* 카카오알림톡
* 휴대폰 본인인증
* sms본인인증  
<br/><br/>

## 설정파일
* [pom.xml](https://github.com/yojic-jung/coksabu/blob/master/pom.xml)
* [web.xml](https://github.com/yojic-jung/coksabu/blob/master/src/main/webapp/WEB-INF/web.xml)
* [applicationContext.xml](https://github.com/yojic-jung/coksabu/blob/master/src/main/resources/applicationContext.xml)
* [spring-security.xml](https://github.com/yojic-jung/coksabu/blob/master/src/main/resources/spring-security.xml)
* [lucy-xss-servlet-filter-rule.xml](https://github.com/yojic-jung/coksabu/blob/master/src/main/resources/lucy-xss-servlet-filter-rule.xml)
* [lesson.xml](https://github.com/yojic-jung/coksabu/blob/master/src/main/webapp/WEB-INF/lesson.xml)


<br/><br/>

## 패키지 구조
```bash
├─src
│  └─main
│      ├─java
│      │  ├─com
│      │  │  └─coksabu
│      │  │      └─yojic
│      │  │          ├─DeviceSwitcher
│      │  │          ├─exception
│      │  │          ├─iamport              
│      │  │          ├─jsonxssfilter
│      │  │          ├─lesson
│      │  │          │  ├─admin                  //관리자 패키지
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  └─service
│      │  │          │  ├─apply                  //수업요청 관련 패키지
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  └─service
│      │  │          │  ├─board                 //수업게시물 관련 패키지
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  └─service
│      │  │          │  ├─chat                 //채팅 관련 패키지
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  ├─service
│      │  │          │  │  └─socketconfig
│      │  │          │  ├─contents
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  └─service
│      │  │          │  ├─cron
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─job
│      │  │          │  │  └─service
│      │  │          │  ├─deal                 //수업거래 패키지
│      │  │          │  │  ├─controller
│      │  │          │  │  ├─dao
│      │  │          │  │  ├─model
│      │  │          │  │  └─service
│      │  │          │  ├─fcm                  //파이어베이스 유틸 패키지
│      │  │          │  │  └─util
│      │  │          │  └─member                 //회원 관련 패키지
│      │  │          │      ├─controller
│      │  │          │      ├─dao
│      │  │          │      ├─model
│      │  │          │      └─service
│      │  │          └─loginhandler
│      │  ├─http
│      │  │  └─communication
│      │  ├─mybatis                        //mybatis dao파일
│      │  ├─purplebook
│      │  │  ├─model
│      │  │  │  ├─request
│      │  │  │  └─response
│      │  │  ├─solapi
│      │  │  │  └─app
│      │  │  └─utilities
│      │  └─social
│      │      └─login
│      │          └─apple
│      │              └─model
│      ├─resources
│      │  └─theme
│      └─webapp
│          ├─resources
│          │  └─theme
│          └─WEB-INF
│              ├─logback          //로그파일
│              │  ├─apply
│              │  ├─board
│              │  ├─chat
│              │  ├─cron
│              │  ├─deal
│              │  └─member
│              └─view            //뷰(jsp파일)
│                  ├─admin
│                  ├─apply
│                  ├─boarder
│                  ├─chat
│                  ├─contents
│                  ├─deal
│                  ├─include
│                  │  └─boarder
│                  ├─main
│                  └─member
└─target
```
