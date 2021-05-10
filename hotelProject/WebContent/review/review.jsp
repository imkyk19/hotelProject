<%@page import="guest.db.GuestDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="review.db.reveiwDto"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="review.db.reviewDao"%>
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
	
	div.check{
	width: 900px;
	height: 300px;
	margin-top: 70px;
	margin-left: 700px;
	}
	
	ul {
	list-style:none;
	float:left;
	display:inline;
	}
	
	ul li {
	float:left;
	}
	
	ul li a {
	float:left;
	padding:4px;
	margin-right:3px;
	width:15px;
	color:#000;
	font:bold 13px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
	}
	
	ul li a:hover, ul li a:focus {
	color:#fff;
	border:1px solid #524630;
	background-color:#524630;
	text-decoration: none;
	}
</style>
</head>

<%
	reviewDao dao=new reviewDao();

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
	List<reveiwDto> list=dao.getList(start, end);
%>

<body>
<div class="reviewform">
	<div class="reviewmenu">
	<h2>후기</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=review/reviewform.jsp'">후기글 작성</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=review/myreview.jsp'">나의 후기글</span><br><br>
	</div>
</div>

<div class="check">
<b style="font-size: 2em; color: #524630; font-weight: bold;'">후기글</b><br><br>
<%
	if(totalCount>0){
		%>
			<b>Total : <%=totalCount %></b>
		<%
	}
%>
<input type="hidden" name="search" id="search">
<input type="text" name="inputsearch" id="inputsearch" style="width: 120px; margin-left: 650px;" placeholder="검색">
<button type="button" class="btnsearch" id="btnsearch" style="color: white;" search="" start="<%=start%>" end="<%=end%>">검색</button>
<br><br>
<table class="table table-bordered" style="width: 900px;">
	<tr bgcolor="#fff7e8"  >
		<th width="60" style="text-align: center;" >번호</th>
		<th width="300">제목</th>
		<th width="70" style="text-align: center;" >작성자</th>
		<th width="100" style="text-align: center;" >작성일</th>
		<th width="100" style="text-align: center;" >조회수</th>
		<th width="100" style="text-align: center;" >추천</th>
	</tr>
	<%
		if(totalCount==0){
			%>
				<tr>
					<td colspan="5" align="center"">
						<b>저장된 게시글이 없습니다.</b>
					</td>
				</tr>
			<%
		}else{
			//글이 있는 경우 : 페이징처리
			SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");
			
			
			for(reveiwDto dto:list){
				%>
					<tr align="center">
						<td><%=no-- %></td>
						<td align="left">
						<%
						//제목 클릭시 content.jsp 내용보이게 href에 넣기
						String path="main.jsp?go=review/content.jsp?h_num="
									+dto.getH_num()+"&pageNum="+currentPage+"&key=list"; 
						//key: 목록에서 클릭한 경우에만 조회수를 증가하기 위한 값
							//현재날짜 게시글만 new 띄우기
							Date day=new Date();
							String today=sdf.format(day);
							if(today.equals(sdf.format(dto.getWriteday()))){
								%>
								<a id="alink" href="<%=path %>" style="color: black; cursor: pointer;" h_num="<%=dto.getH_num()%>" pageNum="<%=currentPage%>">
								<%=dto.getSubject() %></a>&nbsp;<img src="image/new.png" style="width: 15px;" height="15px;">
								<%
							}else{
								%>
								<a href="<%=path %>" style="color: black; cursor: pointer;" h_num="<%=dto.getH_num()%>">
								<%=dto.getSubject() %>
								</a>
								<% 
							}
						%>

						</td>
						<%
						GuestDao gdao=new GuestDao();
						GuestDto gdto=gdao.getId(dto.getG_num());
						String name=gdto.getName();
						%>
						<td><%=name%></td>
						<td><%=sdf.format(dto.getWriteday()) %></td>
						<td><%=dto.getReadcount() %></td>
						<td><%=dto.getLikes() %></td>
					</tr>
					

				<%
			}
		}
	%>
</table>
</div>
<!-- 페이징처리 -->
<%
	//글이 있는 경우
	if(totalCount>0)
	{
		%>
		<div style="width: 900px; text-align: center; margin-left: 670px; margin-top: 30px;">
			<ul >
			<%
			if(startPage>1)
			{
				String pre="main.jsp?go=review/review.jsp?pageNum="+(startPage-1);
				%>
					<li><a href="<%=pre%>">＜이전</a></li>
				<%
			}
			%>
		
			<%
				for(int i=startPage; i<=endPage; i++)
				{
					String path="main.jsp?go=review/review.jsp?pageNum="+i;
					
					//현재페이지인경우 클래스 active 추가
					if(i==currentPage)
					{
					%>
					<li class="active"><a href="<%=path%>"><%=i%></a></li>
					<%
					}else{
					%>
					<li><a href="<%=path%>"><%=i%></a></li>
					<%	
					}
				}
			if(endPage<totalPage)
			{
				String next="main.jsp?go=review/review.jsp?pageNum="+(endPage+1);
				%>
					<li><a href="<%=next%>">다음＞</a></li>
				<%
			}
			%>
			</ul>
		</div>
		<%
	}
%>
<br><br><br><br><br>
<script type="text/javascript">

$("#inputsearch").change(function() {
	//선택값 얻기
	var p=$(this).val();
	//인풋태그에 넣기
	$("#search").val(p);
	//btn에 넣기
	$("#btnsearch").attr("search", p);
	});
	
$("#btnsearch").click(function() {
	var search=$(this).attr("search");
	var h_num=$("#alink").attr("h_num");
	var pageNum=$("#alink").attr("pageNum");
	var start=$(this).attr("start");
	var end=$(this).attr("end");
	
	$.ajax({
		type:"get",
		dataType:"html",
		data:{"h_num":h_num,"pageNum":pageNum,"search":search,"start":start,"end":end},
		url:"review/searchSubject.",
		success:function(data){
		}
	});	
});
</script>
</body>
</html>