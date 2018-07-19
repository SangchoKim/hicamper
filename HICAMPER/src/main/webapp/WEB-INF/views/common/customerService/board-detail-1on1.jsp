<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%pageContext.setAttribute("crlf", "\r\n");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>${title} | 하이캠퍼!</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link href="/resources/css/glnav.css" rel="stylesheet">
	<link href="/resources/css/footer-fixed.css" rel="stylesheet">	
	<style>
		#content-wrap {
			margin-top: 50px;
		}
		
		.post-header {
			font-size: 1.3rem;
			color: gray;
			display: inline-block;
		}
		
		.post-control {
			display: inline-block;					
		}
		
		.post-edit, .post-delete {
			text-decoration: none;
			cursor: pointer;
			font-size: 1.3rem;
			color: gray;
		}
		
		.post-content {
			min-height: 200px;
		}
		
		.title {
			font-size: 2rem;
		}
		
		.post-frame {
			margin-bottom: 20px;
		}
		
		.table-post {
			border-bottom: 1px solid gray;
		} 
		
		.control {
			min-height: 50px;
		}
		
		.comment-frame {
			margin-top: 20px;
		}
		
		.comment-form-frame {
			margin-top: 50px;
		}
		
		.btn-submit-comment {
			width: 100%;
			line-height: 94px;
			padding: 0;
		}
		
		.comment-edit, .comment-delete {
			text-decoration: none;
			cursor: pointer;
			font-size: 1.3rem;
			color: gray;
		}
		
		.table-comment tbody tr:nth-child(even) td {
			padding: 2rem;			
		}
		
		.comments-icon {
			font-size: 2rem;
			padding: 1.3rem;
			color: orange;
		}
		
		#btnup {
			font-size: 1.8rem;
			color: red;
			background-color: rgba(255, 255, 255, 0.5);
		}
		
		#btndown {
			background-color: #fff;
		}
		
	</style>
