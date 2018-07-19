<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 게시글 작성</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link href="/resources/css/glnav.css" rel="stylesheet">
	<link href="/resources/css/footer-fixed.css" rel="stylesheet">
	<style type="text/css">
		.content {
			margin-top: 50px;
		}
	</style>
</head>
<body>	
	<jsp:include page="../../include/header.jsp"></jsp:include>  
	<div class="container content">
		<h3>게시글 작성</h3>	
		<div>
			<form action="/board/add" method="post">
				<input type="hidden" name="board_group" id="board-group">			
				<table class="table">				
					<tbody>
						<tr>
							<td>제목</td>						
						</tr>
						<tr>
							<td>
								<input type="text" name="title" class="form-control" required>							
							</td>
						</tr>
						<tr>
							<td>내용</td>
						</tr>
						<tr>
							<td>
								<textarea name="content" class="form-control" rows="20" required"></textarea>
							</td>					
						</tr>					
					</tbody>	
				</table>
				
				<div class="control" style="text-align: center;">
					<input type="button" class="btn btn-default" onclick='history.go(-1); return false;' value="취소">
					<input type="submit" class="btn btn-submit" value="작성">	
				</div>
			</form>
		</div>
	</div>		
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var setPostBtnURL = function() {
			var paramIdx = location.href.indexOf('=');
			var paramValue = location.href.slice(paramIdx+1);
			
			var boardGroupInput = document.querySelector('#board-group');
			boardGroupInput.setAttribute('value', paramValue);
		} 
	
		document.onload = setPostBtnURL();	
	</script>
</body>
</body>
</html>