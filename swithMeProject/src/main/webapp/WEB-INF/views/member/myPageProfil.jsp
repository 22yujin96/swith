<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 프로필</title>
</head>
<style>
    #profile{
        color: rgb(3, 195, 115);
        border: 2px solid lightgray;
        border-radius: 10px;
        width: 600px;
        height: 50px;
       
    }
    #profilTitle{
    	color: rgb(3, 195, 115);
    }
    
    #Profilcontent{
        width: 600px;
        height: 450px;
        border: 2px solid lightgray;
        border-radius: 10px;
       
     
    }
    #Profilcontent  button{
        border: none;
        height: 40px;
        width: 125px;
        border-radius: 5px;
        color: white;
        margin-top: 270px;
        margin-left: 155px;
                
    }
    
    #profile > div{
        height:50px; 
        font-size: 25px; 
        font-weight: bold;
        margin-top: 7px;
        margin-left: 15px;
        
    }
</style>

<body>

	<jsp:include page="../common/header.jsp"/><br><br><br>
	<jsp:include page="myMenuBar.jsp"/>

    <div id="profile">
        <div id="profilTitle" >
            프로필
        </div>
          
    </div>
    <br>
    
    <div id="Profilcontent">
        <div>
            프로필 사진
        </div>
        <div>
            닉네임
        </div>
        <div>
            아이디
        </div>
        <div>
            이메일
        </div>

        <button style="background-color:rgb(210, 59, 59);">
            회원탈퇴
        </button>


        <button  onclick="location.href='###'" style="background-color: rgb(3, 195, 115); margin-left: 50px;">
            정보수정
        </button>
   
    </div>
    
    <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>

    
</body>
</html>