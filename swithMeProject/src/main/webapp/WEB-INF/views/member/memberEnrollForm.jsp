<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>


<style>
#title{
 color: rgb(3, 195, 115);
 margin : 30px !important;
}

#con{
	width : 490px;
	margin : 0 auto;
	margin-top : 100px;
}
#joinMember{
    background-color: rgb(240, 240, 240);
    border-radius: 20px;
    width: 490px;
    height:655px;
}

.btn123{
   background-color: rgb(3, 195, 115);
   border: none;
   border-radius: 5px;
   margin: 3px;
   color: white;
   width:70px;
   font-size:14px;
   
   
  
}

.btn123:hover{
    cursor: pointer;
}

#joinMember  input{ 
    border-radius: 5px;
    border-color: lightgray; 
    border-style: double;
    height: 30px;
    font-size: 13px;
    
 
    
}

#idMessage{
	color:gray;
}
#pwdMessage{
	color:gray;
}

#joinMember input:focus{
    border-color:rgb(3, 195, 115);
    outline: none;
}

</style>
<body>

	<jsp:include page="../common/header.jsp"/>


	
    
<div id="con">
    <form action="join.mem" method="post">
    <h1 id="title" align="center">회원가입</h1>
        <div id="joinMember">
            <table  style="margin-left: 115px;">
                <br>

                <tr>
                    <th align="left">아이디</th>
                </tr>
                <tr>
                    <td><input id="writeId" onclick="writeId();" type="text" name="memberId" placeholder=" 아이디를 입력하세요" style="width:160px" required><button style="height: 27px;" onclick="idCheck" class="btn123">중복확인</button></td><br>
                 
               
                </tr>
                <tr>
                    <td style="font-size: 10px; display:none;" id="idMessage" >5 ~ 20자의 영문 소문자, 숫자 특수기호(_),(-)만 사용 가능합니다.</td>
                </tr><tr><td><br></td></tr>

                <tr>
                    <th align="left">비밀번호</th>
                </tr>
                <tr>
                    <td><input id="writePwd" type="password" name="memberPwd" placeholder=" 비밀번호를 입력하세요" style="width:225px" required></td>
                </tr>
                <tr>
                    <td style="font-size: 10px; display:none; " id="pwdMessage">8 ~ 16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">비밀번호 재확인</th>
                </tr>
                <tr>
                    <td><input type="password" nmae="memberPwdChk"  style="width:225px" required></td><br>
                    
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이름</th>
                </tr>
                <tr>
                    <td><input type="text" name="memberName"  style="width:225px" required></td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">닉네임</th>
                </tr>
                <tr>
                    <td><input type="text" name="nickName"  style="width:160px" required><button style="height: 27px;" class="btn123">중복확인</button></td>
                </tr>
                
                <tr><td><br></td></tr>
                <tr>
                    <th align="left">이메일</th>
                </tr>
                <tr>
                    <td><input  id="writeEmail" type="email" name="userEmail"  style="width:160px"><button style="height: 27px;" class="btn123" >메일확인</button></td>
                </tr>
                <tr>
                	 <td style="font-size: 10px; display:none; " id="emailMessage">@를 포함하여 입력하세요</td>
                </tr>
                
                <tr><td><br></td></tr>
              
                    <td><button style="width:233px; height: 35px; color: white;" required class="btn123">가입하기</button></td>
                </tr>  <tr><td><br></td></tr>
                <tr>

                    <!-- ***모두입력하면 버튼 활성화시키기  -->
                </tr>
            </table>
		</div>
    </form>
   </div>
    <script>
    
 		$(function() {
 			$('#writeId').click(function() {
 				$('#idMessage').show();
 			});
 		});
 		
 		$(function() {
 			$('#writePwd').click(function() {
 				$('#pwdMessage').show();
 			});
 		});
 		$(function() {
 			$('#writeEmail').click(function() {
 				$('#emailMessage').show();
 			});
 		});
    	
    	
    	
    </script>
   

    
    <br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>