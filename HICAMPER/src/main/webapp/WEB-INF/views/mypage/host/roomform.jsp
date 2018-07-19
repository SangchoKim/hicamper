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
	<title>하이캠퍼! | 캠핑 상품 등록</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link href="/resources/css/footer.css" rel="stylesheet">
	<link href="/resources/css/glnav.css" rel="stylesheet">
	<style type="text/css">
		#wrapper {
			margin-top: 50px;
		}
		
		/* .form-group {
			margin-bottom: 20px;
		}
		
		.img-preview-frame {			
			padding: 2rem;
			text-align: center;			
		}
		
		.img-preview-frame :hover {
			transform: scale(1.05);
		}
		
		.img-preview-frame img {
			max-width: 500px;
			max-height: 300px;		
			margin: 0 auto;		
		}	
				
		.bottom {
			margin: 50px 0;
			padding: 2rem;
		}	 */
	
	</style>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include> 
	<div class="container" id="wrapper">
        <div class="room-form">
            <h1>캠핑 상품 등록</h1>
            <h3>회원님의 캠핑 상품을 등록해주세요</h3>
            
            <form action="/host/reg_product" method="post" enctype="multipart/form-data">                
                <span>상품명</span>                                
                <div class="form-group">
	                <input type="text" name="room_name">                
                </div>
                                
                <span>캠핑 분류</span>
                <div class="form-group">
	                <select name="room_group">
	                    <option value="오토캠핑">오토캠핑</option>
	                    <option value="백팩킹">백팩킹</option>
	                    <option value="글램핑">글램핑</option>
	                    <option value="카라반">카라반</option>
	                </select>                
                </div>
                              
                <span>수용인원</span>
                <div class="form-group">
	                <input type="number" name="accept_people">                
                </div>
                <span>가격 (원)</span>
                <div class="form-group">
	                <input type="text" name="price">
                </div>    

                <span>상품 수량</span>
                <div class="form-group">
	                <input type="number" name="amount">                
                </div>                
                
                <span>상품 설명</span>
                <div class="form-group">
	                <textarea name="explanation" cols="80" rows="10"></textarea>
                </div>
                
                <span>상품 사진</span>
                <div class="form-group">
	                <input type="file" name="room_thumbnail" id="imgInput">                
                </div>
                
                <div class="img-preview-frame">
	                <img src="http://via.placeholder.com/500x300" alt="캠핑 상품" id="room-thumbnail">                
                </div>		
				
				<div class="bottom">
                	<input type="submit" value="상품 등록" class="btn btn-success btn-block btn-lg">		
				</div>
            </form>            
        </div>
    </div>
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function readURL(input) {
	
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	
	            reader.onload = function(e) {
	                $('#room-thumbnail').attr('src', e.target.result);
	            }
	
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
	    $("#imgInput").change(function() {
	        readURL(this);
	    });
	</script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
</body>
</html>