
<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>
<body>

<%

	request.setCharacterEncoding("utf-8");

	String id=session.getAttribute("id").toString();
	
	GuestDto dto=new GuestDto();
	GuestDao dao=new GuestDao();
	
	String name=request.getParameter("name");
	
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	String birth=year+month+day;
	String email=request.getParameter("email");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr");
	
	

	
	System.out.println("id:"+id);
	System.out.println("name:"+name);
	System.out.println("birth:"+birth);
	System.out.println("email:"+email);
	System.out.println("hp:"+hp);
	System.out.println("addr:"+addr);
	
	
	dao.updateGuest(dto);
	
	
	dto.setName(name);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setId(id);
	

		String go="../main.jsp?go=mypage/mypagemain.jsp";

		response.sendRedirect(go);

	%>

 

</body>

</html>