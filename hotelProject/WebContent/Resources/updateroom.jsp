<%@page import="room.db.RoomDao"%>
<%@page import="room.db.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String room=request.getParameter("room_num").substring(0, 3);
	int room_num=Integer.parseInt(room);
	int num=Integer.parseInt(request.getParameter("num"));
	int capacity=Integer.parseInt(request.getParameter("capacity"));
	int price=Integer.parseInt(request.getParameter("price"));
	String text=request.getParameter("text");
	
	
 	RoomDto dto=new RoomDto();
	RoomDao dao=new RoomDao();
	dto.setCapacity(capacity);
	dto.setNum(num);
	dto.setPrice(price);
	dto.setText(text);
	dto.setRoomNum(room_num);
	dao.updateRoom(dto); 
	

%>