<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
String subject=request.getParameter("search");
int start=Integer.parseInt(request.getParameter("start"));
int end=Integer.parseInt(request.getParameter("end"));

reviewDao dao=new reviewDao();
dao.getSearchList(subject, start, end);

response.sendRedirect("../main.jsp?go=review/review.jsp?pageNum="+pageNum);
%>