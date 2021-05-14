<%@page import="reservation.db.NonMemberReservationDao"%>
<%@page import="reservation.db.NonMemberReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    

	request.setCharacterEncoding("utf-8");
	
	NonMemberReservationDto dto=new NonMemberReservationDto();
	NonMemberReservationDao dao=new NonMemberReservationDao();
	
	String guest_name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	String room_num=request.getParameter("room_num");
	String booking_qty=request.getParameter("booking_qty");
	String guest_qty=request.getParameter("guest_qty");
	String checkin_date=request.getParameter("checkin_date");
	String checkout_date=request.getParameter("checkout_date");
	String total_price=request.getParameter("total_price");
	
	
	dto.getGuest_name();
	dto.getHp();
	dto.getAddr();
	dto.getRoom_num();
	dto.getBooking_qty();
	dto.getGuest_qty();
	dto.getCheckin_date();
	dto.getCheckout_date();
	dto.getTotal_price();
	


	
	


	%>

 
    