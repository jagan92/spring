<%@ include file="/WEB-INF/views/include.jsp"%>

<div class="col-md-4 login-container bs-reset mt-login-5-bsfix">
	<div class="login-content">
		<h1 class="text-center">SD Connexion</h1>

		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form:form class="parsley-form" data-parsley-validate="" action="auth/resetPassword.htm" modelAttribute="userVO" method="post">
			<h3 class="font-green text-center">Forgot Password ?</h3>
			<p class="col-md-12">Enter your e-mail address below to reset your password.</p>
			<div class="col-md-12 form-group">
			
				<form:input class="${formInputCss}" type="email" autocomplete="off" id="email" 
					path="email" placeholder="Email" data-parsley-required="true" data-parsley-trigger="change"/>
			</div>
			<div class="col-md-12 form-actions">
				<button type="button" id="back-btn" class="btn blue" onclick="location.href='login.htm'">Back</button>
				<button type="submit" class="btn green btn-parsley pull-right">Submit</button>
			</div>
		</form:form>
	</div>
</div>

<!-- END FORGOT PASSWORD FORM -->