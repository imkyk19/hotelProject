<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id= request.getParameter("id");
	String pass=request.getParameter("pass");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData(id);
	//있는 아이디인지 체크//비번 일치하는지//매니저 계정인지 체크
	boolean t=dao.isIdCheck(id);
	
	if(t && dto.getPass().equals(pass) && dto.getMana()==1){
		//일치하는 경우
		session.setAttribute("mana", id);
		session.setAttribute("id", id);
		session.setAttribute("loginok", "yes");
		response.sendRedirect("index.jsp?mana="+id);
	}else{
		//불일치하는 경우%>
		<script type="text/javascript">
			alert("회원정보가 일치하지 않습니다.");
			history.back();
		</script>
	<%}

%>