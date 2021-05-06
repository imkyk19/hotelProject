<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String g_num=request.getParameter("g_num");

	GuestDao dao=new GuestDao();
	
	
	dao.deleteGuest(g_num);
	
	
	
	
	
%>