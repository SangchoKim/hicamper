<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>하이캠퍼! | 회원 탈퇴</title>
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
			
			.content, .control {
				text-align: center;
			}
			
			.content {
				font-size: 2rem;
				margin: 100px;
			}
			
			.control {
				margin: 100px;
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
				<c:forEach var="list" items="${list}">
					${list.representative}님 정말로 홈페이지를 <span style="color:red">탈퇴</span>하시겠습니까?	
				</c:forEach>							
			</div>	
			
			<div class="control">
				<a href="/host/showinfo" class="btn btn-success">취소</a>
				<a href="/host/deleteinfo" class="btn btn-default">탈퇴</a>
			</div>
		</div>
		
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>