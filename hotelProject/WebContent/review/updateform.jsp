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
	
	table.rtable{
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
	<table class="table table-bordered rtable" style="width: 800px;">
		<caption><b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글 수정</b></caption>
		<input type="hidden" name="g_num" id="g_num" value="<%=g_num%>">
		<input type="hidden" name="h_num" id="g_num" value="<%=h_num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">아이디</td>
			<td><%=id%>
			<input type="hidden" name="name" id="name" value="<%=id%>">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">성명</td>
			<td><%=dto.getName()%>
			<input type="hidden" name="name" id="name" value="<%=dto.getName()%>">
			</td>
		</tr>					
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">후기유형</td>
			<td>
				<input type="hidden" name="type" id="type">
					<select name="rtype" id="rtpye" class="form-control" style="width: 200px;">
						<option disabled hidden selected>선택</option>
						<option value="칭찬">칭찬</option>
						<option value="불만">불만</option>
						<option value="기타">기타</option>
					</select><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">제목</td>
			<td>
				<input type="text" name="subject" id="subject" num=""; class="form-control" required="required" style="width: 500px;"
					value="<%=rdto.getSubject() %>">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 40px;">내용</td>
			<td>
			<textarea name="content" id="content" class="form-control" required="required" style="width: 500px; height: 150px;">
			<%=rdto.getContent() %>
			</textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 40px;">사진첨부</td>
			<td>
				<input type="file" name="image" id="image" class="form-control" style="width: 300px;" value="<%=dao.getPhoto(rdto.getH_num()) %>">
			</td>
		</tr>
	<br>
	<br>
	</table>
	<button type="button" style="width: 120px; margin-left: 900px; color: white;" class="btnlist"
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