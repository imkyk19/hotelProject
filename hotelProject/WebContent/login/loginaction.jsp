<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String savecheck=request.getParameter("savecheck");//üũ ���ϸ� null��
	GuestDao dao=new GuestDao();   
	GuestDto dto=new GuestDto();
	
	boolean t= dao.isIdCheck(id);
	String chpass=dao.getPass(id);
	
	if(t && pass.equals(chpass)){
		session.setAttribute("id", id);
		session.setAttribute("loginok", "ok");
		session.setAttribute("savecheck", savecheck==null?"no":"yes");
		session.setMaxInactiveInterval(60*60*8);//8�ð� ����
		
		response.sendRedirect("../main.jsp");
	}else if(!t && pass.equals(chpass)){%>
		<script type="text/javascript">
			alert("���̵� �ùٸ��� �ʽ��ϴ�.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%
	}else if(t && !pass.equals(chpass)){%>
		<script type="text/javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("��ġ�ϴ� ȸ�������� �����ϴ�.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%}
	
	


%>