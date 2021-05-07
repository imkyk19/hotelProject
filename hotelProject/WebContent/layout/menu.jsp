<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table.menu td{
		width: 100px;
	}
	
	table.tableform{
		width: 100%;
		height: 100px;
		line-height: 100px;
		background-color: #FAEBD0;
		
	}
	
	table.menu a{
		color: #8C4C27;
		text-decoration: none;
		cursor: pointer;
	}
</style>
</head>
<body>
<table class="tableform">
	<tr>
		<td style="width: 300px; font-size: 2em;text-align: center;">
			<span onclick="location.href='main.jsp?go=reservation/bookingform.jsp'" style="line-height: 80px; cursor: pointer;color: #594C3C;">예약<span class="glyphicon glyphicon-calendar"></span></span>
		</td>
		<td style="width: 800px; font-size: 3em; text-align: center; cursor:pointer;color: #594C3C;"><span onclick="location.href='main.jsp'">Hotel GRACE</span></td>

		<td style="width: 300px;">
			<table class="menu" style="float: right; text-align: left;line-height: 40px;">
				<tr style="text-align: left;">
					<%
						String id=(String)session.getAttribute("id");
						String loginok=(String)session.getAttribute("loginok");
						if(loginok==null){%>
							<td><a href="main.jsp?go=login/loginform.jsp">로그인</a></td>
							<td><a href="main.jsp?go=member/memberform.jsp">회원가입</a></td>
						<%}else{%>
							<td><a href="login/logoutaction.jsp">로그아웃</a></td>
							<td><a href="main.jsp?go=mypage/mypagemain.jsp">마이페이지</a></td>
						<%}
					%>
					
					<td><a href="main.jsp?go=reservecheck/reservecheckpage.jsp">예약확인</a></td>
				</tr>
				<tr style="text-align: left;">
					<td><a href="main.jsp?go=information/information.jsp">소개</a></td>
					<td><a href="main.jsp?go=customer/info.jsp">고객센터</a></td>
					<td><a href="main.jsp?go=review/review.jsp">후기</a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>