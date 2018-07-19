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
	<title>#</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link href="/resources/css/footer.css" rel="stylesheet">
	<style type="text/css">
		.logo-frame {
			width: 500px;
			margin: 20px auto;
			text-align: center;
			background: orange;
			border-radius: 20px;
		}

		.logo-frame img {
			max-width: 300px;			
		}
		
		.content {
			text-align: center;
			font-size: 2rem;
			margin: 30px;			
		}
		
	</style>
</head>
<body>

	<div class="container">
		<div class="logo-frame">
			<a href="/">
				<img src="/resources/img/logo2.png" alt="logo">
			</a>					
		</div>
	
		<div class="content">			
			<h2>포인트 충전</h2>
			<form action="/user/updatepoint" method="post">
			<input type="hidden" name="value" value="1">			
				<div class="radio">
					<input type="radio" name="add_point" value="100000" id="menu1">
					<label for="menu1">100,000 포인트</label>
				</div>
				
				<div class="radio">
					<input type="radio" name="add_point" value="200000" id="menu2">
					<label for="menu2">200,000 포인트</label>			
				</div>
						
				<div class="radio">
					<input type="radio" name="add_point" value="300000" id="menu3">
					<label for="menu3">300,000 포인트</label>			
				</div>
				
				<div class="radio">
					<input type="radio" name="add_point" value="400000" id="menu4">
					<label for="menu4">400,000 포인트</label>			
				</div>
				
				<div class="radio">
					<input type="radio" name="add_point" value="500000" id="menu5">
					<label for="menu5">500,000 포인트</label>			
				</div>
						
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="충전하기">		
				</div>
			</form>
		</div>	
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
</body>
</html>