<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
</head>
<style>

    h1{
        color: rgb(3, 195, 115);
    }

    #searchIdResult{
        width: 490px;
        height: 200px;
        background-color: rgb(240, 240, 240);
        border-radius: 20px;
        margin: auto;
    }

   #searchIdResult button{
        background-color: rgb(3, 195, 115);
        border: none;
        border-radius: 5px;
        width: 285px;
        height: 35px;
        margin-top: 100px;
        margin-left: 105px;
        color: white;
    }

   #searchIdResult button:hover{
        cursor: pointer;
    }

   


  
</style>
<body>

    <h1 align="center">아이디 찾기</h1>
    <div id="searchIdResult">
       <div>
       
       <c:choose>
       		<c:when test="${!empty memberId }">
       			회원님의 아이디는 ${memberId}입니다.
       		</c:when>
       		<c:otherwise>
       			조회된 결과가 없습니다.
       		</c:otherwise>
       </c:choose>
       </div>
        <div>
            <button onclick="location.href='loginForm.me'">로그인 화면으로 돌아가기</button>
        </div>

    </div>





    
    
</body>
</html>