<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>
<style>

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

div.reservechange{
	position:absolute;
	left:600px;
	top:50px;
}

</style>
<body>
<div class="mymain">
	<h3 style="margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;margin-left:0px;">
	<br>
	<ul>
		<li><a style="text-decoration: none;" href="main.jsp?go=reservecheck/reservecheckpage.jsp">
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
		<li><a style="text-decoration: none;"href="main.jsp?go=account/passwordupdate.jsp">
				비밀번호 변경
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=mypage/questionhistory.jsp">
				문의 내역 확인
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountdeletepage.jsp">
				회원 탈퇴
		</a></li>
	</ul>	
		
</div>

<div class="reservechange">



	<h2 style="font-size: 1.8em;color:#8C4C27;">문의 확인</h2>
	<hr style="border:2px solid black;width:720px;margin-right:600px;">


	<table style="width:700px;">

	<tr>
		<td>
		기간조회
		<button style="button">1주</button>	
		<button style="button">1개월</button>	
	 	<button style="button">3개월</button>	
	 	<button style="button">6개월</button>	
	 	<button style="button">전체</button>

	 	<input type="date" id="date1" value="sysdate">~<input type="date" id="date2" value="sysdate"><button>조회</button>
	 	</td>
	 </tr>	
	 </table>

	

	

	<table class="table table-bordered" style="width:700px;">
	 <tr>  
	 	<td colspan="6"style="font-size: 1.2em;">
	 	Total:
	 	</td>
	 </tr>

	 <tr style="background-color: #FAEBD0;font-size: 1.2em;border:1px solid black;">
	 	<td>No</td><td>문의유형</td><td>제목</td><td>문의일자</td><td>답변여부</td>
	 </tr>
	 <tr>
	 	<td colspan="6" style="font-size: 1.2em;width:400px;text-align: center;">
	 		자료가 없습니다
	 	</td>
	 </tr>
</table>	

</div>	

</body>

</html>

