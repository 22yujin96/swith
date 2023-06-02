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
    height:640px;
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
               
               <br>
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
                  <td style="font-size: 10px; " id="checkPwd"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">비밀번호 재확인</th>
                </tr>
                <tr>
                    <td><input id="writePwdCheck" type="password" nmae="memberPwdChk"  style="width:225px" required ></td><br>
                    
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이름</th>
                </tr>
                <tr>
                    <td><input id="writeName" type="text" name="memberName"  style="width:225px" required></td>
                </tr>
                 <tr>
                 <tr>
                  <td style="font-size: 10px; " id="checkName"> </td>
                </tr><td><br></td></tr>
                <tr>
                    <th align="left">닉네임</th>
                </tr>
                <tr>
                    <td><input id="writeNick" type="text" name="nickName"  style="width:160px" required><button style="height: 27px;" class="btn123">중복확인</button></td>
                </tr>
                
                <tr><td><br></td></tr>
                <tr>
                    <th align="left">이메일</th>
                </tr>
                <tr>
                    <td><input  id="writeEmail" type="email" name="userEmail"  style="width:160px"><button style="height: 27px;" class="btn123" >메일확인</button></td>
                </tr>
                <tr><td><br></td></tr>
                    <td><button style="width:233px; height: 35px; color: white;" required class="btn123" id="enrollBtn" >가입하기</button></td>
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
   //아이디 중복체크
    $(function() {

    	 let chkId = /^[a-zA-Z0-9\d-_^]{4,19}$/;
    	 
    	const idInput = $('#writeId');
    	
        idInput.keyup(function() {
        	
        	//console.log(idInput.val());
			//공백 
			if(idInput.val() === '') {
				
				
				$('#checkId').css('color','gray').html('아이디는 필수 입력사항입니다.');
				$('#enrollBtn').attr("disabled", true);
				$('#enrollBtn').css('background-color','gray');
			
			//정규표현식에 맞지 않을때
			}else if(!chkId.test(idInput.val())) {
				idInput.css('border-color','gray');
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
							$('#checkId').css('color','gray').html('중복된 아이디가 존재합니다.');
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
		  
    
    
    
    //비밀번호
    $(function() {
    	
    	let chkPwd = /^[a-zA-Z\d!@#$%^]{8,16}/;
    	
    	const pwdInput = $('#writePwd');
    	
    	pwdInput.keyup(function() {
    	
    		//console.log(pwdInput.val());
    		
    		if(pwdInput.val() === ''){
    			pwdInput.css('border-color','gray');
    			$('#checkPwd').css('color','gray').html('비밀번호는 필수 입력사항입니다.');
				$('#enrollBtn').attr("disabled", true);
				$('#enrollBtn').css('background-color','gray');
    		
    		}else if(!chkPwd.test(pwdInput.val())) {
    			
	    		pwdInput.css('border-color','gray');
				$('#checkPwd').css('color','gray').html('8~16자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				$('#enrollBtn').attr("disabled", true);
				$('#enrollBtn').css('background-color','gray');
    		
		    	} else {
		    		
		    		pwdInput.css('border-color','rgb(3, 195, 115)');	
		    		$('#enrollBtn').removeAttr("disabled", true);
					$('#enrollBtn').css('background-color','rgb(3, 195, 115)');
		    	}
		      });
		    });
    	
    	
    
    
    //비밀번호 재확인
    $(function() {
    	
    const pwdChkInput = $('#writePwdCheck');
    const pwdInput = $('#writePwd');
    
    pwdChkInput.keyup(function() {
    	
    	//console.log(pwdChkInput.val());
    	
    	if(pwdInput.val() === pwdChkInput.val()){
    		pwdChkInput.css('border-color','rgb(3, 195, 115)');	
    		$('#enrollBtn').removeAttr("disabled", true);
			$('#enrollBtn').css('background-color','rgb(3, 195, 115)');
    		
    	}else{
    		pwdChkInput.css('border-color','gray');	
    		$('#enrollBtn').attr("disabled", true);
			$('#enrollBtn').css('background-color','gray');
    	}
    });
   });
    
    	
    	
    
    //이름
    $(function() {
    	
    	let chkName = /^[가-힣]{2,7}$/;
    	
    	const nameInput = $('#writeName');
    	
    	nameInput.keyup(function() {
    		
    		console.log(nameInput.val());
    		
    		
    		if(!chkName.test(nameInput.val())){ //정규표현식에 맞지 않으면
    			$('#checkName').css('color','gray').html('이름은 필수 입력사항입니다.');
    			nameInput.css('border-color','gray');	
    			$('#enrollBtn').attr("disabled", true);
    			$('#enrollBtn').css('background-color','gray');
    			
    		}else{ //OK
    			nameInput.css('border-color','rgb(3, 195, 115)');	
    			$('#enrollBtn').removeAttr("disabled", true);
    			$('#enrollBtn').css('background-color','rgb(3, 195, 115)');
    		}
    	});
    });
    
    
    
    //닉네임
    $(function() {
    	
    	let chkNick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;  //2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 구성, 	*한글 초성 및 모음은 허가하지 않는다.
	
    	const nickInput = $('#writeNick');
    	
    	nickInput.keyup(function() {
    		
    		console.log(nickInput.val());
    		
    		닉네임 버튼 누르면 에이젝스로 디비갔다가 확인
    		+ 가입하기 버튼(활성화 / 비활성화)
    	});
    
    	
    	
    });
    
    
   
    
    	
    	

    </script>
   

    
  
</body>
</html>