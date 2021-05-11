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
String ok="ok";
System.out.print("id:"+loginok);

reviewDao dao=new reviewDao();

//아이디를 통해 해당 개인정보 가져오기
GuestDto dto=dao.getId(id);
//아이디를 통해 해당 g_num(guest테이블)값 가져오기
String g_num=dto.getG_num();

//미로그인시 로그인폼 이동
if(loginok!=null){
	%>
<div class="reviewform">
	<div class="reviewmenu">
	<h2>후기</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'">나의 후기글</span><br><br>
	</div>
</div>

<form action="review/reviewaction.jsp" method="post" enctype="multipart/form-data">
	<table class="table table-bordered rtable" style="width: 800px;">
		<caption><b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글 작성</b></caption>
		<input type="hidden" name="g_num" id="g_num" value="<%=g_num%>">
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
				<input type="text" name="subject" id="subject" num=""; class="form-control" required="required" style="width: 500px;">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 40px;">내용</td>
			<td>
			<textarea name="content" id="content" class="form-control" required="required" style="width: 500px; height: 150px;"></textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 40px;">사진첨부</td>
			<td>
				<input type="file" name="image" id="image" class="form-control" style="width: 300px;">
			</td>
		</tr>
	<br>
	<br>
	</table>
	<button type="submit" class="btnq" id="btnq" style="margin-left: 1000px;">등록</button><br><br><br><br><br><br>
</form>	
<script type="text/javascript">
$("#rtpye").change(function() {
	//선택값 얻기
	var p=$(this).val();
	//인풋태그에 넣기
	$("#type").val(p);
	});
</script>
	
	<%
}else{
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href="main.jsp?go=login/loginform.jsp";
	</script>
	<%
}

%>


</body>
</html>