<%@ include file="/WEB-INF/views/include.jsp"%>
<!-- BEGIN LOGIN -->

<!-- <div class="col-md-4 login-container bs-reset mt-login-5-bsfix"> -->
<!-- 	<div class="login-content"> -->
<!-- 		<h1 class="text-center">SD Connexion</h1> -->
<!-- 		<!-- BEGIN LOGIN FORM --> -->
<!-- 		<form class="parsley-form " data-parsley-validate -->
<!-- 			action="j_spring_security_check" method="post"> -->
<!-- 			<h3 class="font-green text-center">Signin</h3> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12 form-group"> -->
<%-- 					<span> User Name <input class="${formInputCss}" --%>
<!-- 						type="text" placeholder="Username" id="j_username" -->
<!-- 						name="j_username" data-parsley-required="true" -->
<!-- 						data-parsley-trigger="change" /> -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-12 form-group"> -->
<%-- 					<span> Password <input class="${formInputCss}" --%>
<!-- 						type="password" placeholder="Password" id="j_password" -->
<!-- 						name="j_password" data-parsley-required="true" -->
<!-- 						data-parsley-trigger="change" /> -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-actions "> -->
<!-- 				<label -->
<!-- 					class="rememberme mt-checkbox mt-checkbox-outline loginFontColor"> -->
<!-- 					<input type="checkbox" name="_spring_security_remember_me" -->
<!-- 					class="icheckbox loginFontColor" /> Remember me <span></span> -->
<!-- 				</label> -->
<!-- 				<button type="submit" class="btn green btn-parsley pull-right">Signin</button> -->
<!-- 			</div> -->
<!-- 			<div class="forget-password "> -->
<!-- 				<h4 class="loginFontColor" style="margin-top: 50px">Forgot your -->
<!-- 					password ?</h4> -->
<!-- 				<p class="loginFontColor"> -->
<!-- 					No worries, click <a href="auth/forgot.htm" id="forget-password"> -->
<!-- 						here </a> to reset your password. -->
<!-- 				</p> -->
<!-- 			</div> -->
<!-- 		</form> -->

<!-- 	</div> -->
<!-- </div> -->

<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form action="j_spring_security_check" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" name="j_username" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="j_password" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>