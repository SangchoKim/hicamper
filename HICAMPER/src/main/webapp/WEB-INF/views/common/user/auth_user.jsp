<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<title>하이캠퍼! | 회원 인증</title>
	</head>
	<body>
		<form id="form">
			<c:forEach var="list" items="${list}">
				<input type="hidden" name="user_no" value="${list.user_no}">
				<input type="hidden" name="id" value="${list.id}">
				<input type="hidden" name="password" value="${pw}">
			</c:forEach>
		</form> 
		
		<script>
			var list = '${list}';
			var auth_mail = '${auth_mail}';			
			<c:forEach var="list" items="${list}">
				var id = '${list.id}';
				var email = '${list.email}';
			</c:forEach>
			var diff_url = '${diff_url}';	
				
			$( document ).ready(function() {
				if ("[]" == list) {
					alert("존재하지 않는 아이디 입니다.")
					document.location.href = diff_url;
				} else {
					if(email == auth_mail){
						alert("아이디와 이메일이 일치합니다.");
						$( document ).ready(function() {
							var form = $('#form');
							form.attr('action','/common/change_upw');
							form.attr('method','post');
							form.submit() 
						});
					} else {
						alert("이메일이 일치하지 않습니다.");
						document.location.href = diff_url;
					}
				}		
			});  	
		</script>
	</body>
</html>