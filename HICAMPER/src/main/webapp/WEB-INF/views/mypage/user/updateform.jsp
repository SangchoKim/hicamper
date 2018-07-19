<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>하이캠퍼! | 개인정보 수정</title>		
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link href="/resources/css/glnav.css" rel="stylesheet">
	<link href="/resources/css/footer.css" rel="stylesheet">
	<style type="text/css">
		.content {
			margin-top: 100px;
			text-align: center;
		}
		
		.info {
				margin-bottom: 10px;
			}
			
		.table {
			width: 30%;			
		}
	</style>
</head>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>	
	<div class="content">
		<div class="info">
			<h3>개인정보 수정</h3>
		</div>
		
		<form id="form" action="/user/updateinfo" method="post">
			<table class="table table-bordered" align="center">
			 	<c:forEach var="list" items="${list}">				 	
					<tr>
						<th class="col-sm-3">변경 비밀번호</th>
						<td><input type="password" class="form-control" id="pw" name="password"></td>						 
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" class="form-control" id="check-pw">
							<div id="password-check"></div>						
						</td>												 
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" class="form-control" id="menu1" name="phone_num" value="${list.phone_num}"></td> 
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class="form-control" id="menu2" name="email" value="${list.email}"></td>
					</tr>					
				</c:forEach>
			</table>
			
			<div class="control">
				<a href="/user/showinfo" class="btn btn-default">이전으로</a>			
				<input type="submit" class="btn btn-success" value="수정하기">
			</div>					
		</form>	
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<script>
		$('#pw').change(function (event) {
			if ($('#pw').val() != $('#check-pw').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');
				isMatched = false;
			}
			
			if ($('#pw').val() == $('#check-pw').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');
				isMatched = false;
			}			
		})
		
		$('#check-pw').change(function (event) {
			if ($('#pw').val() != $('#check-pw').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');				
			}
			
			if ($('#pw').val() == $('#check-pw').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');				
			}			
		})
		
		$('#form').submit(function (event) {			
			if ($('#pw').val() == '') {
				alert('비밀번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#check-pw').val() == '') {
				alert('비밀번호 확인을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu1').val() == '') {
				alert('전화번호를 입력해주세요');
				event.preventDefault();			
			} else if ($('#menu2').val() == '') {
				alert('이메일을 입력해주세요');
				event.preventDefault();				
			} else if ($('#pw').val() != $('#check-pw').val()) {
				alert('비밀번호가 일치하지 않습니다');
				event.preventDefault();				
			}
		}) 	
	
	</script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
</body>
</html>