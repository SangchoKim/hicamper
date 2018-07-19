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
		<title>예약목록</title>
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
		<h2>예약목록</h2><br><br>
	    <h4>총 예약은 ${count}개 이며, 진행중인 예약은 ${confcount}개, 취소된 예약은 ${cancelcount}개 입니다.</h4>
	            <table class="table">
	                <thead>
	                    <tr>
	                    	<th class="1">No.</th>
	                        <th class="2">예약 내역</th>
	                        <th class="3">입실일</th>
	                        <th class="4">퇴실일</th>
	                        <th class="5">가격</th>
	                        <th class="6">예약 상태</th>
	                        <th class="7">예약자</th>
	                        <th class="8">결제 상태</th>
	                        <th class="9">예약날짜</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${list}">
		                    <tr>
		                        <td>${list.book_no}</td>
		                        <td>${list.campsite_name} || ${list.room_name} </td>
		                        <td>${list.check_in}</td>
		                        <td>${list.check_out}</td>
		                        <td>${list.price}원</td>
		                        
		                        <c:choose>
		                        	<c:when test="${list.status eq 0 && (list.reserve_manage == '' || list.reserve_manage == NULL)}">
		                        		<td>대기</td>
		                        	</c:when>
		                        	<c:when test="${list.status eq 0 && list.reserve_manage == '입금미완료'}">
		                        		<td>진행중</td>
		                        	</c:when>
		                        	<c:when test="${list.status eq 0 && list.reserve_manage == '입금완료'}">
		                        		<td>완료</td>
		                        	</c:when>  	
		                        	<c:otherwise>
		                        		<td>취소</td>
		                        	</c:otherwise>
		                        </c:choose>
		                     
		                        <td>${list.subscriber}</td>
		                        
		                        <c:choose>
		                        	<c:when test="${list.status eq 1}">
		                        		<td>--</td>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<td>${list.reserve_manage}</td>
		                        	</c:otherwise>
		                        </c:choose>
		                       	                    
		                        <fmt:formatDate value="${list.reg_date}" var="regDate" pattern="yyyy-MM-dd"/>
								<td>${regDate}</td>
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
		                	<a href="http://localhost/admin/bookinglist?pages=${pageMap.prevPage}">이전</a>
						</li>
	                </c:if>
	                <c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}" step="1">
 	                	<c:if test="${1 eq pageMap.method}">
 	                    	<c:choose>
	                        	<c:when test="${i eq pageMap.currentPage}">
	                         		<li class="active">
	                         			<a href="http://localhost/admin/bookinglist?pages=${i}">${i}</a>	
	                         		</li>
	                        	</c:when>
	                        <c:otherwise>
	                        	<li>
		                        	<a href="http://localhost/admin/bookinglist?pages=${i}">${i}</a>
	                        	</li>
	                        </c:otherwise>
	                        </c:choose>
 	                     </c:if>
 	                 </c:forEach>
	                 <c:if test="${pageMap.currentPage ne pageMap.endPage || pageMap.next eq true}">
		                <li>
		                    <a href="http://localhost/admin/bookinglist?${pageMap.strParam}pages=${pageMap.nextPage}">다음</a>
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
	</body>
</html>