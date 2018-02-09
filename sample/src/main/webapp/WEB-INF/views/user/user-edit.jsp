<%@ include file="/WEB-INF/views/include.jsp"%>
<div class="row">
	<div class="col-md-12">
		<div class="box box-non-top">
			<form:form role="form" class="parsley-form" modelAttribute="userVO"
				action="user.htm" method="post" data-parsley-validate="true">
				<div class="box-body">
					<%-- <form:hidden id="id" path="id" /> --%>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>User Type <img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:select id="userType" path="type"
										onchange="callFunction(this);" cssClass="select2 col-xs-12"
										data-parsley-required="true">
										<form:option value="">
											<fmt:message key='option_default' />
										</form:option>
										<c:forEach items="${userVO.userTypes}" var="userType"
											varStatus="node">
											<form:option value="${userType.key}"
												label="${userType.value}" />
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<label> User Role <img
									src="resources/images/required-field-icon.png">
								</label>
								<form:select id="userRole" path="roleId"
									cssClass="select2 col-xs-12" data-parsley-required="true">
									<form:option value="">
										<fmt:message key='option_default' />
									</form:option>

									<c:forEach items="${userRole}" var="userRole" varStatus="node">
										<form:option value="${userRole.key}" label="${userRole.value}" />
									</c:forEach>
								</form:select>
							</div>


							<div class="form-group">
								<label>First Name <img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="name" path="firstName"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" data-parsley-maxlength="40"
										data-parsley-trim-value="true" />
								</div>
							</div>
							<div class="form-group">
								<label> Last Name <img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="lastName" path="lastName"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" data-parsley-maxlength="40" />
								</div>
							</div>
							<div class="form-group">
								<label> Email Id <img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="email" path="loginId"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" data-parsley-maxlength="80" />
								</div>
							</div>
							<c:if test="${userVO.isNew()}">
								<div class="form-group">
									<label> Password <img
										src="resources/images/required-field-icon.png">
									</label>
									<div>
										<form:input id="password" path="password"
											cssClass="${formInputCss}" data-parsley-required="true"
											data-parsley-trigger="change" data-parsley-maxlength="80" />
									</div>
								</div>
							</c:if>
							<div class="form-group" style="display: none;" id="tenant">
								<label> Tenant </label>
								<form:select id="userTenantName" path="tenantId"
									cssClass="select2 col-xs-12">
									<form:option value="">
										<fmt:message key='option_default' />
									</form:option>
									<c:forEach items="${userVO.tenantName}" var="tenant"
										varStatus="node">
										<form:option value="${tenant.key}" label="${tenant.value}" />
									</c:forEach>
								</form:select>

							</div>

						</div>
						<div class="col-md-3"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label> Mobile No. <img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="mobileNumber" path="mobileNumber"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" data-parsley-maxlength="10" />
								</div>
							</div>
							<div class="form-group">
								<label> Aadhar Card No. </label>
								<div>
									<form:input id="aadharNumber" path="aadharNumber"
										cssClass="${formInputCss}" data-parsley-trigger="change"
										data-parsley-maxlength="40" />
								</div>
							</div>
							<div class="form-group">
								<label> Address<img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="address" path="address"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" />
								</div>
							</div>
							<div class="form-group">
								<label> City<img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="city" path="city" cssClass="${formInputCss}"
										data-parsley-required="true" data-parsley-trigger="change"
										data-parsley-maxlength="40" />
								</div>
							</div>
							<div class="form-group">
								<label> State<img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="state" path="state" cssClass="${formInputCss}"
										data-parsley-required="true" data-parsley-trigger="change"
										data-parsley-maxlength="40" />
								</div>
							</div>
							<div class="form-group">
								<label> Country<img
									src="resources/images/required-field-icon.png">
								</label>
								<div>
									<form:input id="country" path="country"
										cssClass="${formInputCss}" data-parsley-required="true"
										data-parsley-trigger="change" data-parsley-maxlength="40" />
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="box-footer">
					<span> <fmt:message key='blank_required_field_msg' />
					</span> <span class="pull-right">
						<button type="submit" class="btn btn-success btn-parsley">
							<fmt:message key='button_save' />
						</button>
						<button type="button" class="btn btn-default"
							onclick="location.href='users.htm'">Cancel</button>
					</span>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
	function callFunction(e) {
		var userType = $('#userType').val();
		if (userType.trim() == "External") {
			$('#tenant').show();
			$("#userTenantName").attr("data-parsley-required", "true");
			populateUserRole();
		} else {
			$("#userTenantName").removeAttr("data-parsley-required");
			populateUserRole();
		}
	}
</script>

