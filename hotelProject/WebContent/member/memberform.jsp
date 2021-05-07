x<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT>

<style type="text/css">
	div.memberform{
		width: 60%;
		height: 800px;
		margin-left: 400px;
		margin-top: 70px;
		padding-left: 350px;
	}
	table.memberform{
		
		
	}
</style>
<%
	//이메일 링크를 타고 왔을 경우
	String ech=request.getParameter("ech");
	
	//링크를 타고 왔을 경우 성명과 생년월일 저장된 상태로 두기
	if(ech!=null){%>
		<script type="text/javascript">
		$(function(){
			$("#name").val(localStorage.getItem("name"));
			$("#year").val(localStorage.getItem("year"));
			$("#month").val(localStorage.getItem("month"));
			$("#day").val(localStorage.getItem("day"));
			$("#email1").val(localStorage.getItem("email1"));
			$("#email2").val(localStorage.getItem("email2"));
			$("select.selemail").attr("disabled","true");
		});
			
		</script>
		
	<%}

%>
</head>
<body>
<form action="member/memberaction.jsp" name="memberfrm">
<div class="memberform">
	<h3 style="color: #8C4C27;">회원가입</h3>
	<br> <br>
	<h4>회원정보 입력</h4>
	<table class="memberform" style="width: 625px;">
		<tr>
			<th style="text-align: left;">기본 입력</th><th style="text-align: right;">* 표시 필수입력사항</th>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*성명</th>
			<td>&nbsp;&nbsp;<input type="text" name="name" class="input" required id="name"></td>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*생년월일</th>
			<td>&nbsp;&nbsp;
			<select id="year" style="width: 100px;" class="input" name="year">
			
			<script type="text/javascript">
			var date=new Date();
			var year=date.getFullYear();
			for(var y=year;y>=1950;y--){
			var op="<option>"+y+"</option>";
			document.write(op);
			}
			</script>
			</select>
			년  
			<select id="month" style="width: 100px;" class="input" name="month">
			<script type="text/javascript">
			//console.log(date.getMonth());
			var curm=date.getMonth()+1;
			for(var m=1;m<=12;m++){
			var op="";
			if(m==curm)
			op="<option selected>"+m+"</option>";
			else
			op="<option>"+m+"</option>";
			document.write(op);
			} 	
			</script>
			</select>
			월  
			<select id="day" style="width: 100px;" class="input" name="day">
			<script type="text/javascript">
			var curd=date.getDate();
			for(var d=1;d<=31;d++){
			var op="";
			if(d==curd)
			op="<option selected>"+d+"</option>";
			else
			op="<option>"+d+"</option>";
			document.write(op);
			} 	
			</script>
			</select>
			일<br>	
			</td>
</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*이메일</th>
			<td>
			&nbsp;&nbsp;<input type="text" name="email1" style="width: 100px;" class="input" required id="email1" <%=ech==null?"":"readonly"  %>>
			@&nbsp;<input type="text" name=email2 class="email2 input" required id="email2"  <%=ech==null?"":"readonly"  %> >&nbsp;
			<select name="email" class="input selemail">
				<option selected>직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
			</select>
			</td>
			<td><button class="button emailchbtn" style="color: white;">이메일 인증</button></td>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*휴대전화</th>
			<td>&nbsp;
			<input type="text" name="hp1" style="width: 80px;" class="input hp1" required>-
			<input type="text" name="hp2" style="width: 80px;" class="input hp2" required>-
			<input type="text" name="hp3" style="width: 80px;" class="input hp3" required>
			</td>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">자택 주소</th>
			<td>&nbsp;&nbsp;<input type="text" name="zip" id="zip" class="input">&nbsp;
				<button type="button" class="button" style="color: white;" onclick="openaddr()">주소 찾기</button>
				<br><br>&nbsp;&nbsp;<input type="text" name="addr1" id="addr1" class="input" style="width: 400px;">
				<br>&nbsp;&nbsp;<input type="text" name="addr2" id="addr2" class="input" style="width: 400px;">
			</td>
		</tr>
	</table>
	<br><br>
	<table class="memberform2">
		<tr>
			<th style="text-align: left;width: 150px;" colspan="2">웹사이트 비밀번호 입력</th>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*아이디</th>
			<td>&nbsp;&nbsp;<input type="text" name="idsel" class="input id" required readonly  style="background-color: #ccc;">
				<button type="button" class="button" style="color: white;" onclick="openId()">아이디 중복확인</button>
			</td>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*비밀번호</th>
			<td>&nbsp;&nbsp;<input type="password" name="pass" class="input pass1" required>
				
			</td>
		</tr>
		<tr>
			<th style="width: 100px;background-color:#F2ECE9;height: 40px;">*비밀번호 확인</th>
			<td>&nbsp;&nbsp;<input type="password" class="input pass2" required>
				
			</td>
		</tr>
		<tr>
			<td style="text-align: right;" colspan="2">
				<br><button type="submit" class="button btnsub" style="color: white;width: 100px;height: 50px;">가입 신청</button>
			</td>
		</tr>
	</table>
</div>
</form>
<script type="text/javascript">
	//이메일 선택 이벤트
	$("select[name=email]").change(function(){
		var sel =$(this).val();
		if(sel!="직접 입력"){
			$("input.email2").val(sel);
		}
		if(sel=="직접 입력"){
			$("input.email2").val("");
		}
	});
	
	//주소창 띄우기 사용자 함수
	 function openaddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr;
                document.getElementById('addr2').focus();
            }
        }).open();
    }
	
    
	//아이디 입력창 열기
	 function openId(){
	 	window.open("member/idcheck.jsp","","left=100px,top=100px,width=300px,height=150px");
	 }
	
	//비밀번호 확인 이벤트
	$("button.btnsub").click(function(){
		var pass1= $("input.pass1").val();
		var pass2= $("input.pass2").val();
		 if(pass1!=pass2){
			alert("비밀번호가 일치하지 않습니다.");
			return false;//action호출 안 됨 
		} 
	});
	
	//아이디 중복 확인 이벤트
	$("button.btnsub").click(function(){
		 if($("input.id").val().length==0){
			alert("아이디 중복확인을 눌러주세요.");
			return false;//action호출 안 됨 
		} 
	});
	
	//핸드폰 번호 유효성 검사
	$("button.btnsub").click(function(){
		var hp1= $("input.hp1").val();
		var hp2= $("input.hp2").val();
		var hp3= $("input.hp3").val();
		 if(isNaN(hp1) || isNaN(hp2) || isNaN(hp3)){
			alert("올바른 핸드폰 번호를 입력해주세요.");
			return false;//action호출 안 됨 
		} 
	});
	
	//이메일 인증시 보내기 값들 로컬에 저장하기
	 $("button.emailchbtn").click(function(){
			var emailch=$("#email1").val()+"@"+$("#email2").val();
			var year=$("#year").val();
			var name=$("#name").val();
			var day=$("#day").val();
			var month=$("#month").val();
			localStorage.year=year
			localStorage.month=month
			localStorage.day=day
			localStorage.name=name
			localStorage.email1=$("#email1").val();
			localStorage.email2=$("#email2").val();
			
			location.href="member/emailcheckaction.jsp?email="+emailch; 
			
		});
	
	//이메일 인증했는 지 체크하기
	$("button.btnsub").click(function(){
		<%if(ech==null){%>
			alert("이메일을 인증해주세요.");
			return false;//action호출 안 됨 
		<%}
		%>
	});
	
</script>
</body>
</html>