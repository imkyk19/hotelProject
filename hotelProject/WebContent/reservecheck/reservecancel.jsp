<%@page import="reservation.db.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num=request.getParameter("num");

	ReservationDao dao=new ReservationDao();
	
	
	%>
	<script type="text/javascript">
	alert("예약취소되었습니다");
	location.href="main.jsp?go=reservecheck/reservecheckpage.jsp";
	</script>
	<% dao.deleteReservation(num);
	  
	
  
%>
	