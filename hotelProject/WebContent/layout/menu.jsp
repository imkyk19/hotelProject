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
</style>
</head>
<body>
<table class="table table-bordered">
	<tr>
		<td style="width: 300px; font-size: 1.4em;text-align: center;">
			<span onclick="location.href='main.jsp?go=reservation/bookingform.jsp'">예약<span class="glyphicon glyphicon-calendar"></span></span>
		</td>
		<td style="width: 800px; font-size: 1.8em; text-align: center;"><span onclick="location.href='main.jsp'">Hotel</span></td>
		<td>
			<table class="menu" style="float: right; width: 400px;">
				<tr style="text-align: center;">
					<td><a href="main.jsp?go=login/loginform.jsp">로그인</a></td>
					<td><a href="main.jsp?go=member/memberform.jsp">회원가입</a></td>
					<td><a href="main.jsp?go=reservecheck/reservecheckpage.jsp">예약확인</a></td>
				</tr>
				<tr style="text-align: center;">
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