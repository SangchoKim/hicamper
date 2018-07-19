<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 캠핑장 찾기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/glnav.css">
    <link href="/resources/css/footer.css" rel="stylesheet">
    <style>
    	.container-fluid {
    		margin-top: 60px;    		
    	}
    	
    	.search {
    		margin-bottom: 10px;
    	}
    	
        .filter {
            border: 1px solid rgba(221, 217, 217, 0.5);
            background: rgba(221, 217, 217, 0.424);
            padding: 0;
            height: 98vh;
            overflow: auto;
        }
        
        .campsite-list {
            border: 1px solid rgba(221, 217, 217, 0.5);
            margin-bottom: 1rem;
            padding: 10px;
            min-height: 400px;                                    
        }
        
        .campsite-list div {
        	margin: 5px;
        }

        .form-row {
            margin-bottom: 10px;
        }

        .a-row {
            display: block;
        }

        .menu {
            margin-bottom: 10px;
        }

        .campsite-img {
            display: block;
            width: 100%;
        }     
        
        .input-search {
			display: inline-block;
			width: 15%;			
			padding: 1.2rem;			
			border-top-right-radius: 0;
			border-bottom-right-radius: 0;
			border: 1px solid rgba(128, 128, 128, 0.5);			
		}

		.btn-search {
			background-color: rgba(235, 229, 229, 0.9);
			border: none;
			padding: 1.3rem;
			border-top-right-radius: 1rem;
			border-bottom-right-radius: 1rem;
		}
        
        .btn-filter-search {
        	display: block;
        	width: 100%;
        }
        
        .content-center {
        	height: 98vh;
	       	overflow: auto;
        }
        
        .content-right {
            height: 98vh;            
        }
        
        .bakset-info {
        	position: absolute;
        	top: 100px;
        	left: 50px;
        	z-index: 100;
        	background-color: rgba(221, 217, 217);
        	width: 250px;
        	height: 150px;			      			
			text-align: center;						        	
        	display: none;
        }
        
        .btn-x {
        	position: absolute;
        	top: 0;
        	right: 0;     	
        }
        
        .price {
        	color: red;
        }
        
        .campsite-list:hover {
        	transform: scale(1.05);
        }
        
        .glyphicon-star {
        	color: orange;
        }
        
        .glyphicon-star-empty {
        	color: gray;
        }
            
		.pagination {
			text-align: center;
		}
    </style>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>        
    <div class="container-fluid">
    	<div class="search" align="center">
	    	<form action="/lookup" method="post">
		        <input type="text" placeholder="검색" name="search" class="btn input-search"><button type="submit" class="btn-search"><i class="fa fa-search"></i></button>
		    </form>
	    </div>
	    
        <div class="row">
            <div class="search-content">           		
                <div class="col-sm-2 filter">                  
                    <form action="/filter/filterlist">
                        <span>체크인</span>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' class="form-control" name="check_in" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        
                        <span>체크아웃</span>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' class="form-control" name="check_out" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>                       

                        <div class="form-row">
                            <a href="#menu1" class="a-row btn btn-default" data-toggle="collapse">캠핑종류</a>
                        </div>
                        <div id="menu1" class="collapse in menu">                                
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="campsite_group" id="cg1" value="오토캠핑">
                                <label for="cg1" class="form-check-label">오토캠핑</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="campsite_group" id="cg2" value="백팩킹">
                                <label for="cg2" class="form-check-label">백팩킹</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="campsite_group" id="cg3" value="글램핑">
                                <label for="cg3" class="form-check-label">글램핑</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="campsite_group" id="cg4" value="카라반">
                                <label for="cg4" class="form-check-label">카라반</label>
                            </div>                           
                        </div>

                        <div class="form-row">
                            <a href="#menu2" class="a-row btn btn-default" data-toggle="collapse">수용인원</a>
                        </div>                            
                        <div id="menu2" class="collapse in">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="accept_people" id="r1" value="4">
                                <label for="r1" class="form-check-label">4인 이상</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="accept_people" id="r2" value="8">
                                <label for="r2" class="form-check-label">8인 이상</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="accept_people" id="r3" value="12">
                                <label for="r3" class="form-check-label">12인 이상</label>
                            </div>
                        </div>

                        <div class="form-row">
                            <a href="#menu3" class="a-row btn btn-default" data-toggle="collapse">편의시설</a>
                        </div>
                        <div id="menu3" class="collapse in">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="comforts" id="c1" value="샤워실">
                                <label for="c1" class="form-check-label">샤워실</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="comforts" id="c2" value="매점">
                                <label for="c2" class="form-check-label">매점</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="comforts" id="c3" value="수영장">
                                <label for="c3" class="form-check-label">수영장</label>
                            </div>
                        </div>

                        <div class="form-row">
                            <a href="#menu4" class="a-row btn btn-default" data-toggle="collapse">액티비티</a>
                        </div>
                        <div id="menu4" class="collapse in">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="activity" id="c4" value="등산">
                                <label for="c4" class="form-check-label">등산</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="activity" id="c5" value="계곡">
                                <label for="c5" class="form-check-label">계곡</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="activity" id="c6" value="낚시">
                                <label for="c6" class="form-check-label">낚시</label>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <a href="#menu5" class="a-row btn btn-default" data-toggle="collapse">가격</a>
                        </div>
                        <div id="menu5" class="collapse in">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="price" id="r4" value="30000">
                                <label for="r4" class="form-check-label">30,000 이하</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="price" id="r5" value="50000">
                                <label for="r5" class="form-check-label">50,000 이하</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="price" id="r6" value="100000">
                                <label for="r6" class="form-check-label">100,000 이하</label>
                            </div>
                        </div>                        
                        <div class="form-row">
                            <input type="submit" class="btn btn-primary btn-filter-search" value="검색">
                        </div>
                    </form>
                </div>
               
                <div class="col-sm-7">
                    <div class="content-center">
                    	<c:if test="${!empty result}">
							<c:forEach var="result" items="${result}">
								<div class="col-sm-4">
									<div class="campsite-list">
										<div class="campsite-img-frame">
											<img src="/resources/fileupload/${result.saveFileName}" alt="${result.filename}" class="campsite-img">										
										</div>
		                                <div class="name">${result.campsite_name}</div>
		                                <div class="address">
		                                    <a href="#" onclick="setPoint(event)">${result.address}</a>
		                                </div>
		                                <div class="price">
		                                	<strong><fmt:formatNumber value="${result.price}" pattern="#,###" /></strong> 원		                                	
		                               	</div>
		                                <div class="rating">
		                                	<c:if test="${result.score le 0}">
		                                		<c:forEach varStatus="status" begin="1" end="5">
		                                			<span class="glyphicon glyphicon-star glyphicon-star-empty"></span>
		                                		</c:forEach>
		                                	</c:if>
		                                	
		                                	<c:if test="${result.score gt 0}">
			                                	<c:forEach varStatus="status" begin="1" end="5">		                                		
			                                		<c:if test="${result.score ge status.current}">
			                                			<span class="glyphicon glyphicon-star"></span>
			                                		</c:if>
			                                		<c:if test="${result.score lt status.current}">
			                                			<span class="glyphicon glyphicon-star glyphicon-star-empty"></span>
			                                		</c:if>			                                		
			                                	</c:forEach>		                                	
			                                	(<fmt:formatNumber value="${result.score}" pattern=".0"/>)
		                                	</c:if>
		                                </div>
		                                <a href="/user/addbasket?campsite_no=${result.campsite_no}" class="btn btn-success" onclick="addItemOnBasket(event);">장바구니</a>
		                                <div class="bakset-info">
		                                	<button class="btn btn-x" onclick="closeBasketInfo(event);">X</button>
		                                	<br/>
		                                	<br/>
		                                	<p>상품이 장바구니에 담겼습니다</p>
		                                	<br/>
		                                	<a href="/user/showbasket" class="btn btn-default">장바구니 가기</a>		                                	
		                                </div>
		                                <a href="/user/showbookingpage?campsite_no=${result.campsite_no}" class="btn btn-primary">예약하기</a>
                            		</div>
                        		</div>
	                        </c:forEach>	                            
                        </c:if>
                        
                        <div class="pagination col-sm-12">
	                        <ul class="pagination">
	                        	<c:if test="${pageMap.currentPage eq 1}">
	                        		<li>
	                        			<a href="#">이전</a>
	                        		</li>                        		
	                        	</c:if>
								<c:if test="${pageMap.currentPage ne 1}">
									<c:if test="${1 eq pageMap.method}">
										<li>
		                        			<a href="/filter/filterlist?${pageMap.strParam}pages=${pageMap.prevPage}">이전</a>
										</li>
									</c:if>

									<c:if test="${2 eq pageMap.method}">
										<li>
		                        			<a href="/lookup?${pageMap.strParam}pages=${pageMap.prevPage}">이전</a>
										</li>
									</c:if>

									<c:if test="${3 eq pageMap.method}">
										<li>
		                        			<a href="/filter/showlist?${pageMap.strParam}pages=${pageMap.prevPage}">이전</a>
										</li>
									</c:if>
	                        	</c:if>
	                        	<c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}" step="1">
 	                        		<c:if test="${1 eq pageMap.method}">
 	                        		<c:choose>
	                         			<c:when test="${i eq pageMap.currentPage}">
	                         				<li class="active">
	                         					<a href="/filter/filterlist?${pageMap.strParam}pages=${i}">${i}</a>	
	                         				</li>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<li>
		                        				<a href="/filter/filterlist?${pageMap.strParam}pages=${i}">${i}</a>
	                        				</li>
	                        			</c:otherwise>
	                        		</c:choose>
 	                        		</c:if>
 	                        		<c:if test="${2 eq pageMap.method}">
 	                        		<c:choose>
	                         			<c:when test="${i eq pageMap.currentPage}">
	                         				<li class="active">
	                         					<a href="/lookup?${pageMap.strParam}pages=${i}">${i}</a>	
	                         				</li>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<li>
		                        				<a href="/lookup?${pageMap.strParam}pages=${i}">${i}</a>
	                        				</li>
	                        			</c:otherwise>
	                        		</c:choose>
 	                        		</c:if>
 	                        		<c:if test="${3 eq pageMap.method}">
 	                        		<c:choose>
	                         			<c:when test="${i eq pageMap.currentPage}">
	                         				<li class="active">
	                         					<a href="/filter/showlist?${pageMap.strParam}pages=${i}">${i}</a>	
	                         				</li>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<li>
		                        				<a href="/filter/showlist?${pageMap.strParam}pages=${i}">${i}</a>
	                        				</li>
	                        			</c:otherwise>
	                        		</c:choose>
 	                        		</c:if>
	                        	</c:forEach>
	                        	<c:if test="${pageMap.currentPage ne pageMap.endPage || pageMap.next eq true}">
	                        		<c:if test="${1 eq pageMap.method}">
		                        		<li>
		                        			<a href="/filter/filterlist?${pageMap.strParam}pages=${pageMap.nextPage}">다음</a>
	    	                    		</li>
	                        		</c:if>

	                        		<c:if test="${2 eq pageMap.method}">
		                        		<li>
		                        			<a href="/lookup?${pageMap.strParam}pages=${pageMap.nextPage}">다음</a>
	    	                    		</li>
	                        		</c:if>

	                        		<c:if test="${3 eq pageMap.method}">
		                        		<li>
		                        			<a href="/filter/showlist?${pageMap.strParam}pages=${pageMap.nextPage}">다음</a>
	    	                    		</li>
	                        		</c:if>
	                        	</c:if>
	                        	<c:if test="${pageMap.endPage eq pageMap.currentPage && pageMap.next ne true}">
	                        		<li>
	                        			<a href="#">다음</a>
	                        		</li>                    		              		
	                        	</c:if>
							</ul>
                        </div>
                        
                    </div>
				</div>
				
				<div class="col-sm-3">
                    <div class="content-right">
                        <div id="map" style="width:100%; height:95vh;"></div>
                    </div>
                </div>
			</div>
                
        </div>           
    </div>
		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/resources/js/ko.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33ce5896736377936ebe7d42238ed01f&libraries=services"></script>    
    <script type="text/javascript">
    
		/* 체크인 & 체크아웃 */
        $(function () {
            $('#datetimepicker1').datetimepicker({               
                locale: 'ko',
                format: 'YYYY-MM-DD',
                minDate: moment()
            });
            $('#datetimepicker2').datetimepicker({
                locale: 'ko',
                format: 'YYYY-MM-DD',
                minDate: moment(),
                useCurrent: false //Important! See issue #1075
            });
            $("#datetimepicker1").on("dp.change", function (e) {
                $('#datetimepicker2').data("DateTimePicker").minDate(e.date.add(1, 'd'));
            });
            $("#datetimepicker2").on("dp.change", function (e) {
                $('#datetimepicker1').data("DateTimePicker").maxDate(e.date.subtract(1, 'd'));
            });
        });
        
		/* 지도 */             
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 8 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new daum.maps.Map(mapContainer, mapOption); 
        
        // 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();       
                
        // 주소로 좌표를 검색합니다
        var address = '';
        var campsite = '';
        address = document.getElementsByClassName('address')[0].innerText;
        campsite = document.getElementsByClassName('name')[0].innerText;         
        
        geocoder.addressSearch(address, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === daum.maps.services.Status.OK) {

                var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new daum.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new daum.maps.InfoWindow({
                    content: `<div style="width:150px;text-align:center;padding:6px 0;">`+campsite+"</div>"
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });
        
        function setPoint(e) {                     
            var target = event.target;
            
            address = target.firstChild.nodeValue;
            campsite = target.parentNode.previousSibling.previousSibling.firstChild.nodeValue;
            
            geocoder.addressSearch(address, function(result, status) {            
                if (status === daum.maps.services.Status.OK) {                	
                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new daum.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new daum.maps.InfoWindow({
                        content: `<div style="width:150px;text-align:center;padding:6px 0;">`+campsite+"</div>"
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });
        }
        
        // 장바구니       
        var addItemOnBasket = function(event) {
        	event.preventDefault();
        	e = event;
        	var idx = event.target.href.indexOf("=");
        	var cam_no = event.target.href.slice(idx+1);        	 
        	
        	$.ajax({        	
    			type : "GET",
    			url : "/user/addbasket",    			
    			data : {
					"campsite_no" : cam_no
				},
    			
    			success : function(data) {					
    				if (data == 0) {    					
    					var node = e.target.nextElementSibling
    		        	node.style.display = "block";
    				} else if (data == 1) {    					
    					var node = e.target.nextElementSibling
    		        	node.style.display = "block";
    				} else if (data == -2) {    					
    					alert('일반 회원만 이용가능한 기능입니다.');
    					location.href = "/common/login";
    				}
    			},
    		});        	     	
        }
       
        var closeBasketInfo = function (event) {
        	event.target.parentElement.style.display = "none";        	
        }
        	 
    </script>
    <script>
		function goPage(pages, lines) {
			var strParam = ${pageMap.strParam};
		    location.href = '?' + strParam + "pages=" + pages;
		}
	</script> 
 <jsp:include page="../include/footer.jsp"></jsp:include>	   
</body>
</html>