<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
<link rel ="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/footer.css" rel="stylesheet">
<title>#</title>
<title>하이캠퍼! | 게시글 수정</title>
<style type="text/css">
		body {
			height: 10000px;
		}
		.global-nav {
			background-color: orange;
			width: 100%;
			position: fixed;
			top: 0;
			z-index: 100;
		}
		
		section {
			text-align: center;
			margin-top: 200px;
		}
		
		#promotion {
			width: 50%;
			margin: 30px auto;
		}
		
 		#promotion img {
			width: 100%;
			height: 300px;
		}
		
		.quick-search img {
			width: 100%;
			height: 200px;
		}
		.boardShow{
		margin: 30px;
		padding: 100px;
		}
		
		#etcphone1{
		text-align: "center";
		}
		}
		
</style>
</head>
<body>

	
<jsp:include page="../../include/header.jsp"></jsp:include>  
	<div class="col-lg-4"></div>
	<div class="col-lg-4"></div>
	


    
	<a class="navbar-brand" href="####">게시판 홈</a>
	
		<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
		<table class ="table table-striped" style="text-align: center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
				</tr>
				<tr>	
					<td><textarea class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048"
					style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
			</table>
			<input type= "submit" class="btn btn-primary pull-right" vlaue="수정">
			</form>
		</div>
	</div>
	
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>