<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.infomenu{
		position: absolute;
		width: 300px;
		height: 250px;
		border: 1px solid gray;
		margin-top: 50px;
		margin-left: 300px;
		font-size: 1.3em;
		cursor: pointer;
		background-color: #FAEBD0;
		padding: 10px 20px;
	}	
	
	table.qtable{
		width: 900px;
		border: 1px solid gray;
		margin-top: 50px;
		margin-left: 700px;
	}
	
	div.statement{
		width: 800px;
		border: 1px solid gray;
		margin-left: 700px;
	}
	
	#btnq{
		margin-left: 1050px;
		width: 100px;
		height: 50px;
		border: 1px sold #524630;
		background-color: #524630;
		color: white;
		font-size: 1.5em;
	}
</style>
</head>
<body>
<div class="information">
	<div class="infomenu">
	<h2>고객센터</h2><br>
	<span class="contact" onclick="location.href='main.jsp?go=customer/info.jsp'">연락처 및 오시는길</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/question.jsp'">문의하기</span><br><br>
	<span class="question" onclick="location.href='main.jsp?go=customer/questioncheck.jsp'">문의확인</span>
	</div>
	
</div>

<form action="customer/questionInsert.jsp">
	<table class="table table-bordered qtable" style="width: 800px;">
		<caption><b style="font-size: 2em; color: #524630; font-weight: bold;'">문의하기</b></caption>
		<input type="hidden" name="writeday" id="writeday">
		<hr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 30px;">질문유형</td>
			<td>
				<input type="text" name="type" id="type">
					<select name="qtype" id="qtpye" class="form-control" style="width: 200px;">
						<option disabled hidden selected>선택</option>
						<option value="회원가입문의">회원가입문의</option>
						<option value="호텔문의">호텔문의</option>
						<option value="기타문의">기타문의</option>
					</select><br>
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">제목</td>
			<td>
				<input type="text" name="subject" id="subject" num=""; class="form-control" required="required" style="width: 500px;">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 40px;">내용</td>
			<td>
			<textarea name="content" id="content" class="form-control" required="required" style="width: 500px; height: 150px;"></textarea>
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">성명</td>
			<td>
			<input type="text" name="name" id="name" class="form-control" required="required" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">비밀번호</td>
			<td>
			<input type="password" name="pass" id="pass" class="form-control" required="required" style="width: 200px; float: left;">*숫자 4자리 입력
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8" style="height: 20px;">이메일</td>
			<td>
			<input type="text" name="email" id="email" class="form-control" required="required" style="width: 500px;">
			</td>
		</tr>
		<tr>
			<td bgcolor="#fff7e8">휴대전화</td>
			<td>
			<input type="text" name="hp" id="hp" class="form-control" required="required" style="width: 200px;">
			</td>
		</tr>
	</table>
	<br>
	<b style="margin-left: 700px;">개인정보 수집 및 이용에 대한 동의</b><br>
	<div class="statement">
		<div style="overflow:scroll; width:800px; height:100px; padding:10px;">
		호텔그레이스 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.<br>
		1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항<br>
		① 수집ㆍ이용 항목 | 성명(국문·영문), 이메일, 휴대전화<br>
		② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공<br>
		③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간<br>
		※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.
		</div>	
	</div>
	<input type="checkbox" name="agree" id="agree" required="required" style="margin-left: 700px;">동의함
	<br>
	<br>
	<button type="submit" class="btnq" id="btnq">등록</button><br><br><br><br><br><br>
</form>
</body>
<script type="text/javascript">
	$("#btnq").click(function(e){
		alert("문의가 정상 접수되었습니다.");
	});
	
	$("#qtpye").change(function() {
		//선택값 얻기
		var p=$(this).val();
		//인풋태그에 넣기
		$("#type").val(p);
		});
</script>
</html>