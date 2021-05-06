<%@page import="question.db.QuestionDto"%>
<%@page import="question.db.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String type=request.getParameter("type");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	String email=request.getParameter("email");
	String hp=request.getParameter("hp");
	
	QuestionDto dto=new QuestionDto();
	dto.setType(type);
	dto.setSubject(subject);
	dto.setContent(content);	
	dto.setName(name);
	dto.setPass(pass);
	dto.setEmail(email);
	dto.setHp(hp);
	
	QuestionDao dao=new QuestionDao();
	dao.insertQuestion(dto);
	
	response.sendRedirect("../main.jsp?go=customer/question.jsp");
%>
    