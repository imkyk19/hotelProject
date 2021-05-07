<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");

	GuestDao dao=new GuestDao();
	
	boolean b=dao.isPassCheck(id, pass);
	if(b){
	dao.deleteGuest(id);
	}
	%>
	<result><%=b?"success":"fail"%></result>
	
	
	
