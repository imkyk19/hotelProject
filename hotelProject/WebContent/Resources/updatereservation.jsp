<%@page import="reservation.db.ReservationDto"%>
<%@page import="reservation.db.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	String room=request.getParameter("room");
	String reserday=request.getParameter("reserday");
	
	 int n=reserday.indexOf("~");
	String chi=reserday.substring(0,n);
	String cho=reserday.substring(n+1);
	
	
	String capacity=request.getParameter("capacity");
	
 	ReservationDao dao=new ReservationDao();
	ReservationDto dto=dao.getData(num);
	dto.setRoomNum(Integer.parseInt(room));
	dto.setCheckInDate(chi);
	dto.setCheckOutDate(cho);
	dto.setGuestQty(Integer.parseInt(capacity));
	dao.updateReservation(dto); 
	 
	response.sendRedirect("rvContent.jsp?num="+num); 
%>