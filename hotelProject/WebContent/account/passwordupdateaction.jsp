<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String id=session.getAttribute("id").toString();
	
	String pass =request.getParameter("Pw");
	String newPw=request.getParameter("newPw");
	
	GuestDao dao=new GuestDao();
	GuestDto dto=new GuestDto();
				
	String newpass=dao.getPass(id);

	if(pass.equals(newpass)){
		dto.setId(id);
		dto.setPass(newPw);
		dao.passUpdate(dto);	
		String go="../main.jsp?go=mypage/mypagemain.jsp";
		response.sendRedirect(go);
	
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");
			location.href="../main.jsp?go=account/passwordupdate.jsp";
		</script>
	<%}
		
		
	%>
				
				
		

			



	