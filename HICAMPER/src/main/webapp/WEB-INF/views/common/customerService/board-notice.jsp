<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/glnav.css" rel="stylesheet">
<link href="/resources/css/footer-fixed.css" rel="stylesheet">
<title>하이캠퍼! | ${boardName}</title>
<style type="text/css">	
	#board-frame {
		margin-top: 100px;
		min-height: 350px;
	}	
	
	td, th {
		text-align: center;
	}
	
	.board-name {
		margin: 30px;
	}
	
	.control {
		text-align: right;
		margin-top: 50px;
	}
	
	.pagination-frame {
		margin-top: 50px;
	}	
</style>
</head>
<body>	
	<jsp:include page="../../include/header.jsp"></jsp:include>
	  
	<div class="container" id="board-frame">
  		<div class="board-name">
	  		<h3>${boardName}</h3>  		
  		</div>
		<table class="table table-board">	
   			<thead>
				<tr>
			    	<th class="col-sm-1">번호</th>
					<th class="col-sm-6">제목</th>
					<th class="col-sm-2">작성자</th>
					<th class="col-sm-2">작성일</th>
					<th class="col-sm-1">조회수</th>
		      	</tr>
   			</thead>   
   			
	    	<c:forEach var="board" items="${board}">
		    	<tbody>
					<tr>
						<td>${board.idx}</td>
						<td>
							<a href="/board/detail?board_group=${board.board_group}&idx=${board.idx}">
								${board.title}
							</a>
						</td> 
						<td>${board.user_id}</td>												
						<c:set var="now" value="<%=new java.util.Date()%>" />						
						<fmt:formatDate value="${now}" var="nowDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${board.date}" var="regDate" pattern="yyyy-MM-dd"/>
						<td>
							<c:if test="${nowDate > regDate }">
								${regDate}
							</c:if>					
							<c:if test="${nowDate == regDate }">
								<fmt:formatDate value="${board.date}" var="displayHHDD" pattern="HH:MM"/>
								${displayHHDD}
							</c:if>						
						</td>	            
						<td>${board.hit}</td>						
					</tr>	    	
		    	</tbody> 
			</c:forEach>
		</table>
		
		<c:if test="${sessionScope.id eq 'admin'}">	
			<div class="control">
				<a href="#" class="btn btn-primary" id="btn-post">글쓰기</a>			
			</div>		
		</c:if>
		
		<div class="pagination-frame text-center">
			<ul class="pagination">
		       	<c:if test="${pageMap.currentPage eq 1}">
		       		<li>
		       			<a href="#">이전</a>
		       		</li>                        		
		       	</c:if>
		       	
				<c:if test="${pageMap.currentPage ne 1}">
					<li>
	     				<a href="/board/showlist?board_group=${pageMap.board_group }&pages=${pageMap.prevPage}">이전</a>
					</li>
	          	</c:if>
	          	
	          	<c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}" step="1">
		      		<c:choose>
			   			<c:when test="${i eq pageMap.currentPage}">
			   				<li class="active">
			   					<a href="/board/showlist?board_group=${pageMap.board_group }&pages=${i}">${i}</a>	
			   				</li>
			  			</c:when>
		       			<c:otherwise>
		     				<li>
		      					<a href="/board/showlist?board_group=${pageMap.board_group }&pages=${i}">${i}</a>
		     				</li>
		       			</c:otherwise>
		      		</c:choose>
	           	</c:forEach>
	          	<c:if test="${pageMap.currentPage ne pageMap.endPage || pageMap.next eq true}">
	           		<li>
	           			<a href="/board/showlist?board_group=${pageMap.board_group }&pages=${pageMap.nextPage}">다음</a>
	           		</li>
	          	</c:if>
	          	<c:if test="${pageMap.endPage eq pageMap.currentPage && pageMap.next ne true}">
	          		<li>
	          			<a href="#">다음</a>
	          		</li>                    		              		
	          	</c:if>
			</ul>
	    </div>	
	</div>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
	<script>
		function goPage(pages, lines) {
		    location.href = '?' + "pages=" + pages;
		}
		
		var setPostBtnURL = function() {
			var paramIdx = location.href.indexOf('?');
			var param = location.href.slice(paramIdx);
			
			var postBtn = document.querySelector('#btn-post');
			postBtn.setAttribute('href', '/board/addform' + param);
		} 
		
		document.onload = setPostBtnURL();		
	</script>
</body>
</html>