<!doctype html>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html class="no-js" lang="">
<head>
<%@ include file="/WEB-INF/views/include_css.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Starts Web Page Header -->
			<tiles:insertAttribute name="header" />
			<!-- Ends Web Page Header -->
		</header>
		<aside class="main-sidebar">
			<!-- Starts Left Side Menu -->
			<tiles:insertAttribute name="menu" />
			<!-- Ends Left Side Menu -->
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<%-- <section class="content-header">
				<tiles:insertAttribute name="breadcrumb" />
			</section> --%>
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
			<strong> Copyright (c) 2016 Aalam Info Solutions.</strong> All rights
			reserved.
		</footer>
	</div>
	<!-- jQuery 2.2.3 -->
<script src="resources/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/adminlte/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/js/plugins/bootstrap/js/bootstrap-switch.min.js"></script>
<script src="resources/plugins/bootstrap-sweetalert/sweetalert.min.js"></script>
<!-- FastClick -->
<script src="resources/adminlte/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/adminlte/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/adminlte/dist/js/demo.js"></script>
<!-- Select2 for dropdown -->
<script src="resources/js/plugins/select2/select2.full.min.js"></script>


<script src="resources/js/plugins/toastr/toastr.min.js"></script>
<script src="resources/js/plugins/jquery/jquery-ui.min.js"></script>
<script src="resources/js/plugins/jquery/jquery-ui-timepicker-addon.js"></script>
<script src="resources/js/plugins/jquery/jquery.blockui.min.js"></script>
<script src="resources/js/plugins/parsley.min.js"></script>
<script src="resources/js/plugins/toastr/toastr.min.js"></script>
<script src="resources/js/common.js"></script>
<tiles:importAttribute name="customJS" />
<c:if test="${!empty customJS}">
	<c:forEach items="${customJS}" var="jsUrl" varStatus="node">
		<script src="${jsUrl}"></script>
	</c:forEach>
</c:if>
<script>
	$(function() {
		initToastr();
	});
</script>
<%@ include file="/WEB-INF/views/messages.jsp"%>
</body>
</html>