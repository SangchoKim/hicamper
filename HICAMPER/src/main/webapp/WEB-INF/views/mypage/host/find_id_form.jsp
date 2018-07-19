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
	<title>하이캠퍼! | 아이디 찾기</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
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

        .info {
        	border-bottom: 1px solid gray;
        	margin-bottom: 20px;
        }
        
        label {
			display: inline-block;
			width: 50px;
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
		
		<div class="content" align="center">
			<div class="info">
            	<h2>아이디 찾기</h2>
				<p>이메일을 입력해주세요.</p>				
			</div>			
			<form action="hfound_id" method="post">				
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="email" name="email" placeholder="이메일" required id="email">						
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="비밀번호 찾기">						
				</div>
			</form>
		</div>
	</div>	
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>