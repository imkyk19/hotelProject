<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	body *{
		font-family: 'Noto Serif KR';
	}
	div.loginform{
		height: 700px;
		position: absolute;
		left: 600px;
	}
	
	div.loginform div.joinform{
		border: 1px solid black;
		position: absolute;
		width: 500px;
		height: 300px;
		left: 150px;
	}
	div.loginform table.joinform{
		position: absolute;
		border-collapse: collapse;
		width: 500px;
		height: 300px;
		left: 150px;
		
	}
	
</style>
</head>
<body>
<div class="loginform">
	<h2 style="color: #8C4C27;">로그인</h2>
	<hr style="background: #260F01;height: 5px;">
	<br> <br>
	<h2 style="text-align: center; color:#8C4C27; ">어쩌구호텔에 오신 것을 환영합니다.</h2>
	<br>
	<h5 style="text-align: center;">번호와 비밀번호를 입력해 주시기 바랍니다.</h5>
	<h6 style="text-align: center; color: #aaa;">※회원이 되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다</h6>
	<br> <br>
	
	
	<table class="joinform table talbe-bordered">
		<tr style="height: 30px; text-align: center; ">
			<th style="text-align: center;">회원 <hr style="background: #BF8975;height: 7px;"></th><th style="text-align: center;">비회원</th>
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td><input type="text"  placeholder="번호 또는 아이디 입력" style="text-align: left;"></td>
			<td rowspan="2" align="center"><button type="button" style="width: 120px; height: 50px;background-color: #402A22;color: white;">로그인</button></td>
			
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td><input type="password"  placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#F2DAC4">
				<input type="checkbox">번호 또는 아이디 저장
			</td>
		</tr>
		<tr align="center" bgcolor="#F2DAC4">
			<td colspan="2">
			<button style="background-color: #402A22; color: white; width: 50px;">가입</button>
			<button style="background-color: #BF8975; color: white; width: 100px;">아이디찾기</button>
			<button style="background-color: #BF8975; color: white; width: 110px;">비밀번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<img src="../image/구글로그인.JPG">
			</td>
		</tr>
	</table>
		
	
</div>
</body>
</html>