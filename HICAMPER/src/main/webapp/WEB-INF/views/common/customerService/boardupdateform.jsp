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
	<title>하이캠퍼! | 게시글 수정</title>
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
		<h3>게시글 수정</h3>		
		<div>
			<form name="write" action="/board/modify?board_group=${board.board_group}&idx=${board.idx}" method="post">
				<input type="hidden" name="idx" value="${board.idx}">
				<input type="hidden" value="${board.board_group}">
				<table class="table table-write">					
					<tbody>
						<tr>
							<td>제목</td>
						</tr>						
						<tr>
							<td><input type="text" class="form-control" name="title" value="${board.title}"></td>						
						</tr>							
						<tr>
							<td>내용</td>								
						</tr>
						<tr>
							<td>
								<textarea rows="20" class="form-control" name="content">${board.content}</textarea>
							</td>
						</tr>
					</tbody>	
				</table>
						
				<div style="text-align: center;">
					<input type="button" class="btn btn-normal" onclick='history.go(-1); return false;' value="취소">
					<input type="submit" class="btn btn-default" name="insert" value="수정">	
				</div>
			</form>
		</div>	
	</div>
	
	
		
	<jsp:include page="../../include/footer.jsp"></jsp:include>		
	</body>			
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>