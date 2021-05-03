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
	table.booking {
		width: 1200px;
		margin-left: 15%; 
		margin-right: 15%;
	}
	
	thead.title tr td {
		border: 3px solid gray; 
		width: 1200px; 
		height: 200px;
		text-align: center;
		font-size: 5em;
	}
	
	tbody.bookingform{
		margin-top: 100px;
		border: 2px solid blue;
	}
	
	tbody.bookingform tr td {
		border: 2px solid red;
		text-align: center;
		width: 200px;
		height: 50px;
	}
	
	div.vacantrooms {
		width: 1200px; 
		border: 2px solid gray;
		margin-left: 15%; 
		margin-right: 15%;
		text-align: center;
		font-size: 3em;
	}
</style>
</head>
<body>
<div>
	<form action="reservation/orderlist.jsp" method = "post">
		<table class="booking">
			<thead class="title">
				<tr>
					<td colspan="5">
						Reservation
					</td>
				</tr>
			</thead>
			<br>
			<tbody class="bookingform">
				<tr>
					<td >
						<label for = "room">Rooms: </label>
						<select name = "room" id = "room">
						<%
							for(int i = 0; i <= 20; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
					<td>
						<label for = "checkin_date">Check In: </label>
						<input type="date" id = "checkin_date" name = "checkin_date">
					</td>
					<td>
						<label for = "checkout_date">Check Out: </label>
						<input type="date" id = "checkout_date" name = "checkout_date">
					</td>
					<td >
						<label for = "adult">Adults: </label>
						<select name = "adult" id = "adult">
						<%
							for(int i = 0; i <= 50; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
					<td >
						<label for = "children">Children: </label>
						<select name = "children" id = "children">
						<%
							for(int i = 0; i <= 50; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr style="margin-top: 10px;">
					<td  colspan="5" align="center">
						<button style="margin-top: 10px; margin-bottom:10px; width: 200px;" type="button" id = "btnsearch" class="btn btn-success btn-lg">Search</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<div class="vacantrooms" >
	<table>
	
	</table>
</div>
</body>
</html>