<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData2(num);
	dao.deleteGuest(dto.getId());
%>