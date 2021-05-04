<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.passwordupdate{
	margin-top: 50px;
	margin-left: 600px;
	margin-bottom: 100px;

}


</style>
</head>
<body>
<div class="passwordupdate">
<h2 style="font-size: 1.8em;color:#8C4C27;">비밀번호 변경</h2>
	<hr style="border:2px solid black;width:600px;margin-left:0px;">
	<h4>고객님의 정보를 언제든지 확인,변경하실 수 있습니다.</h4>
	
	<table style="width:400px;"class="table table-bordered">
		<tr>
			<td>현재 비밀번호</td>
			<td>
				<input type="password" class="form-control input-sm"
					style="width: 200px;"
					 name="pass" required="required";>				
			</td>
		</tr>	
		<tr>
			<td>새 비밀번호</td>
			<td>
				<input type="password" class="form-control input-sm"
					style="width: 200px;"
					 name="pass" required="required";>				
			</td>
		</tr>	
		<tr>
			<td>새 비밀번호 확인</td>
			<td>
				<input type="password" class="form-control input-sm"
					style="width: 200px;"
					 name="pass" required="required";>				
			</td>
		</tr>		
		
	
		
	
	
	</table>
	
	<button type="submit" style="width: 120px;"
	  		id="btnsubmit">
	  	변경</button>
	 <button type="button" style="width: 120px;"
	  		id="btncancel">
	  	취소</button> 	
	  	

</div>
</body>
</html>