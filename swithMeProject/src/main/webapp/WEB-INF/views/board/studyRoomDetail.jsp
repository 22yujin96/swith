<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 상세</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- swiper.js 라이브러리추가 -->
   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

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
        .reviewStar input[type=radio]{display:none;}
        .reviewStar label:hover{color:red;}
        .reviewStar label.hover{color:red;}

        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<div class="wrap clear">
        <div class="inner">
            <br>
            <a class="btn btn-secondary" style="float:left;" href="">목록으로</a>
            <!-- 관리자만 볼 수 있게 -->
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
                    <td >
                        <div class="swiper">
                            <!-- Additional required wrapper -->
                            <div class="swiper-wrapper">
                                <!-- Slides -->
                                <div class="swiper-slide"><img src="https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg"></div>
                                <div class="swiper-slide"><img src="https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg"></div>
                                <div class="swiper-slide"><img src=></div>
                               
                            </div>
                        
                            <!-- If we need pagination -->
                            <div class="swiper-pagination"></div>
                        
                            <!-- If we need navigation buttons -->
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        
                            <!-- If we need scrollbar -->
                            <div class="swiper-scrollbar"></div>
                        </div>
                    </td>
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
                <table id="reviewArea" align="center">
                    <thead>
                    	<tr>
                    		<th colspan="4" class="reviewStar">
                    			<input type="radio" name="reviewStar" value="1" id="rate1">
                    			<label for="rate1">★</label>
                                <input type="radio" name="reviewStar" value="2" id="rate2">
                    			<label for="rate2">★</label>
                                <input type="radio" name="reviewStar" value="3" id="rate3">
                    			<label for="rate3">★</label>
                                <input type="radio" name="reviewStar" value="4" id="rate4">
                    			<label for="rate4">★</label>
                                <input type="radio" name="reviewStar" value="5" id="rate5">
                    			<label for="rate5">★</label>
                    		 </th>
                    	</tr>
                        
                        <tr>
                            <th colspan="2">
                                <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                            </th>
                            <th colspan="2" style="vertical-align:middle"><button class="btn btn-secondary" onclick="insertReview();">등록하기</button></th>
                        </tr>
                        <tr><th>&nbsp;&nbsp;</th></tr>
                        <tr>
                            <th colspan="4" style="font-size: larger;">이용후기(<span id="rcount"></span>)</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                    </tbody>
                </table>
        </div>
        
    </div>
    <br><br>
    <jsp:include page="../common/footer.jsp" />
    
    <script>
        $(function(){
            selectReviewList();
        });

        // 이용후기 조회
    	function selectReviewList(){
    		$.ajax({
    			url : 'selectStudyRoomReviewList.bo',
    			data : {
    				studyRoomNo : ${sRoomDetail.studyRoomNo}
    			},
    			success : function(result){
                    console.log(result);
    				var value='';
    				for(let i in result){
    					value += '<tr>' 
							+ '<th>' + result[i].memberId+ '</th>'
							+ '<td><b>' + result[i].reviewStar + '</b>/5';
                        for(let j=1; j <= result[i].reviewStar; j++){
                            value += '<label style="color:red;">★</label>';
                        }
                        for(let j=1; j <= 5-result[i].reviewStar; j++){
                            value += '<label style="color:lightgrey;">★</label>';
                        }        
                        value += '</td>'
                                + '<td>' + result[i].reviewDate + '</td>'
                                + '<td>'
                                + '<button class="updateBtn">수정</button>&nbsp;'
                                + '<input type="hidden" value="' +  result[i].reviewNo + '">'
                                + '<button class="deleteBtn">삭제</button>'
                                + '</td>'
                                + '</tr>' 
                                + '<tr>'
                                + '<td colspan="5" style="height:100px; vertical-align:top;">' + result[i].reviewContent + '</td>'
                                + '</tr>';
    				}
    				$('#reviewArea tbody').html(value);
    				$('#rcount').text(result.length);
    			},
    			error : function(){
    				console.log('실패');
    			}
    		});
    	}
    
        // 이용후기 등록
    	function insertReview(){
    		$.ajax({
    			url : 'insertstudyRoomReview.bo',
    			data : {
    				memberId : 'user02',
    				reviewContent : $('#content').val(),
    				reviewStar : $('input:radio[name=reviewStar]').filter(':checked').val(),
    				studyRoomNo : ${sRoomDetail.studyRoomNo}
    			},
    			success : function(result){
                    if(result === 1){
                        selectReviewList();
                        $('#content').val('');
                    }
    			},
    			error : function(){
    				console.log('실패');
    			}
    		});
    	}

        // 이용후기 수정
        // 리뷰 불러오기
        $('#reviewArea').on('click','.updateBtn',function(){
            console.log($(this).next().val());
        	$.ajax({
        		url : 'selectStudyRoomReview.bo',
        		data : {
    				reviewNo : $(this).next().val()
        		},
        		success : function(review){
        			console.log(review);
                    var value='';
    				for(let i in result){
    					value += '<tr>' 
							+ '<th>' + result[i].memberId+ '</th>'
							+ '<td><b>' + result[i].reviewStar + '</b>/5';
                        for(let j=1; j <= result[i].reviewStar; j++){
                            value += '<label style="color:red;">★</label>';
                        }
                        for(let j=1; j <= 5-result[i].reviewStar; j++){
                            value += '<label style="color:lightgrey;">★</label>';
                        }        
                        value += '</td>'
                                + '<td>' + result[i].reviewDate + '</td>'
                                + '<td>'
                                + '<button class="updateBtn">수정</button>&nbsp;'
                                + '<input type="hidden" value="' +  result[i].reviewNo + '">'
                                + '<button class="deleteBtn">삭제</button>'
                                + '</td>'
                                + '</tr>' 
                                + '<tr>'
                                + '<td colspan="5" style="height:100px; vertical-align:top;">' + result[i].reviewContent + '</td>'
                                + '</tr>';
    				}
        		},
        		error : function(){
        			console.log('실패');
        		}
        	})
        })

        // 리뷰 수정하기

        // 이용후기 삭제
         $('#reviewArea').on('click','.deleteBtn',function(){
            $.ajax({
                url : 'deleteReview.bo',
                data : {
                    reviewNo : $(this).prev().val()
                },
                success : function(result){
                    console.log(result);
                    location.reload();
                    
                },
                error : function(){
                    consoel.log('실패');
                }
            })

        })


        // 이용후기 별점 선택
        $('.reviewStar label').on('click', function(){
            var value=$('input:radio[name=reviewStar]').filter(':checked').val();
            $('.reviewStar label').removeClass("hover");
            for(var i=0; i<value; i++){
                $('.reviewStar label').eq(i).addClass("hover");
            }
        })

         // 슬라이더 동작 정의
      const swiper = new Swiper('.swiper', {
          autoplay : {
              delay : 3000 // 3초마다 이미지 변경
          },
          loop : true, //반복 재생 여부
          slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
          pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
              el: '.swiper-pagination',
              clickable: true
          },
          navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
              prevEl: '.swiper-button-prev',
              nextEl: '.swiper-button-next'
          }
      }); 
    
    </script>
    
    
    
    
    
</body>
</html>