<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	div.loginform{
		width: 800px;
		height: 700px;
		position: absolute;
		left: 600px;
		margin-top: 200px;
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
		border: 1px solid gray;
		border-collapse: collapse;
		width: 500px;
		height: 300px;
		left: 150px;
		
	}
	
</style>
</head>
<body>
<div class="loginform">
	<h2>로그인</h2>
	<hr>
	<br> <br>
	<h2 style="text-align: center;">호텔에 오신 것을 환영합니다.</h2>
	<br>
	<h5 style="text-align: center;">신라워즈 번호와 비밀번호를 입력해 주시기 바랍니다.</h5>
	<h6 style="text-align: center;">※회원이 되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다</h6>
	<br> <br>
	
	
	<table class="joinform table table-bordered">
		<tr style="height: 30px;">
			<th>회원</th><th>비회원</th>
		</tr>
		<tr style="height: 30px;">
			<td><input type="text"  placeholder="번호 또는 아이디 입력"></td>
			<td rowspan="2"><button type="button" style="width: 100px; height: 50px;">로그인</button></td>
			
		</tr>
		<tr style="height: 30px;">
			<td><input type="password"  placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="checkbox">번호 또는 아이디 저장
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button>가입</button>
			<button>아이디찾기</button>
			<button>비밀번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>구글 로그인</button>
			</td>
		</tr>
	</table>
		
	
</div>
</body>
</html>