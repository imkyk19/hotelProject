<?xml version="1.0" encoding="UTF-8"?>
<%@page import="room.db.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="room.db.RoomDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <data>
<%
	String capacity=request.getParameter("capacity");
	System.out.println(Integer.parseInt(capacity));
	
	
	String chi=request.getParameter("chi");
	String cho=request.getParameter("cho");
	RoomDao dao=new RoomDao();
	List<RoomDto> list=dao.getVacantRoom(Integer.parseInt(capacity), chi, cho);
	if(list.size()==0){%>
		<room>값이 없습니다</room>
	<% }else{
		for(RoomDto d:list){%>
		<room num="<%=d.getNum()%>">
			<photo><%=d.getPhoto() %></photo>
			<roomNum><%=d.getRoomNum() %></roomNum>
			<price><%=d.getPrice() %></price>
			<capacity><%=d.getCapacity() %></capacity>
			<text><%=d.getText() %></text>
		</room>
	<%}
	}
	

%>
</data>