<%@page import="guest.db.GuestDao"%>
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
	String search =request.getParameter("search");
	if(search==null){
	//search���� null�϶�(ó�� �Է���)

%>
<div class="searchid" id="searchid">
<form action="idsearchform.jsp">
	<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;���̵� ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					���� <input type="text" name="namesearch" class="input" required><br><br>
					�̸��� <input type="text" name="emailsearch" class="input" required><br>
					<input type="hidden" name="search" value="yes">
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="submit" class="button" style="color: white;width: 80px;">Ȯ��</button></th>
		</tr>
	</table>
	</form>
</div>
<%
	}else if(search!=null){
		//�˻����� �� ��
		GuestDao dao=new GuestDao();
		String namesearch = request.getParameter("namesearch");
		String emailsearch = request.getParameter("emailsearch");
		String id=dao.getId(namesearch, emailsearch);
		System.out.println(id);
		
		if(id=="����"){
			//���̵� ���� ��%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;���̵� ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>��ġ�ϴ� ���̵� �����ϴ�</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button" style="color: white;width: 80px;" onclick="location.href='idsearchform.jsp'">���ư���</button></th>
		</tr>
	</table>
			
		<%}else{
			//���̵� ���� ��
			int num=id.length()-3;
			id=id.substring(0,num)+"***";
			
			%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;���̵� ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>���̵��<b style="color: #402A22;"> <%= id %></b>�Դϴ�.</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button" style="color: white;width: 80px;" onclick="window.close()">�α���</button></th>
		</tr>
	</table>
			
		<%}
		
	}
	
%>
</body>
</html>