<%@page import="reservation.db.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	ReservationDao dao=new ReservationDao();
	dao.deleteReservation(num);
%>