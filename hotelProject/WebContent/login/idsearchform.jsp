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
	//search값이 null일때(처음 입력폼)

%>
<div class="searchid" id="searchid">
<form action="idsearchform.jsp">
	<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;아이디 찾기</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					성명 <input type="text" name="namesearch" class="input" required><br><br>
					이메일 <input type="text" name="emailsearch" class="input" required><br>
					<input type="hidden" name="search" value="yes">
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="submit" class="button" style="color: white;width: 80px;">확인</button></th>
		</tr>
	</table>
	</form>
</div>
<%
	}else if(search!=null){
		//검색했을 때 폼
		GuestDao dao=new GuestDao();
		String namesearch = request.getParameter("namesearch");
		String emailsearch = request.getParameter("emailsearch");
		String id=dao.getId(namesearch, emailsearch);
		System.out.println(id);
		
		if(id=="없음"){
			//아이디가 없을 때%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;아이디 찾기</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>일치하는 아이디가 없습니다</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button" style="color: white;width: 80px;" onclick="location.href='idsearchform.jsp'">돌아가기</button></th>
		</tr>
	</table>
			
		<%}else{
			//아이디가 있을 때
			int num=id.length()-3;
			id=id.substring(0,num)+"***";
			
			%>
			<table>
		<tr style="background-color:  #A6806A; height: 50px;">
			<td colspan="2" style="text-align: left;width: 500px;"><span style="color: white;font-style: bold;font-size: 2em;">&nbsp;아이디 찾기</span></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
				<div class="searchid2">
				<br>
					<h4>아이디는<b style="color: #402A22;"> <%= id %></b>입니다.</h4>
				</div>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2"><br><button type="button" class="button" style="color: white;width: 80px;" onclick="window.close()">로그인</button></th>
		</tr>
	</table>
			
		<%}
		
	}
	
%>
</body>
</html>