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
		line-height: 40px;
	}
	
	div.info a{
		color: black;
		text-decoration: none;
	}
	
	div.info div.aTag {
		text-align: center;
	}
	
	div.info a:hover {
		color: #0290ff;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="info">
	
		<p style="font-size: 2em; margin-top: 50px;">Hotel GRACE</p>
		<p>연락처 02-3511-2654</p>
		<div class="aTag">
			<a href="main.jsp?go=information/information.jsp">소개</a>
			<a href="main.jsp?go=customer/info.jsp">고객센터</a>
			<a href="main.jsp?go=review/review.jsp">후기</a>
		</div>
</div>
<div align="center" style="background-color: white; height: 100px; color: gary; font-size: 0.8em; margin-left: auto; margin-right: auto;">
<p>(주) 그레이스호텔 서울특별시 서초구 강남대로 459 (서울특별시 서초구 서초동 1303-34) 사업자등록번호 123-45-78912</p>
<p>호스팅서비스제공자 비트캠프</p>
<p>Copyright(C) HOTEL CO.,LTD. ALL Rights Reserved.</p>
</div>
</body>
</html>