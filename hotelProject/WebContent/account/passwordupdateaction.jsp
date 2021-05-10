<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String id=session.getAttribute("id").toString();
	String pass =request.getParameter("pass");

	
	GuestDao dao=new GuestDao();
	GuestDto dto=new GuestDto();
	
		boolean flag = dao.changePass(id, pass);
		
		if(flag) {
			
			dto.setId(id);
			dto.setPass(pass);
			System.out.println("pass:"+pass);
			String go="../main.jsp?go=mypage/mypagemain.jsp";

			response.sendRedirect(go);
		}
			

%>

	