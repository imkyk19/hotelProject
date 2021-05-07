<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "google-signin-client_id"content = "849640206590-4vnb51rrj4f1qauq29dhecmp8bpaoqu1.apps.googleusercontent.com">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<style type="text/css">
div.loginform{
	width: 30%;
	margin-left: 35%;
	z-index: 1;
}


table{
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
$(function(){
	//$("div.searchpass").hide();
});

</script>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
String savecheck=(String)session.getAttribute("savecheck");
//���̵������� üũ���� �ܿ� true, üũ �� ���� ���false
boolean b;
if(savecheck==null || savecheck.equals("no"))
	b=false;
else
	b=true;
%>

<div class="loginform">
	<h2 style="color: #8C4C27;">�α���</h2>
	<hr style="background: #260F01;height: 5px;">
	<br> <br>
	<h2 style="text-align: center; color:#8C4C27; ">Hotel GRACE�� ���� ���� ȯ���մϴ�.</h2>
	<br>
	<h5 style="text-align: center;">��ȣ�� ��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ�.</h5>
	<h6 style="text-align: center; color: #aaa;">��ȸ���� �ǽø� ȸ������ ���� �پ��� ���񽺿� ������ ������ �� �ֽ��ϴ�</h6>
	<br> <br>
	<form action="login/loginaction.jsp" name="lfrm">
	<table class="joinform table table-bordered">
		<tr style="height: 30px; text-align: center; ">
			<th style="text-align: center; width: 140px;">ȸ�� <hr style="background: #BF8975;height: 7px;"></th>
			<th style="text-align: center; width: 100px;">��ȸ��</th>
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td style="text-align: right;"><input type="text"  placeholder="���̵� �Է�" class="input" name="id" 
			value="<%= b?id:"" %>"></td>
			<td rowspan="2" align="left"><button type="submit" class="button" style="width: 120px; height: 50px;color: white;">�α���</button></td>
			
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td style="text-align: right;"><input type="password"  placeholder="��й�ȣ" class="input" name="pass"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#F2DAC4" style="text-align: center;">
				<input type="checkbox" id="savecheck" <%= b?"checked":"" %> name="savecheck">���̵� ����
			</td>
		</tr>
		<tr align="center" bgcolor="#F2DAC4">
			<td colspan="2">
			<button type="button" style="background-color: #402A22; color: white; width: 50px;" onclick="location.href='main.jsp?go=member/memberform.jsp'">����</button>
			<button type="button" style="background-color: #BF8975; color: white; width: 100px;" onclick="openidsearch()">���̵�ã��</button>
			<button type="button" style="background-color: #BF8975; color: white; width: 110px;" onclick="openpasssearch()">��й�ȣ ã��</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<br>
				<div class="g-signin2" data-onsuccess="onSignIn" style="margin-left: 250px;"></div>
				<br>
			</td>
		</tr>
	</table>
	</form>	
</div>
<script type="text/javascript">
	//���̵� ã�� �̺�Ʈ
		 function openidsearch(){
			 	window.open("login/idsearchform.jsp","","left=100px,top=100px,width=400px,height=200px");
			 }
	
	//��й�ȣ ã�� �̺�Ʈ
		function openpasssearch(){
			 	window.open("login/passsearchform.jsp","","left=100px,top=100px,width=400px,height=240px");
			 	

			 }
	
	/* 	Kakao.init('01888666f60f258d702fb52e5eb58bb0'); //�߱޹��� Ű �� javascriptŰ�� ������ش�.
		console.log(Kakao.isInitialized());
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
 */

		//���� ������ ���� ���
		function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
</script>
</body>
</html>