<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	GuestDao dao=new GuestDao();
	System.out.println(num);
	dao.deleteGuest(num);

%>