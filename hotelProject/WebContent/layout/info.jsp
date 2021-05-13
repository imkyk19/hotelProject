<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	div.info p{
		text-align: center;
		
	}
	
	div.info a{
		color: black;
		text-decoration: none;
		margin-right: 50px;
		font-size: 1em;
	}
	
	
	div.info a:hover {
		color: #0290ff;
		font-weight: bold;
	}
	
	table.info {
		margin-top: 10px;
		margin-left: auto;
		margin-right: auto;
		width: 80% !important;
		border: none !important;
	}
	
	table.info tr, td {
		border: 0px;
	}
	
	table.info tr td span {
		font-size: 1.2em;
		color: gray;
	}
	
	table.info span.bus {
		font-size: 2em;
		color: gray;
	}
	
</style>
</head>
<body>
<div class="info">
	<table class="table table-borderless info" style="border:none;">
		<tr style="border: 0px;">
			<td rowspan="3" style="width: 300px;">
				<p style="font-size: 3em; line-height: 50px;">Hotel GRACE</p><br>
				<p>SEOUL KOREA</p>
			</td>
			<td style="text-align: center;">
				<span class="bus">GRACE Shuttle Service</span>
			</td>
			<td rowspan="3" style="width: 300px; text-align: center; line-height: 120px;">
				
					<a href="main.jsp?go=information/information.jsp">소개</a>
					<a href="main.jsp?go=customer/info.jsp">고객센터</a>
					<a href="main.jsp?go=review/review.jsp">후기</a>
				
			</td>
		</tr>
		<tr>
			<td>
				<span style="margin-right: 50px;">Hotel Front 02-7788-9922</span>
				<span style="margin-right: 50px;" >Room Service 02-7788-9944</span>
			</td>
			
		</tr>
		<tr>
			<td style="height: 20px;">
				<span style="margin-right: 50px;">Concierge 02-7788-9933</span>
				<span style="margin-right: 30px;">Cleaning Service 02-7788-9955</span>
			</td>
			
		</tr>
	</table>
</div>
<div class="bottomInfo" align="left" style="background-color: white; color: gary; font-size: 0.8em; ">
<p>(주) 그레이스호텔 서울특별시 서초구 강남대로 459 (서울특별시 서초구 서초동 1303-34) 사업자등록번호 123-45-78912</p>
<p>호스팅서비스제공자 비트캠프</p>
<p>Copyright(C) HOTEL CO.,LTD. ALL Rights Reserved.</p>
</div>
</body>
</html>