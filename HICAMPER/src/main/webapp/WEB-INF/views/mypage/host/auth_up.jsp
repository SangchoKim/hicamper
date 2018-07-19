<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">		
		<title>하이캠퍼! | 회원 인증</title>
	</head>
	<body>			
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script>
			$( document ).ready(function() {
				var authpw = '${authpw}';
				
				<c:forEach var="list" items="${list}">
					var hostpw = '${list.password}';
				</c:forEach>
				
				var same_url = '${same_url}';
				var diff_url = '${diff_url}';		
				if ( hostpw == authpw ) {
					alert("비밀번호가 일치합니다.")
					document.location.href = same_url;
				} else {
					alert("비밀번호가 다릅니다.");
					document.location.href = diff_url;
				}	
			});
		</script>
	</body>
</html>