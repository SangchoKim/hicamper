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
	<title>하이캠퍼! | 객실 등록</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<style type="text/css">
		.logo-frame {
			width: 350px;
			text-align: center;
			margin: 0 auto;
			background-color: orange;
			border-radius: 20px;						
		}
		
		.logo-frame img {
			max-width: 300px;			
		}
		
		.form-group {			
			margin: 50px auto;
			width: 50%;
			text-align: center;						
		}	
		
		.contents {
			text-align: center;
		}
		
		.form-group input {
			width: 80%;
			padding: 10px;
		}
		
		.btn-nav {
			width: 20%;
			padding: 5px;
			font-size: 2rem;
		}		
		
		.thumbnail-frame img {
			max-width: 500px;
			max-height: 300px;
			margin: 30px auto;	
		}
		
		.thumbnail-frame img:hover {
			transform: scale(1.05);
		}
		
		.thumbnail-frame {
			padding: 2rem;
			text-align: center;
		}
		
		.nav {
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="progress">
		<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="70"
		aria-valuemin="0" aria-valuemax="100" style="width:90%">
			<span class="sr-only">70% Complete</span>
		</div>
	</div>

	<div class="container">
		<div class="contents">
			<div class="logo-frame">
				<a href="/">
					<img alt="logo" src="/resources/img/logo2.png">			
				</a>
			</div>
			
			<div class="info">
				<h3>캠핑장의 대표 사진을 등록해주세요</h3>			
			</div>
            <form action="/host/addcamp_9" method="post" enctype="multipart/form-data">
            	<div class="form-group">
            		<input type="file" id="imgInput" name="campsite_thumbnail" required>            	
            	</div>
            	
            	<div class="thumbnail-frame">
            		<img id="thumbnail" alt="캠핑장 대표 사진" src="http://via.placeholder.com/500x300">          	          	
            	</div>
            	
            	<div class="nav">
	            	<a href="/host/addcamp_7" class="btn btn-default btn-nav">이전</a>
					<input type="submit" value="다음" class="btn btn-primary btn-nav">            	
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
	                $('#thumbnail').attr('src', e.target.result);
	            }
	
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
	    $("#imgInput").change(function() {
	        readURL(this);
	    });
	</script>
	
</body>
</html>