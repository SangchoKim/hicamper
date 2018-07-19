<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>장바구니 삭제</title>
		<script>
			var url = "/user/showbasket";
			
			$( document ).ready(function() {
				alert("장바구니에서 삭제되었습니다.");
				document.location.href = url;	
			});
		</script>
	</head>	
	<body>

	</body>
</html>