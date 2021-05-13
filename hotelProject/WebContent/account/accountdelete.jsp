<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

	String id=session.getAttribute("id").toString();

	String pass=request.getParameter("Pw");

	GuestDao dao=new GuestDao();
	  
	String newpass=dao.getPass(id);
	
	boolean b=dao.isPassCheck(id, pass);  
	
	
	if(b && pass.equals(newpass)){	
	
	%>
	<script type="text/javascript">
	alert("회원탈퇴처리가 완료되었습니다");
	location.href="../main.jsp";
	</script>
	
	<% dao.deleteGuest(id);
	session.removeAttribute("loginok");
	session.removeAttribute("id");
	//String go="../main.jsp";
	//response.sendRedirect(go);
	
	
	}else{%>  
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");  
		location.href="../main.jsp?go=account/accountdeletepage.jsp";
	</script>
<%}
%>
	

	
