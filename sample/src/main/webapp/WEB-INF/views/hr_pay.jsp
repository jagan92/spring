<%@ include file="/WEB-INF/views/include.jsp"%>
<label style="font-size: xx-large;">Consultant</label>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">TECHWAUKEE PAYROLL</h3>
				</div>
				 <form:form action="hr_pay.htm" method="POST"
					modelAttribute="hrPayVO"  >
					
									
										<div class="col-md-12">
							<div class="form-group" style="text-align: left">

								<label style="font-size: 28px; color: #26a4d6;">HR PAYROLL
									</label>
							</div>
						</div>
						
						<div class="col-md-3" >
								<div class="form-group">
									<label for="exampleInputEmail1" style="font-size: 21px" > Consultant ID</label>
<!-- 									<input type="text" class="form-control "  -->
<!-- 										placeholder="Consultant ID" /> -->
										<form:select id="id_select_consultant" path="consultantId" class="form-control"  onchange="loadCosultant(this)">
											<option value=""> Select Consultant </option>
											<c:forEach items="${consultantVOs}" var="consultantVO">
												<option value="${consultantVO.id}" <c:if test="${consultantVO.id == hrPayVO.consultantId}"> selected</c:if> > TWC${consultantVO.id} </option>
											</c:forEach>
										</form:select>
								</div>
							</div>
															<div class="col-md-4">
			
<%--                 <label>Date:</label>
<form:input type="text" class="form-control" id="departing_date"     path = "trans_date"
											placeholder="take home" style="margin-top: 2%"/>
                --%>
                
                 
                 
                 
                 <label>Date range:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <form:input type="text" class="form-control" id="reservation"      path = "trans_date"
											placeholder="DATE" style="margin-top: 2%"/>
                  
                 <%--  <form:input type="text" class="form-control pull-right"  style="margin-top: 2%"   id="reservation"  path = "trans_date"/ > --%>
                </div>
                 
                 
                 
                 
                 
                  
                  
                    
                </div>
                
				<div class="col-md-3" >
				<button type="button" class="btn btn-success" id="btn_load" onclick="funcLoadValue()"  style="margin-top: 11%;">Load</button>
			</div>

							
										<div class="col-md-12 loadConsultantDiv">
										
										
										
