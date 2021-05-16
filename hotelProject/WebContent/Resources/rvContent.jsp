<%@page import="org.json.simple.JSONObject"%>
<%@page import="reservation.db.ReservationDto"%>
<%@page import="reservation.db.ReservationDao"%>
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
		span.updatereservation{
			cursor: pointer;			
		}
		span.delreservation{
			cursor: pointer;
		}
		span.updatereservation:hover{
			color: black;		
		}
		span.delreservation:hover{
			color: black;
		}
		span.reviewlist{
			cursor: pointer;
		}
		tr.goreview{
			cursor: pointer;
		}
		td.chroom{
			cursor: pointer;
		}
	</style>
	
<script type="text/javascript">
<%
//아이디값 얻기
String id=(String)session.getAttribute("mana");
String num=request.getParameter("num");
String re=request.getParameter("re");

ReservationDao dao=new ReservationDao();
ReservationDto dto=dao.getData(num);

%> 

	$(function(){
		<%
		if(re!=null){%>
		window.reload();
		<%}
		%>
		//수정 버튼 눌렀을 때 값 모달 창 띄우기
		$("span.updatereservation").click(function(){
			$("select.capacity").val("<%=dto.getGuestQty()%>");
			$("#reservationModal").modal();
			
			//검색 버튼 띄우기
			$("button.searchbtn").click(function(){
				$("div.searchroom").html("");
				//가능한 방 띄우기
				var chi=$("input.checkin").val();
				var cho=$("input.checkout").val();
				var capacity=$("select.capacity").val();
				$.ajax({
					data:{"chi":chi,"cho":cho,"capacity":capacity},
					type:"get",
					dataType:"xml",
					url:"searchroom.jsp",
					success:function(data){
						var s="";
						if($(data).find("room").attr("num")==0){
							s="<h6 style='text-align:center;'>조건에 맞는 객실이 없습니다. 다시 선택해주세요.</h6>";
						}else{
							
						
						$(data).find("room").each(function(i) {
							var n=$(this);
							var num=n.attr("num");
							var photo=n.find("photo").text();
							var roomNum=n.find("roomNum").text();
							var price=n.find("price").text();
							var capacity=n.find("capacity").text();
							var text=n.find("text").text();
							
							s+="<table>";
							s+="<tr>";
							s+="<td rowspan='3'><img src='"+photo+"' style='width:200px;height:150px;'></td>"
							s+="<td class='roomnum'>"+roomNum+"</td>";
							s+="<td class='price'>"+price+"</td>";						
							s+="</tr>";
							s+="<tr>";						
							s+="<td style='text_align:center;' class='capacity'>"+capacity+"인</td>";	
							s+="<td style='text_align:center;' class='chroom' num='"+num+"'>선택<img src='../image/체크.png' style='width:30px;height:30px;'></td>";	
							s+="</tr>";
							s+="<tr>";						
							s+="<td colspan='2' style='height:100px;'>"+text+"</td>";						
							s+="</tr>";
							s+="</table>";
							
							
						
						});
						
						}
						$("div.searchroom").html(s);
						
					}
				});
			});
			
			//방선택 버튼 눌렀을 때
			$(document).on("click","td.chroom",function(){
				
				//선택 값을 넣어주고
				var rnum=$(this).attr("num");
				var room= $(this).parent().parent().find("td.roomnum").text();				
			
				$("td.rn").text(room);
				$("td.ca").text($("select.capacity").val());
				$("td.day").text($("input.checkin").val()+"~"+$("input.checkout").val());
			
				//초기화
				$("div.searchroom").html("");
				
				
				
				
			});
			
			//수정
			$("button.upreservation").click(function(){
				var room=$("td.room").text();
				var reserday=$("td.reserday").text();
				var capacity=$("td.capacity").text();
				location.href="updatereservation.jsp?room="+room+"&reserday="+reserday+"&capacity="+capacity+"&num=<%=num%>";
				
				
			});
		});
		
		//예약 취소 버튼
		$("span.delreservation").click(function(){
			var t=confirm("정말 취소하시겠습니까?");
			if(t){
				$.ajax({
					type:"get",
					data:{"num":<%=num%>},
					dataType:"html",
					url:"delreservation.jsp",
					success:function(){
						location.href="reservationlist.jsp";
					}
					
				});
			}
			
			
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
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="guestlist.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Grace Hotel</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="guestlist.jsp">
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
                    <h1 class="h3 mb-2 text-gray-800">상세 예약 내역</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="width: 800px;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"></h6>
                        </div>
                        <div class="card-body" style="width: 800px;">
                            <div class="table-responsive">
                            
                            <div style="text-align: right;">
                            	<span class="updatereservation"><i class="fas fa-edit"></i>수정</span>
                            	<span class="delreservation"><i class="fas fa-ban"></i>예약 취소</span>                           	
                            </div>
                                <table class="table table-bordered" id="dataTable"  cellspacing="0">                                  	
	                                 
	                                <tr>
	                                	<th colspan="2" style="text-align: center;"><img src="<%=dto.getPhoto()%>" style="max-width: 500px;max-height: 450px;"></th>
	                                </tr>	                                
	                                 <tr>
	                                	<th style="width: 50px;">객실</th>
	                                	<td><%=dto.getRoomNum() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">인원</th>
	                                	<td><%=dto.getGuestQty() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 70px;">예약 날짜</th>
	                                	<td><%=dto.getCheckInDate()+"~"+dto.getCheckOutDate() %></td>
	                                </tr>  
                                     <tr>
	                                	<th style="width: 50px;">예약자</th>
	                                	<td><%=dto.getName() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">아이디</th>
	                                	<td><%=dto.getId() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">연락처</th>
	                                	<td><%=dto.getHp() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">이메일</th>
	                                	<td><%=dto.getEmail() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">요청 사항</th>
	                                	<td></td>
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
    
   
    
  	
  	<!-- Modal reservation-->
  <div class="modal fade" id="reservationModal" role="dialog" >
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header" >
        <h4 class="modal-title imgname"><%=dto.getName() %>님의 예약내역</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">     
          
          	<table class="table table-bordered">
          	<input type="hidden" num="<%=dto.getNum() %>" name="num">
          		  <tr>
	                                	<th colspan="2" style="text-align: center;"><img src="<%=dto.getPhoto()%>" style="max-width: 500px;max-height: 450px;"></th>
	                                </tr>	                                
	                                <tr>
	                                	<th style="width: 70px;">예약 날짜</th>
	                                	<td>Check In<input type="date" class="input checkin" value="<%=dto.getCheckInDate()%>"> Check Out<input type="date" class="input checkout" value="<%=dto.getCheckOutDate()%>">
	                                	&nbsp;인원	                                	
	                                		<select class="input capacity" style="width: 50px;">
	                                			<option>1</option>
	                                			<option>2</option>
	                                			<option>3</option>
	                                			<option>4</option>
	                                		</select>
	                                		<button type="button" class="button searchbtn" style="margin-left: 30px;">검색</button>
	                                	</td>
	                                	
	                                </tr> 
	                                 <tr>
	                                	<td colspan="2"><div class="searchroom"></div></td>
	                                </tr>
	                                  <tr>
	                                	<th style="width: 50px;">객실</th>
	                                	<td class="rn room" name="room"><%=dto.getRoomNum() %></td>
	                                </tr>
	                                <tr>
	                                	<th style="width: 80px;">예약일</th>
	                                	<td class="day reserday" name="reserday"><%=dto.getCheckInDate()+"~"+dto.getCheckOutDate() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">인원</th>
	                                	<td class="ca capacity" name="capacity"><%=dto.getGuestQty() %></td>
	                                </tr>
                                     <tr>
	                                	<th style="width: 50px;">예약자</th>
	                                	<td><%=dto.getName() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">아이디</th>
	                                	<td><%=dto.getId() %></td>
	                                </tr>
	                                 <tr>
	                                	<th style="width: 50px;">연락처</th>
	                                	<td name="hp"><%=dto.getHp() %></td>
	                                </tr>	                                
	                       
          	</table>      
          	<div style="text-align: center;"><button type="button" class="button upreservation">예약 수정</button></div>   
          	
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