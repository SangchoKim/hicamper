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
	<title>하이캠퍼! | 일반 회원 가입</title>
	<link rel="stylesheet" href="/resources/css/bootstrap/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-3.3.1.min.js.js"></script>
	<style>
		.logo-frame {
			text-align: center;
		}

		.logo-frame img {			
			width: 300px;
		}
		
		.info {
			text-align: center;
		}
	</style>
</head>	
<body>
	<div class="container">
		<div class="jumbotron">
			<div class="logo-frame">
				<a href="/">
					<img src="/resources/img/logo2.png" alt="logo">
				</a>
			</div>
			<div class="info">
				<h2>유저 회원가입</h2>
			</div>
			<form action="/common/usersignup" method="post" class="form">
				<div class="form-group">
					<label for="menu1">아이디</label>
					<input type="text" class="form-control" id="id" placeholder="아이디" name="id" autofocus>
					<div id="id-check"></div>					
				</div>
				<div class="form-group">
					<label for="menu2">비밀번호</label>
					<input type="password" class="form-control" id="menu2" placeholder="비밀번호" name="password">
				</div>
				<div class="form-group">
					<label for="menu3">비밀번호 확인</label>
					<input type="password" class="form-control" id="menu3" placeholder="비밀번호 확인">
					<div id="password-check"></div>
				</div>
				<div class="form-group">
					<label for="menu4">이름</label>
					<input type="text" class="form-control" id="menu4" placeholder="이름" name="name">
				</div>
				<div class="form-group">
					<label for="menu5">이메일</label>
					<input type="email" class="form-control" id="menu5" placeholder="예) kdhong@hanmail.net" name="email">
				</div>				
				<div class="form-group">
					<strong>성별</strong>
					<label class="radio-inline" for="menu7">
						<input type="radio" name="gender" id="menu7" value="남자" checked>남자
					</label>
					<label class="radio-inline" for="menu8">
						<input type="radio" name="gender" id="menu8" value="여자">여자
					</label>
				</div>				
				<div class="form-group">
					<strong>생년월일</strong>
					<select name="birthyear" id="birthyear">
						<option value="">선택</option><option value="1920">1920</option><option value="1921">1921</option><option value="1922">1922</option><option value="1923">1923</option><option value="1924">1924</option><option value="1925">1925</option><option value="1926">1926</option><option value="1927">1927</option><option value="1928">1928</option><option value="1929">1929</option><option value="1930">1930</option><option value="1931">1931</option><option value="1932">1932</option><option value="1933">1933</option><option value="1934">1934</option><option value="1935">1935</option><option value="1936">1936</option><option value="1937">1937</option><option value="1938">1938</option><option value="1939">1939</option><option value="1940">1940</option><option value="1941">1941</option><option value="1942">1942</option><option value="1943">1943</option><option value="1944">1944</option><option value="1945">1945</option><option value="1946">1946</option><option value="1947">1947</option><option value="1948">1948</option><option value="1949">1949</option><option value="1950">1950</option><option value="1951">1951</option><option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option><option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option>
					</select>
					년
					<select name="birthmonth" id="birthmonth">
						<option value="">선택</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
					</select>
					월
					<select name="birthdate" id="birthdate">
						<option value="">선택</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
					</select>
					일
				</div>
				<div class="form-group">
					<label for="menu9">전화번호</label>
					<input type="text" class="form-control" name="phone_num" id="menu9" placeholder="예) 010-4420-2080">
				</div>				
				
				<input type="submit" class="btn btn-primary btn-block" value="가입하기">
			</form>
		</div>
	</div>
	
	<script>
		var isDuplicated = true;
		var isMatched = false;
		
		$('#id').change(function (event) {
			$.ajax({
				type : "GET",
				url : "/common/checkid",
				data : {
					"id" : $('#id').val()
				},
	
				success : function(data) {
					if (data == "0") {
						$('#id-check').text('사용가능한 아이디입니다');
						$('#id-check').css('color', 'green');
						isDuplicated = false;
					} else {
						$('#id-check').text('중복되는 아이디입니다');
						$('#id-check').css('color', 'red');
						isDuplicated = true;
					}
				},
			});
		})
		
		$('#menu2').change(function (event) {
			if ($('#menu2').val() != $('#menu3').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');
				isMatched = false;
			}
			
			if ($('#menu2').val() == $('#menu3').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');
				isMatched = false;
			}			
		})
		
		$('#menu3').change(function (event) {
			if ($('#menu2').val() != $('#menu3').val()) {
				$('#password-check').text('비밀번호가 일치하지 않습니다');
				$('#password-check').css('color', 'red');
				isMatched = false;
			}
			
			if ($('#menu2').val() == $('#menu3').val()) {
				$('#password-check').text('비밀번호가 일치합니다');
				$('#password-check').css('color', 'green');
				isMatched = false;
			}			
		})
	
		$('form').submit(function (event) {			
			if ($('#id').val() == '') {
				alert('아이디를 입력해주세요');
				event.preventDefault();			
			} else if ($('#menu2').val() == '') {
				alert('비밀번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu3').val() == '') {
				alert('비밀번호 확인을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu4').val() == '') {
				alert('이름을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu5').val() == '') {
				alert('이메일을 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu9').val() == '') {
				alert('전화번호를 입력해주세요');
				event.preventDefault();				
			} else if ($('#menu2').val() != $('#menu3').val()) {
				alert('비밀번호가 일치하지 않습니다');
				event.preventDefault();				
			} else if ($('#birthyear option:selected').text() == '선택') {
				alert('출생년도를 선택해주세요');
				event.preventDefault();
			} else if ($('#birthmonth option:selected').text() == '선택') {
				alert('출생월을 선택해주세요');
				event.preventDefault();
			} else if ($('#birthdate option:selected').text() == '선택') {
				alert('출생일을 선택해주세요');
				event.preventDefault();
			} else if (isDuplicated == true) {
				alert('아이디 중복확인을 해주세요');
				event.preventDefault();
			}		
		})
	</script>
</body>
</html>