<%@page import="review.db.reveiwDto"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="review.db.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.reviewmenu{
		position: absolute;
		width: 300px;
		height: 250px;
		margin-top: 50px;
		margin-left: 300px;
		font-size: 1.3em;
		cursor: pointer;
		background-color: #FAEBD0;
		padding: 10px 20px;
	}	
	
	div.form{
		width: 900px;
		margin-top: 50px;
		margin-left: 700px;
	}
</style>
</head>
<body>
<%

//로그인된 아이디 세션 값 얻기
String id=(String)session.getAttribute("id");
String loginok=(String)session.getAttribute("loginok");
System.out.print("id:"+id);
String h_num=request.getParameter("h_num");
String pageNum=request.getParameter("pageNum");
reviewDao dao=new reviewDao();
reveiwDto rdto=dao.getData(h_num);

//아이디를 통해 해당 개인정보 가져오기
GuestDto dto=dao.getId(id);
//아이디를 통해 해당 g_num(guest테이블)값 가져오기
String g_num=dto.getG_num();

	%>
<div class="reviewform">
	<div class="reviewmenu">
	<h2>후기</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'">나의 후기글</span><br><br>
	</div>
</div>

<form action="review/updateaction.jsp" method="post" enctype="multipart/form-data">
	<div class="form">
		<b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글 수정</b><br><br>
		<input type="hidden" name="g_num" id="g_num" value="<%=g_num%>">
		<input type="hidden" name="h_num" id="g_num" value="<%=h_num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
			<b><%=dto.getName()%>
			<input type="hidden" name="name" id="name" value="<%=dto.getName()%>">
			</b>
	
			<b>(<%=id%>)
			<input type="hidden" name="name" id="name" value="<%=id%>">
			</b><br><br><br>
		
			<b style="color: gray;">후기유형</b>
			<br>
			<b>
				<input type="hidden" name="type" id="type" value="칭찬">
					<select name="rtype" id="rtpye" class="form-control" style="width: 100px;">
						<option disabled hidden selected>선택</option>
						<option value="칭찬">칭찬</option>
						<option value="불만">불만</option>
						<option value="기타">기타</option>
					</select>
			</b><br>
	
	
			<b style="color: gray;">제목</b>
			<br>
				<input type="text" name="subject" id="subject" num=""; class="form-control" required="required" style="width: 500px;"
				value="<%=rdto.getSubject()%>"><br>
			
		
			<b style="color: gray;">내용</b>
			<br>
			<textarea name="content" id="content" class="form-control" required="required" style="width: 500px; height: 150px;"><%=rdto.getContent()%></textarea>
			<br>
			<b style="color: gray;">사진첨부</b>
				<input type="file" name="image" id="image" class="form-control" style="width: 300px;" value="<%=dao.getPhoto(rdto.getH_num()) %>">
			<br><br><br>
	</div>
	
	<button type="button" style="width: 120px; margin-left: 800px; color: white;" class="btnlist"
onclick="location.href='main.jsp?go=review/review.jsp?pageNum=<%=pageNum%>'">목록</button>
	<button type="submit" class="btnupdate" id="btnupdate" style="width: 120px; color: white;">수정</button><br><br><br><br><br><br>
</form>	
<script type="text/javascript">
$("#rtpye").change(function() {
	//선택값 얻기
	var p=$(this).val();
	//인풋태그에 넣기
	$("#type").val(p);
	});
</script>

</body>
</html>