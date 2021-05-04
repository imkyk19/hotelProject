<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 70%;
    margin: auto;
  }
  .carousel-caption > h3{
  	font-size: 5em;
  }
  
   .carousel-caption > p{
  	font-size: 3em;
  	text-shadow: gray;
  }
  
  #img{
  	width: 100%;
  	height: 650px;
  }
  
  	table.booking {
		width: 1200px;
		margin-left: 15%; 
		margin-right: 15%;
	}
	
	thead.title tr td {
		border: 3px solid gray; 
		width: 1200px; 
		height: 200px;
		text-align: center;
		font-size: 5em;
	}
	
	tbody.bookingform{
		margin-top: 100px;

	}
	
	tbody.bookingform tr td {
		text-align: center;
		width: 200px;
		height: 50px;
	}
	
	div.vacantrooms {
		width: 1200px; 
		border: 2px solid gray;
		margin-left: 15%; 
		margin-right: 15%;
		text-align: center;
		font-size: 3em;
	}
  
  div.rewards{
  	width: 100%;
  	background-color: #eee;
  	height: 400px;
  	text-align: center;
  }
  
  </style>

</head>
<body>

<div class="carousel slide" data-ride="carousel" id="myCarousel">
	<!-- 인디케이터(data-slide-to: 슬라이드할 이미지 개수) -->
	<ul class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ul>
	
	<!-- 슬라이드쇼 -->
	<div class="carousel-inner" role="listbox">
	 <div class="item active">
	 	<img alt="호텔" src="image/호텔.jpg" id="img">
	 	<div class="carousel-caption">
	 		<h3>Hotel GRACE♡</h3>
	 		<p>사랑하는 사람들과 행복한 추억을 만들어보세요</p>
	 	</div>
	 </div>
	 
	 <div class="item">
	 	<img alt="연회장" src="image/연회장.jpg" id="img">
	 	<div class="carousel-caption">
	 		 <h3>banquet hall</h3>
	 		<p>넓은 연회장에서 소중한 추억을 만들어보세요</p>
	 	</div>
	 </div>

	 <div class="item">
	 	<img alt="객실" src="image/객실.jpg" id="img">
	 	<div class="carousel-caption">
	 		 <h3>Rooms</h3>
	 		<p>Deluxe | Business Deluxe | Superior Suite | Corner Suite</p>
	 	</div>
	 </div>	
	 
	 <div class="item">
	 	<img alt="수영장" src="image/수영장.jpg" id="img">
	 	<div class="carousel-caption">
	 		 <h3>Pool</h3>
	 		<p>야외 수영장에서 즐기는 달콤한 휴식</p>
	 	</div>
	 </div> 
	</div>
	
	<!-- 컨트롤 -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br><br>
<div>
	<form action="reservation/orderlist.jsp" method = "post">
		<table class="booking">
			<tbody class="bookingform">
				<tr>
					<td >
						<label for = "room">Rooms: </label>
						<select name = "room" id = "room">
						<%
							for(int i = 0; i <= 20; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
					<td>
						<label for = "checkin_date">Check In: </label>
						<input type="date" id = "checkin_date" name = "checkin_date">
					</td>
					<td>
						<label for = "checkout_date">Check Out: </label>
						<input type="date" id = "checkout_date" name = "checkout_date">
					</td>
					<td >
						<label for = "adult">Adults: </label>
						<select name = "adult" id = "adult">
						<%
							for(int i = 0; i <= 50; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
					<td >
						<label for = "children">Children: </label>
						<select name = "children" id = "children">
						<%
							for(int i = 0; i <= 50; i++){
								%>
								<option><%=i%></option>
								<%
							}
						%>
						</select>
					</td>
					<td>
					<button style="margin-top: 10px; margin-bottom:10px; width: 100px;" type="button" id = "btnsearch" class="btn btn-default btn">검색</button>
					</td>
				</tr>
			</tbody>
			<br>
		</table>
	</form>
</div>
<br><br>
<!-- 호텔 리워즈 -->
<div class="rewards">
<br>
	<h2 style="text-align: center;">그레이스 리워즈</h2>
	<hr style="text-align: center;border: 1px solid #A68863;width: 300px;">
	<h4 style="text-align: center;color:#A68863;">M E M B E R S H I P</h4>
	<br>
	<span><img src="image/reward1.png" style="width: 350px;text-align: center;margin-left: 100px;"></span>
	<span><img src="image/reward2.png" style="width: 350px;text-align: center;margin-left: 100px;"></span>
	<span><img src="image/reward3.png" style="width: 350px;text-align: center;margin-left: 100px;"></span>
	<span>
	<button type="button" style="width: 100px;background-color:#260B01;color: white;height: 60px;">가입하기</button>
	</span>
	
	<h4 style="color: #260B01;">그레이스리워즈는 포인트 혜택 및 특전을 제공하는 통합멤버쉽 서비스입니다.</h4>
	<h4 style="color: #260B01;">지금 가입하시고 회원만을 위한 특별한 서비스와 다양한 혜택을 받으십시오.</h4>
	
</div>
</body>
</html>