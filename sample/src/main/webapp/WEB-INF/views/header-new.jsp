<%@ include file="/WEB-INF/views/include.jsp"%>
<a href="#" class="logo">
  <!-- mini logo for sidebar mini 50x50 pixels -->
  <span class="logo-mini"><b>SD</b></span>
  <!-- logo for regular state and mobile devices -->
  <span class="logo-lg"><b>SD</b> Connexion</span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
	 <!-- Sidebar toggle button-->
     <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
       <span class="sr-only">Toggle navigation</span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
     </a>
     <div class="navbar-custom-menu">
     	<ul class="nav navbar-nav">
     		<li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="resources/images/avatar.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><sec:authentication property="principal.username" /></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
					<li class="user-header"><img
						src="resources/adminlte/dist/img/user2-160x160.jpg"
						class="img-circle" alt="User Image">

						<p>
							<sec:authentication property="principal.username" />
						</p></li>
					<!-- Menu Body -->
              <!-- <li class="user-body">
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
                </div>
                /.row
              </li> -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="userProfile.htm" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="j_spring_security_logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
     	</ul>
     </div>
</nav>