<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<title>하이캠퍼! | 댓글 작성</title>
	</head>
	<body>
		<script>
			var result = '${result}';
			var	url = "/board/detail?idx=${sessionScope.idx}&board_group=${sessionScope.board_group}";
			
			$( document ).ready(function() {
				if (1 == result) {
					alert("댓글 작성완료");
					document.location.href = url;
				} else {
					alert("댓글 작성오류!");
					document.location.href = url;
				}	
			});
			
		</script>
	</body>
</html>