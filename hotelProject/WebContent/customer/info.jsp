<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.information{
		border: 1px solid gray;
	}
	
	div.infomenu{
		position: absolute;
		width: 300px;
		height: 250px;
		border: 1px solid gray;
		margin-top: 50px;
		margin-left: 300px;
		font-size: 1.3em;
		cursor: pointer;
		background-color: #FAEBD0;
		padding: 10px 20px;
	}
	
	div.map{
		width: 900px;
		height: 1000px;
		border: 1px solid gray;
		margin-top: 50px;
		margin-left: 700px;
		font-size: 1.3em;
	}
</style>
</head>
<body>
<div class="information">
	<div class="infomenu">
	<h2>고객센터</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=customer/info.jsp'">연락처 및 오시는길</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/question.jsp'">문의하기</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/questioncheck.jsp'">문의확인</span>
	</div>
	
	<div class="map">
	<h2>오시는 길</h2>
	</div>
	
</div>
</body>
</html>