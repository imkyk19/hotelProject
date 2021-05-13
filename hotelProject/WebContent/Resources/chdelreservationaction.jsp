<%@page import="reservation.db.ReservationDao"%>
<%@page import="guest.db.GuestDao"%>
<%@page import="guest.db.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[] idd=request.getParameterValues("ch");

	//삭제
	ReservationDao dao= new ReservationDao();
	
	
for(String s:idd){
	dao.deleteReservation(s);
}
	
%>