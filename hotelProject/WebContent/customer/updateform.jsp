<%@page import="question.db.QuestionDao"%>
<%@page import="question.db.QuestionDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
	div.infomenu{
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
	
	table.content{
		width: 700px;
		height: 500px;
		margin-top: 50px;
		margin-left: 700px;
	}
</style>
</head>
<body>
<%
	String num=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		pageNum="1";
	String key=request.getParameter("key");

	QuestionDao dao=new QuestionDao();
	//dto 가져오기
	QuestionDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	<div class="infomenu">
	<h2>고객센터</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=customer/info.jsp'">연락처 및 오시는길</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/question.jsp'">문의하기</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/questioncheck.jsp'">문의확인</span>
	</div>
<form action="customer/updateaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
<table class="table table-bordered content" >
	<caption><b style="font-size: 2em; color: #524630; font-weight: bold;'">문의글 수정하기</b></caption>
	<caption><b style="color: gray;">※제목과 내용만 수정가능합니다.</b></caption>
	
	<tr>
		<td style="height: 30px;">
			<b style="font-size:1.3em; color: #524630;">성함: <%=dto.getName() %></b>
			<span style="color: gray; float: right;">
			<%=sdf.format(dto.getWriteday())%>
			</span>
		</td>
	</tr>
	<tr>
		<td style="height: 50px;">
			제목: <input type="text" name="subject" class="form-control"
			style="font-size:1.3em; font-weight: bold; color: #524630;" value="<%=dto.getSubject() %>">
		</td> 
	</tr>
	<tr>
		<td style="color: #524630;">
		내용: <textarea name="content" class="form-control" 
		style="height: 300px; font-size:1.3em;"><%=dto.getContent() %></textarea>

		</td>
	</tr>
</table>
<br>
<button type="button" style="width: 120px; margin-left: 900px; color: white;" class="btnlist"
onclick="location.href='main.jsp?go=customer/questioncheck.jsp?pageNum=<%=pageNum%>'">목록</button>
<button type="submit" style="width: 120px; color: white;" class="btnupdate">수정</button>
</form>	
<br><br><br><br><br>
</body>
</html>