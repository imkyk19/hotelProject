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
div.accountupdate{
	margin-top: 50px;
	margin-left: 600px;
	margin-bottom: 100px;

}


</style>
</head>
<body>
<form action="account/accountupdateaction.jsp">
<div class="accountupdate">
	<h2 style="font-size: 1.8em;color:#8C4C27;">프로필 수정</h2>
	<hr style="border:2px solid black;width:600px;margin-left:0px;">
	<h4>고객님의 정보를 언제든지 확인,변경하실 수 있습니다.</h4>
	<br>
	<table style="width:600px;"class="table table-bordered">
		<caption>기본정보</caption>
		<tr>
			<td>성명</td>
			<td>
				<input type="text" class="form-control input-sm"
					style="width: 120px;"
					 name="name" required="required"
					 >				
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<select id="selyear" style="width: 100px;">
 <script type="text/javascript">
 	var date=new Date();
 	var year=date.getFullYear();
 	for(var y=year;y>=1950;y--){
 		var op="<option>"+y+"</option>";
 		document.write(op);
 	}
 </script> 
</select>
년 &nbsp;     
<select id="selmonth" style="width: 100px;">
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
월 &nbsp; 
<select id="selday" style="width: 100px;">
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
			<td>이메일</td>
			<td>
			<input type="text" name="email1" style="width: 100px;" class="input">
			<input type="text" name=email2 class="email2 input">
			<select name="email" class="input">
				<option selected>직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td>
	 		<input type="text" id="hp1" maxlength="3"
	 			style="width: 70px;">
	 		<b>-</b>
	 		<input type="text" id="hp2" maxlength="4"
	 			style="width: 70px;">
	 		<b>-</b>
	 		<input type="text" id="hp3" maxlength="4"
	 			style="width: 70px;">
	 	</td>  
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="zip" id="zip" class="input">
				<button type="button" class="button" onclick="openaddr()">주소 찾기</button>
				<br><br><input type="text" name="addr1" id="addr1" class="input" style="width: 400px;">
				<br><input type="text" name="addr2" id="addr2" class="input" style="width: 400px;">
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