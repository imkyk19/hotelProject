<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">

.input{
		border: 1px solid #BFBCBA;
		height: 30px;
	}
	.input:hover{
		cursor: text;
	}
	.input:focus{
		outline: 1px solid #808080;
		
	}
	button{
		cursor: pointer;
		border: 0px solid;
		background-color: #735236;
		color: white;
		font-style: bold;
		border-radius: 2px;
		height: 30px;
	}
	button:active{
		outline: none;
	}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String key=request.getParameter("key");//처음 호출시 null
	if(key==null){
		//null값인 경우 form을 나타냄
		%>
		<div style="margin: 10px 30px;">
		<form action="idcheck.jsp" method="post" class="form-line">
			<b>아이디를 입력해주세요</b><br>
			<input type="text" name="id" class="input" style="width: 130px;float: left;" autofocus required placeholder="아이디 입력">
			
			<input type="hidden" name="key" value="yes">
			<button type="submit" class="button" style="margin-left: 10px;color: white;">중복 체크</button>
		</form>
		</div>
	<% }else{
		//action 처리
		String id=request.getParameter("id");
		//dao선언 후 아이디가 db에 존재하는지 확인
		GuestDao dao=new GuestDao();
		boolean b=dao.isIdCheck(id);
		if(b){
			//존재하는 경우
			%>
			<div style="margin: 10px 30px;">
			<h6><%= id %>는 이미 가입된 아이디입니다</h6>
			<button type="button" class="button" onclick="location.href='idcheck.jsp'">다시입력</button>
			</div>
		<% }else{
			//존재하지 않는 경우
			%>
				<div style="margin: 10px 30px;">
				<b><%= id %>는 사용가능한 아이디입니다</b><br>
				<button type="button" class="button" onclick="saveId('<%=id%>')">적용하기</button>
				<button type="button" class="button" onclick="location.href='idcheck.jsp'">다시입력</button>
				</div>
		<% }
		
	}
%>
<script type="text/javascript">
function saveId(id){
		//부모창 : opener
		opener.memberfrm.idsel.value=id;
		//현재창 닫기
		window.close();
}
</script>
</body>
</html>