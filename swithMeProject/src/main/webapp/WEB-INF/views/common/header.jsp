<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- alertify Framework -->
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="/cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	

    <script src="resources/summernote/summernote-lite.js"></script>
    <script src="resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/summernote/summernote-lite.css">
	
	<link rel="stylesheet" href="resources/css/common/header.css">
	
	
<title>Insert title here</title>
</head>
<body>

<header>
    <div class="wrap clear">
        <h1 id="logo"><a href="index.jsp">스터디윗미</a></h1>
        <ul id="mainMenu" class="clear">
            <li><a href="freeBoardListView.bo?boardType=1">커뮤니티</a></li>
            <li><a href="freeBoardListView.bo?boardType=2">질문정보</a></li>
            <li><a href="studyBandListView.bo">스터디밴드</a></li>
            <li><a href="studyRoomMainView.bo">스터디룸</a></li>
            <li><a href="#">아이템 상점</a></li>
        </ul>
        
        <ul id="userMenu">
            <li>
                <a href="alarm.me">
                    <img src="resources/images/common/notice.png">
                    <div id="noRead"></div>
                </a>
            </li>
            <li><a href="loginForm.me">로그인</a></li>
            <li><a href="memberEnrollForm.me">회원가입</a></li>
            
        </ul>
    </div>
</header>

<div class="headerblank"></div>
        
</body>
</html>