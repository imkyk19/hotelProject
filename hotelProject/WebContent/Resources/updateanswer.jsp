<%@page import="answer.db.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	String answer=request.getParameter("answer");
	AnswerDao dao=new AnswerDao();
	dao.updateAnswer(idx, answer);
%>