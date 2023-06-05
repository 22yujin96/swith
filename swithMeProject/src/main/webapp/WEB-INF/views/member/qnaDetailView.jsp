<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/qnaDetailView.css">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
        <!-- 컨텐츠 영역 -->
		<div class="content"> 
			<div class="topBlock">문의글</div>

			<div class="block"> 
				<!-- 답변여부 카테고리 -->
				<button class="post_Btn" disabled>미완료</button>
				
				<!-- 글쓴 정보 : 제목, 날짜, 작성자 -->
				<div class="writerInfo clear">
					<img src="" alt="" id="character">
					<div class="clear">
						<h6 class="title">제목</h6>
						<div class="clear">
							<p class="writerId">아이디</p>
							<p class="writerDate">234829480293</p>
						</div>
					</div>
				</div>

				<!-- 컨텐츠 내용 -->
				<div id="content_text">
					<p>이ㅏㅓㄴ리ㅏㄴ어리ㅏㅇ너ㅣㅏㄹㄴㅇ</p>
				</div>

				<div class="replyArea">
					<textarea name="" id="replyContent" placeholder="관리자만 작성 가능합니다." readonly disabled></textarea>
					<!-- <button id="replyBtn" onclick="insertReply();" disabled>등록</button> -->
					<div class="blank"></div>

					<div class="replyWrap">
						<!-- 댓글 컨텐츠 영역 -->
					</div>
				</div>

				<div id="myQnaBtn">
					<button class="deleteBtn_yj">문의글삭제</button>
					<button class="qnaBack" onclick="location.href='qna.me'">목록으로</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>