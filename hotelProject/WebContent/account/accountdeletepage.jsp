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

div.mymain{
	width:240px;
	height:500px;
	border: 1px solid gray;
	margin-top: 50px;
	margin-left: 200px;
	margin-bottom: 100px;
	background-color: #F5ECCE;
	

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
	
div.accountdelete{
	position:absolute;
	left:600px;
	top:50px;

}

</style>
</head>
<body>
<div class="mymain">
	<h3 style="margin-left: 20px;">마이 페이지</h3>
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
		<li><a style="text-decoration: none;"href="main.jsp?go=mypage/questionhistory.jsp">
				문의 내역 확인
		</a></li>
	</ul>	
	<ul>
		<li><a style="text-decoration: none;"href="main.jsp?go=account/accountdeletepage.jsp">
				회원 탈퇴
		</a></li>
	</ul>	
		
</div>

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
<script type="text/javascript">
	//삭제 버튼 이벤트
	function fundel(num){
		//alert(num);
		$("#btnmdel").attr("g_num",g_num);
		$("#memberDelModal").modal();
	}

</script>

 <!-- Modal -->
  <div class="modal fade" id="memberDelModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원 탈퇴</h4>
        </div>
        <div class="modal-body">
          <p>회원 탈퇴를 원하면 아래 [탈퇴확인]버튼을 눌러주세요</p>
          <button type="button" class="btn btn-danger"
          style="width:150px;" id="btnmdel" num=""
          data-dismiss="modal">탈퇴확인</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <script type="text/javascript">
  $("#btnmdel").click(function() {
  	//버튼에 있는 num 읽어오기
  	var g_num=$(this).attr("g_num");
  	//이동
  	location.href="account/accountdelete.jsp?g_num="+g_num;
  });
  
  </script>

</body>
</html>   