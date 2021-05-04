<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>
<style>

div.reservechange{
	margin-top: 50px;
	margin-left: 600px;
	margin-bottom: 100px;
}

</style>
<body>
<div class="reservechange">

 

 

	<h2 style="font-size: 1.8em;color:#8C4C27;">예약확인/취소</h2>
	<hr style="border:2px solid black;width:700px;margin-left:0px;">


	<table style="width:700px;">
	<tr>
		<td style="font-size: 1.2em;">
		객실및 패키지 예약 내역을 확인하실수있습니다.
		</td>    
	</tr>
	<tr>
		<td>
		<select>
	 		<option>예약완료일기준</option>
	 		<option>투숙일기준</option>
	 	</select>

	 	<button style="button">3개월</button>	
	 	<button style="button">6개월</button>	
	 	<button style="button">12개월</button>

	 	<input type="date" id="date1" value="sysdate">~<input type="date" id="date2" value="sysdate"><button>조회</button>
	 	</td>
	 </tr>	
	 </table>

	

		<h2 style="font-size: 1.2em;font-weight: bold;">객실/패키지예약</h2>

	  <hr style="border:1px solid black;width:700px;margin-left:0px;">

	

	<table class="table table-bordered" style="width:700px;">
	 <tr>  
	 	<td colspan="6"style="font-size: 1.2em;">
	 	Total:
	 	</td>
	 </tr>

	 <tr style="background-color: #FAEBD0;font-size: 1.2em;border:1px solid black;">
	 	<td>예약번호</td><td>객실/패키지</td><td>객실수</td><td>체크인/체크아웃</td><td>예약상태</td>
	 </tr>
	 <tr>
	 	<td colspan="6" style="font-size: 1.2em;width:400px;text-align: center;">
	 		자료가 없습니다
	 	</td>
	 </tr>
</table>	

</div>	

</body>

</html>

