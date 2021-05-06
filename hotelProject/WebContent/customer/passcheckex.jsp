<%@page import="java.util.List"%>
<%@page import="question.db.QuestionDao"%>
<%@page import="question.db.QuestionDto"%>
<%@page import="java.io.Console"%>
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
	div.form{
		width: 400px;
		height: 300px;
		text-align: center;
		margin-top: 50px;
		margin-left: 700px;
	}

	div.statement{
		width: 400px;
		height: 150px;
	}
</style>
</head>
<%
QuestionDao dao=new QuestionDao();

int totalCount=dao.getTotalCount();//전체개수 구하기
int totalPage;//전체 페이지
int startPage;//각 블럭의 시작페이지
int endPage;//각 블럭의 마지막페이지
int start;//각 페이지의 시작번호
int end;//각 페이지의 끝번호
int no;//각 페이지에서 출력을 시작할 번호
int perPage=5;//한페이지에 보여질 글의 개수
int perBlock=5;//한 블럭에 보여질 페이지의 개수
int currentPage;//현재 페이지

//총 페이지수 구하기
totalPage=totalCount/perPage+(totalCount%perPage>0?1:0); 
//나머지가 있으면 1페이지 더하기(글개수13개면 페이지3장필요)

//현재페이지(pageNum이 null인경우 1페이지로 이동)
String pageNum=request.getParameter("pageNum");
if(pageNum==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(pageNum);

//현재페이지가 3인경우 startPage는 1, endPage=5 / 현재페이지가 6인경우 startPage는 6, endPage=10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//만약 총 페이지수가 8인경우 2번째 블럭은 startPage 6, endPage 10 BUT, 이때 endPage는 8로 표기되어야한다.
if(totalPage<endPage)
	endPage=totalPage;

//각 페이지의 시작번호, 끝번호 구하기(1일경우 1, 2일경우 6)
start=(currentPage-1)*perPage+1;
end=start+perPage-1;

//총 글수가 12인경우 마지막페이지의 end는 12가 되어야한다.
if(end>totalCount)
	end=totalCount;

//각 글 앞에 붙일 시작번호구하기 
//예: 총글이 20개일경우 1페이지는 20부터 2페이지는 15부터 출력해서 1씩 감소해가며 출력할것
no=totalCount-(currentPage-1)*perPage;

//start부터 end까지 게시글 가져오기
List<QuestionDto> list=dao.getList(start, end);	

String pass=request.getParameter("pass");
String num=request.getParameter("num");
	
%>
<body>
	<div class="form">
	<div class="statement">
		<h3 style="font-weight: bold;">비밀글 기능으로 보호된 글입니다.</h3>
		<h4>작성자와 관리자만 열람하실 수 있습니다.</h4>
		<h4>본인이라면 비밀번호를 입력하세요.</h4>
	</div>
	<input type="hidden" id="password" name="password">
	<input type="password" id="inputpass" style="width: 200px;" placeholder="비밀번호" required="required"><br><br>
	<button type="button" id="btncheck" style="width: 200px; color: white;">확인</button>
	</div>
</body>
<script type="text/javascript">
	$("#inputpass").change(function() {
	var p=$(this).val();
	$("#password").val(p);
	});
	
	$("#btncheck").click(function() {
		var password=$("#password").val();
		var pass=<%=pass%>;
		console.log(password);
		console.log(pass);
		
		
		if(password==pass.toString() || password=="system"){
			<%
			QuestionDto dto=dao.getData(num);
			String path="main.jsp?go=customer/content.jsp?num="
					+dto.getNum()+"&pageNum="+currentPage+"&pass="+dto.getPass(); 
			%>
			location.href="<%=path%>";
		}else{
			alert("맞지않는 비밀번호입니다.");
		}
		

	});
</script>
</html>