<?xml version="1.0" encoding="UTF-8"?>
<%@page import="answer.db.AnswerDto"%>
<%@page import="answer.db.AnswerDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
//num읽기
String num=request.getParameter("num");

//list출력을 위한 dao선언
AnswerDao dao=new AnswerDao();;

List<AnswerDto> list=dao.getAnswerList(num);

//날짜 표기를 위한 선언
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//데이터 출력
for(AnswerDto dto:list){
	%>
	<answer idx="<%=dto.getIdx()%>" num="<%=dto.getNum()%>">
		<content><%=dto.getContent() %></content>
		<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	</answer>
	<%
}
%>
</data>