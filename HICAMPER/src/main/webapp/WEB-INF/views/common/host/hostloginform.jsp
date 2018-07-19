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
	<title>하이캠퍼! | 로그인</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<style>
		body {
			background: #fff;
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

		.login-frame {
			width: 400px;
			text-align: center;
			margin: 10px auto;
			font-size: 16px;
			background: #ebebeb;			
		}

		.header {
			padding: 1.2rem;
			font-size: 1.4rem;
			color: #fff;
			background: #17c
		}
		
		.form-group {
			text-align: center;
		}
		
		.form-group input {			
			font-size: 16px;
			width: 80%;
			margin: 20px auto;			
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

		<div class="login-frame">
			<div class="header">
				<h2>로그인</h2>
			</div>
			
			<form action="/common/loginid" method="post">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20" id="id" autofocus>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" id="password">
				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-primary form-control" value="로그인">				
				</div>
			</form>
			
			<div class ="nav">
				<a class="btn btn-default" href="/common/signup" role="button">회원가입</a>
				<a class="btn btn-default" href="#" role="button">아이디찾기</a>
				<a class="btn btn-default" href="/common/search_pw" role="button">비밀번호찾기</a>
			</div>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('form').submit(function (event) {			
			if($('#id').val() == '') {
				alert('아이디를 입력해주세요');
				event.preventDefault();
			} else if ($('#password').val() == '') {
				alert('비밀번호를 입력해주세요');
				event.preventDefault();		
			}	
		})
		
		if ((window.location.search) == "?ret=0")
			alert('로그인에 실패했습니다.')		
	</script>
</body>
</html>