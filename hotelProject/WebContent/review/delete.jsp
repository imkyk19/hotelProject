<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
reviewDao dao=new reviewDao();

dao.deleteContent(h_num);

response.sendRedirect("../main.jsp?go=review/content.jsp?h_num="+h_num+"&pageNum="+pageNum);
%>
