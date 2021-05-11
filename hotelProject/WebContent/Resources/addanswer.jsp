<%@page import="answer.db.AnswerDto"%>
<%@page import="answer.db.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	String answer=request.getParameter("answer");
	AnswerDao dao =new AnswerDao();
	AnswerDto dto=new AnswerDto();
	dto.setNum(Integer.parseInt(num));
	dto.setContent(answer);
	dao.insertAnswer(dto);

%>