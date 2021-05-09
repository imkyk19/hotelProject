<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String savecheck=request.getParameter("savecheck");//체크 안하면 null값
	GuestDao dao=new GuestDao();   
	GuestDto dto=new GuestDto();
	
	boolean t= dao.isIdCheck(id);
	String chpass=dao.getPass(id);
	
	if(t && pass.equals(chpass)){
		session.setAttribute("id", id);
		session.setAttribute("loginok", "ok");
		session.setAttribute("savecheck", savecheck==null?"no":"yes");
		session.setMaxInactiveInterval(60*60*8);//8시간 유지
		
		//관리자인지 체크해서 관리자면 mana세션으로 아이디를 저장
		dto= dao.getData(id);
		int mana=dto.getMana();
		if(mana==0){
			response.sendRedirect("../main.jsp");
		}else if(mana==1){
			session.setAttribute("mana", id);
			response.sendRedirect("../main.jsp");
		}
		
		
	}else if(!t && pass.equals(chpass)){%>
		<script type="text/javascript">
			alert("아이디가 올바르지 않습니다.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%
	}else if(t && !pass.equals(chpass)){%>
		<script type="text/javascript">
			alert("비밀번호가 틀립니다.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("일치하는 회원정보가 없습니다.");
			location.href="../main.jsp?go=login/loginform.jsp";
		</script>
	<%}
	
	


%>