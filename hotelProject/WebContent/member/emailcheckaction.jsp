<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");
	
	String email=request.getParameter("email");
	GuestDao dao=new GuestDao();
	//�ִ� �̸������� üũ
	boolean t=dao.isEmailCheck(email);
	//�̹� �ִ� �̸����� ���
	if(t){%>
		<script type="text/javascript">
		alert("�̹� �ִ� �̸����Դϴ�.");
		history.back();
		</script>
		
	<%
	}else{
		response.sendRedirect("emailSendAction.jsp?email="+email);
	}

 
%>