<%@page import="reservation.db.NonMemberReservationDao"%>
<%@page import="reservation.db.NonMemberReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	div.nonmembermain{
	width:500px;
	height:500px;
	margin-top:50px;
	margin-left: 600px;
	
	}
	
	div.nonmembercheck{
	position:absolute;
	top:350px;
	left:600px;
	width:500px;
	height:200px;
	
	}


</style>

</head>

<body>



<% 
NonMemberReservationDao dao=new NonMemberReservationDao();
String num=request.getParameter("num");
int totalCount=dao.getTotalCount(num);//전체개수 구하기
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
List<NonMemberReservationDto> list=dao.getReservationList(num);

    
	%>
	


<div class="nonmembermain">

	<h2 style="font-size: 1.8em;color:#8C4C27;"> 비회원 예약 확인/취소</h2>
	<hr style="border:2px solid black;width:720px;margin-right:600px;">


	<table style="width:700px;">
	<tr>
		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">성명</td>
			<td>
				<input type="text" class="form-control input-sm"
					style="width: 150px;"
					 id="name" name="name" required="required">			
			</td>
		</tr>
		<tr>
			<td style="width:70px;background-color:#fff7e8;text-align: center;">휴대전화</td>
			<td>

	 		<input type="text" class="form-control input-sm"
	 		id="hp" name="hp" maxlength="13"
	 			style="width: 150px;" required="required">
	 		</td>  
		</tr>
	 </table>
	 	<button type="submit" style="color:white; width: 200px;"

	  		  id="btnsubmit">조회</button>
	
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

<div class="nonmembercheck">
<table class="table table-bordered" style="width: 700px;">
	<tr style=background-color:#fff7e8;"  >
		
		<th style="text-align:center;">객실번호</th>
		<th style="text-align:center;">객실수</th>
		<th style="text-align:center;">인원수</th>
		<th style="text-align:center;">체크인</th>
		<th style="text-align:center;">체크아웃</th>
		<th style="text-align:center;">가격</th>
		<th style="text-align:center;">성함</th>
		<th style="text-align:center;">핸드폰번호</th>
		<th style="text-align:center;">주소</th>
		<th style="text-align:center;">예약취소하기</th>
	</tr>
	<%
		if(totalCount==0){
			%>
				<tr>
					<td colspan="10" align="center"">
						<b>예약 내역이 없습니다.</b>
					</td>
				</tr>
			<%
		}else{
			
			
			for(NonMemberReservationDto dto:list){
				%>
					<tr align="center">
						<td><%=dto.getRoom_num()%></td>
						<td><%=dto.getBooking_qty()%></td>
						<td><%=dto.getGuest_qty()%></td>
						<td><%=dto.getCheckin_date()%></td>
						<td><%=dto.getCheckout_date()%></td>
						<td><%=dto.getTotal_price()%></td>
						<td><%=dto.getGuest_name()%></td>
						<td><%=dto.getHp()%></td>
						<td><%=dto.getAddr()%></td>

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

	

</html>

