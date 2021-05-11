<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<list> 
<%
	DbConnect db=new DbConnect();
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from reservation order by room_num";        
	//db연결
	conn=db.getCommonConnection();
	try{
		 pstmt=conn.prepareStatement(sql);
		 rs=pstmt.executeQuery(sql);
		 while(rs.next())
		 {
			  String room_num=rs.getString("room_num");
			  String booking_qty=rs.getString("booking_qty");
			  String guest_qty=rs.getString("guest_qty");
			  String checkin_date=rs.getString("checkin_date");
			  String checkout_date=rs.getString("checkout_date");		
			  String total_price=rs.getString("total_price");
	    	 %>
			
			<reservation>	
					<room_num><%=room_num%></room_num>
					<booking_qty><%=booking_qty%></booking_qty>
					<guest_qty><%=guest_qty%></guest_qty>
					<checkin_date><%=checkin_date%></checkin_date>
					<checkout_date><%=checkout_date%></checkout_date>
					<total_price><%=total_price%></total_price>
				
			</reservation>	
			<%  }
	
	}catch(SQLException e){
		System.out.println("select 오류:"+e.getMessage());
	}finally{
		db.dbColse(rs, pstmt, conn);
	}

%>
</list>
