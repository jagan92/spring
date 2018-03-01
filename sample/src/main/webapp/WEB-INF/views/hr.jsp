<%-- <%@ include file="/WEB-INF/views/include.jsp"%> --%>
<label style="font-size: xx-large;">Consultant</label>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Add Consultant</h3>
				</div>
				<form:form action="hr.htm" method="post"
					modelAttribute="consultantVO">
					<form:hidden path="id" />
					<div class="box-body">
						<c:if test="${consultantVO.id != null}">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Consultant ID</label> <input
											type="text" class="form-control"
											value="TWE${consultantVO.id}" placeholder="First Name"
											disabled="disabled" />
									</div>
								</div>
							</div>

						</c:if>

						<div class="col-md-12">
							<div class="form-group" style="text-align: left">

								<label style="font-size: 28px; color: #26a4d6;">Personal
									Informat</label>
							</div>
						</div>

						<div class="col-md-12">
							<div class="col-md-6" style="padding: 0">
								<div class="col-md-12">
									<div class="form-group" style="text-align: center">
										<label style="font-size: 21px;">Name</label>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">First Name</label>
										<form:input type="text" class="form-control" path="first_name"
											placeholder="First Name" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Middle Name</label>
										<form:input type="text" class="form-control"
											path="middle_name" placeholder="Middle Name" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Last Name</label>
										<form:input type="text" class="form-control" path="last_name"
											placeholder="Last Name" />
									</div>
								</div>

							</div>
							
						</div>




						




							<div class="col-md-12" style="padding:0;">
								<div class="col-md-4">
									<div class="form-group">
										<label class="form-label form-label-top" id="label_38"
											for="input_38"> Rate Per </label> <select class="dropdown"
											id="input_38" path="rate_per" style="width: 300px;"
											data-component="dropdown">
											<option value=""></option>
											<option value="Rate Per Hour">Rate Per Hour</option>
											<option value="Rate Per Day">Rate Per Day</option>
											<option value="Rate Per Month">Rate Per Month</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
									<label for="exampleInputEmail1">Salary</label>
									<form:input type="number" class="form-control"
										path="salary" placeholder="First Name" />
								</div>
								</div>
							</div>



						</div>


						<div class="col-md-12">

							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Account Holder Name</label>
									<form:input type="text" class="form-control"
										path="ac_holder_name" placeholder="First Name" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Bank Name</label>
									<form:input type="text" class="form-control" path="bank_name"
										placeholder="First Name" />
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Account Number</label>
									<form:input type="number" class="form-control"
										path="acc_number" placeholder="First Name" />
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">IFSC Code</label>
									<form:input type="number" class="form-control" path="ifsc_code"
										placeholder="First Name" />
								</div>
							</div>

						</div>


						<div class="col-md-12" >
							<div class="form-group">

								<label style="font-size: 28px;  color: #26a4d6  ">Skill Set</label>
							</div>
						</div>

						<div class="col-md-12">
							<div class="col-md-4" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Skill</label>
									<form:input type="text" class="form-control" path="skill"
										placeholder="First Name" />
								</div>
							</div>
							<div class="col-md-4" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Client</label>
									<form:input type="text" class="form-control" path="client"
										placeholder="First Name" />
								</div>
							</div>
							<div class="col-md-4" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Location</label>
									<form:input type="text" class="form-control" path="location"
										placeholder="First Name" />
								</div>
							</div>




						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-success">Save</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>
