<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>하이캠퍼! | 호스트 회원가입</title>
<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
<link rel="stylesheet"
	href="/resources/css/bootstrap/css/bootstrap.min.css">
<style>
	.logo-frame {
		text-align: center;
	}
	
	.info {
		text-align: center;
	}
	
	.form-group {
		margin: 10px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<div class="logo-frame">
				<a href="/"> <img src="/resources/img/logo2.png" alt="logo"
					width="300px">
				</a>
			</div>
			<div class="info">
				<h2>호스트 회원가입</h2>
			</div>
			<form action="/common/hostsignup" method="post" class="form">
				<div class="form-group">
					<label for="menu1">대표자</label> 
					<input type="text"
						class="form-control" id="menu1" placeholder="대표자명"
						name="representative" autofocus>
				</div>
				<div class="form-group">
					<label for="menu2">사업자번호</label> 
					<input type="text"
						class="form-control" id="menu2" placeholder="사업자번호"
						name="corporate_num">
				</div>
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" class="form-control" placeholder="아이디" />					
					<div id="id-check"></div>
				</div>
				<div class="form-group">
					<label for="menu4">비밀번호</label>
					<input type="password" class="form-control" id="menu4" placeholder="비밀번호" name="password">
				</div>
				<div class="form-group">
					<label for="menu5">비밀번호 확인</label>
					<input type="password" class="form-control" id="menu5" placeholder="비밀번호 확인">
					<div id="password-check"></div>
				</div>  
				<div class="form-group">
					<label for="menu7">이메일 주소</label>
					<input type="email" class="form-control" id="menu7" placeholder="예) kdhong@hanmail.net" name="email">
				</div>
				<div class="form-group">			
					<label for="menu9">전화번호</label>
					<input type="text" class="form-control" name="phone_num" id="menu9" placeholder="예) 010-4420-2080" name="phone_num">
				</div>
				
				<input type="submit" value="가입하기" class="btn btn-primary	btn-block">							
			</form>
		</div>
	</div>
	<script>
		var isDuplicated = true;
		var isMatched = false;
		
		$('#id').change(function (event) {
			$.ajax({
				type : "GET",
				url : "/common/checkid",
				data : {
					"id" : $('#id').val()
				},
	
				success : function(data) {					
					if (data == "0") {
						$('#id-check').text('사용가능한 아이디입니다');
						$('#id-check').css('color', 'green');
						isDuplicated = false;
					} else {
						$('#id-check').text('중복되는 아이디입니다');
						$('#id-check').css('color', 'red');
						isDuplicated = true;
					}
				},
			});
		})
		
		$('#menu4').change(function (event) {
			if ($('#menu4').val() != $('#menu5').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');
				isMatched = false;
			}
			
			if ($('#menu4').val() == $('#menu5').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');
				isMatched = false;
			}			
		})
		
		$('#menu5').change(function (event) {
			if ($('#menu4').val() != $('#menu5').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');
				isMatched = false;
			}
			
			if ($('#menu4').val() == $('#menu5').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');
				isMatched = false;
			}			
		})
	
		$('form').submit(function (event) {			
			if ($('#menu1').val() == '') {
				alert('대표자명을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu2').val() == '') {
				alert('사업자번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#id').val() == '') {
				alert('아이디를 입력해주세요');
				event.preventDefault();			
			} else if ($('#menu4').val() == '') {
				alert('비밀번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu5').val() == '') {
				alert('비밀번호 확인을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu7').val() == '') {
				alert('이메일을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu9').val() == '') {
				alert('전화번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu4').val() != $('#menu5').val()) {
				alert('비밀번호가 일치하지 않습니다');
				event.preventDefault();				
			} else if (isDuplicated == true) {
				alert('아이디 중복확인을 해주세요');
				event.preventDefault();
			}
		})		
	</script>
</body>
</html>

