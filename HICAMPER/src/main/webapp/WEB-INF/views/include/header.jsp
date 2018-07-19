<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <nav class="navbar navbar-default global-nav">          
        <a href="/" class="navbar-brand">
        	<div>
        		<img height="20px" alt="로고" src="/resources/img/logo2.png">	
        	</div>
        </a>        
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
			                        <li><a href="/admin/bookinglist">모든예약 목록</a></li>
			                        <li><a href="/admin/boardlist">게시판 목록</a></li>
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