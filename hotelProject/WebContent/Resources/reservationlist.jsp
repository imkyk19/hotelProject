<%@page import="reservation.db.ReservationDto"%>
<%@page import="reservation.db.ReservationDao"%>
<%@page import="java.util.List"%>
<%@page import="guest.db.GuestDto"%>
<%@page import="guest.db.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Grace 관리</title>
    
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT>
    <link rel="stylesheet" href="../css/style.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

	<style type="text/css">
		span.addguest{
			cursor: pointer;
		}
		span.delguest{
			cursor: pointer;
		}
		tr.showcontent{
			border: 1px solid gray;
		}
		button.delreservation{
			margin-bottom: 10px;
		}
	</style>
	<%
	//아이디값 얻기(mana값이 null값이면 로그인 폼 띄우기)
	String id=(String)session.getAttribute("mana");
	if(id==null){
		response.sendRedirect("loginform.jsp");
	}
%>
<script type="text/javascript">
	$(function(){
		//회원추가 버튼을 클릭했을때 
		$("span.addguest").click(function(){
			$("#myModal").modal();
		});
		
		
		//회원 체크박스 삭제 이벤트
		$("button.delreservation").click(function(){
			
			//체크된 값 배열에 넣기
			var chk_arr=[];
			$("input[name=delreservation]:checked").each(function() {
				var chk=$(this).attr("num");
				chk_arr.push(chk);
			});
			
		
			
			  var chnum = {
                      "ch" : chk_arr     //과일배열 저장
                  };
			  console.log(chnum);
			
			//값 삭제 ajax
			var t=confirm("정말 "+chk_arr.length+"개의 정보를 삭제하시겠습니까?");
			if(t){
				$.ajax({
					type:"post",
					data:chnum,
					dataType:"html",
					url:"chdelreservationaction.jsp",
					traditional:true,
					success:function(){
						//알림
						alert("삭제되었습니다.");
						//새로고침
						location.reload();
					}
				});
			}else{
				//체크상자 체크 풀기
				$("input[name=delguestch]").each(function(){
					$(this).attr("checked",false);
				});
				
				$("input[name=entirecheck]").prop("checked",false);
			}
			
		});
		
		//전체 선택 눌렀을 때
		$("input[name=entirecheck]").change(function(){
			if($(this).is(":checked")){
				//체크 됐을 때
				$("input[name=delreservation]").each(function(){
					$(this).attr("checked",true);
				});
			}else{
				//체크 풀었을 때
				$("input[name=delreservation]").each(function(){
					$(this).attr("checked",false);
				});
			}
		});
		
		//예약 내역 상세보기 이벤트
		$("th.showcontent").click(function(){
			var num= $(this).attr("num");
			location.href="rvContent.jsp?num="+num;
		});
	
	});
	

