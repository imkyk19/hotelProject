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
<SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT>
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
	
	table.pay tbody {
		border: 1px solid gray;
	}
	
	tbody.guestInfo tr td {
		font-size: 1.5em;
	}
	
	tbody.card input {
		float: left;
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
	
	int memberPrice = (dto.getPrice()/100)*90;
	//System.out.println("memberPrice = " + memberPrice);
	//로그인된 아이디 세션 값 얻기
	
	String loginok=(String)session.getAttribute("loginok");
	//System.out.println("로그인 체크: " + loginok);
	//System.out.print("id:"+id);

	//미로그인시 로그인폼 이동
	if(loginok=="ok" && id!=null){
%>
	<div class="pay">
		<form id = "payfrm">
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
					<td><h4>Room Number: <%=roomNum%></h4>
					<input type="hidden" name = "room_num" id = "room_num" value = "<%=roomNum%>">
					</td>
					<td align="right"><h4><b>Price: <s><%=dto.getPrice()%></s></b> <b style="color: red;"><%=memberPrice%> 원</b></h4>
					<input type = "hidden" name = "price" id ="price" value = "<%=memberPrice%>">
					</td>
				</tr>
				<tr>
					<td><%=dto.getCapacity()%> 인용</td>
					
					<td align="right"><h4><b>예약 날짜: <%=checkin_date%> ~ <%=checkout_date%></b></h4>
					<input type="hidden" name = "checkin_date" id ="checkin_date" value = "<%=checkin_date%>">
					<input type="hidden" name = "checkout_date" id ="checkout_date" value = "<%=checkout_date%>">
					
					</td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><%=dto.getText() %></td>
				</tr>
			</tbody>
			<tbody class = "guestInfo">
				<tr>
					<td colspan = "1">Name: <%=gdto.getName()%></td>
					<td><input type="hidden" name = "g_num" id = "g_num" value = "<%=gdto.getG_num()%>"></td>
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
			<tbody class="card">
				<tr>
					<td >
						<label for = "card" >신용카드: </label>
					</td>
					<td colspan="2">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
					</td>
				</tr>
				<tr>
					<td>
						<label for = "cardDate" >만료일(MM/YY): </label>
					</td>
					<td colspan="2">
						<input name = "cardDate" style="width: 80px;" type="text" class="form-inline cardDate">
						<input type="hidden" name = "guest_qty" id = "guest_qty" value = "<%=dto.getCapacity()%>">
						<input type="hidden" name = "booking_qty" id = "booking_qty" value = "1">
					</td>
					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						<button id = "btnPay" type="submit" class="btn btn-success btn-lg" style="height: 50px; width: 200px;">결제하기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	<script type="text/javascript">
		
			$("#btnPay").click(function(e) {
				e.preventDefault();
				data = $("#payfrm").serialize();
				//alert(data);
				
				var card = $("input.card").val();
				if(card.length == 0){
					alert("카드 번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type: "post",
					dataType: "html",
					url: "reservation/insertreservationaction.jsp",
					data: data,
					success: function(data){
						alert("예약 성공!!!");
						location.href = "main.jsp?go=reservecheck/reservecheckpage.jsp";
					}
				});
			});
		
	</script>
<%
} else {
%>

<div class="pay">
		<form id = "nonmemberpayfrm">
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
					<td><h4>Room Number: <%=roomNum%></h4>
					<input type="hidden" name = "room_num" id = "room_num" value = "<%=roomNum%>">
					</td>
					<td align="right"><h4><b>Price: <%=dto.getPrice() %> 원</b></h4>
					<input type = "hidden" name = "price" id ="price" value = "<%=dto.getPrice()%>">
					</td>
				</tr>
				<tr>
					<td><%=dto.getCapacity()%> 인용</td>
					
					<td align="right"><h4><b>예약 날짜: <%=checkin_date%> ~ <%=checkout_date%></b></h4>
					<input type="hidden" name = "checkin_date" id ="checkin_date" value = "<%=checkin_date%>">
					<input type="hidden" name = "checkout_date" id ="checkout_date" value = "<%=checkout_date%>">
					
					</td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><%=dto.getText() %></td>
				</tr>
			</tbody>
			<tbody class = "guestInfo">
				<tr>
					<td>
						<label for="guest_name">이름:</label>
						<input required="required" type="text" name = "guest_name" id = "guest_name" style="width: 150px;">
					</td>
					<td colspan="2">
						<label for = "hp">핸드폰:</label>
						<input required="required" type="text" name = "hp" id = "hp">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label>주소:</label>
						&nbsp;&nbsp;<input type="text" name="zip" id="zip" class="input">&nbsp;
						<button type="button" class="button" style="color: white;" onclick="openaddr()">주소 찾기</button>
						<br><br>&nbsp;&nbsp;<input type="text" name="addr1" id="addr1" class="input" style="width: 400px;">
						<br>&nbsp;&nbsp;<input type="text" name="addr2" id="addr2" class="input" style="width: 400px;">
					</td>
				</tr>
				
			</tbody>
			<tbody class="card">
				<tr>
					<td >
						<label for = "card" >신용카드: </label>
					</td>
					<td colspan="2">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
						<input style="width: 50px;" type="text" class="form-inline card">
					</td>
				</tr>
				<tr>
					<td>
						<label for = "cardDate" >만료일(MM/YY): </label>
					</td>
					<td colspan="2">
						<input name = "cardDate" style="width: 80px;" type="text" class="form-inline cardDate">
						<input type="hidden" name = "guest_qty" id = "guest_qty" value = "<%=dto.getCapacity()%>">
						<input type="hidden" name = "booking_qty" id = "booking_qty" value = "1">
					</td>
					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						<button id = "btnNonMemberPay" type="submit" class="btn btn-danger btn-lg" style="height: 50px; width: 200px;">비회원 결제하기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	
<script type="text/javascript">

//비회원 결제 버튼 누를 시 액션
$("#btnNonMemberPay").click(function(e) {
	e.preventDefault();
	data = $("#nonmemberpayfrm").serialize();
	//alert(data);
	
	var card = $("input.card").val();
	if(card.length == 0){
		alert("카드 번호를 입력하세요");
		return;
	}
	
	$.ajax({
		type: "post",
		dataType: "html",
		url: "reservation/insertnonmemberbooking.jsp",
		data: data,
		success: function(data){
			alert("비회원 예약 성공!!!");
			location.href = "main.jsp";
		}
	});
});

//주소창 띄우기 사용자 함수
function openaddr() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr1').value = fullRoadAddr;
           document.getElementById('addr2').focus();
       }
   }).open();
}	
</script>
<%
}
%>
</body>
</html>