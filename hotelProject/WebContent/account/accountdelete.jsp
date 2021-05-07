<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=session.getAttribute("id").toString();



	String pass=request.getParameter("pass");
	String g_num=request.getParameter("g_num");
	GuestDao dao=new GuestDao();
	
	boolean b=dao.isPassCheck(id, pass);
	if(b){
	dao.deleteGuest(g_num);
	}
	
	session.removeAttribute("id");
	response.sendRedirect("../main.jsp");
	%>
	
	
	
	
