<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<title>하이캠퍼! | 메일링</title>
	</head>
	<body>
		<div align="center">
			<h1 style="text-align: center">메일을 보내는 중입니다.</h1>
			<img alt="load_spinner" src="/resources/img/load_spinner.gif">
		</div>
		<form id="mail">
			<c:forEach var="list" items="${list}">
				<input type="hidden" name="tomail" value="${list.email}"> <!-- 상대의 이메일 -->
				<input type="hidden" name="title" value="highcamper 회원 비밀번호 변경 안내"> <!-- 메일의 제목 -->
				<input type="hidden" name="content" value="변경된 비밀번호는 '${list.password}' 입니다."> <!-- 메일의 내용 -->
			</c:forEach>
		</form> 
		
		<script>
			var result = '${result}';
			var diff_url = '${diff_url}';	
			
			var fun = function(){			
				if (result == 1){					
					$(document).ready(function() {
						var form = $('#mail');
						form.attr('action','/mail/userpw_send');
						form.attr('method','post');
						form.submit() 
					});
				} else if (result != 1){		
					alert("비밀번호 변경오류");
					document.location.href = diff_url;
				}
			};		
				
			fun();
		</script>
	</body>
</html>