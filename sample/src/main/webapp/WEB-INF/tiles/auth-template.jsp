<!doctype html>
<%@ include file="/WEB-INF/views/include.jsp"%>

<html class="no-js" lang="">
<head>
<style>
.login>div>div>footer {
	color: #fff;
}
</style>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<base
	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<%@ include file="/WEB-INF/views/include_css.jsp"%>
<link rel="stylesheet" href="resources/css/custom/login.min.css">
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<link rel="stylesheet" href="resources/js/plugins/toastr/toastr.min.css">

</head>
<body class="login">
	<div class="user-login-5">
		<div class="row bs-reset">
			<div class="col-md-8 bs-reset mt-login-5-bsfix">
				<div class="login-bg"
					style="background-image: url(resources/images/login-img1.jpg)">

				</div>
			</div>
			<div>
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>

	<tiles:importAttribute name="customJS" />
	<c:if test="${!empty customJS}">
		<c:forEach items="${customJS}" var="jsUrl" varStatus="node">
			<script src="${jsUrl}"></script>
		</c:forEach>
	</c:if>
	<script src="resources/js/plugins/jquery/jquery-1.12.4.min.js"></script>
	<script src="resources/js/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/plugins/jquery/jquery.backstretch.min.js"></script>
	<script src="resources/js/plugins/parsley.min.js"></script>
	<script src="resources/js/plugins/toastr/toastr.min.js"></script>
	<script src="resources/js/plugins/login.min.js"></script>
	<script src="resources/js/appProp.js"></script>

</body>
</html>