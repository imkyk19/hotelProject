<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String id=session.getAttribute("id").toString();
	String pass =request.getParameter("pass");
	String newPw=request.getParameter("newPw");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=new GuestDto();
	
		
			dto.setId(id);
			dto.setPass(newPw);
			dao.passUpdate(dto);	
				
	
			String go="../main.jsp?go=mypage/mypagemain.jsp";
			response.sendRedirect(go);

			

%>

	