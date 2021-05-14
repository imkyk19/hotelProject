<%@page import="reservation.db.ReservationDao"%>
<%@page import="guest.db.GuestDto"%>
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

div.mymain{
	width:240px;
	height:450px;
	margin-top: 50px;
	margin-left: 300px;   
	margin-bottom: 100px;
	background-color: #FAEBD0;
	

}

ul,li{
		list-style: none; }
		
li{
	
	font-size: 1.3em;
	
}	

ul>li>a{
		color: #8C4C27;
		text-decoration: none;
		cursor: pointer;
	}	
	
div.accountdelete{
	position:absolute;
	left:600px;
	top:50px;

}

</style>
</head>

<%


String id=session.getAttribute("id").toString();


	GuestDao dao=new GuestDao();

	GuestDto dto=dao.getData(id);
	

%>
<body>
<div class="mymain">
	<br>
	<h3 style="margin-top:10px;margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;">
	<br>
	<ul>
		<li><a style="text-decoration: none;" href="main.jsp?go=reservecheck/reservecheckpage.jsp">
		예약 확인/취소
		</a></li>
	</ul>
	<br>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=mypage/mypagemain.jsp">
				내 정보
		</a></li>
	</ul>	
	<ul>
			<li><a style="text-decoration: none;"href="main.jsp?go=account/accountupdate.jsp">
				회원정보 수정
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/passwordupdate.jsp">
				비밀번호 변경
		</a></li>
	</ul>	
	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountdeletepage.jsp">
				회원 탈퇴
		</a></li>
	</ul>	
		
</div>
<form action="account/accountdelete.jsp" method="post">
<div class="accountdelete">
<h2 style="font-size: 1.8em;color:#8C4C27;">회원 탈퇴</h2>
	<hr style="border:2px solid black;width:600px;margin-left:0px;">
	<h4>고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</h4>
	<br>
	<table style="width:400px;"class="table table-bordered">
		<tr>
			<td style="background-color:#fff7e8;">아이디</td>
			<td>
			<%=dto.getId()%>
			 </td>
		</tr>	
		<tr>
			<td style="background-color:#fff7e8;">비밀번호</td>

			<td>
				<input type="password" id="Pw" name="Pw" style="width: 150px;"
			class="form-control input-sm"
			required="required">
			</td>
		</tr>	
		
	</table>
	
	<button type="submit" style="color:white; width: 200px;"
	  		id="btnsubmit">탈퇴하기</button>
	 <button type="button" style="color:white; width: 200px;"
onclick="history.back()" id="btncancel">취소</button> 	
</div>
</form>
</body>
</html>   