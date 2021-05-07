<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���̵� �Է�</title>
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
	String key=request.getParameter("key");//ó�� ȣ��� null
	if(key==null){
		//null���� ��� form�� ��Ÿ��
		%>
		<div style="margin: 10px 30px;">
		<form action="idcheck.jsp" method="post" class="form-line">
			<b>���̵� �Է����ּ���</b><br>
			<input type="text" name="id" class="input" style="width: 130px;float: left;" autofocus required placeholder="���̵� �Է�">
			
			<input type="hidden" name="key" value="yes">
			<button type="submit" class="button" style="margin-left: 10px;color: white;">�ߺ� üũ</button>
		</form>
		</div>
	<% }else{
		//action ó��
		String id=request.getParameter("id");
		//dao���� �� ���̵� db�� �����ϴ��� Ȯ��
		GuestDao dao=new GuestDao();
		boolean b=dao.isIdCheck(id);
		if(b){
			//�����ϴ� ���
			%>
			<div style="margin: 10px 30px;">
			<h6><%= id %>�� �̹� ���Ե� ���̵��Դϴ�</h6>
			<button type="button" class="button" onclick="location.href='idcheck.jsp'">�ٽ��Է�</button>
			</div>
		<% }else{
			//�������� �ʴ� ���
			%>
				<div style="margin: 10px 30px;">
				<b><%= id %>�� ��밡���� ���̵��Դϴ�</b><br>
				<button type="button" class="button" onclick="saveId('<%=id%>')">�����ϱ�</button>
				<button type="button" class="button" onclick="location.href='idcheck.jsp'">�ٽ��Է�</button>
				</div>
		<% }
		
	}
%>
<script type="text/javascript">
function saveId(id){
		//�θ�â : opener
		opener.memberfrm.idsel.value=id;
		//����â �ݱ�
		window.close();
}
</script>
</body>
</html>