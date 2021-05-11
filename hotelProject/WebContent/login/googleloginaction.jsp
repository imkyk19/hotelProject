<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String google=request.getParameter("google");
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getGoogleId(google);
	session.setAttribute("loginok", "ok");
	session.setAttribute("id", dto.getId());
	response.sendRedirect("../main.jsp");
%>