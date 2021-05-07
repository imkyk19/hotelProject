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

<script type="text/javascript">
		$(function(){
			$("#roomslide1").hide();
			$("#roomslide2").hide();
			$("#roomslide3").hide();
		});
		

</script>
<style type="text/css">
	div.total{
		width: 1300px;
		margin-left: 300px;
		margin-top: 100px;
		text-align: center;
	}
	
	div.hotelinfo{
		height: 1000px;
	}
	
	#img1, #img2, #img3{
		cursor: pointer;
	}
	
	#roomslide1{
		position: absolute;
		top: 1250px;
		left: 1000px;
		width: 700px;
		height: 300px;
	}
	
	#roomslide2{
		position: absolute;
		top: 1750px;
		left: 1000px;
		width: 700px;
		height: 300px;
	}
	
	#roomslide3{
		position: absolute;
		top: 2200px;
		left: 1000px;
		width: 700px;
		height: 300px;
	}
</style>

</head>
<body>

<div class="total">
	<div class="hotelinfo" >
		<h1 style="color:#524630;">호텔 소개</h1>
		<img style="margin-top: 20px;" src="image/호텔.jpg">
		<h3>저희 Hotel Grace는 2021년 5월 개관하였습니다.</h3>
		<h3>앞으로도 끊임없는 최상의 가치를 선사하는 명문기업으로 성장할 것을 약속 드립니다.</h3>
	</div>
	<div class="room1" style="height: 600px;">
		<h1 style="margin-bottom: 100px; color:#524630;">객실소개</h1>
		<h3 style=" text-align: left; margin-bottom: 30px;">스탠다드</h3>
		<img alt="" src="image/스탠다드1.jpg" width="500px;" align="left" id="img1">
	</div>
	<br>
	<div class="room2" style="height: 400px;">
		<h3 style=" text-align: left; margin-bottom: 30px;">디럭스</h3>
		<img alt="" src="image/디럭스1.jpg" width="500px;" align="left" id="img2">
	</div>
	<br>
	<div class="room3" style="height: 600px;">
		<h3 style=" text-align: left; margin-bottom: 30px;">스위트</h3>
		<img alt="" src="image/스위트1.jpg" width="500px;" align="left" id="img3">
	</div>
</div>

<div class="carousel slide" data-ride="carousel" id="roomslide1">
	<!-- 인디케이터(data-slide-to: 슬라이드할 이미지 개수) -->
	<ul class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ul>
	
	<!-- 슬라이드쇼 -->
	<div class="carousel-inner" role="listbox">
	 <div class="item active">
	 	<img alt="" src="image/스탠다드1.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>
	 
	 <div class="item">
	 	<img alt="" src="image/스탠다드2.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>

	 <div class="item">
	 	<img alt="" src="image/스탠다드3.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>	
	</div>
	
	<!-- 컨트롤 -->
  <a class="left carousel-control" href="#roomslide1" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#roomslide1" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="carousel slide" data-ride="carousel" id="roomslide2">
	<!-- 인디케이터(data-slide-to: 슬라이드할 이미지 개수) -->
	<ul class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ul>
	
	<!-- 슬라이드쇼 -->
	<div class="carousel-inner" role="listbox">
	 <div class="item active">
	 	<img alt="" src="image/디럭스1.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>
	 
	 <div class="item">
	 	<img alt="" src="image/디럭스2.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>

	 <div class="item">
	 	<img alt="" src="image/디럭스3.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>	
	</div>
	
	<!-- 컨트롤 -->
  <a class="left carousel-control" href="#roomslide2" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#roomslide2" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div class="carousel slide" data-ride="carousel" id="roomslide3">
	<!-- 인디케이터(data-slide-to: 슬라이드할 이미지 개수) -->
	<ul class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ul>
	
	<!-- 슬라이드쇼 -->
	<div class="carousel-inner" role="listbox">
	 <div class="item active">
	 	<img alt="" src="image/스위트1.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>
	 
	 <div class="item">
	 	<img alt="" src="image/스위트2.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>

	 <div class="item">
	 	<img alt="" src="image/스위트3.jpg" id="img">
	 	<div class="carousel-caption">
	 	</div>
	 </div>	
	</div>
	
	<!-- 컨트롤 -->
  <a class="left carousel-control" href="#roomslide3" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#roomslide3" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<script type="text/javascript">
	$("#img1").click(function() {
		$("#roomslide1").toggle();
	});

	$("#img2").click(function() {
		$("#roomslide2").toggle();
	});

	$("#img3").click(function() {
		$("#roomslide3").toggle();
	});
</script>

</body>
</html>