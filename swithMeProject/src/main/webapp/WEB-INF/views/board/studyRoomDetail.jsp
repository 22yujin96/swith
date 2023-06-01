<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 상세</title>
<style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style> 
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        
        table * {margin:5px;}
        table {width:100%;}
        #middle-bar{text-align:center;}
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<div class="wrap clear">
        <div class="inner">
            <br>
            <a class="btn btn-secondary" style="float:left;" href="">목록으로</a>
            <a class="btn btn-secondary" style="float:right;" href="">수정하기</a> 
            <a class="btn btn-secondary" style="float:right;" href="">삭제하기</a> 
            
            <br>
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100" >${sRoomDetail.studyRoomName}</th>
                </tr>
                <tr>
                    <td >${sRoomDetail.studyRoomAddress}</td>
                </tr>
                <tr>
                    <td >이미지</td>
                </tr>
                <tr>
                    <td >${sRoomDetail.studyRoomIntroduce}</td>
                </tr>
            </table>
            <div id="middle-bar">
                <button>위치정보</button>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <button>이용후기</button>
            </div>
                <table class="table">
                    <tr>
                        <td>
                            ${sRoomDetail.studyRoomName} <br>
                            ${sRoomDetail.studyRoomAddress} <br>
                           ${sRoomDetail.studyRoomWebsite}
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <div id="map" style="width:100%;height:450px;"></div>

						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8188ba557a9044b5d922513c971fc6ac"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = { 
						        center: new kakao.maps.LatLng(${sRoomDetail.studyRoomLat}, ${sRoomDetail.studyRoomLng}), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(${sRoomDetail.studyRoomLat}, ${sRoomDetail.studyRoomLng}); 
						
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
						// marker.setMap(null);    
						</script>
						                        
                        </td>
                    </tr>
                </table>
                <table id="replyArea" class="table" align="center">
                    <thead>
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                            </th>
                            <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
                        </tr>
                        <tr>
                            <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>user02</th>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>2023-05-05</td>
                        </tr>
                        <tr>
                            <th>user01</th>
                            <td>재밌</td>
                            <td>2023-05-05</td>
                        </tr>
                        <tr>
                            <th>admin</th>
                            <td>댓글</td>
                            <td>2023-05-05</td>
                        </tr>
                    </tbody>
                </table>
        </div>
        
    </div>
    <br><br>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>