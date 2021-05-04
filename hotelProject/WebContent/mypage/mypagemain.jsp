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
	height:500px;
	border: 1px solid gray;
	margin-top: 50px;
	margin-left: 200px;
	margin-bottom: 100px;
	background-color: #F5ECCE;
	

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
</style>

</head>
<body>
<div class="mymain">
	<h3 style="margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;margin-left:0px;">
	<br>
	<ul>
		<li><a style="text-decoration: none;" href="main.jsp?go=reserve/reservecheckpage.jsp">
		예약 확인/취소
		</a></li>
	</ul>
	<br>	
	<ul>
		<li>
				내 정보
		</li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountupdate.jsp">
				회원정보 수정
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=.jsp">
				비밀번호 변경
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=mypage/questionhistory.jsp">
				문의 내역 확인
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountdelete.jsp">
				회원 탈퇴
		</a></li>
	</ul>	
		
</div>

</body>
</html>