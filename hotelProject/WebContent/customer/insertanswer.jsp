<%@page import="answer.db.AnswerDto"%>
<%@page import="answer.db.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	String content=request.getParameter("content");
	
	AnswerDao dao=new AnswerDao();
	AnswerDto dto=new AnswerDto();
	
	dto.setContent(content);
	dto.setNum(Integer.parseInt(num));
	
	dao.insertAnswer(dto);
	
	response.sendRedirect("..main.jsp?go=customer/content.jsp?num="+num+"&pageNum="+pageNum);
%>