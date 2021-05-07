<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=request.getParameter("id");

	GuestDao dao=new GuestDao();
	
	
	dao.deleteGuest(id);

	String go="../main.jsp";

	response.sendRedirect(go);
	

%>