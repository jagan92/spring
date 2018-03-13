<%@ include file="/WEB-INF/views/include.jsp"%>
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
				<form:form action="consultant.htm" method="post"
					modelAttribute="consultantVO">
					<form:hidden path="id" />
					<div class="box-body">
						<c:if test="${consultantVO.id != null}">
							<div class="row">
							<div class="col-md-12">
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Consultant ID</label> <input
											type="text" class="form-control"
											value="TWC${consultantVO.id}" placeholder="First Name"
											disabled="disabled" />
									</div>
								</div>
								
						<!-- 			<div class="col-md-3"  >
					
						<button type="button"    class="btn btn-success"    style="margin-bottom:  -18%"    >Activate</button>
				
					</div>
						<div class="col-md-3" >
					
						<button type="button"    class="btn btn-danger"   style="margin-left: -87%;margin-bottom: -18%"  >Deactivate</button>
				
					</div> -->
								
								
								
								</div>
							</div>

						</c:if>

						<div class="col-md-12" style="padding: 0">
							<div class="form-group" style="text-align: left">

								<label style="font-size: 28px; color: #26a4d6;">Personal
									Information</label>
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
							<div class="col-md-6" style="padding: 0">
								<div class="col-md-12">
									<div class="form-group" style="text-align: center">
										<label style="font-size: 21px;">Alias Name</label>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">First Name</label>
										<form:input type="text" class="form-control"
											path="a_first_name" placeholder="First Name" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Middle Name</label>
										<form:input type="text" class="form-control"
											path="a_middle_name" placeholder="Middle Name" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1">Last Name</label>
										<form:input type="text" class="form-control"
											path="a_last_name" placeholder="Last Name" />
									</div>
								</div>
							</div>
						</div>




						<div class="col-md-12">
							<div class="col-md-12">
								<div class="form-group" style="text-align: left">

									<label style="font-size: 21px;">Address</label>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Street</label>
									<form:input type="text" class="form-control" path="add_street"
										placeholder="street" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Lane</label>
									<form:input type="text" class="form-control" path="add_lane"
										placeholder="lane" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">City</label>
									<form:input type="text" class="form-control" path="add_city"
										placeholder="city" />
								</div>
							</div>
							
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">State</label>
									<form:input type="text" class="form-control" path="add_state"
										placeholder="state" />
								</div>
							</div>
						</div>

						<div class="col-md-12">

							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Pin</label>
									<form:input type="text" class="form-control" path="add_pin"
										placeholder="Pin number" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Country</label>
									<form:input type="text" class="form-control" path="add_country"
										placeholder="country" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label>
									<form:input type="text" class="form-control" path="ph_number" 
										placeholder="phone number" />
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Alternate Phone Number</label>
									<form:input type="text" class="form-control"
										path="alter_ph_number" placeholder="alternate Phone Number" />
								</div>
							</div>
						</div>
						
						
						<div class="col-md-12">
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Email Id</label>
									<form:input type="text" class="form-control"
										path="email" placeholder="Email" />
								</div>
							</div>

						
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Aadhar Number</label>
									<form:input type="text" class="form-control"
										path="aadhar_number" placeholder="aadhar Number" />
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Pan Number</label>
									<form:input type="text" class="form-control"
										path="pan_number" placeholder="pan number" />
								</div>
							</div>
                   </div>
							<div class="col-md-12" style="padding: 0">
								<div class="form-group" style="text-align: left">

									<label style="font-size: 28px; color: #26a4d6">Salary Details</label>
								</div>
							</div>




							<div class="col-md-12" style="padding:0;">
							
							
							
							<c:choose>
							  <c:when test = "${consultantVO.id != null}">
							
						
								<div class="col-md-4">
									<div class="form-group">
										<label class="form-label form-label-top" id="label_38"
											for="input_38"> Rate Per </label>
										
										
										<form:select path="rate_per" style="width:50%;" onchange="funcChangeRatePer(this)">
									        <form:option value="${consultantVO.rate_per}" label="${consultantVO.rate_per}"/>
									        <option value="Hour">Hour</option>
									       
									       <option value="Day">Day</option>
									    </form:select>
									   
										
											<%-- value="TWE${consultantVO.id}" placeholder="First Name" --%>
										
										
									</div>
								</div>
								
								</c:when>
								
								
							
							
							<c:otherwise>
           
								
								<div class="col-md-4">
									<div class="form-group">
										<label class="form-label form-label-top" id="label_38"
											for="input_38"> Rate Per </label>
										
										
										<form:select path="rate_per" style="width:50%;" onchange="funcChangeRatePer(this)">
									        <form:option value="--Select--" label="select"/>
									        <option value="Hour">Hour</option>
									       
									       <option value="Day">Day</option>
									    </form:select>
									   
										
											<%-- value="TWE${consultantVO.id}" placeholder="First Name" --%>
										
										
									</div>
								</div>
								
         </c:otherwise>
							
							
							
							
								 </c:choose>
								 
								 
								 
								 
								
							
								
								<div class="col-md-3" >
									<div class="form-group clsRatePer">	
										<label for="exampleInputEmail1">Hour</label>
										<form:input type="text" id="id_hour" class="form-control"
											path="hour_day" placeholder="Hour" />
									</div>
								</div>
								
								<div class="col-md-3">
								<div class="form-group clsRatePer">
									<label for="exampleInputEmail1">Day</label>
									<form:input type="text" id="id_day" class="form-control"
										path="day" placeholder="Day" />
								</div>
							</div>	
								
								
							</div>
								<div class="col-md-12" style="padding: 0">
								<div class="form-group" style="text-align: left">

									<label style="font-size: 28px; color: #26a4d6">Bank Account Details</label>
								</div>
							</div>
							



						


						<div class="col-md-12">

							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Account Holder Name</label>
									<form:input type="text" class="form-control"
										path="ac_holder_name" placeholder="Account holder name" />
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Bank Name</label>
									<form:input type="text" class="form-control" path="bank_name"
										placeholder="bank Name" />
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="exampleInputEmail1">Branch Name</label>
									<form:input type="text" class="form-control" path="branch"
										placeholder="branch Name" />
								</div>
							</div>
							</div>
                         <div class="col-md-12">
							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">Account Number</label>
									<form:input type="text" class="form-control"
										path="acc_number" placeholder="account number" />
								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<label for="exampleInputEmail1">IFSC Code</label>
									<form:input type="text" class="form-control" path="ifsc_code"
										placeholder="IFSC code" />
								</div>
							</div>

						</div>


						<div class="col-md-12"   style="padding: 0" >
							<div class="form-group">

								<label style="font-size: 28px;  color: #26a4d6  " >Skill Set</label>
							</div>
						</div>

						<div class="col-md-12">
							<div class="col-md-3" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Skill</label>
									<form:input type="text" class="form-control" path="skill"
										 />
								</div>
							</div>
							<div class="col-md-3" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Client</label>
									<form:input type="text" class="form-control" path="client"
										 />
								</div>
							</div>
							<div class="col-md-3" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Vendor</label>
									<form:input type="text" class="form-control" path="vendor"
										 />
								</div>
							</div>
							<div class="col-md-3" style="padding: 2">
								<div class="form-group">
									<label for="exampleInputEmail1">Location</label>
									<form:input type="text" class="form-control" path="location"
										 />
								</div>
							</div>
                       </div>
										
					</div>
					<!-- /.box-body --> 
					<div class="box-footer">
<div class="col-md-12" style="padding: 2">
<div class="col-md-3" >
					
						<button type="submit"   onclick="return confirm('Are you sure want to save?')" class="btn btn-success">Save</button>
					
					</div>
				
					<div class="col-md-3" >
					
						<button type="button"   onclick="funcback()" class="btn btn-success" style=" margin-left: -76%"      >Back</button>
				
					</div>
					</div>
					</div>
				
			
				</form:form>
			</div>
		</div>
	</div>
</section>
<script src="resources/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script>
function funcChangeRatePer(elem){
	var lsVal = $(elem).val();
	$("#id_day").prop('disabled', false);
	$("#id_hour").prop('disabled', false);
	$("#id_hour").val("");
	$("#id_day").val("");
	if(lsVal == "Day"){
		$("#id_hour").prop('disabled', true);
	} else if(lsVal == "Hour"){
		$("#id_day").prop('disabled', true);
	}
}



function funcback(){
	
	location.href="dashboard.htm";   
}

</script>