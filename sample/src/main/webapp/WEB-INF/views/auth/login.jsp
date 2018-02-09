<%@ include file="/WEB-INF/views/include.jsp"%>
<!-- BEGIN LOGIN -->

<div class="col-md-4 login-container bs-reset mt-login-5-bsfix">
	<div class="login-content">
		<h1 class="text-center">SD Connexion</h1>
		<!-- BEGIN LOGIN FORM -->
		<form class="parsley-form " data-parsley-validate
			action="j_spring_security_check" method="post">
			<h3 class="font-green text-center">Signin</h3>
			<div class="row">
				<div class="col-md-12 form-group">
					<span> User Name <input class="${formInputCss}"
						type="text" placeholder="Username" id="j_username"
						name="j_username" data-parsley-required="true"
						data-parsley-trigger="change" />
					</span>
				</div>
				<div class="col-md-12 form-group">
					<span> Password <input class="${formInputCss}"
						type="password" placeholder="Password" id="j_password"
						name="j_password" data-parsley-required="true"
						data-parsley-trigger="change" />
					</span>
				</div>
			</div>
			<div class="form-actions ">
				<label
					class="rememberme mt-checkbox mt-checkbox-outline loginFontColor">
					<input type="checkbox" name="_spring_security_remember_me"
					class="icheckbox loginFontColor" /> Remember me <span></span>
				</label>
				<button type="submit" class="btn green btn-parsley pull-right">Signin</button>
			</div>
			<div class="forget-password ">
				<h4 class="loginFontColor" style="margin-top: 50px">Forgot your
					password ?</h4>
				<p class="loginFontColor">
					No worries, click <a href="auth/forgot.htm" id="forget-password">
						here </a> to reset your password.
				</p>
			</div>
		</form>

	</div>
</div>
