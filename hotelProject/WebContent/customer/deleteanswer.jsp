<%@page import="answer.db.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	String idx=request.getParameter("idx");

	AnswerDao dao=new AnswerDao();

	dao.deleteAnswer(idx);
	
	response.sendRedirect("..main.jsp?go=customer/content.jsp?num="+num+"&pageNum="+pageNum);

%>