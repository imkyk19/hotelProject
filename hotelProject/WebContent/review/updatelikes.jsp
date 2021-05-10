<%@page import="org.apache.coyote.ajp.AjpAprProtocol"%>
<%@page import="likes.db.LIkesDao"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
reviewDao dao=new reviewDao();
String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
String subject=request.getParameter("subject");

// 로그인한 유저의 아이디를 가져오기(세션 확인)
String userid = null;

if(session.getAttribute("id") != null) {
	userid=(String)session.getAttribute("id");
	System.out.println("로그인된id:"+userid);
}	

LIkesDao ldao=new LIkesDao();

// userID와 userWriteTtilte을 PK, NN 설정이기때매 중복이 불가
int result = ldao.like(userid, subject,h_num);
System.out.println("추천클릭값:"+result);


// 정상적으로 1번 데이터가 들어가면 1이 출력
if (result == 1) {
	result = dao.updatdLikes(h_num);
	return;
} else{
}
%>
