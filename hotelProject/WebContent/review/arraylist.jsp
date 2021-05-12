<?xml version="1.0" encoding="UTF-8"?>
<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@page import="review.db.reviewDao"%>
<%@page import="review.db.reveiwDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
//num읽기
String number=request.getParameter("number");
String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
String start=request.getParameter("start");
String end=request.getParameter("end");
String readcount="1";
String likes="2";

//list출력을 위한 dao선언
reviewDao dao=new reviewDao();


//날짜 표기를 위한 선언
SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");

if(number.equals(readcount)){
	String array="readcount";
	List<reveiwDto> list=dao.getArrayList(array, start, end);
	
	//데이터 출력
	for(reveiwDto dto:list){
		GuestDao gdao=new GuestDao();
		GuestDto gdto=gdao.getId(dto.getG_num());
		String name=gdto.getName();
		%>
		<answer h_num="<%=dto.getH_num()%>" g_num="<%=dto.getG_num()%>">
			<type><%=dto.getType() %></type>
			<subject><%=dto.getSubject() %></subject>
			<content><%=dto.getContent() %></content>
			<readcount><%=dto.getReadcount() %></readcount>
			<likes><%=dto.getLikes() %></likes>
			<writeday><%=sdf.format(dto.getWriteday())%></writeday>
			<name><%=name %></name>
		</answer>
		<%
	}

}else if(number.equals(likes)){
	String array="likes";
	List<reveiwDto> list=dao.getArrayList(array, start, end);
	
	//데이터 출력
	for(reveiwDto dto:list){
		GuestDao gdao=new GuestDao();
		GuestDto gdto=gdao.getId(dto.getG_num());
		String name=gdto.getName();
		%>
		<answer h_num="<%=dto.getH_num()%>" g_num="<%=dto.getG_num()%>">
			<type><%=dto.getType() %></type>
			<subject><%=dto.getSubject() %></subject>
			<content><%=dto.getContent() %></content>
			<readcount><%=dto.getReadcount() %></readcount>
			<likes><%=dto.getLikes() %></likes>
			<writeday><%=sdf.format(dto.getWriteday())%></writeday>
			<name><%=name %></name>
		</answer>
		<%
	}

}else{
	String array="writeday";
	List<reveiwDto> list=dao.getArrayList(array, start, end);

	//데이터 출력
	for(reveiwDto dto:list){
		GuestDao gdao=new GuestDao();
		GuestDto gdto=gdao.getId(dto.getG_num());
		String name=gdto.getName();
		%>
		<answer h_num="<%=dto.getH_num()%>" g_num="<%=dto.getG_num()%>">
			<type><%=dto.getType() %></type>
			<subject><%=dto.getSubject() %></subject>
			<content><%=dto.getContent() %></content>
			<readcount><%=dto.getReadcount() %></readcount>
			<likes><%=dto.getLikes() %></likes>
			<writeday><%=sdf.format(dto.getWriteday())%></writeday>
			<name><%=name %></name>
		</answer>
		<%
	}
}

%>
</data>
