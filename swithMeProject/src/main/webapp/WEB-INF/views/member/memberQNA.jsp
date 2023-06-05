<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/memberQNA.css">
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
            <!-- 게시글 -->
			<div class="topBlock">문의글</div>

            <div class="block">
                <!-- 상단버튼 -->
                <div class="post_Btn">
                    <div id="qna_left">
                        <button class="qna_all">전체</button>
                        <button class="answer">답변완료</button>
                        <button class="unAnswer">미답변</button>
                    </div>

                    <div id="qna_right">
                        <button class="qnaCreate" onclick="location.href='qnaEnroll.me'">문의글작성</button>
                        <button class="deleteBtn_yj">선택삭제</button>
                    </div>
                </div>

                <!-- 목록 -->
                <div class="postList">
                
                	<!--  리스트 표시 -->
                	<c:if test="${ not empty list }" >
                		<c:forEach items="${ list }" var="q">
	                		<div class="post_block">
		                        <div class="post_top">
		                            <input type="checkbox">
		                            <div class="post_cate">${ q.qnaStatus }</div>
		                            <p class="post_title">${ q.qnaTitle }</p>
		                        </div>
		                        <p class="post_con">${ q.qnaContent }</p>
		                        <span class="post_date">${ q.qnaDate }</span>
		                    </div>
                		</c:forEach>
                	</c:if>
                	
                </div>
                
                <!-- 페이징버튼 -->
                <div class="paBtn">
                	<c:choose>
                      <c:when test="${ pi.currentPage eq 1 }">
                          <button disabled>전</button>
                       </c:when>
                       <c:otherwise>
                           <button onclick="location.href='qna.me?cPage=${ pi.currentPage -1 }'">전</button>
                       </c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                       <button onclick="location.href='qna.me?cPage=${ p }'">${ p }</button>
                    </c:forEach>
                    
                    <c:choose>
                      <c:when test="${ pi.currentPage eq pi.maxPage }">
                          <button disabled>후</button>
                       </c:when>
                       <c:otherwise>
                          <button onclick="location.href='qna.me?cPage=${ pi.currentPage + 1 }'">후</button>
                       </c:otherwise>
                    </c:choose>
                
				</div>

            </div>
			
		</div>
	</div>
</body>
</html>