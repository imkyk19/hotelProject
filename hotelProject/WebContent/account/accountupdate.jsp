<%@page import="guest.db.GuestDto"%>

<%@page import="guest.db.GuestDao"%>

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
div.mymain{
	width:240px;
	height:500px;
	margin-top: 70px;
	margin-left: 300px;
	margin-bottom: 100px;
	background-color: #FAEBD0;
	
	

}

ul,li{
		list-style: none; }
		
li{
	
	font-size: 1.3em;
	
}	

ul>li>a{
		color: #8C4C27;
		text-decoration: none;
		cursor: pointer;
	}	

div.accountupdate{
	position:absolute;
	left:600px;
	top:50px;
 

}



</style>

</head>

<%


String id=session.getAttribute("id").toString();

	GuestDao dao=new GuestDao();

	GuestDto dto=dao.getData(id);

%>
<body>
<div class="mymain">
	<br>
	<h3 style="margin-top:10px;margin-left: 20px;">마이 페이지</h3>
	<hr style="border:2px solid black;width:200px;margin-left:0px;">
	<br>
	<ul>
		<li><a style="text-decoration: none;" href="main.jsp?go=reservecheck/reservecheckpage.jsp">
		예약 확인/취소
		</a></li>
	</ul>
	<br>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=mypage/mypagemain.jsp">
				내 정보
		</a></li>
	</ul>	
	<ul>
			<li><a style="text-decoration: none;"href="main.jsp?go=account/accountupdate.jsp">
				회원정보 수정
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/passwordupdate.jsp">
				비밀번호 변경
		</a></li>
	</ul>	
	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountdeletepage.jsp">
				회원 탈퇴
		</a></li>
	</ul>	
		
</div>

<form action="account/accountupdateaction.jsp" method="post">


<div class="accountupdate">


	<h2 style="font-size: 1.8em;color:#8C4C27;">회원정보 수정</h2>

	<hr style="border:2px solid black;width:600px;margin-left:0px;">

	<h4>고객님의 정보를 언제든지 확인,변경하실 수 있습니다.</h4>

	<br>

	<table style="width:600px;"class="table table-bordered">

		<caption>기본정보</caption>

		<tr>
			<td>아이디</td>
			<td>
			<%=dto.getId()%>
			</td>
		</tr>
		
		<tr>
			<td>성명</td>
			<td>
				<input type="text" class="form-control input-sm"
					style="width: 150px;"
					 name="name" required="required"
					value="<%=dto.getName()%>">			
			</td>
		</tr>
		
		<tr>
			<td>생년월일</td>
			<td>
			<input type="text" id="birth" name="birth" style="width: 150px;"
			value="<%=dto.getBirth().substring(0, 10)%>" >
			</td>
		</tr>
           
		<tr>
			<td>이메일</td>
			<td>
			<input type="text" name="email" style="width: 150px;" class="input" value="<%=dto.getEmail() %>">
			</td>
		</tr>

		<tr>
			<td>휴대전화</td>
			<td>

	 		<input type="text" id="hp" name="hp" maxlength="13"
	 			style="width: 150px;" required="required" value="<%=dto.getHp()%>" >
	 		</td>  
		</tr>
		
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" id="addr" class="input" style="width: 400px;"value="<%=dto.getAddr() %>">
			</td>
		</tr>
	</table>

	

	<button type="submit" style="color:white; width: 200px;"

	  		  id="btnsubmit">변경</button>

	 <button type="button" style="color:white; width: 200px;"
onclick="history.back()" id="btncancel">취소</button> 	

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

</script>

</body>

</html>