</script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

       <!-- 사이드바 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Grace Hotel</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
               <li class="nav-item">
                <a class="nav-link collapsed" href="guestlist.jsp">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원관리</span>
                </a>
                 </li>
                

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="reservationlist.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>예약관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="roomlist.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>객실관리</span></a>
            </li>
            
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="questionlist.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>문의 사항</span></a>
            </li>
            
              <li class="nav-item">
                <a class="nav-link" href="reviewlist.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>후기글 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        
                         <!-- Nav Item -preHotel Page -->
                        <li class="nav-item dropdown no-arrow prehotel">
                            <a class="nav-link dropdown-toggle" href="../main.jsp" >
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">&nbsp;<i class="fas fa-arrow-left"></i> <i class="fas fa-hotel"></i> Grace Page</span>
                              
                            </a>                          
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=id %>님</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">예약 관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="width: 950px;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">                           	
                                <table class="table table-hover" id="dataTable" width="900px" cellspacing="0">
                                	 <thead>
                                	 <div style="text-align: right;">
                                	  <button type="button" class="btn btn-danger delreservation"><span class="delreservation" num=""><i class="fas fa-user-minus" ></i>예약 취소</span></button>
                                      </div>
                                        <tr>
                                        	 <th style="width: 20px;"><input type="checkbox" name="entirecheck" ></th>
                                            <th></th>
                                           
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <%
                                    	ReservationDao dao=new ReservationDao();
                                    	ReservationDto dto=new ReservationDto();
                                    	List<ReservationDto> list= dao.getReservationList();
                                    	//순서 변수
                                    	int no=0;
                                    	for(ReservationDto d:list){%>
                                    	<!-- 회원목록 출력 -->	
                                    	<tr>
                                    		<th><input type="checkbox" name="delreservation" num="<%=d.getNum()%>"></th>                                    		
                                    		<th class="showcontent" num="<%=d.getNum()%>">
	                                    		<div style="font-size: 1.3em;">
                        						<span><img src="../image/알림.png" style="width: 30px;"></span>
	                                    		<span><%=d.getName()+"("+d.getId()+") 님의 예약" %></span>
	                                    		
	                                    		</div>     
	                                    		<div style="font-size: 1.1em;margin-left: 30px;">
	                                    		<span><i class="fas fa-bed" style="color: #aaa;"></i>&nbsp;<%=d.getRoomNum()%>호</span>
	                                    		<span><i class="far fa-calendar-alt" style="color: #aaa;"></i>&nbsp;<%=d.getCheckInDate() %></span>~
	                                    		<span><%=d.getCheckOutDate()%></span>
	                                    		</div>  
                                    		</th>                                 
                                        </tr>		
                                    	<%}
                                    %>
                                         
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                     

                </div>
               
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Grace Hotel 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

  <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='logoutaction.jsp'">Logout</button>
                </div>
            </div>
        </div>
    </div>
    
     <!-- Modal 사진 클릭시 다이얼로그 형태로 보이게 하기 위한 코드-->
  <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" >
        <h4 class="modal-title imgname">회원 추가</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          <form action="addguest.jsp">
          	<table>
          		<tr>
					<th style="width: 100px;">성명</th>
					<td>&nbsp;&nbsp;<input type="text" name="name" class="input" required id="name"></td>
				</tr>
				<tr>
					<th style="width: 100px;">생년월일</th>
					<td>&nbsp;&nbsp;
					<select id="year" style="width: 70px;" class="input" name="year">
					
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
					<select id="month" style="width: 70px;" class="input" name="month">
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
					<select id="day" style="width: 70px;" class="input" name="day">
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
					<th style="width: 100px;">이메일</th>
					<td>
					&nbsp;&nbsp;<input type="text" name="email1" style="width: 100px;" class="input" required id="email1">
					@&nbsp;<input type="text" name=email2 class="email2 input" required id="email2" >&nbsp;
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">휴대전화</th>
					<td>&nbsp;
					<input type="text" name="hp1" style="width: 80px;" class="input hp1" required maxlength="3">-
					<input type="text" name="hp2" style="width: 80px;" class="input hp2" required maxlength="4">-
					<input type="text" name="hp3" style="width: 80px;" class="input hp3" required maxlength="4">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">자택 주소</th>
					<td>&nbsp;&nbsp;<input type="text" name="zip" id="zip" class="input">
						<button type="button" class="btn btn-info" style="color: white;" onclick="openaddr()">주소 찾기</button>
						<br><br>&nbsp;&nbsp;<input type="text" name="addr1" id="addr1" class="input" style="width: 400px;">
						<br>&nbsp;&nbsp;<input type="text" name="addr2" id="addr2" class="input" style="width: 400px;">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">아이디</th>
					<td>&nbsp;&nbsp;<input type="text" name="idsel" class="input id" required>
						
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">비밀번호</th>
					<td>&nbsp;&nbsp;<input type="text" name="pass" class="input pass1" required>
						
					</td>
				</tr>
          	</table>
          		<div style="text-align: center;"><button type="submit" class="btn btn-warning" >추가</button></div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  	<!-- modal끝 -->
  
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>