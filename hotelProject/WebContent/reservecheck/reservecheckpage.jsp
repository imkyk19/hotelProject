<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reservation.db.ReservationDao"%>
<%@page import="reservation.db.ReservationDto"%>
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
<script type="text/javascript">
$(function(){
	$("#searchbtn").click(function() {
		$.ajax({
			type:"get",
			url:"reservelist.jsp",
			dataType:"xml",
			success:function(data){
				var s="";
				$(data).find("reservation").each(function(i){
					var n=$(this);
					var g_num=n.attr("g_num");
					var roomnum = n.find("room_num").text();
					var bookingqty=n.find("booking_qty").text();
					var guestqty=n.find("guest_qty").text();
					var checkindate=n.find("checkin_date").text();
					var checkoutdate=n.find("checkout_date").text();
					var totalprice=n.find("total_price").text();
					
					s += "<table class = 'table table-bordered'>";
					s += "<tr><td>객실번호"+roomnum+"</td><td>객실 수"+bookingqty+"</td>";
					s += "<td>인원 수"+guestqty+"</td><td>체크인날짜"+checkindate+"</td>";
					s += "<td>체크아웃날짜"+checkoutdate+"</td><td>가격"+totalprice+"</td></tr>";
					s += "<tr><td class = 'text'>" + text+ "</td></tr>";
					s += "</table>";
						
				
				$("#show").html(s);
				

				});
			});
		});
	});

</script>
</head>

<body>



<% 

ReservationDao dao=new ReservationDao();
ReservationDto dto=new ReservationDto();
//List<ReservationDto> list=dao.getReservationList(g_num);
//dto=dao.getIndividualReservation(g_num);

GuestDao gdao=new GuestDao();
GuestDto gdto=new GuestDto();

String id=(String)session.getAttribute("id");
String name=gdao.getName(id);
gdto = gdao.getData(id);
String loginok=(String)session.getAttribute("loginok");


//로그인된 아이디 세션 값 얻기

//System.out.print("id:"+id);

//아이디를 통해 해당 개인정보 가져오기
gdto=gdao.getId(id);


//미로그인시 로그인폼 이동
if(id!=null &&loginok!=null){    
	%>
	

<div class="mymain">
	<br>
	<h3 style="margin-top:10px;margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;margin-left:0px;">
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

<div class="reservechange">



	<h2 style="font-size: 1.8em;color:#8C4C27;"> 예약 확인/취소</h2>
	<hr style="border:2px solid black;width:720px;margin-right:600px;">


	<table style="width:700px;">
	<tr>
		<td style="font-size: 1.2em;">
		
			 <%=name%>님의 객실및 패키지 예약 내역을 확인하실수있습니다.
		</td>    
	</tr>
	<tr>
		<td>
	 	<input type="date" id="checkin_date" value="">~<input type="date" id="checkout_date" value="">
	 	<button type="button" id="searchbtn" style="color:white;">조회</button>
	 	</td>
	 </tr>	
	 </table>

	

		<h2 style="font-size: 1.2em;font-weight: bold;">객실/패키지예약</h2>

	  <hr style="border:1px solid black;width:700px;margin-left:0px;">
	
	<div id="show">show</div>
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

