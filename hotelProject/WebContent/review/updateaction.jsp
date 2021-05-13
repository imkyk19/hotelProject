<%@page import="review.db.reveiwDto"%>
<%@page import="review.db.reviewDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MultipartRequest multi=null;
//업로드할 경로
String realFolder=getServletContext().getRealPath("/upload");


try{
	
	multi=new MultipartRequest(request, realFolder, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());

	String h_num=multi.getParameter("h_num");
	String pageNum=multi.getParameter("pageNum");
	String type=multi.getParameter("type");
	String subject=multi.getParameter("subject");
	String content=multi.getParameter("content");
	
	//업로드한 이미지의 원래파일명
	String image=multi.getOriginalFileName("image");
	System.out.print("image: "+image);
	//실제 업로드된 파일명
	String uploadFime=multi.getFilesystemName("image");
	
	//dto로 묶기
	reveiwDto dto= new reveiwDto();;
	dto.setType(type);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setImage(image);
	
	//insert
	reviewDao dao=new reviewDao();
	dao.updateContent(h_num, type, subject, content, image);
	
	response.sendRedirect("../main.jsp?go=review/content.jsp?h_num="+h_num+"&pageNum="+pageNum);
	System.out.print("image: "+image);
	
}catch(Exception e){
	e.printStackTrace();
}

%>