</head>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>  		
	<div id="content-wrap" class="container">
		<div class="post-frame">
			<table class="table table-post">			
				<thead>
					<tr>
						<td>
							<input type="hidden" id="board_group" name="board_group" value="${board_group.board_group}"/>
						</td>
					</tr> 
					<tr class="title">
						<th>${board_group.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:set var="date" value="${board_group.date}"/>					
						<td>
							<div class="post-header">
								<fmt:formatDate value="${board_group.date}" var="regDate" pattern="yyyy-MM-dd hh:mm"/>
								${board_group.user_id} | ${regDate} | 조회 ${board_group.hit}
							</div>
							
							<c:if test="${(board_group.user_id eq sessionScope.id) or (sessionScope.id eq 'admin')}">
								<div class="post-control pull-right">								
									<a class="post-edit" onclick="location.href='/board/modifyform?board_group=${board_group.board_group}&idx=${board_group.idx}'">
										수정
									</a> |
									<a class="post-delete" onclick="fn_del()">삭제</a>
								</div>							
							</c:if>													
						</td>
					</tr>
					<tr>
						<td>
							<div class="post-content">
								<c:set var = "mainContent" value="${board_group.content}"/>
								${fn:replace(mainContent, crlf, "</br>")}								
							</div>
							
							<div class="btn-evaluation" style="text-align: center;">
								<button type="button" id="btnup" value="up" class="btn">
									<i class="fas fa-heart"></i>
								</button>
								<div id="countlike" style="display: inline-block;">${board_group.likebtn}
									
								</div>
	                        	<button type="button" id="btndown" value="down" class="btn">
	                        		<i class="far fa-heart"></i>
	                        	</button>
								<div id="countdislike" style="display: inline-block;">${board_group.dislikebtn}
									
								</div>
							</div>
						</td>
					</tr>		
				</tbody>
			</table>				
			
			<div class="control">							 
				<button class="btn btn-default pull-right" 
					onclick="location.href='/board/showlist?board_group=${board_group.board_group}'">
					목록
				</button>
			</div>
		</div>
			
		<div class="comment-frame">
				<table class="table table-striped table-comment">
					<c:if test="${!empty comlist}">
						<div class="comments-icon">
							<i class="fa fa-comments" aria-hidden="true"></i> 댓글
						</div>						
						<tbody>													
							<c:forEach var="comlist" items="${comlist}">
								<tr>
									<td>
										<span class="comment-id">
											${comlist.comment_id}										
										</span>
																				
										<span class="pull-right">
											<fmt:formatDate value="${comlist.reg_date}" var="regDate" pattern="yyyy-MM-dd"/>
											${regDate}
											<c:if test="${sessionScope.id == comlist.comment_id}">
												<a class="comment-edit" onClick="up(${comlist.comment_no});">
													| 수정
												</a> |
												<a class="comment-delete" onClick="de(${comlist.comment_no});">
													삭제
												</a>										
												
												<form id="de">
													<input type="hidden" name="comment_no" id="comment_no">
												</form>
											</c:if>
										</span>
									</td>
								</tr>
								<tr>									
									<c:set var = "contents" value = "${comlist.contents}"/>			                        
			                        <td>
			                        	${fn:replace(contents, crlf, "</br>")}	                        	
		                        	</td>									
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				
			<c:if test="${(sessionScope.id eq 'admin') or (board_group.user_id eq sessionScope.id)}">	
				<div class="comment-form-frame" style="width: 100%;">
					<form action="/board/writecomment" method="post">
						<table class="table">
							<c:if test="${!empty sessionScope.id}">
								<tr>
									<td class="col-sm-10 textarea-comment">
										<textarea class="form-control textarea-comment" 
										name="contents" placeholder="댓글 내용을 입력해주세요" rows="4" required></textarea>
									</td>
									<td class="col-sm-2 submit-comment">
										<input type="submit" class="btn btn-primary btn-submit-comment" value="댓글 쓰기">
									</td>
								</tr>					
							</c:if>
						</table>
					</form>
									
					<c:if test="${empty sessionScope.id}">
						<table class="table">								
							<tr>
								<td class="col-sm-10 textarea-comment">
									<textarea class="form-control textarea-comment" 
									name="contents" placeholder="비회원은 댓글을 작성할 수 없습니다" rows="4" required></textarea>
								</td>
								<td class="col-sm-2 submit-comment">
									<a href="/common/login">
										<input type="button" class="btn btn-primary btn-submit-comment" value="로그인">
									</a>									
								</td>
							</tr>
						</table>						
					</c:if>
				</div>				
			</c:if>	
		</div>
	</div>
	<jsp:include page="../../include/footer.jsp"></jsp:include>		
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>		
	<script type="text/javascript">
		function fn_del(){
			if (confirm("정말 삭제하시겠습니까?") == true) {
				location.href="/board/delete?idx="+${board_group.idx}+"&board_group="+${board_group.board_group};
			} else {				
				return false;
			}	
		}
		
		var	url = "/board/showcomment";	
		
		function de(no) {
			var conf = confirm("정말 삭제하시겠습니까?");
			
	        if (true == conf){
	    		var form = $('#de');
	    		$('#comment_no').val(no);
	   			form.attr('action','/board/deletecomment');
	    		form.attr('method','post');
	    		form.submit()
	        } else if(false == conf) {
	        	document.location.href = url;
	        }
		};
		
		function up(comment_no) {
			window.name = "parentForm"
			window.open("/board/showupdate_form?comment_no="+comment_no, "updateform", "width=600, height=400, resizable = no, scrollbars = 1");
		};
		
		var id = null;
		$('#btnup, #btndown').on('click', function() {				
			var value = 1;
			id = '${id}';		
			
			if (id === undefined || id === null || id === '') {
				alert('로그인 해주세요~');
				return;
			}
			
			if('up' == this.value) {			
				$.ajax({
					type : "GET",
					url : "/thumbup?idx=" + ${board_group.idx},
					data : {
						"btnup" : value
					},					
					success : function(data) {
						console.log(data);
						var jo = JSON.parse(data);						
						$('#countlike').text(jo.data); 
						
						}					
					});
			} else {				
				$.ajax({
					type :"GET",
					url :"/thumbdown?idx="+ ${board_group.idx},
					data : {
						"btndown" : value
					},					
					success : function(data) {
						console.log(data);
						var jo = JSON.parse(data);
						$('#countdislike').text(jo.data);
					}						
				});	
			}
		});
		
	</script>
</body>
</html>