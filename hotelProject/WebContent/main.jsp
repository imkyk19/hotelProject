<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>호텔</title>
<script type="text/javascript">
	$(function(){
		stickyFooter();
	});
</script>
<%
	//go를 읽어서 null일경우 body.jsp를 include하고 null이 아닐경우 해당 파일 include
	String body="layout/body.jsp";
	String go=request.getParameter("go"); //경로 포함한 파일명
	//go를 읽었을 때 null이 아니면
	if(go!=null)
		body=go;
%>
</head>
<body>
<div class="main">
	<div class="menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	<div class="body">
		<jsp:include page="<%=body %>"/>
	</div>
	<div class="info">
		<jsp:include page="layout/info.jsp"/>
	</div>
</div>
<script type="text/javascript">
	//info위치 정하는 함수
	function stickyFooter(){
		var height=$("div.body").height();
		console.log(height);
		$("div.info").css("top",height+100);
	}
</script>
</body>
</html>