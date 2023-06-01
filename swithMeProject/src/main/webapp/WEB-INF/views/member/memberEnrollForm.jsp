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
    height:635px;
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
 #joinMember input:focus{
  	  border-color:gray;
  	  outline: none;
  	  
}

#idMessage{
	color:gray;
}
#pwdMessage{
	color:gray;
}



</style>
<body>

	<jsp:include page="../common/header.jsp"/>


	
    
<div id="con">
    <form action="join.mem" method="post">
    <h1 id="title" align="center">회원가입</h1><br>
        <div id="joinMember">
            <table  style="margin-left: 115px;">
               

                <tr>
                    <th align="left">아이디</th>
                </tr>
                <tr>
                    <td><input id="writeId"  type="text" name="memberId" placeholder=" 아이디를 입력하세요" style="width:225px" required><br>
                 
               
                </tr>
                <tr>
                   <td style="font-size: 10px; " id="checkId"> </td>
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
  
                
                <tr><td><br></td></tr>
              
                    <td><button style="width:233px; height: 35px; color: white;" required class="btn123" id="enrollBtn"  >가입하기</button></td>
                </tr>  <tr><td><br></td></tr>
                <tr>

                    <!-- ***모두입력하면 버튼 활성화시키기  -->
                </tr>
            </table>
		</div>
    </form>
   </div>
   
   <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>
 					
 					
    <script>
    //input클릭하면 조건메시지 뜨도록
 	
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
    <script>
    	
    // 정규표현식에 맞으면 초록색 테두리
    // 정규표현식에 맞지 않으면 빨간색 테두리
      
   
    $(function() {

    	 let chkId = /^[a-zA-Z0-9\d-_^]{4,19}$/;
    	 
    	const idInput = $('#writeId');
    	
        idInput.keyup(function() {
        	
        	console.log(idInput.val());

			if(idInput.val() === '') {
				idInput.css('border-color','red');
				$('#checkId').css('color','gray').html('아이디는 필수 입력사항입니다.');
				$('#enrollBtn').attr("disabled", true);
				$('#enrollBtn').css('background-color','gray');
			
				
				
			}else if(!chkId.test(idInput.val())) {
				
				idInput.css('border-color','red');
				$('#checkId').css('color','gray').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				$('#enrollBtn').attr("disabled", true);
				$('#enrollBtn').css('background-color','gray');
				
			}else {
				
				
				//아이디 중복체크
				$.ajax({
					
					url : 'idCheck.me',
					data : {checkId : idInput.val()},
					success : function(result) {
						
						console.log(result);
						
						if(result === "N"){
							
							$('#checkId').css('color','red').html('중복된 아이디가 존재합니다.');
							$('#enrollBtn').attr("disabled", true);
							$('#enrollBtn').css('background-color','gray');
							
						}else{
							
							idInput.css('border-color','rgb(3, 195, 115)');
							$('#checkId').css('color','rgb(3, 195, 115)').html('사용가능한 아이디입니다.');
							$('#enrollBtn').removeAttr("disabled", true);
							$('#enrollBtn').css('background-color','rgb(3, 195, 115)');
						}
						
					},
					error : function(){
						console.log('아이디 중복');
					}
					
					
				
				
				
				});
				
				
				
				
				
				
			}


        });






    });
       
			
            	
              
           
       

                      
        
    
    </script>
   

    
  
</body>
</html>