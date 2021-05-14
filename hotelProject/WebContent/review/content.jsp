<%@page import="likes.db.LIkesDao"%>
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
	width: 250px;
	height: 400px;
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

button{
	float: left;
}

div.btnbox{
	position: absolute;
	width: 900px;
	height: 100px;
	margin-left: 1200px;
}

.table-striped>tbody>tr:nth-child(odd)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
   background-color: #FAEBD0;
 }
 
 div.photodiv{
 	width: 900px;
 	text-align: center;
 }

</style>
</head>
<%
	//key, num, pageNum
	String key=request.getParameter("key");
	String h_num=request.getParameter("h_num");
	String pageNum=request.getParameter("pageNum");
	
	//id세션 값
	//로그인된 아이디 세션 값 얻기
	String id=(String)session.getAttribute("id");
	
	//로그인 되어있는지 체크
	String loginok=(String)session.getAttribute("loginok");
	
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
	<hr style="border:2px solid black;width:200px;margin-top:0px;margin-left: 0px;">
	<span class="contact" onclick="location.href='main.jsp?go=review/review.jsp'"style="color: #8C4C27;">후기글 목록</span><br><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'"style="color: #8C4C27;">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'"style="color: #8C4C27;">나의 후기글</span><br><br>
	</div>
</div>

<table class="table table-striped content" >
	<caption><b style="color: #524630; font-weight: bold;'">후기>후기글</b></caption>
		<tr>
		<td style="height: 50px;">
			<b style="font-size:2em; font-weight: bold; color: #524630;"><%=dto.getSubject() %></b>
			<br>
			<b style="color: gray;"><%=name %>(<%=gdto.getId() %>)</b>
			<b style="color: gray;"><%=sdf.format(dto.getWriteday())%></b>
			<b style="float: right;">조회  <%=dto.getReadcount() %></b>
			<br>
			<br>
		</td> 
	</tr>
	<tr style="border: 1px solid #FAEBD0;">
		<td style="height: 200px; color: #524630;">
			<h4><%=dto.getContent().replace("\n", "<br>")%></h4>
			<div class="photodiv">
						<%
			//해당 사진이 개인톰켓서버에 존재
			if(myPhoto==null){
				%>
				<br><img alt="" src="image/logo.png" class="myphoto" align="center;" style="width: 400px; height: 300px;" ><br>
				<%
			}else{
			//해당 사진이 개인톰켓서버에 미존재
				%>
				
				<br><img alt="" src="image/<%=myPhoto%>" class="myphoto" style="width: 400px; height: 300px;" align="center;" ><br>
				<%
			}
			%>
			</div>

		<%
	LIkesDao ldao=new LIkesDao();
	if(ldao.likeData(id, dto.getSubject(), h_num)!=0){
		int thumbs=ldao.likeData(id, dto.getSubject(), h_num);
		//System.out.println("로그인된 아이디:"+id);
		//System.out.println("클릭되어있으면1 안되어있으면0:"+thumbs);
		%>
		<b style="margin-left: 400px; font-size: 3em;"><%=dto.getLikes()%></b>
		<b class="glyphicon glyphicon-thumbs-up thumbs" style="text-align:center; color: red;" thumbs="<%=thumbs %>" loginok="<%=loginok%>"
				h_num="<%=dto.getH_num() %>" pageNum="<%=pageNum%>" subject="<%=dto.getSubject()%>" id="<%=id%>" style="font-size: 3em;"></b>
		<%
	}else{
		%>
		<b style="margin-left: 400px; font-size: 3em;"><%=dto.getLikes()%></b>
		<b class="glyphicon glyphicon-thumbs-up thumbs" loginok="<%=loginok%>" h_num="<%=dto.getH_num() %>" pageNum="<%=pageNum%>" 
		subject="<%=dto.getSubject()%>" id="<%=id%>" style="font-size: 3em;" ></b>
		<%
	}
	%>
		</td>
	</tr>
</table>
<br>
<button type="button" style="width: 120px; margin-left: 1100px; color: white;" class="btnlist"
onclick="location.href='main.jsp?go=review/review.jsp?pageNum=<%=pageNum%>'">목록</button>

<%
if(loginok!=null && id.equals(gdto.getId())){
	%>
	<div class="btnbox" >
		<button type="button" style="width: 120px; color: white; margin-left:150px; margin-right:10px;" class="btnupdate"
		onclick="location.href='main.jsp?go=review/updateform.jsp?h_num=<%=dto.getH_num()%>&pageNum=<%=pageNum%>'">수정</button>
	<button type="button" style="width: 120px;  color: white;" class="btndelete"
		onclick="location.href='main.jsp?go=review/delete.jsp?h_num=<%=dto.getH_num()%>'">삭제</button>	
	</div>
	<%
}
%>

 
<br><br><br><br><br>

</body>

<script type="text/javascript">
var click=true;

//thumbs클릭 이벤트
$("b.thumbs").click(function() {
	var h_num=$(this).attr("h_num");
	var pageNum=$(this).attr("pageNum");
	var subject=$(this).attr("subject");
	var id=$(this).attr("id");
	var thumbs=$(this).attr("thumbs");
	var loginok=$(this).attr("loginok");
	console.log(loginok);
	
	//클릭시	
	if(click){
		//미로그인시 로그인폼 이동
		if(loginok!="ok"){
			alert("로그인이 필요합니다.");
			return;
		}if(thumbs==1){
			alert("이미 추천을 누르신 게시글입니다.");
		}else{
			$(this).css("color", "red");
			$.ajax({
				type:"get",
				dataType:"html",
				data:{"h_num":h_num,"pageNum":pageNum,"subject":subject},
				url:"review/updatelikes.jsp",
				success:function(data){
					window.location.reload();
					alert("추천되었습니다. 감사합니다.");	
				}
			});	
			//click false값으로 변경
			click=!click;
		}
	}else{
		alert("죄송합니다. 추천은 게시글당 1회씩 가능합니다.");
	}
	
});

</script>
</html>