<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<%

	request.setCharacterEncoding("utf-8");

	String id=session.getAttribute("id").toString();
	
	GuestDto dto=new GuestDto();
	GuestDao dao=new GuestDao();
	
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String email=request.getParameter("email");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	

	
	dto.setId(id);
	dto.setName(name);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setAddr(addr);
	
	
	
	dao.updateGuest(dto);
	

	
		String go="../main.jsp?go=mypage/mypagemain.jsp";

		response.sendRedirect(go);

	%>

 
