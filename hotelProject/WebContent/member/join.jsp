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
	div.joinsuccess{
		width: 60%;
		height: 800px;
		margin-left: 400px;
		margin-top: 70px;
	}
	
	div.joinsuccess2{
		width: 60%;
		height: 300px;
		margin-left: 250px;
		margin-top: 50px;
		border: 5px solid #F2D1B3;
		text-align: center;
	}
</style>
<%
	String name=request.getParameter("name");
	String id=request.getParameter("id");
%>
</head>
<body>
<div class="joinsuccess">
	<h2 style="color: #8C4C27;">�׷��̽� ����</h2>
	<hr style="height: 2px;background: gray;">
	<h2 style="color: #8C4C27;text-align: center;">�����մϴ�</h2>
	<h3 style="text-align: center;"><%= name %>�Բ����� �׷��̽��� ���������� ���ԵǼ̽��ϴ�.</h3>
	<div class="joinsuccess2">
		<br><br><br>
		<span><b style="font-size: 2em;color: #A6A6A6;">���̵� | </b></span><span><b style="font-size: 2em;color:#8C4C27; ">  <%= id %></b></span>
		<br><br>
		<h4>�α��� �Ͻ� �� �پ��� ���ð� ���񽺸� �����غ��ñ� �ٶ��ϴ�.</h4>
			<br><br>
		<button class="button" style="color: white;width: 150px;height: 50px;text-align: center;background-color: #260101;font-size: 1.3em;" onclick="location.href='main.jsp?go=login/loginform.jsp'" >�α���</button>
	</div>
</div>
</body>
</html>