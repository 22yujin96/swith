<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸</title>
<style>
    .content>div{height:100%;float:left;}
    #sRoom-list{width:70%;}
    #sRoom-map{width:30%;}
    /*검색*/
    table {display: inline-block;}
    .search {text-align: center;}

    #sRoomBtnSearch:hover {
        transform: scale(1.1);
    }
        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br>
        <div class="wrap clear">
            <div class="search">
                <br><br>
                <form action="sRoomSearch.bo">
				<table>
					<tr>
						<td><select name="searchSelect" id="sRoomSearchSelect">
							<option value="0">지역</option>
						</select></td>
						<td><input id="sRoomSearchInput" type="text" placeholder="검색어 입력" name="searchText" maxlength="200">&nbsp;
							<button type="submit" id="sRoomBtnSearch">검색</button></td>
					</tr>
				</table>
			</form>
            <br><br>
            </div>
            <div class="content">
                <div id="sRoom-list">
                	<c:choose>
                		<c:when test="${ empty sRoomList }">
                			조회 결과가 없습니다.
                		</c:when>
                		<c:otherwise>
                			<c:forEach items="${sRoomList}" var="sRoom">
			                    <table border="1">
			                        <tbody>
			                            <tr>
			                                <th rowspan="4" style="width:300px;height:300px;">이미지</th>
			                                <td style="width: 500px;">${sRoom.studyRoomName}</td>
			                            </tr>
			                            <tr>
			                                <td>${sRoom.studyRoomAddress}</td>
			                            </tr>
			                            <tr>
			                                <td>${sRoom.studyRoomPhone}</td>
			                            </tr>
			                            <tr>
			                                <td><button>지도보기</button></td>
			                            </tr>
			                        </tbody>
			                    </table>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </div>
                <div id="sRoom-map">
                    지도
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />
</body>
</html>