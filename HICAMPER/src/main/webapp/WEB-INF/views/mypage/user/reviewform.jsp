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
	<title>#</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<style type="text/css">
		#review-form-frame {
			position: absolute;			
			top: 30%;
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
		}
		
		.label-content {
			font-size: 3rem;
		}
		
		.textarea-review {
			width: 50%;
			margin: 10px auto;
		}
		
		.score {
			font-size: 2rem;
			color: orange;
			padding: 2rem;
			margin: 10px 0;
		}
		
		.glyphicon {
			color: rgb(244, 179, 66);
		}
		
		label {
			padding-right : 10px;
		}		
	</style>	
</head>
<body>
	<div id="review-form-frame" class="container">
		<form action="/user/review_user" method="post">
			<div class="form-group">
				<label for="content" class="label-content">					
					<strong>리뷰</strong>
				</label>
				<textarea rows="2" cols="10" class="form-control textarea-review" id="content" name="content"></textarea>	    		
	    	</div>
	    	
	    	<div class="form-group">
	    		<span class="score">
	    			<strong>만족도</strong>
	    		</span>
		  		<input type="radio" name="score" value="1" id="score-1">
		  		<label for="score-1">
		  			<span class="glyphicon glyphicon-star"></span>	
		  		</label>
		  		
		  		<input type="radio" name="score" value="2" id="score-2">
		  		<label for="score-2">
		  			<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>		  		
		  		</label>
		  		<input type="radio" name="score" value="3" id="score-3">
		  		<label for="score-3">
		  			<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
		  		</label>
		  				  		
		  		<input type="radio" name="score" value="4" id="score-4">
		  		<label for="score-4">
		  			<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
		  		</label>		  		
		  		
		  		<input type="radio" name="score" value="5" id="score-5">
		  		<label for="score-5">
			  		<span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>
		  		</label>
	    	</div>	   		
	  		
	  		<div class="form-group">
		  		<button class="btn btn-default" type="submit">리뷰 등록</button>		  				  			  		
	  		</div>
		</form>	
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>