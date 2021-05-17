
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
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
	
}


table{
	border-width: 0;
	margin-bottom: 20px;
}
table.joinform{
	border-width: 0;
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
//아이디저장을 체크했을 겨우 true, 체크 안 했을 경우false
boolean b;
if(savecheck==null || savecheck.equals("no"))
	b=false;
else
	b=true;
%>

<div class="loginform">
	<h2 style="color: #8C4C27;">로그인</h2>
	<hr style="background: #260F01;height: 5px;">
	<br> <br>
	<h2 style="text-align: center; color:#8C4C27; ">Hotel GRACE에 오신 것을 환영합니다.</h2>
	<br>
	<h5 style="text-align: center;">번호와 비밀번호를 입력해 주시기 바랍니다.</h5>
	<h6 style="text-align: center; color: #aaa;">※회원이 되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다</h6>
	<br> <br>
	<form action="login/loginaction.jsp" name="lfrm">
	<table class="joinform table table-bordered">
		<tr style="height: 30px; text-align: center; ">
			<th style="text-align: center; width: 140px;" colspan="2">회원 <hr style="background: #BF8975;height: 7px;"></th>
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td style="text-align: right;height: 30px;"><input type="text"  placeholder="아이디 입력" class="input" name="id" 
			value="<%= b?id:"" %>"></td>
			<td rowspan="2" align="left" ><button type="submit" class="button" style="width: 120px; height: 50px;color: white;">로그인</button></td>
			
		</tr>
		<tr style="height: 30px;" bgcolor="#F2DAC4">
			<td style="text-align: right;"><input type="password"  placeholder="비밀번호" class="input" name="pass"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#F2DAC4" style="text-align: center;">
				<input type="checkbox" id="savecheck" <%= b?"checked":"" %> name="savecheck">아이디 저장
			</td>
		</tr>
		<tr align="center" bgcolor="#F2DAC4">
			<td colspan="2">
			<button type="button" style="background-color: #402A22; color: white; width: 50px;" onclick="location.href='main.jsp?go=member/memberform.jsp'">가입</button>
			<button type="button" style="background-color: #BF8975; color: white; width: 100px;" onclick="openidsearch()">아이디찾기</button>
			<button type="button" style="background-color: #BF8975; color: white; width: 110px;" onclick="openpasssearch()">비밀번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<br>
				<div class="g-signin2" onclick="onSignIn()" style="margin-left: 200px;"></div>			
				<br>
			</td>
		</tr>
	</table>
	</form>	
</div>
<script type="text/javascript">
	//아이디 찾기 이벤트
		 function openidsearch(){
			 	window.open("login/idsearchform.jsp","","left=100px,top=100px,width=400px,height=200px");
			 }
	
	//비밀번호 찾기 이벤트
		function openpasssearch(){
			 	window.open("login/passsearchform.jsp","","left=100px,top=100px,width=400px,height=240px");
			 	

			 }
	


		//구글 프로필 정보 얻기
		function onSignIn() {
		  var auth2=gapi.auth2.getAuthInstance();
		  if (auth2.isSignedIn.get()) {
			  var profile = auth2.currentUser.get().getBasicProfile();
			  //var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); 
			  
			  var google= profile.getId().toString();
			  var name=profile.getName();
			  var email=profile.getEmail()
			  
			  
			   //구글아이디로 로그인한 적이 있는 지 체크
			  $.ajax({
				 type:"get",
				 dataType:"json",
				 url:"login/goocheckid.jsp",
				 data:{"google":google},
				 success:function(d){
					 var googleok=d.googleok;
		
					 if(googleok=="no"){
						//아이디가 없을 경우 회원가입 창으로
						 location.href="main.jsp?go=member/memberform.jsp?google="+google+"&email="+email+"&name="+name+"&ech=yes";
						
					 }else if(googleok=="yes"){
						 //아이디가 있을 경우 로그인					
						 location.href="login/googleloginaction.jsp?google="+google;
						 
					 }
					
					
				 }
				 
				 
			  }); 
		  }
		  /*  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.		   
		  
		  var google= profile.getId().toString();
		  var name=profile.getName();
		  var email=profile.getEmail(); */
			
		
		  
}
</script>
</body>
</html>