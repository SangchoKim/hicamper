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
	<title>하이캠퍼! | 회원가입 완료</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">	
	<style>		
		.info {
			padding: 40px;
			text-align: center;
			font-size: 2rem;
		}

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

		.nav {
			text-align: center;						
		}

		.btn-nav {
			width: 40%;
		}
	</style>
</head>	
<body>
	<div class="container">			
		<div class="logo-frame">
			<a href="/">
				<img src="/resources/img/logo2.png" width="300px">
			</a>
		</div>
		<div class="info">
			<h2>축하합니다 하이캠퍼가 되셨습니다!</h2>				
			<p>하이캠퍼의 다양한 서비스를 이용해보세요.</p>            
		</div>
		
		<div class="nav">			
			<a href="/common/login" class="btn btn-success btn-nav">로그인</a>
		</div>
	</div>
</body>
</html>