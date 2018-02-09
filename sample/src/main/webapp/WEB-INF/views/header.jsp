<%@ include file="/WEB-INF/views/include.jsp"%>
<div class="page-header-inner ">
	<!-- BEGIN LOGO -->
	<div class="page-logo">
		<a class="logo-default" href="dashboard.htm"
			style="font-size: 19px; margin-top: 10px; color: #d8d8d8;"><label>SD
				Connexion</label></a>
	</div>

	<div class="hor-menu hidden-sm hidden-xs">
		<ul class="nav navbar-nav">
			<%-- <sdConnexion:hasPermission
				capability="<%=Capability.APP_MANAGEMENT%>"
				action="<%=Permission.VISIBLE%>"> --%>
				<li class="mega-menu-dropdown" aria-haspopup="true"><a
					href="javascript:;" class="dropdown-toggle"
					data-hover="megamenu-dropdown" data-close-others="true"> App
						Management <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu pull-left">
						<%-- <sdConnexion:hasPermission capability="<%=Capability.LIST_ITEMS%>"
							action="<%=Permission.VISIBLE%>"> --%>
						<li><a href="appLists.htm">List & Items</a></li>
						<%-- </sdConnexion:hasPermission> --%>
						<%-- <sdConnexion:hasPermission
							capability="<%=Capability.CAPABILITIES%>"
							action="<%=Permission.VISIBLE%>"> --%>
						<li><a href="capabilities.htm">Capabilities</a></li>
						<%-- </sdConnexion:hasPermission> --%>
						<%-- <sdConnexion:hasPermission
							capability="<%=Capability.ROLES_PERMISSIONS%>"
							action="<%=Permission.VISIBLE%>"> --%>
						<li><a href="roles.htm">Roles & permission</a></li>
						<%-- </sdConnexion:hasPermission> --%>
						<!-- <li><a href="emailQueues.htm">Email Queue</a></li> -->
						<%-- <sdConnexion:hasPermission capability="<%=Capability.TENANT%>"
							action="<%=Permission.VISIBLE%>"> --%>
						<li><a href="tenants.htm">Tenant</a></li>
						<%-- </sdConnexion:hasPermission> --%>
						<!-- <li><a href="tenant.htm">Add Tenant</a></li> -->
					</ul></li>
			<%-- </sdConnexion:hasPermission> --%>
			<%-- <sdConnexion:hasPermission
				capability="<%=Capability.USER_MANAGEMENT%>"
				action="<%=Permission.VISIBLE%>"> --%>
				<li class="mega-menu-dropdown" aria-haspopup="true"><a
					href="javascript:;" class="dropdown-toggle"
					data-hover="megamenu-dropdown" data-close-others="true"> User
						Management <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu pull-left">
						<%-- <sdConnexion:hasPermission capability="<%=Capability.USER%>"
							action="<%=Permission.VISIBLE%>"> --%>
							<li><a href="users.htm">User</a></li>
						<%-- </sdConnexion:hasPermission> --%>
						<%-- <sdConnexion:hasPermission capability="<%=Capability.ADD_USER%>"
							action="<%=Permission.VISIBLE%>">
							<li><a href="addUser.htm">Add User</a></li>
						</sdConnexion:hasPermission> --%>
					</ul></li>
			<%-- </sdConnexion:hasPermission> --%>

			<li class="mega-menu-dropdown" aria-haspopup="true"><a
				href="javascript:;" class="dropdown-toggle"
				data-hover="megamenu-dropdown" data-close-others="true"> Account
					Management <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu pull-left">
					<li><a href="teams.htm">Team</a></li>
					<li><a href="addTeam.htm">Add Team</a></li>
					<li><a href="divisions.htm">Division</a></li>
					<li><a href="addDivision.htm">Add Division</a></li>
					<!-- <li><a href="#">Pupil</a></li>
					<li><a href="#">Order</a></li> -->
				</ul></li>
		</ul>
	</div>

	<div class="top-menu">
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown dropdown-user"><a href="javascript:;"
				class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <img src="resources/images/avatar.png"
					class="header-avatar img-circle"
					alt="<sec:authentication property="principal.username" />"
					title="<sec:authentication property="principal.username" />">
					<span class="username username-hide-on-mobile"> <sec:authentication
							property="principal.username" />
				</span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-default">
					<li class="divider"></li>
					<li><a href="j_spring_security_logout"> <i
							class="fa fa-sign-out"></i> Log Out
					</a></li>
				</ul></li>
			<li class="dropdown dropdown-quick-sidebar-toggler hide"><a
				href="javascript:;" class="dropdown-toggle"> <i
					class="icon-logout"></i>
			</a></li>
		</ul>
	</div>
</div>


