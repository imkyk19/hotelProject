<%@page import="java.text.SimpleDateFormat"%>
<%@page import="guest.db.GuestDao"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="room.db.RoomDto"%>
<%@page import="room.db.RoomDao"%>
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
	table.pay {
		width: 1200px;
		margin-left: 300px;
		border: 2px solid gray;
		margin-top: 50px;
		margin-bottom: 50px;
		font-size: 1em;
	}
	
	table.pay thead tr td.title {
		height: 100px;
		background-color: beige;
		font-size: 4em;
		text-align: center;
		line-height: 100px;
		border: 2px solid gray;
	}
	
	tbody.guestInfo tr td {
		font-size: 1.5em;
	}
</style>
</head>
<body>
<%
	int roomNum = Integer.parseInt(request.getParameter("roomNum"));
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	
	//System.out.println(checkin_date);
	//System.out.println(checkout_date);
	
	RoomDao dao = new RoomDao();
	RoomDto dto = new RoomDto();
	dto = dao.getRoomInfo(roomNum);
	
	String id = (String)session.getAttribute("id");
	GuestDto gdto = new GuestDto();
	GuestDao gdao = new GuestDao();
	gdto = gdao.getData(id);
%>
<div class="pay">
	<table class = 'table table-bordered pay'>
		<thead>
			<tr>
				<td class="title" colspan = "3">
					Order Confirmation
				</td>
			</tr>
		</thead>
		<tbody class="roomInfo">
			<tr>
				<td rowspan = '4'>
					<img style="width: 300px;" class = "pay" alt="" src="<%=dto.getPhoto()%>">
				</td>
				<td><h4>Room Number: <%=roomNum%></h4></td>
				<td align="right"><h4><b>Price: <%=dto.getPrice() %> 원</b></h4></td>
			</tr>
			<tr>
				<td><%=dto.getCapacity()%> 인용</td>
				<td align="right"><h4><b>예약 날짜: <%=checkin_date%> ~ <%=checkout_date%></b></h4></td>
			</tr>
			<tr>
				<td colspan="2" rowspan="2"><%=dto.getText() %></td>
			</tr>
		</tbody>
		<tbody class = "guestInfo">
			<tr>
				<td colspan = "2">Name: <%=gdto.getName()%></td>
				<td style="display: none;">g_num: <%=gdto.getG_num()%></td>
				<td align="right">ID: <%=gdto.getId() %></td>
			</tr>
			<tr>
				<td colspan="3">Date of Birth: <%=gdto.getBirth().substring(0, 10)%></td>
			</tr>
			<tr>
				<td colspan="3">Email: <%=gdto.getEmail() %></td>
			</tr>
			<tr>
				<td colspan="3">Mobile: <%=gdto.getHp() %></td>
			</tr>
			<tr>
				<td colspan="3">Address: <%=gdto.getAddr() %></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>