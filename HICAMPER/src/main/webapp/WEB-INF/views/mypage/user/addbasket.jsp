<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>장바구니 add 팝업</title>
		<script>
			var result = '${result}';
			var tr_url = "/user/showbasket";
			var fa_url = "/filter/campsite_group";
			$( document ).ready(function() {
				if(1 == result){
					if (confirm("장바구니로 이동하시겠습니까?") == true){
						document.location.href = tr_url;	
					} else {
						document.location.href = fa_url;
					}
				} else {
					document.location.href = fa_url;
				}	
			});
		</script>
	</head>
	<body>
	</body>
</html>