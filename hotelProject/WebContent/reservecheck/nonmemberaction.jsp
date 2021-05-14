<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.List"%>
<%@page import="reservation.db.NonMemberReservationDao"%>
<%@page import="reservation.db.NonMemberReservationDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%    

	request.setCharacterEncoding("utf-8");

	//list출력을 위한 dao선언
	NonMemberReservationDao dao=new NonMemberReservationDao();	

	String guest_name=request.getParameter("name");
	String hp=request.getParameter("hp");
	String num=dao.getData(guest_name).getNum();
	
	//검색 정렬 메서드 호출
	List<NonMemberReservationDto> list=dao.getSearchList(num);

	
	
	//데이터 출력
		for(NonMemberReservationDto dto:list){
			%>
			<answer num="<%=dto.getNum()%>">
				<roomnum><%=dto.getRoom_num()%></roomnum>
				<booking><%=dto.getBooking_qty()%></booking>
				<guest><%=dto.getGuest_qty()%></guest>
				<checkin><%=dto.getCheckin_date()%></checkin>
				<checkout><%=dto.getCheckout_date()%></checkout>
				<price><%=dto.getTotal_price()%></price>
				<name><%=dto.getGuest_name()%></name>
				<hp><%=dto.getHp()%></hp>
				<addr><%=dto.getAddr()%></addr>
			</answer>
			<%
	}
	%>
	</data>
