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
	
	%>
	<script type="text/javascript">
	alert("회원정보가 수정되었습니다");
	location.href="../main.jsp?go=mypage/mypagemain.jsp";
	</script>

	<%
	dto.setId(id);
	dto.setName(name);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setAddr(addr);
	
	
	
	dao.updateGuest(dto);
	

	
		//String go="../main.jsp?go=mypage/mypagemain.jsp";

		//response.sendRedirect(go);

	%>

 
