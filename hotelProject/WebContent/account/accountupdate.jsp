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

<SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT>

<style type="text/css">
div.mymain{
	width:240px;
	height:500px;
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

div.accountupdate{
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

<form action="account/accountupdateaction.jsp" method="post">


<div class="accountupdate">


	<h2 style="font-size: 1.8em;color:#8C4C27;">회원정보 수정</h2>

	<hr style="border:2px solid black;width:600px;margin-left:0px;">

	<h4>고객님의 정보를 언제든지 확인,변경하실 수 있습니다.</h4>

	<br>

	<table style="width:600px;"class="table table-bordered">

		<caption>정보수정</caption>

		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">아이디</td>
			<td>
			<%=dto.getId()%>
			</td>
		</tr>
		
		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">성명</td>
			<td>
				<input type="text" class="form-control input-sm"
					style="width: 150px;"
					 id="name" name="name" required="required"
					value="<%=dto.getName()%>">			
			</td>
		</tr>
		
		<tr>
			<td style="width:100px;background-color:#fff7e8;text-align: center;">생년월일</td>
			<td>
			<input type="text"  class="form-control input-sm"
			id="birth" name="birth" style="width: 150px;"
			value="<%=dto.getBirth().substring(0, 10)%>" >
			</td>
		</tr>
           
		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">이메일</td>
			<td>
			<input type="text" class="form-control input-sm"
			id="email" name="email" style="width: 150px;" class="input" value="<%=dto.getEmail() %>">
			</td>
		</tr>

		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">휴대전화</td>
			<td>

	 		<input type="text" class="form-control input-sm"
	 		id="hp" name="hp" maxlength="13"
	 			style="width: 150px;" required="required" value="<%=dto.getHp()%>" >
	 		</td>  
		</tr>
		
		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">주소</td>
			<td>
				<input type="text" class="form-control input-sm"
				name="addr" id="addr" class="input" style="width: 300px;"value="<%=dto.getAddr() %>">
			</td>
		</tr>
	</table>

	

	<button type="submit" style="color:white; width: 200px;"

	  		  id="btnsubmit">수정</button>

	 <button type="button" style="color:white; width: 200px;"
onclick="history.back()" id="btncancel">취소</button> 	

	</div>

  </form>

</body>

</html>