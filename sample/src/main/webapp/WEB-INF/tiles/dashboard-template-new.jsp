<!doctype html>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Top Navigation</title>
<base	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->

 <link rel='stylesheet' type='text/css' href='http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css'/>


<link rel="stylesheet"
	href="resources/adminlte/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="resources/adminlte/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="resources/adminlte/plugins/datepicker/datepicker3.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="resources/adminlte/dist/css/skins/_all-skins.min.css">
	
	<link rel="stylesheet" href="resources/adminlte/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="resources/adminlte/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="resources/adminlte/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="resources/adminlte/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="resources/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="resources/adminlte/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="resources/adminlte/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/adminlte/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/adminlte/dist/css/skins/_all-skins.min.css">
	
	
	
	
	

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  
  <style>
  
  h2 {
    font-family: Verdana, Arial, sans-serif;
    text-align: center;
	color: #FFFFFF;
}

#header {
	width: 100%;
	height: 70px;
	position: relative;
	top: -40px;
	background-color: #7FC7AF;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

p {
    font-family: Verdana, Arial, sans-serif;
    font-size: 1em;
}

.left {
	position: relative;
	top: -40px;
    float: left;
}

.right {
	position: relative;
	top: -40px;
    float: right;
}

#main {
	position: relative;
	top: 170px;
	float: left;
}
  
  </style>
  
  
</head>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="#" class="navbar-brand"><b>Techwaukee</b>  EMS</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
						
						
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse pull-left"
						id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active hide"><a href="#"> <span
									class="sr-only">(current)</span></a></li>
							<li><a class="hide" href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Consultant <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="consultant.htm">Add Consultant</a></li>
									<li><a href="allconsultant.htm">View Consultant</a></li>
								</ul></li>
									<li class="active hide"><a href="#"> <span
									class="sr-only">(current)</span></a></li>
							<li><a class="hide" href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Employee <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="consultant.htm">Add Employee</a></li>
									<li><a href="allconsultant.htm">View Employee</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- Messages: style can be found in dropdown.less-->
							<li class="dropdown messages-menu">
								<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
									class="label label-success">4</span>
							</a>
<!-- 								<ul class="dropdown-menu">
									<li class="header">You have 4 messages</li>
									<li>
										inner menu: contains the messages
										<ul class="menu">
											<li>
												start message <a href="#">
													<div class="pull-left">
														User Image
														<img src="../../dist/img/user2-160x160.jpg"
															class="img-circle" alt="User Image">
													</div> Message title and timestamp
													<h4>
														Support Team <small><i class="fa fa-clock-o"></i>
															5 mins</small>
													</h4> The message
													<p>Why not buy a new awesome theme?</p>
											</a>
											</li>
											end message
										</ul> /.menu
									</li>
									<li class="footer"><a href="#">See All Messages</a></li>
								</ul>
							</li>
							/.messages-menu

							Notifications Menu
							<li class="dropdown notifications-menu">
								Menu toggle button <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
									class="label label-warning">10</span>
							</a>
								<ul class="dropdown-menu">
									<li class="header">You have 10 notifications</li>
									<li>
										Inner Menu: contains the notifications
										<ul class="menu">
											<li>
												start notification <a href="#"> <i
													class="fa fa-users text-aqua"></i> 5 new members joined
													today
											</a>
											</li>
											end notification
										</ul>
									</li>
									<li class="footer"><a href="#">View all</a></li>
								</ul>
							</li>
							Tasks Menu
							<li class="dropdown tasks-menu">
								Menu Toggle Button <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
									class="label label-danger">9</span>
							</a>
								<ul class="dropdown-menu">
									<li class="header">You have 9 tasks</li>
									<li>
										Inner menu: contains the tasks
										<ul class="menu">
											<li>
												Task item <a href="#"> Task title and progress text
													<h3>
														Design some buttons <small class="pull-right">20%</small>
													</h3> The progress bar
													<div class="progress xs">
														Change the css width attribute to simulate progress
														<div class="progress-bar progress-bar-aqua"
															style="width: 20%" role="progressbar" aria-valuenow="20"
															aria-valuemin="0" aria-valuemax="100">
															<span class="sr-only">20% Complete</span>
														</div>
													</div>
											</a>
											</li>
											end task item
										</ul>
									</li>
									<li class="footer"><a href="#">View all tasks</a></li>
								</ul>
							</li> -->
							<!-- User Account Menu -->
							<li class="dropdown user user-menu">
								<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <!-- The user image in the navbar-->
									<!-- <img src="../../dist/img/user2-160x160.jpg" class="user-image"
									alt="User Image"> --> <!-- hidden-xs hides the username on small devices so only the image appears. -->
									<span class="hidden-xs">Account</span>
							</a>
								<ul class="dropdown-menu">
									<!-- The user image in the menu -->
									<li class="user-header">

										<p>
											Techwaukee EMS <small>Member since
												Nov. 2012</small>
										</p></li>
									<!-- Menu Body -->
									<li class="user-body">
										<div class="row">
											<div class="col-xs-4 text-center">
												<a href="#">Followers</a>
											</div>
											<div class="col-xs-4 text-center">
												<a href="#">Sales</a>
											</div>
											<div class="col-xs-4 text-center">
												<a href="#">Friends</a>
											</div>
										</div> <!-- /.row -->
									</li>
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="#" class="btn btn-default btn-flat">Profile</a>
										</div>
										<div class="pull-right">
											<a href="j_spring_security_logout" class="btn btn-default btn-flat">Sign out</a>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					
					
					<div class="navbar-header">
						<a href="hr_pay.htm" class="navbar-brand"><b>HR Payroll</b> </a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
						
						<a href="#" class="navbar-brand"><b>Reports</b> </a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>
					
					
					
					
					
					
					<!-- /.navbar-custom-menu -->
				</div>
				
				
				
				
				<!-- /.container-fluid -->
			</nav>
		</header>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				<tiles:insertAttribute name="body" />
			</section>
		</div>
		<!-- /.content-wrapper -->
		<!-- Starts Web Page Footer -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.8
			</div>
			<strong> Copyright (c) 2018 Techwaukee.</strong> All rights
			reserved.
		</footer>
	</div>
	
	<script>
	
	
	$(document).ready(function() {
	    $("#departing").datepicker();
	    $("#returning").datepicker();
	    $("button").click(function() {
	    	var selected = $("#dropdown option:selected").text();
	        var departing = $("#departing").val();
	        var returning = $("#returning").val();
	     
	    });
	});
	
	
	</script>
	
	
	
	
	<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
	
	
	
	
	
	
	
	
	
	<!-- jQuery 2.2.3 -->
	<script src="resources/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="resources/adminlte/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="resources/adminlte/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/adminlte/dist/js/app.min.js"></script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	
	<!-- AdminLTE for demo purposes -->
	<script src="resources/adminlte/dist/js/demo.js"></script>
	
	<script src="resources/adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
	
	
	<!--  -->
	
	
<!-- Select2 -->
<script src="resources/adminlte/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="resources/adminlte/plugins/input-mask/jquery.inputmask.js"></script>
<script src="resources/adminlte/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="resources/adminlte/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="resources/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="resources/adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="resources/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="resources/adminlte/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="resources/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="resources/adminlte/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="resources/adminlte/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/adminlte/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/adminlte/dist/js/demo.js"></script>
<!-- Page script -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>