<?xml version="1.0" encoding="UTF-8"?>
<%@page import="room.db.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.db.RoomDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
	
	int capacity = 0;
	try {
		capacity = Integer.parseInt(request.getParameter("capacity"));
	} catch (NumberFormatException e) {
		capacity = 1;
		System.out.println("총 인원 정수로 변환시 오류: " + e.getMessage());
	}
	
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	
	RoomDao dao = new RoomDao();
	List<RoomDto> list = dao.getVacantRoom(capacity, checkin_date, checkout_date);
	
	for(RoomDto dto : list){
		 
		%> 
		<room num = "<%=dto.getNum()%>">
			<room_num><%=dto.getRoomNum()%></room_num>
			<capacity><%=dto.getCapacity() %></capacity> 
			<price><%=dto.getPrice() %></price>
			<photo><%=dto.getPhoto() %></photo>
			<text><%=dto.getText() %></text>
		</room>
		<%
		}
	
	
%>
</data>