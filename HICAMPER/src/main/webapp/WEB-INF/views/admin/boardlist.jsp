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
		<title>게시판 목록</title>
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
	<nav class="navbar navbar-default global-nav">          
        <div>
        	<a href="/" class="navbar-brand">
        		<img height="20px" alt="로고" src="/resources/img/logo2.png">	
        	</a>        
        </div>
        <div class="collapse navbar-collapse" id="nav-collapse">
            <ul class="nav navbar-nav">
               	<li><a href="/filter/showlist">캠핑장 찾기</a></li>
               	<c:if test="${empty sessionScope.user_no}">
	               	<li class="dropdown">
	                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">호스팅 <span class="caret"></span></a>
	                	<ul class="dropdown-menu">
	                        <li><a href="/host/showcamp">마이호스팅</a></li>
	                        <li><a href="/host/addcamp">캠핑장 등록</a></li>   
							<li><a href="/host/roomform">캠핑상품 등록</a></li>                                             
	                    </ul>
	               	</li>
               	</c:if>
              <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티 <span class="caret"></span></a>
                	<ul class="dropdown-menu">
                        <li><a href="/board/showlist?board_group=3">캠핑 팁</a></li>
                        <li><a href="/board/showlist?board_group=2">캠핑 후기</a></li>
                        <li><a href="/board/showlist?board_group=1">질문 게시판</a></li>
                    </ul>
               	</li>            	
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">고객센터 <span class="caret"></span></a>
                	<ul class="dropdown-menu">
                        <li><a href="/board/showlist?board_group=5">FAQ</a></li>
                        <li><a href="/board/showlist?board_group=6">공지사항</a></li>
                        <li><a href="/board/showlist?board_group=7">1:1 문의</a></li>
                    </ul>
               	</li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
            	<c:if test="${empty sessionScope.id}">
	            	<li class="dropdown"><a href="/common/login">로그인</a></li>
	          		<li class="dropdown"><a href="/common/signup">회원가입</a></li>            	
            	</c:if>
            	
				<c:if test="${!empty sessionScope.user_no}">
					<c:choose>
						<c:when test="${sessionScope.id == 'admin'}">
							<li class="dropdown">
			                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자 페이지 <span class="caret"></span></a>
			                    <ul class="dropdown-menu">
			                        <li><a href="/admin/hostlist">호스트 회원목록</a></li>
			                        <li><a href="/admin/userlist">유저회원 목록</a></li>
			                        <li><a href="/">모든예약 목록</a></li>
			                        <li><a href="/">캠핑장 목록</a></li>
			                        <li><a href="/">게시판 목록</a></li>
			                        <li><a href="/common/logout">로그아웃</a></li>
			                    </ul>
			                </li>
						</c:when>
						<c:otherwise>
							 <li class="dropdown">
			                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이 페이지 <span class="caret"></span></a>
			                    <ul class="dropdown-menu">
			                        <li><a href="/user/showinfo">개인정보 수정</a></li>
			                        <li><a href="/user/currentbooking_user">예약 내역</a></li>
			                        <li><a href="/user/showbasket">장바구니</a></li>
			                        <li><a href="/common/logout">로그아웃</a></li>
			                    </ul>
			                </li>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${!empty sessionScope.host_no}">
					<li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이 페이지 <span class="caret"></span></a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/host/showinfo">개인정보 수정</a></li>
	                        <li><a href="/host/currentbooking_host">예약 내역</a></li>	                        
	                        <li><a href="/common/logout">로그아웃</a></li>
	                    </ul>
	                </li>
				</c:if>
            </ul>      
        </div>
    </nav>
	
	
	<div class="container">
	<div class="pagination col-sm-12">
		<ul class="pagination">
			<li class="active">
				<a href="http://localhost/admin/boardlist?board_group=1&pages=1">질문 게시판</a>	
			</li>
			<li class="active">
		    	<a href="http://localhost/admin/boardlist?board_group=2&pages=1">캠핑후기 게시판</a>
	        </li>
			<li class="active">
		    	<a href="http://localhost/admin/boardlist?board_group=3&pages=1">캠핑팁 게시판</a>
	        </li>
			<li class="active">
		    	<a href="http://localhost/admin/boardlist?board_group=5&pages=1">FAQ</a>
	        </li>
			<li class="active">
		    	<a href="http://localhost/admin/boardlist?board_group=6&pages=1">공지사항</a>
	        </li>
			<li class="active">
		    	<a href="http://localhost/admin/boardlist?board_group=7&pages=1">1:1 문의</a>
	        </li>
	    </ul>
	</div>
		<h2>${boardName}</h2><br><br>
	    <h4>총 ${count}개의 게시글이 있습니다.</h4>
	            <table class="table">
	                <thead>
	                    <tr>
	                    	<th class="1">No.</th>
	                        <th class="2">id</th>
	                        <th class="3">제목</th>
	                        <th class="4">내용</th>
	                        <th class="5">조회수</th>
	                        <th class="6">좋아요</th>
	                        <th class="7">싫어요</th>
	                        <th class="8">등록날짜</th>
	                        <th class="9"></th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${list}">
		                    <tr>
		                        <td>${list.idx}</td>
		                        <td>${list.user_id}</td>
		                        <td>${list.title}</td>
		                        <td>${list.content}</td>
		                        <td>${list.hit}</td>
		                        <td>${list.likebtn}</td>
		                        <td>${list.dislikebtn}</td>
		                        
		                        <fmt:formatDate value="${list.date}" var="date" pattern="yyyy-MM-dd"/>
								<td>${date}</td>
		                        <td><a href = "http://localhost/admin/deleteboard?board_group=${pageMap.board_group }&idx=${list.idx}&pages=${pageMap.currentPage}">삭제</a></td>
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
		                	<a href="http://localhost/admin/boardlist?board_group=${pageMap.board_group }&pages=${pageMap.prevPage}">이전</a>
						</li>
	                </c:if>
	                <c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}" step="1">
 	                    	<c:choose>
	                        	<c:when test="${i eq pageMap.currentPage}">
	                         		<li class="active">
	                         			<a href="http://localhost/admin/boardlist?board_group=${pageMap.board_group }&pages=${i}">${i}</a>	
	                         		</li>
	                        	</c:when>
	                        <c:otherwise>
	                        	<li>
		                        	<a href="http://localhost/admin/boardlist?board_group=${pageMap.board_group }&pages=${i}">${i}</a>
	                        	</li>
	                        </c:otherwise>
	                        </c:choose>
 	                </c:forEach>
	                 	<c:if test="${pageMap.currentPage ne pageMap.endPage || pageMap.next eq true}">
		                	<li>
		                    	<a href="http://localhost/admin/boardlist?board_group=${pageMap.board_group }&pages=${pageMap.nextPage}">다음</a>
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