</div>							
							
										<div class="col-md-12">
							<div class="col-md-6" style="padding: 0">
								<div class="col-md-12">
									<div class="form-group" style="text-align: left">
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
							<div class="col-md-12">
							
						<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">Rate</label>
										<form:input type="text" class="form-control" path="rate_per" id="id_rate_per"
											placeholder="Rate" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px ;">Hour</label>
										<form:input type="text" id="id_hour" class="form-control" path="hour_day"
											placeholder="Salary"/>
									</div>
								</div>
									<div class="col-md-2">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px ;">Day</label>
										<form:input type="text" id="id_day" class="form-control" path="day"
											placeholder="Salary"/>
									</div>
								</div>

               
             
              <div class="col-md-12"style="padding: 0">
              
              <%-- <c:if test="${HrPayVO.rate_per = Hour }">  --%>
              	<div class="col-md-3">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">Number of working hours</label>
										<form:input type="text" class="form-control"   id="id_no_hours" path = "no_hours"  
											placeholder="hours" />
									</div>
								</div>
								
								
									<div class="col-md-3" >
									<button type="button" class="btn btn-success" id="btn_num_hours" onclick="funcCalculateHourPay()"  style="margin-top: 11%;">Calculate</button>
								</div>
            <%--  </c:if>  --%>
              	<div class="col-md-3">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">Number of working days</label>
										<form:input type="text" class="form-control" id="id_no_days" path = "no_days"
											placeholder="days" />
									</div>
								</div>
								
								
								
              
              	<div class="col-md-3" >
									<button type="button" class="btn btn-success" id="btn_num_days" onclick="funcCalculateDayPay()" style="margin-top: 11%;">Calculate</button>
								</div>
								</div>
								 <div class="col-md-12"style="padding: 0">
								 
								  <div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">Gross Amount</label>
										<form:input type="text" class="form-control" id="id_gross" path = "gross"
											placeholder="10% deduction from salary" />
									</div>
								</div>
								
								 <div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">TDS Deduction</label>
										<form:input type="text" class="form-control" id="id_tds" path = "tds"
											placeholder="10% deduction from salary" />
									</div>
								</div>
								
								<div class="col-md-4">
									<div class="form-group">
										<label for="exampleInputEmail1"style="font-size: 21px;">Take Home</label>
										<form:input type="text" class="form-control" id="id_take_home" path = "take_home" 
											placeholder="take home" />
									</div>
								</div>
              
              </div>
              
              
               <div class="col-md-9">
              <div class="col-md-3" >
									<button type="submit" class="btn btn-success" style="margin-top: 11%; "     data-dateId="${hrPayVO.trans_date} data-conId="${hrPayVO.consultantId}" >Save & Send Mail</button>
			 
								</div>
			<div class="col-md-3" >
									<button type="button" id="id_paid_btn" class="btn btn-success" style="margin-top: 11%;"
									 data-conId="${hrPayVO.consultantId}"  onclick="funcUpdateTrans(this)">Paid</button>
								</div>	
								<div class="col-md-3" >
									<button type="button" class="btn btn-success" onclick="funcback()" style="margin-top: 12%;
    margin-left: -48%;">Back</button>
								</div>				
              </div>
        <!--       <div class="col-md-12" >
              						<form action="servlet/SendMail">  
           To:<input type="text" name="to"/><br/>  
             Subject:<input type="text" name="subject"><br/>  
          Text:<textarea rows="10" cols="70" name="msg"></textarea><br/>  
           <input type="submit" value="send"/>  
                             </form>
              
              </div>
               -->
              
              
              
								</div>
								</form:form>
							</div>
							</div>
							</div>
							
							
							
							
							
							
							
							
							
						
							
							
							
							
							
							
							
							
							
							
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				
				<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>
							
	<script>
	
	
	
	
	
	$(document).ready(function() {
	    $("#departing").datepicker();
	    $("#returning").datepicker();
	    $("button").click(function() {
	    	var selected = $("#dropdown option:selected").text();
	        var departing = $("#departing").val();
	        var returning = $("#returning").val();
	       
	    });
	});
	
	
	
	
	
	

	function funcLoadValue(elem){
		var lsDateValue = $("#reservation").val();
		var lsConsultantId = $("#id_select_consultant").val();
		var lsEncodeDate = encodeURIComponent(lsDateValue) ;
		var lsUrl = "getTransDetail.htm?consultantId="+lsConsultantId+"&date="+lsEncodeDate;
		$.get(lsUrl, function(data, status){
			$("#id_take_home").val("");
			if(data.trim() != "null"){
				var strVal = JSON.parse(data);
				$("#id_take_home").val(strVal.take_home);
				
				$("#id_no_hours").val(strVal.no_hours);
				$("#id_no_days").val(strVal.no_days);
				$("#id_tds").val(strVal.tds);
				$("#id_gross").val(strVal.gross);

              if(strVal.is_paid == "Y"){
					$("#id_paid_btn").prop('disabled', true);	
				} else {
					$("#id_paid_btn").prop('disabled', false);
				}
			} else {
					
			}
	    });
	}
	
	function funcUpdateTrans(elem){
		var lsDateValue = $("#reservation").val();
		var lsConsultantId = $("#id_select_consultant").val();
		var lsEncodeDate = encodeURIComponent(lsDateValue) ;
		var lsUrl = "updatePaid.htm?consultantId="+lsConsultantId+"&date="+lsEncodeDate;
		$.get(lsUrl, function(data, status){
			if(data.trim() == "true"){
				$("#id_pain_btn").prop('disabled', true);
			} else {
				$("#id_pain_btn").prop('disabled', false);
			}
	    });
	}
	function funcCalculateHourPay(){
		
		var lsHours = $("#id_no_hours").val();
		var lsHourSalary = $("#id_hour").val();
		lsHourSalary = parseInt(lsHourSalary);
		lsHours = parseInt(lsHours);
		
		var totSalary = lsHours * lsHourSalary;
		var tdsAmt = (totSalary * 10)/100;
		var takeHome = totSalary - tdsAmt;
		$("#id_gross").val(totSalary);
		$("#id_tds").val(tdsAmt);
		$("#id_take_home").val(takeHome);
		var lsDate = $("#reservation").val();
		var lsConsultantId = $("#id_select_consultant").val();
	/* 	$.get("getStatus.htm?consultantId="+lsConsultantId+"&date="+lsDate, function(data, status){
			$("#id_pain_btn").prop('disabled', false);
			if(data == "true"){
				alert("Already Paid")
	        	$("#id_pain_btn").prop('disabled', true);
	        	
	        } else {
	        	$("#id_pain_btn").prop('disabled', false);
	        }
	    }); */
		
	}
	
	
	
	
	
	function funcCalculateDayPay(){
		var lsDays = $("#id_no_days").val();
		var lsDaySalary = $("#id_day").val();
		lsDaySalary = parseInt(lsDaySalary);
		lsDays = parseInt(lsDays);
		
		var totSalary = lsDays * lsDaySalary;
		var tdsAmt = (totSalary * 10)/100;
		var takeHome = totSalary - tdsAmt;
		
		$("#id_tds").val(tdsAmt);
		$("#id_take_home").val(takeHome);
		$("#id_gross").val(totSalary);
		
	  	var lsDate = $("#reservation").val();
		var lsConsultantId = $("#id_select_consultant").val();
	/* 	$.get("getStatus.htm?consultantId="+lsConsultantId+"&date="+lsDate, function(data, status){
			$("#id_pain_btn").prop('disabled', false);
			if(data == "true"){
	        	$("#id_pain_btn").prop('disabled', true);
	        } else {
	        	$("#id_pain_btn").prop('disabled', false);
	        }
	    });  
		 */
	}
	
	
	
	
	
	
	
	
	   function loadMail(e){
		   var conId = $(e).attr("data-conId");         
		   var dateId = $(e).attr("data-dateId");  
		}
		  
	
	
	
	   function funcback(){
			
				location.href="dashboard.htm";   
			}
		  
	
	
	
	
	

		  function loadCosultant(e){
		var lsVal = $(e).val();
		if(lsVal != "" && lsVal != null){
			location.href="hr_pay.htm?consultantId="+lsVal;	
		} else {
			location.href="hr_pay.htm";
		}
	  }
		  $(function(){
			  setTimeout(function(){
				  var lsRatePer = $("#id_rate_per").val();
				 	$("#id_no_days").prop('disabled', false);
					$("#btn_num_days").prop('disabled', false);
					 $("#id_no_hours").prop('disabled', false);
						$("#btn_num_hours").prop('disabled', false);
				 if(lsRatePer == "Day"){
					 $("#id_no_hours").prop('disabled', true);
					$("#btn_num_hours").prop('disabled', true);
				 } else if(lsRatePer == "Hour"){
					 $("#id_no_days").prop('disabled', true);
					$("#btn_num_days").prop('disabled', true); 
				 }
			  }, 1000)
		  });
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
  
  
  
  
  
  
</script>

<script type="text/javascript">
	$('.daterange').daterangepicker();
</script>

<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
</section>
							
					