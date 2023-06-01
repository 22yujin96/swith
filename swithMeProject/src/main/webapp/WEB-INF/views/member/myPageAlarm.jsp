<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 알람</title>
</head>
<style>

    #alarm{
       
        border: 2px solid lightgray;
        border-radius: 10px;
        width: 600px;
        height: 50px;
       
    }
    #alarmTitle{
     color: rgb(3, 195, 115);
    }
    
    #alarmContent{
        width: 600px;
        height: 450px;
        border: 2px solid lightgray;
        border-radius: 10px;
       
     
    }
 
    #alarm > div{
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
	

    <div id="alarm">
        <div id="alarmTitle">
            알림
        </div>
          
    </div>
    
    
  <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>

    
</body>
</html>