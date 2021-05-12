<%@page import="answer.db.AnswerDao"%>
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
	
	div.content{
		width: 700px;
		margin-top: 50px;
		margin-left: 700px;
	}

	div.list{
		width: 700px;
	}
	
	span.aday{
		float: right;
		color: gray;
		font-size: 9pt;
	}
	
	span.adel{
		margin-left: 3px;
		cursor: pointer;
	}
	
	span.adel:active{
		color: red;
	}
	
.table-striped>tbody>tr:nth-child(odd)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
   background-color: #FAEBD0;
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
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("id");
	System.out.print(id);

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
<div class="content">
<table class="table table-striped content">
	<caption><b style=" color: #524630; font-weight: bold;'">고객센터>문의확인>문의글</b></caption>
	<tr>
		<td style="height: 50px;">
			<b style="font-size:2em; font-weight: bold; color: #524630;"><%=dto.getSubject() %></b><br>
			<b style="font-size:1.3em; color: gray;"><%=dto.getName() %></b>
			<b style="color: gray;"><%=sdf.format(dto.getWriteday())%></b>
		</td> 
	</tr>

	<tr>
		<td style="height: 200px; color: #524630;">
			<%=dto.getContent().replace("\n", "<br>")%>
		</td>
	</tr>
</table>
<input type="hidden" name="num" id="num" value="<%=num%>">
<input type="hidden" name="pageNum" id="pageNum" value="<%=pageNum%>">
<%
//관리자 계정 로그인시 댓글 가능
if(loginok!=null && id.equals("manager")){
	%>
	
	<div style="width: 700px; background-color: #FAEBD0;" class="form-inline">
		<b>관리자 <%=id %> : </b>
		<input type="text" class="form-control" name="reple" id="reple" style="width: 500px;">
		<button type="button" name="btnreple" id="btnreple" style="color: white;">입력</button>
	</div>
	<br>
	<%
}
%>
<div class="list"></div><br><br>
<button type="button" style="width: 120px;  color: white;" class="btnlist"
onclick="location.href='main.jsp?go=customer/questioncheck.jsp?pageNum=<%=pageNum%>'">목록</button>
	<tr>
		<td align="right" style="height: 10px; border:1px solid white;">
	<button type="button" style="width: 120px; margin-left: 300px; color: white;" class="btnupdate"
	onclick="location.href='main.jsp?go=customer/updateform.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>
	<button type="button" style="width: 120px; color: white;" class="btndel"
	onclick="location.href='customer/delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
		</td>
	</tr>
<br><br><br><br><br>
</div>

<script type="text/javascript">
	$(function(){
		list();

	});
	
	//댓글출력 사용자함수
	function list(){
		var num=$("#num").val();
		$.ajax({
			type:"post",
			dataType:"xml",
			url:"customer/answerlist.jsp",
			data:{"num":num},
			success:function(data){
				list();
				var s="";
				//댓글 출력
				$(data).find("answer").each(function(i, element) {
					var n=$(this);
					//속성으로 넣은 값 attr로 얻기, 컬럼으로 넣은 값 find로 찾기
					var idx=n.attr("idx");
					var content=n.find("content").text();
					var writeday=n.find("writeday").text();
					
					s+="<b>관리자 manager : </b>"+content+"<span class='aday'>";
					s+=writeday;
					<%
					//관리자 계정 로그인시 삭제 가능
					if(loginok!=null && id.equals("manager")){
						%>
						s+="<span class='adel glyphicon glyphicon-trash' idx="+idx+"></span>";
						<%		
					}
					%>
					s+="</span><br>";
					//div에 html로 출력
					$("div.list").html(s);
				});
			}
		});
	}
	
	//btnreple버튼 클릭시 댓글데이터 추가
	$("#btnreple").click(function() {
		var num=$("#num").val();
		var pageNum=$("#pageNum").val();
		var content=$("#reple").val();
		$("#reple").val("");
		$.ajax({
			type:"post",
			dataType:"html",
			url:"customer/insertanswer.jsp",
			data:{"num":num,"pageNum":pageNum,"content":content},
			success:function(d){
				//목록 재출력
				list();
				//입력값 지우기
				$("#reple").val("");
			}
		});
	});
	
	//삭제버튼 클릭 이벤트
	$(document).on("click","span.adel", function() {
		alert("ss");
		var idx=$(this).attr("idx");
		var num=$("#num").val();
		var pageNum=$("#pageNum").val();
		$.ajax({
			type:"get",
			dataType:"html",
			url:"customer/deleteanswer.jsp",
			data:{"num":num,"pageNum":pageNum,"idx":idx},
			success:function(d){
				//목록 재출력
				list();
			}
			,error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

		});
		
	});
</script>
</body>
</html>