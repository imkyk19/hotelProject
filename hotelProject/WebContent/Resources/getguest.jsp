<%@page import="org.json.simple.JSONObject"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	GuestDao dao=new GuestDao();
	GuestDto dto=dao.getData2(num);
	
	JSONObject ob=new JSONObject();
	
	int hp1num=dto.getHp().indexOf("-");
	int hp2num=dto.getHp().indexOf("-",hp1num+1);
	
	int email=dto.getEmail().indexOf("@");
	
	ob.put("name", dto.getName());
	ob.put("id", dto.getId());
	
	
	ob.put("hp1", dto.getHp().substring(0,hp1num));
	ob.put("hp2", dto.getHp().substring(hp1num+1,hp2num));
	ob.put("hp3", dto.getHp().substring(hp2num+1));
	
	ob.put("email1", dto.getEmail().substring(0,email));
	ob.put("email2", dto.getEmail().substring(email+1));
	
	ob.put("addr", dto.getAddr());
	ob.put("year", dto.getBirth().substring(0,4));
	ob.put("month", dto.getBirth().substring(5,7));
	ob.put("day", dto.getBirth().substring(8,10));
	
	ob.put("pass", dto.getPass());
%>
<%=ob.toString()%>