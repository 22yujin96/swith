<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 상세</title>
<style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<div class="content">
        <div class="inner">
            <br>
            <a class="btn btn-secondary" style="float:left;" href="">목록으로</a>
            <a class="btn btn-secondary" style="float:right;" href="">수정하기</a> &nbsp;
            <a class="btn btn-secondary" style="float:right;" href="">삭제하기</a> &nbsp;
            
            <br>
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100" colspan="2">스터디룸명</th>
                </tr>
                <tr>
                    <td colspan="2">주소</td>
                </tr>
                <tr>
                    <td colspan="2">이미지</td>
                </tr>
                <tr>
                    <td colspan="2">상세설명</td>
                </tr>
            </table>
            <div id="middle-bar">
                <button>위치정보</button>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <button>이용후기</button>
            </div>
                <table class="table">
                    <tr>
                        <td colspan="2">
                            카페명
                            주소
                            웹사이트
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">이미지</td>
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
</body>
</html>