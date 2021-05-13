<%@page import="java.io.File"%>
<%@page import="review.db.reveiwDto"%>
<%@page import="review.db.reviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="question.db.QuestionDto"%>
<%@page import="question.db.QuestionDao"%>
<%@page import="room.db.RoomDto"%>
<%@page import="room.db.RoomDao"%>
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="../css/style.css">

	<style type="text/css">
		tr.showcontent:hover{
			cursor: pointer;
		}
		span.updateguest{
			cursor: pointer;			
		}
		span.delguest{
			cursor: pointer;
		}
		span.updateguest:hover{
			color: black;		
		}
		span.delguest:hover{
			color: black;
		}
		span.reviewlist{
			cursor: pointer;
		}
		tr.goreview{
			cursor: pointer;
		}
	
	</style>
	
<script type="text/javascript">
<%
//아이디값 얻기
String id=(String)session.getAttribute("mana");
String num=request.getParameter("num");
%>
	$(function(){
		//삭제 이벤트
		$("span.delguest").click(function(){
			
			var t=confirm("정말 삭제하시겠습니까?");
			if(t){
				$.ajax({
					type:"get",
					data:{"num":num},
					dataType:"html",
					url:"delguest.jsp",
					success:function(){
						location.reload();						
					}
				});
			}
			
		
		});
		
		//수정 이벤트
		$("span.updateguest").click(function(){
			
			//값얻어와서 집어 넣기
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"num":<%=num%>},
				url:"getguest.jsp",
				success:function(d){
					var hp1=d.hp1;
					var hp2=d.hp2;
					var hp3=d.hp3;					
					var email1=d.email1;
					var email2=d.email2;				
					var year=d.year;
					var month=d.month;
					var day=d.day;
					var name=d.name;
					var id=d.id;
					var pass=d.pass;
					var addr=d.addr;					
					
					$("input[name=name]").val(name);
					$("select[name=year]").val(year);
					$("select[name=month]").val(month);
					$("select[name=day]").val(day);
					$("input[name=email1]").val(email1);
					$("input[name=email2]").val(email2);
					$("input[name=addr1]").val(addr);
					$("input[name=idsel]").val(id);
					$("input[name=pass]").val(pass);
					$("input[name=hp1]").val(hp1);
					$("input[name=hp2]").val(hp2);
					$("input[name=hp3]").val(hp3);
					
				}
			});
			
			$("#myModal").modal();	
			
			
		});
		
		//후기 내역 클릭했을 때
		$("span.reviewlist").click(function(){
			$("#reviewModal").modal();	
		});
		//후기 내역 상세보기로 이동
		$("tr.goreview").click(function(){
			var num=$(this).attr("num");
			location.href="rContent.jsp?num="+num;
		});
		
		//예약 내역 클릭했을 때
		$("span.reservationlist").click(function(){
			$("#reservationModal").modal();	
		});
		//예약 내역 상세보기로 이동
		$("tr.goreservation").click(function(){
			var num=$(this).attr("num");
			location.href="rvContent.jsp?num="+num;
		});
		
	});
</script>
</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
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
                    <h1 class="h3 mb-2 text-gray-800">회원 정보</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="width: 800px;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"></h6>
                        </div>
                        <div class="card-body" style="width: 800px;">
                            <div class="table-responsive">
                             <div style="text-align: left;">
                            	<span class="reservationlist" style="margin-right: 10px;color: #4e73df;"><i class="fas fa-bed" style="color: #4e73df;"></i></i>Reservation</span>                           	 
                            	&nbsp;<span class="reviewlist" style="color: #1cc88a;"><i class="fas fa-child" style="color: #1cc88a;"></i>&nbsp;Review</span>                            	
                            </div>
                            <div style="text-align: right;">
                            	<span class="updateguest"><i class="fas fa-user-edit"></i></span>
                            	<span class="delguest"><i class="fas fa-user-minus"></i></span>                           	
                            </div>
                                <table class="table table-bordered" id="dataTable"  cellspacing="0">                                  	
	                                <%
	                                	GuestDao dao=new GuestDao();
	                                	GuestDto dto=dao.getData2(num);
	                                
	                                	
	                                	
	                                	
	                                %>   
	                                
	                                	
	                                                                                         
                                    
                                    <tr>
                                    	<th width="120px;">이름</th>
                                    	<td><%=dto.getName() %></td>
                                    	<td width="70px;"><i class="fab fa-google" style="color: blue;"></i>oogle</td>
                                    	<%
                                    		
                                    	
                                    		if(dto.getGoogle().equals("no")){%>
                                    			<td style="width: 30px;"><i class="fas fa-times"></i></td>
                                    		<% }else{%>
                                    			<td style="width: 30px;"><i class="fas fa-check"></i></td>
                                    		<% }
                                    	%>
                                    			
                                    		
                                    	
                                    </tr>
                                     <tr>
                                    	<th width="80px;">아이디</th>
                                    	<td colspan="3"><%=dto.getId() %></td>
                                    </tr>
                                     <tr>
                                    	<th width="80px;">생년월일</th>
                                    	<td colspan="3"><%=dto.getBirth().substring(0,10) %></td>
                                     </tr>
                                     <tr>
                                    	<th width="80px;"> 연락처</th>
                                    	<td colspan="3"><%=dto.getHp() %></td>
                                     </tr>
                                      <tr>
                                    	<th width="80px;">주소</th>
                                    	<td colspan="3"><%=dto.getAddr() %></td>
                                     </tr>
                                     <tr>
                                    	<th width="80px;">비밀번호</th>
                                    	<td colspan="3"><%=dto.getPass() %></td>
                                     </tr>
                                     
                                                                          
                                </table>
                               
                            </div>
                        </div>
                    </div>

                </div>
                <!-- listform -->
                <div class="listform">
            	
           	 </div>
                <!-- /.container-fluid -->

            </div>
             
            <!-- End of Main Content -->
          

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Grace</span>
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
        <h4 class="modal-title imgname">회원 정보 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          <form action="updateguest.jsp">
          <input type="hidden" name="num" value="<%=num%>">
          	<table>
          		<tr>
					<th style="width: 100px;">이름</th>
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
          		<div style="text-align: center;"><button type="submit" class="btn btn-warning updateguestbtn" >수정</button></div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  	<!-- modal끝 -->
  	
  	<!-- Modal review-->
  <div class="modal fade" id="reviewModal" role="dialog" >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header" >
        <h4 class="modal-title imgname"><%=dto.getName() %>님의 후기 내역</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">        
          	<table class="table table-hover">
          		<tr>
          			<td>no</td><td>평가</td><td>제목</td><td>작성일</td><td>추천수</td><td>조회수</td>
          		</tr>
          		<%
				reviewDao rdao=new reviewDao();
				List<reveiwDto>list =rdao.getUserList(num);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				int no=0;
				if(list.size()==0){%>
					<tr><th colspan="6" style="text-align: center;">문의 내역이 없습니다.</th></tr>
				<%}else{
					
				
					for(reveiwDto d:list){%>
						<tr num="<%=d.getH_num()%>" class="goreview">
						<th><%=++no %></th>
						<th><%=d.getType() %></th>
						<th><%=d.getSubject() %></th>
						<th><%=sdf.format(d.getWriteday()) %></th>
						<th><%=d.getLikes() %></th>
						<th><%=d.getReadcount() %></th>
						</tr>
					<%}
				}
				%>
          	</table>         	
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