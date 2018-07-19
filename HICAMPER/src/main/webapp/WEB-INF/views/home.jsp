<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>하이캠퍼! | 캠핑장 예약 1위</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Gothic" rel="stylesheet">
	<link href="/resources/css/glnav.css" rel="stylesheet">
	<link href="/resources/css/footer.css" rel="stylesheet">
	<style type="text/css">
		h3 {
			font-family: 'Jua', sans-serif;			
		}
		
		h1 {
			font-family: 'Jua', sans-serif;			
		}			

		p {
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 1.6rem;
		}
				
		section {
			background-attachment: fixed;
			height: 100vh;
			background-size: cover;
		}

		.search {
			margin-top: 50px;
			background-image: url('/resources/img/search-bg.jpg');
		}		

		.search-content {
			width: 50%;
			position: relative;
			left: 50%;
			top: 30%;
			transform: translateX(-50%) translateY(-50%);
			text-align: center;			
		}

		.search-info {
			margin-bottom: 24px;
		}
		
		.input-search {
			display: inline-block;
			width: 50%;			
			padding: 1.2rem;			
			border-top-right-radius: 0;
			border-bottom-right-radius: 0;
			border: 1px solid rgba(128, 128, 128, 0.5);			
		}

		.btn-search {
			background-color: rgba(235, 229, 229, 0.918);
			border: none;
			padding: 1.25rem;
			border-top-right-radius: 1rem;
			border-bottom-right-radius: 1rem;
		}

		.fa-search {
			padding: 0 2rem;
		}				
		
		.quick-search {
			background-image: url('/resources/img/sky.jpg');
			color: white;
			opacity: 0.9;
			overflow: auto;			
		}

		.img-frame {
			height: 100vh;			
		}

		.quick-search figure {
			margin-top: 22vh;			
		}

		.quick-search img {
			height: 50vh;
			border-top-left-radius: 1rem;
			border-top-right-radius: 1rem;
			width: 100%;			
		}		
		
		.quick-search figcaption {
			text-align: center;
			border-right: 1px solid white;
			border-bottom: 1px solid white;
			border-left: 1px solid white;
			border-bottom-left-radius: 1rem;
			border-bottom-right-radius: 1rem;
			padding: 1.1rem;
		}

		.quick-search figcaption h3 {
			margin-top: 0;
		}

		.quick-search h3:after {
			content: '';
			display: block;
			width: 30%;
			margin: 1rem auto;						
			border-bottom: 1px solid white;
		}

		.hosting {
			background-image: url('/resources/img/campfire.jpg');
			overflow: auto;			
		}

		.hosting-content {
			width: 50%;
			position: relative;			
			left: 50%;
			top: 24%;
			transform: translateX(-50%) translateY(-50%);
			text-align: center;			
			color: white;
		}		

		.btn-camp {
			padding: 1.3rem;
			margin: 1.5rem;
		}

		.hosting-content h3 {
			width: fit-content;							
			margin: 0 auto;	
			padding: 1rem;
			background: rgba(218, 182, 182, 0.8);
			color: black;
		}

		.hosting-content p {			
			max-width: 30%;
			margin: 1rem auto;
			line-height: 3rem;
			background: rgba(255, 255, 255, 0.8);
			color: black;
			font-weight: bolder;
		}
		
		.box {
		 	border-radius: 25px;
			background : rgba(234, 234, 234, 0.8);
			display: inline-block;			
			text-align: center;			
			width: 50%;			
		}
		
		.hosting-caption {
			margin-top: 300px;
		}		
		
		.box img {
			width: 30%;
		}						
		
		.affliate {			
			background-image: url('/resources/img/background4.jpg');
			opacity: 0.95;
			overflow: auto;
		}
		
		.title_affliate {
			margin-top: 80px;
		}
		
		.group_logo {
			margin: 30px;
		}
		
		.box_affliate img {
			width: 100%;
		}
		
		.title_affliate {
			text-align: center;
		}
	</style>
