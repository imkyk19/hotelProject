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

div.reservecheckmain{
	position:absolute;
	left:600px;
	top:50px;
}


div.reservecheck{
	position:absolute;
	left:600px;
	top:280px;

}
</style>

</head>

<body>



<% 

String id=(String)session.getAttribute("id");
String loginok=(String)session.getAttribute("loginok");


ReservationDao dao=new ReservationDao();
GuestDao gdao=new GuestDao();
boolean t= gdao.isIdCheck(id);
GuestDto gdto=gdao.getData(id);
String name=gdao.getName(id);
String g_num=gdto.getG_num();



//로그인된 아이디 세션 값 얻기

//System.out.print("id:"+id);

//아이디를 통해 해당 개인정보 가져오기
gdto=gdao.getId(id);

int totalCount=dao.getTotalCount(g_num);//전체개수 구하기
int totalPage;//전체 페이지
int startPage;//각 블럭의 시작페이지
int endPage;//각 블럭의 마지막페이지
int start;//각 페이지의 시작번호
int end;//각 페이지의 끝번호
int no;//각 페이지에서 출력을 시작할 번호
int perPage=5;//한페이지에 보여질 글의 개수
int perBlock=5;//한 블럭에 보여질 페이지의 개수
int currentPage;//현재 페이지

//총 페이지수 구하기
totalPage=totalCount/perPage+(totalCount%perPage>0?1:0); 
//나머지가 있으면 1페이지 더하기(글개수13개면 페이지3장필요)

//현재페이지(pageNum이 null인경우 1페이지로 이동)
String pageNum=request.getParameter("pageNum");
if(pageNum==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(pageNum);

//현재페이지가 3인경우 startPage는 1, endPage=5 / 현재페이지가 6인경우 startPage는 6, endPage=10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//만약 총 페이지수가 8인경우 2번째 블럭은 startPage 6, endPage 10 BUT, 이때 endPage는 8로 표기되어야한다.
if(totalPage<endPage)
	endPage=totalPage;

//각 페이지의 시작번호, 끝번호 구하기(1일경우 1, 2일경우 6)
start=(currentPage-1)*perPage+1;
end=start+perPage-1;

//총 글수가 12인경우 마지막페이지의 end는 12가 되어야한다.
if(end>totalCount)
	end=totalCount;

//각 글 앞에 붙일 시작번호구하기 
//예: 총글이 20개일경우 1페이지는 20부터 2페이지는 15부터 출력해서 1씩 감소해가며 출력할것
no=totalCount-(currentPage-1)*perPage;

//start부터 end까지 게시글 가져오기
List<ReservationDto> list=dao.getReservationList(g_num);



//미로그인시 로그인폼 이동
if(id!=null &&loginok!=null){    
	%>
	

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

<div class="reservecheckmain">



	<h2 style="font-size: 1.8em;color:#8C4C27;"> 예약 확인/취소</h2>
	<hr style="border:2px solid black;width:720px;margin-right:600px;">


	<table style="width:700px;">
	<tr>
		<td style="font-size: 1.2em;">
		
			 <%=name%>님의 객실및 패키지 예약 내역을 확인하실수있습니다.
		</td>    
	</tr>
	 </table>

	

		<h2 style="font-size: 1.2em;font-weight: bold;">객실/패키지예약</h2>
		<%
	if(totalCount>0){
		%>
			<b>예약 : <%=totalCount %></b>
		<%
	}
%>
		
		

	  <hr style="border:1px solid black;width:700px;margin-left:0px;">
	

</div>	

<div class="reservecheck">
<table class="table table-bordered" style="width: 700px;">
	<tr style=background-color:#fff7e8;"  >
		<th style="text-align:center;">객실번호</th>
		<th style="text-align:center;">객실수</th>
		<th style="text-align:center;">인원수</th>
		<th style="text-align:center;">체크인</th>
		<th style="text-align:center;">체크아웃</th>
		<th style="text-align:center;">가격</th>
		<th style="text-align:center;">예약취소하기</th>
	</tr>
	<%
		if(totalCount==0){
			%>
				<tr>
					<td colspan="8" align="center"">
						<b>예약 내역이 없습니다.</b>
					</td>
				</tr>
			<%
		}else{
			
			
			for(ReservationDto dto:list){
				%>
					<tr align="center">
						<td><%=dto.getRoomNum()%></td>
						<td><%=dto.getBookingQty()%></td>
						<td><%=dto.getGuestQty()%></td>
						<td><%=dto.getCheckInDate()%></td>
						<td><%=dto.getCheckOutDate()%></td>
						<td><%=dto.getTotalPrice()%></td>
						<td> 
						
					<a href="main.jsp?go=reservecheck/reservecancel.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>"
							style="text-decoration: none; color:black;">예약취소</a>
						</td>
					</tr>
				<%
			}
		}
	%>
</table>
</div>

</body>		
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
	

</html>

