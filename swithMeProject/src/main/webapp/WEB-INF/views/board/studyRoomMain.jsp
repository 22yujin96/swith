<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸</title>
<style>
    div{border: 1px solid red;}
    .outer{width:100%;height:1200px;}
    .search{height:10%;}
    .content{height:90%;}
    .content>div{height:100%;float:left;}
    #sRoom-list{width:70%;}
    #sRoom-map{width:29%;}
    /*검색*/
    table {display: inline-block;}
    .search {text-align: center;}

    #sRoomBtnSearch:hover {
        transform: scale(1.1);
    }
        
    </style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
    
        <div class="outer">
            <div class="search">
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
            </div>
            <div class="content">
                <div id="sRoom-list">
                    리스트
                </div>
                <div id="sRoom-map">
                    지도
                </div>
            </div>
        </div>
    </div>
</body>
</html>