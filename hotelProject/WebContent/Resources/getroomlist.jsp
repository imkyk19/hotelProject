<%@page import="room.db.RoomDto"%>
<%@page import="room.db.RoomDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String room_num=request.getParameter("num");
	int num =Integer.parseInt(room_num);
	JSONObject ob=new JSONObject();
	RoomDao dao=new RoomDao();
	RoomDto dto=dao.getRoomInfo(num);
	ob.put("room_num", dto.getRoomNum());
	ob.put("status", dto.getStatus());
	ob.put("capacity", dto.getCapacity());
	ob.put("price", dto.getPrice());
	ob.put("photo", dto.getPhoto());
	ob.put("text", dto.getText());
	ob.put("num", dto.getNum());
%>
<%=ob.toString()%>