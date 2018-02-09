<!doctype html>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html class="no-js" lang="">
<head>
<style>
	.headercolor {
	color:#3078ce;
	}

</style>
<%@ include file="/WEB-INF/views/include_css.jsp"%>
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/customcolors.css">
<tiles:importAttribute name="customCss" />

<link rel="stylesheet" href="resources/js/plugins/toastr/toastr.min.css">
<c:if test="${!empty customCss}">
	<c:forEach items="${customCss}" var="cssUrl" varStatus="node">
		<link rel="stylesheet" href="${cssUrl}">
	</c:forEach>
</c:if>

</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
	<div class="page-wrapper">
		<!-- BEGIN HEADER -->
		
		<div class="page-header navbar navbar-fixed-top headercolor">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- END HEADER -->
		<div class="clearfix"></div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<div class="page-sidebar-wrapper">
<%-- 				<tiles:insertAttribute name="menu" /> --%>
			</div>
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<tiles:insertAttribute name="breadcrumb" />
					</div>
					<div>
						<tiles:insertAttribute name="body" />
					</div>
				</div>
			</div>
		</div>

		<script src="resources/js/plugins/jquery/jquery-1.12.4.min.js"></script>
		<script src="resources/js/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="resources/js/plugins/jquery/jquery.slimscroll.min.js"></script>
		<script src="resources/js/plugins/jquery/jquery-ui.min.js"></script>
		<script src="resources/js/plugins/jquery/jquery-ui-timepicker-addon.js"></script>
		<script src="resources/js/plugins/jquery/jquery.blockui.min.js"></script>
		<script src="resources/js/plugins/bootstrap/js/bootstrap-switch.min.js"></script>
		<script src="resources/js/plugins/parsley.min.js"></script>
		<script src="resources/js/plugins/custom.app.js"></script>
		<script src="resources/js/plugins/layout.app.js"></script>
		<script src="resources/js/plugins/custom.demo.js"></script>
		<script src="resources/js/plugins/custom.sidebar.js"></script>
		<script src="resources/js/plugins/nav.min.js"></script>
		<script src="resources/js/appProp.js"></script>
		<script src="resources/js/common.js"></script>
		<script src="resources/js/plugins/switch/bootstrap-switch.min.js"></script>
		<script src="resources/js/plugins/toastr/toastr.min.js"></script>
		<tiles:importAttribute name="customJS" />
		<c:if test="${!empty customJS}">
			<c:forEach items="${customJS}" var="jsUrl" varStatus="node">
				<script src="${jsUrl}"></script>
			</c:forEach>
		</c:if>
	</div>
	<script>
		$(function() {
			initToastr();
		});
	</script>
	<%@ include file="/WEB-INF/views/messages.jsp"%>
</body>