<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.infomenu{
		position: absolute;
		width: 300px;
		height: 250px;
		margin-left: 300px;
		font-size: 1.3em;
		cursor: pointer;
		background-color: #FAEBD0;
		padding: 10px 20px;
	}
	
	div.map{
		width: 900px;
		margin-top: 50px;
		margin-left: 700px;
		padding: 10px 10px;
	}
	
	div.hotelcontact{
		width: 900px;
		margin-left: 700px;
		padding: 10px 10px;
	}
</style>
</head>
<body>
<div class="information">
	<div class="infomenu">
	<h2>고객센터</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=customer/info.jsp'">연락처 및 오시는길</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/question.jsp'">문의하기</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/questioncheck.jsp'">문의확인</span>
	</div>
	
	<div class="map">
	<b style="font-size: 2em; color: #524630; font-weight: bold;">오시는 길</b>
	<br>
	<!-- 위치 안내 -->
	<div class="loaction" style="font:normal normal 400 12px/normal dotum, sans-serif; width:640px; height:392px; color:#333; position:relative">
	<div style="height: 360px;"><a href="https://map.kakao.com/?urlX=505410.0&amp;urlY=1112128.0&amp;itemId=23062480&amp;q=%EB%B9%84%ED%8A%B8%EC%BA%A0%ED%94%84%20%EC%84%9C%EC%B4%88%EB%B3%B8%EC%9B%90&amp;srcid=23062480&amp;map_type=TYPE_MAP&amp;from=roughmap" target="_blank"><img class="map" src="//t1.daumcdn.net/roughmap/imgmap/f3c7543377b057868f160c9e151080d464ebd0679638a4e6b8921da53691121c" width="638px" height="358px" style="border:1px solid #ccc;"></a></div><div style="overflow: hidden; padding: 7px 11px; border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 0px 0px 2px 2px; background-color: rgb(249, 249, 249);">
	<a href="https://map.kakao.com" target="_blank" style="float: left;"><img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵" style="display:block;width:72px;height:16px"></a>
	<div style="float: right; position: relative; top: 1px; font-size: 11px;">
	<a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;srcid=23062480&amp;confirmid=23062480&amp;q=%EB%B9%84%ED%8A%B8%EC%BA%A0%ED%94%84%20%EC%84%9C%EC%B4%88%EB%B3%B8%EC%9B%90&amp;rv=on" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">로드뷰</a><span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span><a target="_blank" href="https://map.kakao.com/?from=roughmap&amp;eName=%EB%B9%84%ED%8A%B8%EC%BA%A0%ED%94%84%20%EC%84%9C%EC%B4%88%EB%B3%B8%EC%9B%90&amp;eX=505410.0&amp;eY=1112128.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">길찾기</a><span style="width: 1px;padding: 0;margin: 0 8px 0 9px;height: 11px;vertical-align: top;position: relative;top: 2px;border-left: 1px solid #d0d0d0;float: left;"></span><a target="_blank" href="https://map.kakao.com?map_type=TYPE_MAP&amp;from=roughmap&amp;srcid=23062480&amp;itemId=23062480&amp;q=%EB%B9%84%ED%8A%B8%EC%BA%A0%ED%94%84%20%EC%84%9C%EC%B4%88%EB%B3%B8%EC%9B%90&amp;urlX=505410.0&amp;urlY=1112128.0" style="float:left;height:15px;padding-top:1px;line-height:15px;color:#000;text-decoration: none;">지도 크게 보기</a></div></div>
	
	<h5 style=" text-align: right; color: #524630;"  >(주) 그레이스호텔 서울특별시 서초구 강남대로 459</h5>
	<h5 style=" text-align: right; color: #524630;">(지번) 서초동 1303-34</h5>
	</div>
	</div>
	<br><br>
	
	<div class="hotelcontact">
	<b style="font-size: 2em; color: #524630; font-weight: bold;">연락처</b><br>
	<table class="table table-bordered" style="width: 650px;">
		<tr>
			<td style="width:150px; height: 40px; line-height: 40px;" bgcolor="#fff7e8">대표전화</td>
			<td><b style="height: 40px; line-height: 40px;">02-3511-2654</b></td>
		</tr>
		<tr>
			<td style="width:150px; height: 40px; line-height: 40px; " bgcolor="#fff7e8">객실예약</td>
			<td><b style="height: 40px; line-height: 40px;">02-3511-2655</b><br>* 평일(월~금요일) 09:00~18:00, 주말 및 공휴일 09:00~16:00</td>
		</tr>
		<tr>
			<td style="width:150px; height: 40px; line-height: 40px;" bgcolor="#fff7e8">E-mail</td>
			<td style="height: 40px; line-height: 40px;">
			<a href="mailto:hotelgrace@hotelgrace.com" style="color: black; text-decoration: none;">hotelgrace@hotelgrace.com</a><br> 
			</td>
		</tr>
	</table>
	<b>* 객실예약 운영시간 : 평일(월~금요일) 09:00~20:00, 주말(토~일요일) 및 공휴일 09:00~18:00</b>
	<br><br><br><br><br>
	</div>
	
</div>
</body>
</html>