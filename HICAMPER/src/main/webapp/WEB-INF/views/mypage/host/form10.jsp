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
	<title>하이캠퍼! | 객실 등록 결과</title>
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
		
		.info {
			margin: 50px;
		}
	</style>	
</head>
<body>
	<div class="progress">
		<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="70"
		aria-valuemin="0" aria-valuemax="100" style="width:100%">
			<span class="sr-only">70% Complete</span>
		</div>
	</div>
		
	<div class="container">
		<div class="logo-frame">
			<a href="/">
				<img alt="logo" src="/resources/img/logo2.png">			
			</a>
		</div>
	
		<div class="contents">
			<div class="info">
				<h3>캠핑장 등록이 완료되었습니다!</h3>
				<strong>캠핑 상품도 등록해보세요.</strong>			
			</div>
			<div class="nav">			
				<a href="/host/showcamp" class="btn btn-success btn-nav">마이 호스팅</a>
				<a href="/host/roomform" class="btn btn-primary btn-nav">캠핑 상품등록</a>
			</div>
		</div>
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>