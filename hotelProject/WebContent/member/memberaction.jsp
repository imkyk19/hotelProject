<%@page import="guest.db.GuestDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="guest.db.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String name=request.getParameter("name");	
	//��¥ ����
	String birth=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");	
	System.out.println(birth);
	
    //�ּ�����(null���� �� no�� ����)
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	String addr="";
	if(addr1==null || addr2==null){
		addr="no";
	}else{
		addr=request.getParameter("addr1")+" "+request.getParameter("addr2");
	}
	
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	String id=request.getParameter("idsel");	
	String pass=request.getParameter("pass");

	GuestDto dto=new GuestDto();
	dto.setAddr(addr);
	dto.setBirth(birth);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setId(id);
	dto.setName(name);
	dto.setPass(pass);
	
	GuestDao dao=new GuestDao();
	dao.insertGuest(dto);
	response.sendRedirect("../main.jsp?go=member/join.jsp?name="+name+"&id="+id);
%>



