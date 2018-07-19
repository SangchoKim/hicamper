<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
		<title>하이캠퍼! | 비밀번호 찾기</title>		
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
	            	<h2>호스트 비밀번호 찾기</h2>
					<p>아이디와 이메일을 입력해주세요. 이메일로 변경된 비밀번호를 보내드립니다.</p>				
				</div>			
				<form action="/common/auth_host" method="post">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" name="id" placeholder="아이디" autofocus required id="id">						
					</div>
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
	</body>
</html>