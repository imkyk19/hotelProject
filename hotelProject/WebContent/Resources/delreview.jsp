<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	reviewDao dao=new reviewDao();
	dao.deleteContent(num);

%>