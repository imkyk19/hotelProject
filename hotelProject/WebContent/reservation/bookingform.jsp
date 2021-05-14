<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
	}
	
	thead.title tr td {
		border-bottom: 3px solid gray; 
		width: 1200px; 
		height: 150px;
		text-align: center;
		font-size: 5em;
		/* background-color: #FAEBD0; */
		color: #594C3C;
	}
	
	tbody.bookingform{
		margin-top: 100px;
		border: 0px solid blue;
	}
	
	tbody.bookingform tr td {
		border: 0px solid gray;
		text-align: center;
		width: 200px;
		height: 50px;
	}
	
	tbody.bookingform label {
		font-size: 1.4em;
		margin-right: 10px;
	}
	
	div.roomlist {
		width: 1200px; 
		height: 2350px;
		margin-bottom: 50px;
		text-align: center;
		font-size: 1em;
	}
	
	div.reserve {
		margin-left: auto;
		margin-right: auto;
		width: 1200px;
		
	}
	
	div.body {
		margin-bottom: 50px;
	}
	
	table.roomlist {
		border: 2px solid gray;
		margin-top: 30px;
	}
	
	table.roomlist td.text {
		text-align: left;
	}
	
	a.pay {
		font-weight: bold;
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
				if($(data).find("room").length == 0){
					alert("그 기간은 예약이 다 찼습니다");
				}
				
				var s = "";
				$(data).find("room").each(function(i, element) {
					var r = $(this);
					var num = r.attr("num");
					var roomNum = r.find("room_num").text();
					var capacity = r.find("capacity").text();
					var price = r.find("price").text();
					var photo = r.find("photo").text();
					var text = r.find("text").text();
					
					
					s += "<table class = 'table table-bordered roomlist'>";
					s += "<tr><td rowspan = '4'><img class = 'click' style = 'width:300px;' src = '" +photo+"'></td>";
					s += "<td><b style = 'font-size: 1.2em;'>Room "+roomNum+"</b></td><td><b style = 'font-size: 1.2em;'>"+price+"</b></td></tr>";
					s += "<tr><td>"+capacity+"인용</td><td><a class = 'pay' href = 'main.jsp?go=reservation/payform.jsp?roomNum="+roomNum+"&checkin_date="+$("#checkin_date").val()+"&checkout_date="+$("#checkout_date").val()+"'>결제</a></td></tr>";
					s += "<tr><td class = 'text' colspan = '2' rowspan = '2'>" + text+ "</td></tr>";
					s += "</table>";
					
					$("div.roomlist").html(s);
				})
			}
		});
	};
	
	/* function roomList(){
		$.ajax({
			type: "get",
			dataType: "xml",
			url: ".jsp",
			data: {"checkin_date":checkin_date, "checkout_date":checkout_date, "adult":adult, "children":children},
			success: function(d){
				$("#checkin_date").html(checkin_date);
				$("#checkout_date").html(checkout_date);
				$("#adult").html(adult);
				$("#children").html(children)
			}
		});
	}; */
	<%
		String checkin_date = request.getParameter("checkin_date");
		String checkout_date = request.getParameter("checkout_date");
		String id = (String)session.getAttribute("id");
		String loginok=(String)session.getAttribute("loginok");
		/* int adult = Integer.parseInt(request.getParameter("adult"));
		int children = Integer.parseInt(request.getParameter("children"));
		int capacity = adult + children; */
		
		/* System.out.println("checkin:"+checkin_date);
		System.out.println("checkout:"+checkout_date);
		System.out.println("adult"+adult);
		System.out.println("children"+children);
		System.out.println("capacity"+capacity); */
	%>
	
	$(function(){
	 	
		var date = new Date();
		
		var day = date.getDate();
		var month = date.getMonth()+1;
		var year = date.getFullYear();
		
		if(month<10)
			month = "0" + month;
		if(day<10)
			day = "0" + day;
		
		var today = year + "-" + month + "-" + day;
		//$("#checkin_date").attr("value", today);
		
		
		
		$("#btnsearch").click(function(e) {
			e.preventDefault();
			data=$("#reservefrm").serialize();
			//alert(data);
			//list();
			var adultvalue = $("select[name=adult] option").filter(":selected").val();
			var childvalue = $("select[name=children] option").filter(":selected").val();
			//alert("adult =" + adultvalue);
			//alert("child =" + childvalue);
			var ckInDate = $("#checkin_date").val();
			var ckOutDate = $("#checkout_date").val();
			if(ckInDate <= today){
				alert("예약 날짜를 오늘 날짜 이후로 잡아주세요");
				return;
			}
			if(ckInDate == ""){
				alert("체크인 날짜를 선택하세요");
				return;
			}
			if(ckOutDate == ""){
				alert("체크아웃 날짜를 선택하세요");
				return;
			}
			if(ckOutDate<ckInDate){
				alert("체크아웃 날짜는 체크인 날짜보다 먼저 올 수 없습니다. 다시 선택하세요")
				return;
			}
			if(adultvalue == "select"){
				alert("어른 인원 수를 선택하세요");
				return;
			} else if (childvalue == "select"){
				alert("어린이 인원 수를 선택하세요");
				return;
			} else {
				list();
			}
		});
		
		
	}); 
</script>
</head>
<body>
<div class = "reserve">
<form action="#" id = "reservefrm" method="post">

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
					<%-- <td >
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
					</td> --%>
					<td>
						<label for = "checkin_date">Check In: </label>
						<%-- <%
							Date date = new Date();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							String today = sdf.format(date);
						%> --%>
						<input type="date" id = "checkin_date" name = "checkin_date" required="required" value="<%=checkin_date%>">
						
						
					</td>
					<td>
						<label for = "checkout_date">Check Out: </label>
						<input type="date" id = "checkout_date" name = "checkout_date" required="required" value = "<%=checkout_date%>">
						
					</td>
					<td >
						<label for = "adult">Adults: </label>
						<select name = "adult" id = "adult" required="required" class = "people" style="height: 25px;" >
							<option value = "select" selected="selected">--Select--</option>
							<option value = 1>1</option>
							<option value = 2>2</option>
							<option value = 3>3</option>
						</select>
					</td>
					<td >
						<label for = "children">Children: </label>
						<select name = "children" id = "children" required="required" class = "people" style="height: 25px;">
							<option value = "select" selected="selected">--Select--</option>
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
					
						<button style="margin-top: 30px; margin-bottom:10px; width: 200px; height: 50px; background-color:#260B01; line-height:20px; color: white; font-size: 1.5em; text-align: center;" type="submit" id = "btnsearch" class="btn btn-default btn-lg">Search</button>
						
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
			capacity = parseInt(adult) + parseInt(children)
			console.log(capacity);
			$("#capacity").val(capacity);
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