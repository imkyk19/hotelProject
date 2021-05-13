<%@page import="review.db.reveiwDto"%>
<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	reviewDao dao=new reviewDao();
	reveiwDto dto=dao.getData(num);
	dto.setSubject(subject);
	dto.setContent(content);
	dao.updateContent(num, dto.getType(), subject, content, dto.getImage());
%>
<script type="text/javascript">
location.href="reviewlist.jsp";
</script>