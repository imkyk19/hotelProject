<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="review.db.reveiwDto"%>
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
div.reviewmenu {
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

table.content {
	width: 900px;
	height: 300px;
	margin-top: 70px;
	margin-left: 700px;
}

b.thumbs{
	cursor: pointer;
	font-size: 2em;
}

b.thumbs:active {
	color: red;
	font-weight: bold;
	font-size: 4em;
}
</style>
</head>
<%
	//key, num, pageNum
	String key=request.getParameter("key");
	String h_num=request.getParameter("h_num");
	String pageNum=request.getParameter("pageNum");
	
	//db처리 위한 dao 선언
	reviewDao dao=new reviewDao();
	//목록에서 클릭시에만 조회수 증가
	if(key!=null)
		dao.updateReadCount(h_num);
	
	//출력을 위한 dto 선언
	reveiwDto dto=dao.getData(h_num);
	
	//날짜타입 선언
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//이미지출력: 개인톰켓서버 업로드는 타인이 볼 수 없으므로 해당 이미지 없을경우 임시이미지 출력
	String realPath=getServletContext().getRealPath("/");
	//사진 경로 얻어오기
	String myPhoto=dao.getPhoto(h_num);
	File photo=new File(realPath+"\\"+myPhoto);
	
	//작성자 이름
	GuestDao gdao=new GuestDao();
	GuestDto gdto=gdao.getId(dto.getG_num());
	String name=gdto.getName();
	
	//현재페이지(pageNum이 null인경우 1페이지로 이동)
	int currentPage;
	if(pageNum==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(pageNum);
%>

<body>
<div class="reviewform">
	<div class="reviewmenu">
	<h2>후기</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'">나의 후기글</span><br><br>
	</div>
</div>

<table class="table table-bordered content" >
	<caption><b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글</b></caption>
	<caption><b class="glyphicon glyphicon-thumbs-up thumbs" style="float: right;" h_num="<%=dto.getH_num() %>" pageNum="<%=pageNum%>"></b></caption>
	
	<tr>
		<td style="height: 30px;">
			<b style="font-size:1.3em; color: #524630;"><%=name %>(<%=gdto.getId() %>) 고객님</b>
			<span style="color: gray; float: right;">
			<%=sdf.format(dto.getWriteday())%>
			</span>
		</td>
	</tr>
	<tr>
		<td style="height: 50px;">
			<b style="font-size:2em; font-weight: bold; color: #524630;"><%=dto.getSubject() %></b>
		</td> 
	</tr>
	<tr>
		<td style="height: 200px; color: #524630;">
			<%=dto.getContent().replace("\n", "<br>")%>
		</td>
	</tr>
	<tr>
		<td>
			<%
			//해당 사진이 개인톰켓서버에 존재
			if(photo!=null){
				%>
				<img alt="" src="image/<%=myPhoto%>" class="myphoto" style="width: 600px;" align="center;" >
				<%
			}else{
			//해당 사진이 개인톰켓서버에 미존재시 임시이미지 출력
				%>
				<b>첨부하신 사진이 없습니다.</b>
				<%
			}
			%>
		</td>
	</tr>
</table>
<br>
<button type="button" style="width: 120px; margin-left: 1000px; color: white;" class="btnlist"
onclick="location.href='main.jsp?go=review/review.jsp?pageNum=<%=pageNum%>'">목록</button>
<br><br><br><br><br>

</body>

<script type="text/javascript">

//thumbs클릭 이벤트
$("b.thumbs").click(function() {
	var h_num=$(this).attr("h_num");
	var pageNum=$(this).attr("pageNum");
	console.log(h_num+pageNum)
	
	$(this).css("color", "red");
	$.ajax({
		type:"get",
		dataType:"html",
		data:{"h_num":h_num,"pageNum":pageNum},
		url:"review/updatelikes.jsp",

	});

});

</script>
</html>