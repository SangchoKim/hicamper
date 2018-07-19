<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<title>하이캠퍼! | 댓글 수정</title>
	
		<style type="text/css">
			#wrap {
            width: 600px;
            margin: 0 auto 0 auto;
            text-align :center;
        }
		</style>
	</head>
	<body>
	
	<div id="wrap">
    	<br>
    	<b><font size="5" color="gray">댓글수정</font></b>
    	<hr size="1" width="550">
    	<br>
 
	    <div id="commentUpdateForm">
	        <c:forEach var="list" items="${list}">
		        <form id="update" target="parentForm">        
			    	<c:if test="${!empty list}">
			            <textarea rows="7" cols="70" name="contents">${list.contents}</textarea>
			            <br><br>
			        </c:if>
		            <input type="button" class="btn btn-default" value="수정" onclick="update(${list.comment_no});">
		            <input type="button" class="btn btn-basic" value="취소" onclick="window.close()">          	
					<input type="hidden" name="comment_no" id="comment_no">
		        </form>
	        </c:forEach>
	    </div>    
	</div> 
	
		<script type="text/javascript">      	     
		        function update(no) {
		        	window.close();
		        	var form = $('#update');
		    		$('#comment_no').val(no);
	    			form.attr('action','/board/updatecomment');
		    		form.attr('method','post');
		    		form.submit()
				};		
		</script>	
	</body>
</html>