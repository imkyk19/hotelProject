<%@page import="room.db.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//룸 넘버 통해 삭제
	String num = request.getParameter("num");
	RoomDao dao=new RoomDao();
	dao.deleteRoom(num);

%>