<%@page import="reservation.db.NonMemberReservationDto"%>
<%@page import="reservation.db.ReservationDao"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="reservation.db.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String guest_name = request.getParameter("guest_name");
	String hp = request.getParameter("hp");
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	String addr="";
	if(addr1==null || addr2==null){
		addr="no";
	}else{
		addr=request.getParameter("addr1")+" "+request.getParameter("addr2");
	}
	int guest_qty = Integer.parseInt(request.getParameter("guest_qty"));
	int booking_qty = Integer.parseInt(request.getParameter("booking_qty"));
	int totalPrice = Integer.parseInt(request.getParameter("price"));
	int room_num = Integer.parseInt(request.getParameter("room_num"));
	String checkin_date = request.getParameter("checkin_date");
	String checkout_date = request.getParameter("checkout_date");
	
 	NonMemberReservationDto dto = new NonMemberReservationDto();
	
 	dto.setGuest_name(guest_name);
 	dto.setHp(hp);
 	dto.setAddr(addr);
 	dto.setGuest_qty(guest_qty);
 	dto.setBooking_qty(booking_qty);
 	dto.setTotal_price(totalPrice);
 	dto.setRoom_num(room_num);
 	dto.setCheckin_date(checkin_date);
 	dto.setCheckout_date(checkout_date);
 	
	ReservationDao dao = new ReservationDao();
	dao.insertReservation2(dto); 
	
	/* System.out.println(guest_name);
	System.out.println(hp);
	System.out.println(addr);
	System.out.println(guestQty);
	System.out.println(bookingQty);
	System.out.println(totalPrice);
	System.out.println(roomNum);
	System.out.println(checkin_date);
	System.out.println(checkout_date); */
	
%>