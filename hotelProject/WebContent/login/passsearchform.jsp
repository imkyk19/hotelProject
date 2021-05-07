<%@page import="guest.db.GuestDto"%>
<%@page import="java.util.Random"%>
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
<div class="searchpass" id="searchid">
<form action="passsearchform.jsp">
	<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;��й�ȣ ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;"><h5 style="color: #402A22;">����Ͻ� �̸��Ϸ� �ӽ� ��й�ȣ�� �߱��ص帳�ϴ�.</h5></th>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchpass2">
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
			//�Էµ����Ͱ� ��ġ���� ���� ��%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;���̵� ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>��ġ�ϴ� ȸ�������� �����ϴ�.</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button" style="color: white;width: 80px;" onclick="location.href='passsearchform.jsp'">���ư���</button></th>
		</tr>
	</table>
			
		<%}else{
			//ȸ�������� ���� ��
			//�ӽú�� �������� �߱��ϱ�
				Random random = new Random();
				String pa="";
				char c=' ';
				for(int i =0;i<=1;i++) {
					int n = random.nextInt(26)+65;
					c=(char)n;//���ĺ� �빮�� ���Ƿ� 5�� ���
				}
				pa+=c;
				for(int i =1;i<=5;i++) {
					int n = random.nextInt(10)+1;
					pa+=String.valueOf(n);
					}
			
			//��й�ȣ ����
			GuestDto dto=new GuestDto();
			dto=dao.getData(id);
			dto.setPass(pa);
			dao.updatePass(dto);
			%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;���̵� ã��</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>�Է��Ͻ� <b style="color: #402A22;"> <%= emailsearch %></b>�� �ӽ� ��й�ȣ�� ���½��ϴ�.</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button sendbtn" style="color: white;width: 80px;" onclick="location.href='sendemail.jsp?email=<%=emailsearch%>&pa=<%= pa %>'">Ȯ��</button></th>
		</tr>
	</table>
		<%}
		
	}
	
%>

</body>
</html>