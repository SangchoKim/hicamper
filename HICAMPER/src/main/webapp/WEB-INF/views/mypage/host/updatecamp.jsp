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
	<title>하이캠퍼! | 캠핑장 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/resources/css/footer.css" rel="stylesheet">
    <link href="/resources/css/glnav.css" rel="stylesheet">
    <style>
    	#wrapper {
    		margin: 50px;    		
    	}  	
    	    
        .nav :first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        
        .nav :last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        
        .ul-menu {
        	background-color: rgba(242, 242, 242, 0.5);
        }
                        
        .tab-content div {
            text-align: center;
            height:500px;
            margin-top: 50px;
        }
        
        .controller {
            text-align: center;
        }    

        #thumbnail {
            width: 500px;
            height: 400px;
            margin: 10px;
        }

        .btn-nav {
            width: 30%;
        }
        
        .tab-content input[type="text"] {
            width: 30%;
            margin: 0 auto;
        }

        .form-control {
            font-size: 16px;
        }
        
        .campsite-img-frame {
			text-align: center;
			margin: 20px;
		}
    </style>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include> 
    <div class="container-fluid" id="wrapper">        
        <ul class="nav nav-pills nav-justified">
            <li class="active">
                <a href="#menu1" data-toggle="pill">캠핑장 이름</a>
            </li>
            <li>
                <a href="#menu2" data-toggle="pill">연락처</a>
            </li>
            <li>
                <a href="#menu3" data-toggle="pill">캠핑 유형</a>
            </li>
            <li>
                <a href="#menu4" data-toggle="pill">위치</a>
            </li>
            <li>
                <a href="#menu5" data-toggle="pill">편의시설</a>
            </li>
            <li>
                <a href="#menu6" data-toggle="pill">액티비티</a>
            </li>
            <li>
                <a href="#menu7" data-toggle="pill">상세설명</a>
            </li>
            <li>
                <a href="#menu8" data-toggle="pill">주의사항</a>
            </li>
            <li>
                <a href="#menu9" data-toggle="pill">사진 등록</a>
            </li>
        </ul>
    </div>
    
    <div class="container">
        <form action="/host/updatecamp" method="post" enctype="multipart/form-data">
        	<c:forEach var="list" items="${list}">
        	<input type="hidden" name="fileupload_no" value="${list.fileupload_no}">
        	<input type="hidden" name="campsite_no" value="${list.campsite_no}">
	            <div class="tab-content">                        
	                    <div id="menu1" class="tab-pane fade in active">
	                        <h3>캠핑장 이름</h3>
	                        <input type="text" name="campsite_name" placeholder="캠핑장 이름" class="form-control" value="${list.campsite_name}">
	                    </div>
	                    <div id="menu2" class="tab-pane fade">
	                        <h3>연락처</h3>
	                        <input type="text" name="phone_num" placeholder="연락처" class="form-control" value="${list.phone_num}">
	                    </div>
	                    <div id="menu3" class="tab-pane fade">
	                        <h3>캠핑 유형</h3>
	                                 
		                        <label for="cg1">
		                            <input type="checkbox" name="campsite_group" value="오토캠핑" id="cg1" class="form-control" > 오토캠핑
		                        </label>			
		                        <label for="cg2">
		                            <input type="checkbox" name="campsite_group" value="백팩킹" id="cg2" class="form-control"> 백팩킹
		                        </label>
		                        <label for="cg3">
		                            <input type="checkbox" name="campsite_group" value="글램핑" id="cg3" class="form-control"> 글램핑
		                        </label>
		                        <label for="cg4">
		                            <input type="checkbox" name="campsite_group" value="카라반" id="cg4" class="form-control"> 카라반
		                     	</label>
		                </div>
	                    <div id="menu4" class="tab-pane fade">
	                        <h3>위치</h3>
	                        <input type="text" name="address" placeholder="캠핑장 위치" class="form-control" value="${list.address}">
	                    </div>
	                    <div id="menu5" class="tab-pane fade">
	                        <h3>편의시설</h3>
	                        <label for="comforts1">
	                            <input type="checkbox" name="comforts" value="샤워실" id="comforts1" class="form-control"> 샤워실
	                        </label>			
	                        <label for="comforts2">
	                            <input type="checkbox" name="comforts" value="화장실" id="comforts2" class="form-control"> 화장실
	                        </label>
	                        <label for="comforts3">
	                            <input type="checkbox" name="comforts" value="매점" id="comforts3" class="form-control"> 매점
	                        </label>
	                        <label for="comforts4">
	                            <input type="checkbox" name="comforts" value="흡연실" id="comforts4" class="form-control"> 흡연실
	                        </label>
	                        <label for="comforts5">
	                            <input type="checkbox" name="comforts" value="수영장" id="comforts5" class="form-control"> 수영장
	                        </label>
	                    </div>
	                    <div id="menu6" class="tab-pane fade">
	                        <h3>액티비티</h3>
	                        <label for="activity1">
	                            <input type="checkbox" name="activity" value="낚시" id="activity1" class="form-control"> 낚시
	                        </label>			
	                        <label for="activity2">
	                            <input type="checkbox" name="activity" value="등산" id="activity2" class="form-control"> 등산
	                        </label>
	                        <label for="activity3">
	                            <input type="checkbox" name="activity" value="스키" id="activity3" class="form-control"> 스키
	                        </label>
	                        <label for="activity4">
	                            <input type="checkbox" name="activity" value="계곡" id="activity4" class="form-control"> 계곡
	                        </label>
	                        <label for="activity5">
	                            <input type="checkbox" name="activity" value="해수욕" id="activity5" class="form-control"> 해수욕
	                        </label>
	                    </div>
	                    <div id="menu7" class="tab-pane fade">
	                        <h3>상세설명</h3>
	                        <textarea name="explanation" cols="30" rows="10" placeholder="캠핑장 상세설명" class="form-control">${list.explanation}</textarea>
	                    </div>
	                    <div id="menu8" class="tab-pane fade">
	                        <h3>주의사항</h3>
	                        <textarea name="attension" cols="30" rows="10" placeholder="캠핑장 주의사항" class="form-control">${list.attension}</textarea>
	                    </div>
	                    <div id="menu9" class="tab-pane fade">
	                        <h3>캠핑장 대표사진</h3>
	                        <input type="file" id="imgInput" name="campsite_thumbnail" style="margin: 0 auto;">                        
	                        <img id="thumbnail" alt="캠핑장 대표 사진" src="/resources/fileupload/${list.saveFileName}">                        
	                    </div>                                       
	            </div>
	            <div class="controller">
	                <a href="/" class="btn btn-default btn-nav">취소</a>
	                <input class="btn btn-success btn-nav" type="submit" value="수정">  
	            </div>
 		</c:forEach>
        </form>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		function readURL(input) {	
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	
	            reader.onload = function(e) {
	                $('#thumbnail').attr('src', e.target.result);
	            }
	
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
	    $("#imgInput").change(function() {
	        readURL(this);
	    });
	    
	    var campsiteGroup;
	    var comforts;
	    var activity;
	    
	    <c:forEach items="${list}" var="list">
		    campsiteGroup = '${list.campsite_group}';
		    comforts = '${list.comforts}';
		    activity = '${list.activity}';
	    </c:forEach>
	    	   
	    function setCampsiteGroup(str) {	    	
	    	if (str.includes("오토캠핑")) {
	    		var ac1 = document.querySelector('#cg1');
	    		ac1.setAttribute("checked", '');
	    	}
	    	
			if (str.includes("백팩킹")) {
				var ac2 = document.querySelector('#cg2');
	    		ac2.setAttribute("checked", '');
	    	}
			
			if (str.includes("글램핑")) {
				var ac3 = document.querySelector('#cg3');
	    		ac3.setAttribute("checked", '');
	    	}
	    
			if (str.includes("카라반")) {
				var ac2 = document.querySelector('#cg4');
	    		ac4.setAttribute("checked", '');				
	    	}
	    }
	    
	    function setComforts(str) {
			if (str.includes("샤워실")) {
				var comforts1 = document.querySelector('#comforts1');
				comforts1.setAttribute("checked", '');
	    	}
			
			if (str.includes("화장실")) {
				var comforts2 = document.querySelector('#comforts2');
				comforts2.setAttribute("checked", '');
	    	}
			
			if (str.includes("매점")) {
				var comforts3 = document.querySelector('#comforts3');
				comforts3.setAttribute("checked", '');
	    	}
			
			if (str.includes("흡연실")) {
				var comforts4 = document.querySelector('#comforts4');
				comforts4.setAttribute("checked", '');
	    	}
			
			if (str.includes("수영장")) {
				var comforts5 = document.querySelector('#comforts5');
				comforts5.setAttribute("checked", '');
	    	}	
	    }
	    
	    function setActivity(str) {
			if (str.includes("낚시")) {
				var activity1 = document.querySelector('#activity1');
				activity1.setAttribute("checked", '');
	    	}
			
			if (str.includes("등산")) {
				var activity1 = document.querySelector('#activity2');
				activity2.setAttribute("checked", '');
	    	}
			
			if (str.includes("스키")) {
				var activity1 = document.querySelector('#activity3');
				activity3.setAttribute("checked", '');
	    	}
			
			if (str.includes("계곡")) {
				var activity1 = document.querySelector('#activity4');
				activity4.setAttribute("checked", '');
	    	}
			
			if (str.includes("해수욕")) {
				var activity1 = document.querySelector('#activity5');
				activity5.setAttribute("checked", '');
	    	}
	    }
	    
	    window.document.onload = setCampsiteGroup(campsiteGroup);
	    window.document.onload = setComforts(comforts);
	    window.document.onload = setActivity(activity);
	</script>
	<jsp:include page="../../include/footer.jsp"></jsp:include>	
</body>
</html>