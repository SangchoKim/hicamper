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
	</style>
</head>
<body>
	<div class="progress">
		<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="70"
		aria-valuemin="0" aria-valuemax="100" style="width:60%">
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
				<h3>게스트가 어떤 활동을 할 수 있나요?</h3>		
			</div>
            <form action="/host/addcamp_6" method="post">
	            <div class="form-group">
		            <label for="activity1">
						<input type="checkbox" name="activity" value="낚시" id="activity1"> 낚시
					</label>			
					<label for="activity2">
						<input type="checkbox" name="activity" value="등산" id="activity2"> 등산
					</label>
					<label for="activity3">
						<input type="checkbox" name="activity" value="스키" id="activity3"> 스키
					</label>
					<label for="activity4">
						<input type="checkbox" name="activity" value="계곡" id="activity4"> 계곡
					</label>
					<label for="activity5">
						<input type="checkbox" name="activity" value="해수욕" id="activity5"> 해수욕
					</label>				
	            </div>
	            
				<div class="nav">
					<a href="/host/addcamp_4" class="btn btn-default btn-nav">이전</a>
					<input type="submit" value="다음" class="btn btn-primary btn-nav">
				</div>
            </form>            			
		</div>		
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>