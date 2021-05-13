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
		width: 250px;
		height: 400px;
		margin-top: 50px;
		margin-left: 300px;
		margin-bottom: 200px;
		font-size: 1.3em;
		cursor: pointer;
		background-color: #FAEBD0;
		padding: 10px 20px;
	}	
	
	div.form{
		width: 900px;
		margin-top: 70px;
		margin-left: 650px;
		
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
	<hr style="border:2px solid black;width:200px;margin-top:0px;margin-left: 0px;">
	<span class="contact" onclick="location.href='main.jsp?go=review/review.jsp'"style="color: #8C4C27;">후기글 목록</span><br><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'"style="color: #8C4C27;">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'"style="color: #8C4C27;">나의 후기글</span><br><br>
	</div>
</div>

<form action="review/reviewaction.jsp" method="post" enctype="multipart/form-data">
	<div class="form">
		<b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글 작성</b><br><br>
		<input type="hidden" name="g_num" id="g_num" value="<%=g_num%>">
		
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
						<option disabled hidden selected >선택</option>
						<option value="칭찬">칭찬</option>
						<option value="불만">불만</option>
						<option value="기타">기타</option>
					</select>
			</b><br>
	
	
			<b style="color: gray;">제목</b>
			<br>
				<input type="text" name="subject" id="subject" num=""; class="form-control" required="required" style="width: 500px;"><br>
			
		
			<b style="color: gray;">내용</b>
			<br>
			<textarea name="content" id="content" class="form-control" required="required" style="width: 500px; height: 150px;"></textarea>
			<br>

			<b style="color: gray;">사진첨부</b>
				<input type="file" name="image" id="image" class="form-control" style="width: 300px;">
			<br><br><br>
	</div>


	<button type="submit" class="btnq" id="btnq" style="margin-left: 900px; color: white;">등록</button><br><br><br><br><br><br>
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