<%@page import="org.json.simple.JSONObject"%>
<%@page import="answer.db.AnswerDto"%>
<%@page import="answer.db.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	AnswerDao dao = new AnswerDao();
	AnswerDto dto=dao.getAnswer(idx);
	JSONObject ob=new JSONObject();
	ob.put("answer", dto.getContent());
	System.out.println(dto.getContent());
%>
<%=ob.toString()%>