<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>하이캠퍼! | 일반 회원 목록</title>
		<style>
	    	.container {
	    		margin-top: 100px;
	    	}
	    	.global-nav {
				background-color: orange; 
				width: 100%;
				position: fixed;
				top: 0;
				z-index: 100;
			}
			table {
				min-height: 300px;
			}
			
			td, th {
				text-align: center;
			} 
	        tr {
	            border-bottom: 1px solid gray;
	        }
	
	        tr:last-child {
	            border: none;
	        }
	        .pagination {
			text-align: center;
			}
    </style>
	</head>
	<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
		<h2>유저 회원목록</h2><br><br>
	    <h4>유저 회원은 총 ${count}명 있습니다.</h4>
	            <table class="table">
	                <thead>
	                    <tr>
	                    	<th class="1">No.</th>
	                        <th class="2">id</th>
	                        <th class="3">이름</th>
	                        <th class="4">전화번호</th>
	                        <th class="5">email</th>
	                        <th class="6">생년월일</th>
	                        <th class="7">성별</th>
	                        <th class="8">가입날짜</th>
	                        <th class="9">탈퇴</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${list}">
		                    <tr>
		                        <td>${list.user_no}</td>
		                        <td>${list.id}</td>
		                        <td>${list.name}</td>
		                        <td>${list.phone_num}</td>
		                        <td>${list.email}</td>
		                        <td>${list.birth}</td>
		                        <td>${list.gender}</td>
		                        
		                        <fmt:formatDate value="${list.reg_date}" var="regDate" pattern="yyyy-MM-dd"/>
								<td>${regDate}</td>
								
								<td>
									<input type="button" class="btn btn-default" value="탈퇴" onclick="de_uesr(${list.user_no});">
									<form id="de">
										<input type="hidden" name="user_no" id="user_no">
									</form>
								</td>
		                    </tr>
		   				</c:forEach>                      
	                </tbody>
	            </table>             
	        </div>
	        
	        <div class="pagination col-sm-12">
	        	<ul class="pagination">
	            	<c:if test="${pageMap.currentPage eq 1}">
	                	<li>
	                    	<a href="#">이전</a>
	                	</li>                        		
	                </c:if>
					<c:if test="${pageMap.currentPage ne 1}">
						<li>
		                	<a href="http://localhost/admin/userlist?${pageMap.strParam}pages=${pageMap.prevPage}">이전</a>
						</li>
	                </c:if>
	                <c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}" step="1">
 	                	<c:if test="${1 eq pageMap.method}">
 	                    	<c:choose>
	                        	<c:when test="${i eq pageMap.currentPage}">
	                         		<li class="active">
	                         			<a href="http://localhost/admin/userlist?pages=${i}">${i}</a>	
	                         		</li>
	                        	</c:when>
	                        <c:otherwise>
	                        	<li>
		                        	<a href="http://localhost/admin/userlist?pages=${i}">${i}</a>
	                        	</li>
	                        </c:otherwise>
	                        </c:choose>
 	                     </c:if>
 	                </c:forEach>
	                 	<c:if test="${pageMap.currentPage ne pageMap.endPage || pageMap.next eq true}">
		                	<li>
		                    	<a href="http://localhost/admin/userlist?pages=${pageMap.nextPage}">다음</a>
	    	                </li>
	                   	</c:if>
	                    <c:if test="${pageMap.endPage eq pageMap.currentPage && pageMap.next ne true}">
	                        <li>
	                        	<a href="#">다음</a>
	                        </li>                    		              		
	                    </c:if>
				</ul>
			</div>
                                      
		<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
		<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
		
		<script>
			function de_uesr(no){
				if (confirm("정말 유저 회원을 삭제하시겠습니까?") == true) {
					var form = $('#de');
		    		$('#user_no').val(no);
		   			form.attr('action','/admin/ad_deleteUser');
		    		form.attr('method','post');
		    		form.submit()
				} else {				
					return false;
				}	
			};
		</script>
	</body>
</html>