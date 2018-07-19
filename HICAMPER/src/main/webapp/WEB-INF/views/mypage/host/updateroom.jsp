<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 상품 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/resources/css/footer.css" rel="stylesheet">
    <link href="/resources/css/glnav.css" rel="stylesheet">
    <style>
        #wrapper {
        	margin-top: 50px;
        }
           
        .nav:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        
       .nav:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        
        .ul-menu {
        	background-color: rgba(242,	 242, 242, 0.5);
        }
                
        .tab-content div {
            text-align: center;
            height:500px;
            margin-top: 50px;
        }
        
        .controller {
            text-align: center;
        }    

        #thumbnail {
            width: 500px;
            height: 400px;
        }

        .btn-nav {
            width: 30%;
        }
        
        .tab-content input[type="text"] {
            width: 30%;
            margin: 0 auto;
        }
        
        .tab-content input[type="number"] {
            width: 30%;
            margin: 0 auto;
        }
        
        .tab-content select {
            width: 30%;
            margin: 0 auto;
        }

        .form-control {
            font-size: 16px;
        }
    </style>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
    <div class="container-fluid" id="wrapper">        
        <ul class="nav nav-pills nav-justified ul-menu">
            <li class="active">
                <a href="#menu1" data-toggle="pill">상품 이름</a>
            </li>
            <li>
                <a href="#menu2" data-toggle="pill">캠핑 유형</a>
            </li>
            <li>
                <a href="#menu3" data-toggle="pill">수용인원</a>
            </li>
            <li>
                <a href="#menu4" data-toggle="pill">가격</a>
            </li>
            <li>
                <a href="#menu5" data-toggle="pill">객실 수량</a>
            </li>
            <li>
                <a href="#menu6" data-toggle="pill">상세설명</a>
            </li>
            <li>
                <a href="#menu7" data-toggle="pill">사진 등록</a>
            </li>
        </ul>
    </div>
    
    <div class="container">
        <form action="/host/roommodify" method="post" enctype="multipart/form-data">
        	<c:forEach var="room" items="${room}"> 
        	<input type="hidden" name="room_no" value="${room.room_no}">
	            <div class="tab-content">                        
                    <div id="menu1" class="tab-pane fade in active">
                        <h3>상품명</h3>
                        <input type="text" name="room_name" placeholder="방 이름" class="form-control" value="${room.room_name}">
                    </div>
	            
                    <div id="menu2" class="tab-pane fade">
                        <h3>캠핑 유형</h3>	
                     	<div class="form-group">
			                <select name="room_group" class="form-control">
			                    <option value="오토캠핑" id="auto-camping">오토캠핑</option>
			                    <option value="백팩킹" id="backpacking">백팩킹</option>
			                    <option value="글램핑" id="glamping">글램핑</option>
			                    <option value="카라반" id="caravan">카라반</option>
			                </select>                
	                	</div>
	                </div>
	                
                    <div id="menu3" class="tab-pane fade">
                        <h3>수용인원</h3>
                        <input type="number" name="accept_people" placeholder="수용인원" class="form-control" value="${room.accept_people}">
                    </div>
                    
                    <div id="menu4" class="tab-pane fade">
                        <h3>가격 (원)</h3>
                        <input type="number" name="price" placeholder="가격" class="form-control" value="${room.price}">
                    </div>
                    
                    <div id="menu5" class="tab-pane fade">
                        <h3>객실 수량</h3>
                        <input type="number" name="amount" placeholder="객실 수량" class="form-control" value="${room.amount}">
                    </div>
                    
                    <div id="menu6" class="tab-pane fade">
                        <h3>상세설명</h3>
                        <textarea name="explanation" cols="30" rows="10" placeholder="캠핑장 상세설명" class="form-control">${room.explanation}</textarea>
                    </div>	
                                   
                    <div id="menu7" class="tab-pane fade">
                        <h3>방 사진</h3>
                        <input type="file" id="imgInput" name="campsite_thumbnail" style="margin: 0 auto;">                        
                        <img id="thumbnail" alt="객실 사진" src="/resources/campingroom/${room.saveFileName}">                        
                    </div>                                       
	            </div>
	            
	            <div class="controller">
	                <a href="/" class="btn btn-default btn-nav">취소</a>
	                <input class="btn btn-success btn-nav" type="submit" value="수정">  
	            </div>
           </c:forEach>
        </form>
        
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		function readURL(input) {
	
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	
	            reader.onload = function(e) {
	                $('#thumbnail').attr('src', e.target.result);
	            }
	
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
	    $("#imgInput").change(function() {
	        readURL(this);
	    });
	    
	    var roomGroup = '${room[0].room_group}';
	    
	    var setOptionSelected = 
	    	function (roomGroup) {
	    		if (roomGroup == '오토캠핑') {
	    			var option = document.querySelector('#auto-camping');
	    			option.setAttribute('selected', '');
	    		} else if (roomGroup == '백팩킹') {
	    			var option = document.querySelector('#backpacking');
	    			option.setAttribute('selected', '');
	    		} else if (roomGroup == '글램핑') {
	    			var option = document.querySelector('#glamping');
	    			option.setAttribute('selected', '');
	    		} else if (roomGroup == '카라반') {
	    			var option = document.querySelector('#caravan');
	    			option.setAttribute('selected', '');
	    		}	
	    	}
	    
	    window.document.onload = setOptionSelected(roomGroup);
	</script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
</body>
</html>