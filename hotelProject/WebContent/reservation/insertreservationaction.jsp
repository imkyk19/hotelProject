<%@page import="reservation.db.ReservationDao"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="reservation.db.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int g_num = Integer.parseInt(request.getParameter("g_num"));
	int guestQty = Integer.parseInt(request.getParameter("guest_qty"));
	int bookingQty = Integer.parseInt(request.getParameter("booking_qty"));
	int totalPrice = Integer.parseInt(request.getParameter("price"));
	int roomNum = Integer.parseInt(request.getParameter("room_num"));
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	
	ReservationDto dto = new ReservationDto();
	
	dto.setg_num(g_num);
	dto.setGuestQty(guestQty);
	dto.setBookingQty(bookingQty);
	dto.setTotalPrice(totalPrice);
	dto.setRoomNum(roomNum);
	dto.setCheckInDate(checkin_date);
	dto.setCheckOutDate(checkout_date);
	
	ReservationDao dao = new ReservationDao();
	dao.insertReservation(dto);
	response.sendRedirect("../main.jsp");
%>