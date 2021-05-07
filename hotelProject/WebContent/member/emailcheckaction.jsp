<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");
	
	String email=request.getParameter("email");
	GuestDao dao=new GuestDao();
	//있는 이메일인지 체크
	boolean t=dao.isEmailCheck(email);
	//이미 있는 이메일일 경우
	if(t){%>
		<script type="text/javascript">
		alert("이미 있는 이메일입니다.");
		history.back();
		</script>
		
	<%
	}else{
		response.sendRedirect("emailSendAction.jsp?email="+email);
	}

 
%>