</head>
<body>	
	<jsp:include page="./include/header.jsp"></jsp:include>	
	<section class="search">
		<div class="search-content">
			<div class="search-info">
				<h3>원하는 캠핑장을 검색해보세요!</h3>
				<p>(지역 또는 캠핑 종류로 검색)</p>
			</div>
			<form action="/lookup" method="get" id="form_search">
				<input type="text" id="search" name="search" class="btn input-search"><button type="submit" class="btn-search"><i class="fa fa-search"></i></button>
			</form>
		</div>
	</section>
	
	<section class="quick-search">
		<div class="quick-search-content">
			<div class="col-sm-3 img-frame">
				<figure>
					<a href="/filter/filterlist?checkin=&checkout=&campsite_group=오토캠핑">
						<img src="/resources/img/autocamping.jpg" alt="오토캠핑">
					</a>
				</figure>
				<figcaption>
					<h3>오토캠핑</h3>
					<p>캠핑카를 타고 야영!</p>
				</figcaption>
			</div>

			<div class="col-sm-3 img-frame">
				<figure>
					<a href="/filter/filterlist?checkin=&checkout=&campsite_group=글램핑">
						<img src="/resources/img/glamping.jpg" alt="글램핑">
					</a>
				</figure>
				<figcaption>
					<h3>글램핑</h3>
					<p>럭셔리하게 즐기는 캠핑!</p>
				</figcaption>				
			</div>

			<div class="col-sm-3 img-frame">
				<figure>
					<a href="/filter/filterlist?checkin=&checkout=&campsite_group=백팩킹">
						<img src="/resources/img/backpacking.jpg" alt="백팩킹">
					</a>
				</figure>
				<figcaption>
					<h3>백팩킹</h3>
					<p>가방 하나 들고 떠나는 낭만 캠핑!</p>
				</figcaption>
			</div>

			<div class="col-sm-3 img-frame">
				<figure>
					<a href="/filter/filterlist?checkin=&checkout=&campsite_group=카라반">
						<img src="/resources/img/trailer.jpg" alt="카라반">
					</a>
				</figure>
				<figcaption>
					<h3>카라반</h3>
					<p>만능 카라반과 함께 즐거운 캠핑!</p>
				</figcaption>
			</div>
		</div>
	</section>

	<section class="hosting">
		<div class="hosting-content">
			<h3>호스트가 되어보세요!</h3>
			<p>간단한 캠핑장 등록 과정을 체험해보세요. 등록은 쉽지만 <strong style="color: rgb(255, 166, 0);">홍보 효과</strong>는 강력합니다!</p>
			<a href="/host/addcamp" class="btn btn-primary btn-camp">캠핑장 등록하기</a>
		</div>
		
		<div class="hosting-caption">							
			<div class="col-sm-4 text-center">
				<div class="box">
					<img alt="설명1" src="/resources/img/signup.png">	
					<div class="content_title">
						<h3>STEP 1<br> 호스트 회원가입</h3>
					</div>
					<div class="content">
						<p>
							캠핑장 홍보부터 예약까지 모두 가능!
							<br>
							회원가입을 통해 하이캠퍼가 되어보세요.
						</p>
					</div>
				</div>				
			</div>
			<div class="col-sm-4 text-center">
				<div class="box">
					<img alt="설명2" src="/resources/img/tent.png">
					<div class="content_title">
						<h3>STEP 2 <br>캠핑장 등록</h3>
					</div>
					<div class="content">
						<p>아름다운 캠핑장과 객실을 등록해보세요.</p>
					</div>
				</div>				
			</div>
			<div class="col-sm-4 text-center">
				<div class="box">
					<img alt="설명3" src="/resources/img/using.png">
					<div class="content_title">
						<h3>STEP 3 <br>예약자와의 만남</h3>
					</div>
					<div class="content">
						<p>캠핑장을 예약한 고객과의 만남이 기다립니다!</p>
					</div>	
				</div>		
			</div>
		</div>
	</section>
	
	<section class="affliate">
		<div class="col-sm-6 col-sm-offset-3" >
			<div class="title_affliate">			
				<h1 class="title_name">제휴 기업...이면 좋겠네!</h1>
			</div>
			<div class="row group_logo">		
				<div class="contents_logo" >
					<div class="col-sm-2 col-sm-offset-3">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/android.png">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/facebook.png">
						</div>
					</div>
						<div class="col-sm-2">
							<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/google-plus.png">
						</div>
					</div>
				</div>		
			</div>
			<div class="row group_logo">				
				<div class="contents_logo">
					<div class="col-sm-2 col-sm-offset-3 text-center" >
						<div class="box_affliate">
							<img class="content_img" alt="로고" src="/resources/img/instagram.png">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/linkedin.png">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/skype.png">
						</div>
					</div>
				</div>				
			</div>
			<div class="row group_logo">			
				<div class="contents_logo">
					<div class="col-sm-2 col-sm-offset-3">
						<div class="box_affliate text-center">
						<img class="content_img" alt="로고" src="/resources/img/snapchat.png">
					</div>
				</div>
					<div class="col-sm-2">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/twitter.png">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="box_affliate text-center">
							<img class="content_img" alt="로고" src="/resources/img/youtube-logo.png">
						</div>
					</div>
				</div>						
			</div>			
		</div>
	</section>
		<jsp:include page="./include/footer.jsp"></jsp:include>		
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<script src="/resources/css/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
