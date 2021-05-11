<%@page import="question.db.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String h_num=request.getParameter("h_num");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String pageNum=request.getParameter("pageNum");
QuestionDao dao=new QuestionDao();
dao.updateContent(h_num, subject, content);

response.sendRedirect("../main.jsp?go=customer/questioncheck.jsp?pageNum="+pageNum);
%>
