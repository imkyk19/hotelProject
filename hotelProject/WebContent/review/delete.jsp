<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
reviewDao dao=new reviewDao();

dao.deleteContent(h_num);


%>
<script type="text/javascript">
location.href="main.jsp?go=review/review.jsp"
</script>