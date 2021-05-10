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

</head>
<style>

div.mymain{
	width:240px;
	height:500px;
	margin-top: 70px;
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

div.reservechange{
	position:absolute;
	left:600px;
	top:50px;
}

</style>

<body>
<%
GuestDao dao=new GuestDao();

String id=(String)session.getAttribute("id");
String name=dao.getName(id);
String loginok=(String)session.getAttribute("loginok");

//로그인된 아이디 세션 값 얻기

//System.out.print("id:"+id);

//아이디를 통해 해당 개인정보 가져오기
GuestDto dto=dao.getId(id);


//미로그인시 로그인폼 이동
if(id!=null &&loginok!=null){    
	%>
<div class="mymain">
	<br>
	<h3 style="margin-top:10px;margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;margin-left:0px;">
	<br>
	<ul>
		<li><a style="text-decoration: none;" href="main.jsp?go=reserve/reservecheckpage.jsp">
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

<div class="reservechange">



	<h2 style="font-size: 1.8em;color:#8C4C27;"> 예약확인/취소</h2>
	<hr style="border:2px solid black;width:720px;margin-right:600px;">


	<table style="width:700px;">
	<tr>
		<td style="font-size: 1.2em;">
		
			 <%=name%>님의 객실및 패키지 예약 내역을 확인하실수있습니다.
		</td>    
	</tr>
	<tr>
		<td>
		<select>
	 		<option>예약완료일기준</option>
	 		<option>투숙일기준</option>
	 	</select>

	 	<button style="color:white;"type="button">3개월</button>	
	 	<button style="color:white;"type="button">6개월</button>	
	 	<button style="color:white;"type="button">12개월</button>

	 	<input type="date" id="date1" value="sysdate">~<input type="date" id="date2" value="sysdate">
	 	<button  style="color:white;">조회</button>
	 	</td>
	 </tr>	
	 </table>

	

		<h2 style="font-size: 1.2em;font-weight: bold;">객실/패키지예약</h2>

	  <hr style="border:1px solid black;width:700px;margin-left:0px;">

	

	<table class="table table-bordered" style="width:900px;">
	 <tr>  
	 	<td colspan="7"style="font-size: 1.2em;width:700px;">
	 	Total:
	 	</td>
	 </tr>

	 <tr style="background-color: #FAEBD0;font-size: 1.0em;border:1px solid black;width:700px;">
	 	<td style="width:70px;">객실번호</td><td style="width:70px;">객실수</td><td style="width:70px;">인원수</td>
	 	<td style="width:70px;">체크인날짜</td><td style="width:100px;">체크아웃날짜</td><td style="width:70px;">가격</td>
	 	<td style="width:70px;">예약상태</td>
	 </tr>
	 <tr>
	 	<td colspan="7" style="font-size: 1.2em;text-align: center;">
	 		자료가 없습니다
	 	</td>
	 </tr>
</table>	

</div>	

	
	<%
}else{
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href="main.jsp?go=login/loginform.jsp";
	</script>
	<%
}

%>
</body>

</html>

