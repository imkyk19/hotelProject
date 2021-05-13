<%@page import="review.db.reveiwDto"%>
<%@page import="review.db.reviewDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MultipartRequest multi=null;
//업로드할 경로
	//업로드할 경로 구하기 (톰켓에 업로드된 프로젝트 경로 구하기)
	ServletContext context=getServletContext();
	//upload폴더의 실제 경로를 구하는 것
	String realFolder=context.getRealPath("/upload");
System.out.print(realFolder);


try{
	
	multi=new MultipartRequest(request, realFolder, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());

	String g_num=multi.getParameter("g_num");
	String type=multi.getParameter("type");
	String subject=multi.getParameter("subject");
	String content=multi.getParameter("content");
	
	//업로드한 이미지의 원래파일명
	String image=multi.getOriginalFileName("image");
	System.out.print("image: "+image);
	//실제 업로드된 파일명
	String uploadFime=multi.getFilesystemName("image");
	
	//dto로 묶기
	reveiwDto dto= new reveiwDto();
	dto.setG_num(g_num);
	dto.setType(type);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setImage(image);
	
	//insert
	reviewDao dao=new reviewDao();
	dao.insertReview(dto);
	
	response.sendRedirect("../main.jsp?go=review/review.jsp");
	System.out.print("image: "+image);
	
}catch(Exception e){
	e.printStackTrace();
}

%>