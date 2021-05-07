<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
reviewDao dao=new reviewDao();
String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
dao.updatdLikes(h_num);

response.sendRedirect("main.jsp?go=review/content.jsp?h_num="+h_num+"&pageNum="+pageNum);
%>
   