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
div.accountdelete{
	margin-top: 50px;
	margin-left: 600px;
	margin-bottom: 100px;

}

</style>
</head>
<body>
<div class="accountdelete">
<h2 style="font-size: 1.8em;color:#8C4C27;">회원 탈퇴</h2>
	<hr style="border:2px solid black;width:600px;margin-left:0px;">
	<h4>고객님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</h4>
	<table style="width:400px;"class="table table-bordered">
		<tr>
			<td>아이디</td>
			<td>
			<input type="text" name="mid" style="width: 150px;"
			class="form-control input-sm"
			 required="required">
			 </td>
		</tr>	
		<tr>
			<td>비밀번호</td>

			<td>
				<input type="password" name="pass" style="width: 150px;"
			class="form-control input-sm"
			required="required">
			</td>
		</tr>	
		
	</table>		
	<button type="submit" style="width: 120px;"
	  		id="btnsubmit">
	  	확인</button>
		
		

</div> 
<div>

</div>
 
</body>
</html>   