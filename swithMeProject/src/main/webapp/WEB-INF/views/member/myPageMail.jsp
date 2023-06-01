<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 작성폼</title>
</head>
<style>

    #mail{
            
            border: 2px solid lightgray;
            border-radius: 10px;
            width: 600px;
            height: 50px;
       	
        
        }
    #mail > div{
        height:50px; 
        font-size: 25px; 
        font-weight: bold;
        margin-top: 7px;
        margin-left: 15px;
        color: rgb(3, 195, 115);
        
    }

    
    #Mailcontent{
            width: 600px;
            height: 550px;
            border: 2px solid lightgray;
            border-radius: 10px;
        }

    #mailForm{
        width: 700px;
        padding-left: 20px;
      
        
    }

    #mailForm input{
        margin-left: 30px;
    }

    #mailTitle, #mailReceiver{
        border-radius: 5px;
        border-color: lightgray;
        border-style: double;
        height: 23px;
        width: 200px;
       
    }
   #mailForm textarea{
        border-radius: 5px;
        border-color: lightgray;
        border-style: double;
       
    
    }

    #mailForm button{
        margin-left: 163px;
        border: none;
        height: 40px;
        width: 125px;
        border-radius: 5px;
        color: white;

    }


  
   

</style>
<body>

  	<jsp:include page="../common/header.jsp"/><br><br><br>
	<jsp:include page="myMenuBar.jsp"/>
  
    
    <div id="mail">
        <div>
            메일
        </div>
    </div>
          
    <br>

     
    <div id="Mailcontent">
        <br><br>
       <form action="mail.me" method="post">
            <table border="0" id="mailForm">
                <tr>
                    <th align="right" style="width:100px">받는사람 : </th>
                    <td><input type="eamil" name="mailReceiver" style="width:350px;"placeholder=" 받는 사람의 이메일을 작성해주세요." id="mailReceiver"></td>
                </tr><td><br></td>
                <tr>
                    <th align="right">제목 :</th>
                    <td><input type="text" name="mailTitle" style="width:350px;" id="mailTitle"></td>
                </tr><td><br></td>
                <tr>
                    <th align="right" >첨부파일 : </th>
                    <td><input type="file" nmae="mailFile"></td>
                </tr><td><br></td>
                <tr>
                    <th align="right">내용 : </th>
                    <td><textarea name="mailContent" id="mailContent" cols="47" rows="15" style="margin-left: 30px;"></textarea></td>
                </tr>


                <tr>
                    <td>개행문자 처리하기 !!!</td>
                </tr>
            
                <td colspan="2">
                    <button onclick="location.href='###'" style="background-color: rgb(210, 59, 59);">
                        취소
                    </button>
                    <button onclick="location.href='###'" style="background-color: rgb(3, 195, 115); margin-left: 50px;">
                        전송
                    </button>
                </td>
            


            </table>
       </form>
       
        <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>
     
</body>
</html>