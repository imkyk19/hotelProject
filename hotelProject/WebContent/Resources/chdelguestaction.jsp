<%@page import="guest.db.GuestDao"%>
<%@page import="guest.db.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[] idd=request.getParameterValues("ch");

	//삭제
	GuestDao dao= new GuestDao();
	
	
for(String s:idd){
	dao.deleteGuest(s);
}
	
%>