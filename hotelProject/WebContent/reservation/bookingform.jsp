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
	
	div.roomlist {
		width: 1200px; 
		border: 2px solid pink;
		margin-bottom: 50px;
		text-align: center;
		font-size: 1em;
	}
	
	div.reserve {
		margin-left: 300px;
		width: 1200px;
	}
	
	div.body {
		margin-bottom: 50px;
	}
</style>

<script type="text/javascript">

	function list(){
		
		$.ajax({
			type: "get",
			dataType: "xml",
			url: "reservation/orderlist.jsp",
			//data: {"capacity":capacity, "checkin_date":checkin_date, "checkout_date":checkout_date},
			data:data,
			success: function(data){
				var s = "";
				$(data).find("room").each(function(i, element) {
					var r = $(this);
					var num = r.attr("num");
					var roomNum = r.find("room_num").text();
					var capacity = r.find("capacity").text();
					var price = r.find("price").text();
					var photo = r.find("photo").text();
					var text = r.find("text").text();
					
					
					s += "<table class = 'table table-bordered'>";
					s += "<tr><td rowspan = '4'><img style = 'width:300px;' src = '" +photo+"'></td>";
					s += "<td>"+roomNum+"</td><td>"+price+"</td></tr>";
					s += "<tr><td>"+capacity+"인용</td><td><a class = 'pay' href = 'main.jsp?go=reservation/payform.jsp?roomNum="+roomNum+"&checkin_date="+$("#checkin_date").val()+"&checkout_date="+$("#checkout_date").val()+"'>결제</a></td></tr>";
					s += "<tr><td colspan = '2' rowspan = '2'>" + text+ "</td></tr>";
					s += "</table>";
					
					$("div.roomlist").html(s);
				})
			}
		});
	};
	
	$(function(){
		$("#btnsearch").click(function(e) {
			e.preventDefault();
			data=$("#reservefrm").serialize();
			//alert(data);
			list();
		});
		
		
	});
</script>
</head>
<body>
<div class = "reserve">
<form action="#" id = "reservefrm">

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
							for(int i = 0; i <= 3; i++){
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
						<select name = "adult" id = "adult" required="required">
							<option value = "">Select</option>
							<option value = 1>1</option>
							<option value = 2>2</option>
							<option value = 3>3</option>
						</select>
					</td>
					<td >
						<label for = "children">Children: </label>
						<select name = "children" id = "children" required="required">
							<option value = "">Select</option>
							<option value = 0>0</option>
							<option value = 1>1</option>
						</select>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr style="margin-top: 10px;">
					<td  colspan="5" align="center">
					
					<input type="hidden" name = "ckin_date" id = "ckin_date" value = "">
					<input type="hidden" name = "ckout_date" id = "ckout_date" value = "">
					<input type="hidden" name = "capacity" id = "capacity" value = "">
					
						<button style="margin-top: 10px; margin-bottom:10px; width: 200px; height: 50px;" type="submit" id = "btnsearch" class="btn btn-success btn-lg">Search</button>
						
					</td>
				</tr>
			</tfoot>
		</table>
</form>
<div class="roomlist"></div>
</div>
<script type="text/javascript">


		$("#checkin_date").change(function() {
		var checkin_date = $(this).val();
		$("#ckin_date").attr("value",checkin_date);
		});
		
		$("#checkout_date").change(function() {
		var checkout_date = $(this).val();
		$("#ckout_date").attr("value",checkout_date);
		});
		
		 $("#adult").change(function() {
			adult = ($(this).val());
			
			console.log(adult);
		})
		
		$("#children").change(function() {
		 	children = ($(this).val());
			
			console.log(children);
			capacity = parseInt(adult) + parseInt(children)
			console.log(capacity);
			$("#capacity").val(capacity);
		})
		
			
		
</script>
</body>
</html>