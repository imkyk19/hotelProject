<%@page import="org.json.simple.JSONObject"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String google= request.getParameter("google");
	
	GuestDao dao=new GuestDao();
	boolean googleok= dao.isGoogleCheck(google);

	JSONObject ob = new JSONObject();
	ob.put("googleok", googleok?"yes":"no");
%>
<%=ob.toString()%>