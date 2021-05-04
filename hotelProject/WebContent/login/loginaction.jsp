<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	GuestDao dao=new GuestDao();   
	GuestDto dto=new GuestDto();
	
	boolean t= dao.isIdCheck(id);
	String chpass=dao.getPass(id);
	
	if(t && pass.equals(chpass)){
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*60*8);//8시간 유지
		response.sendRedirect("../main.jsp");
	}else{%>
		<script type="text/javascript">
			alert("로그인을 할 수 없습니다");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%
	}
	
	


%>