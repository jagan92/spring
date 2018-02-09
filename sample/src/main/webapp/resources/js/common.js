$(function(){
	initDatePicker();
	initDateTimePicker();
	initBootstrapSwitch();
	initSelect2();
	initDeleteModel();
});

//Initialize Select2 Elements
function initSelect2(){
    $(".select2").select2();
}
initSelect2();
function initDatePicker() {
	$('.datepicker').datepicker({
		dateFormat: "dd-mm-yy",
	});
	$(".datepicker").keypress(function(event) {
		event.preventDefault();
	});
}

function initDateTimePicker() {
	$('.datetimepicker').datetimepicker({
		dateFormat: "dd-mm-yy", 
	    timeFormat: "HH:mm"
	});
	$(".datetimepicker").keypress(function(event) {
		event.preventDefault();
	});
}

function initTimePicker(){
	$('.timepicker').timepicker();
	$(".timepicker").keypress(function(event) {
		event.preventDefault();
	});
}

function show(divId) {
	$('#' + divId).show();
}

function initBootstrapSwitch(element) {
	$(".bootstrap-switch").bootstrapSwitch({
		size : "small",
		onText : "Yes",
		offText : "No"
	});
}
function enableEditing(elementId) {
	$('#' + elementId).attr('readonly', false);
}
function initToastr() {
	toastr.options = {
		"closeButton" : true,
		"debug" : false,
		"newestOnTop" : false,
		"progressBar" : false,
		"positionClass" : "toast-bottom-right",// toast-top-right /
		// toast-top-left /
		// toast-bottom-right /
		// toast-bottom-left
		"preventDuplicates" : false,
		"showDuration" : "300",
		"hideDuration" : "1000",
		"timeOut" : "3000",
		"extendedTimeOut" : "3000",
		"showEasing" : "swing",
		"hideEasing" : "linear",
		"showMethod" : "fadeIn",
		"hideMethod" : "fadeOut"
	}
}

function callToastr(psType, psMessage) {
	if (psMessage) {
		if (psType == "info") {
			toastr.info(psMessage);
		} else if (psType == "warning") {
			toastr.warning(psMessage);
		} else if (psType == "success") {
			toastr.success(psMessage);
		} else if (psType == "error") {
			toastr.error(psMessage);
		}
	}
}

function emptyOptions(elementName) {
	$('#' + elementName).empty();
	$('#' + elementName).append(
			$('<option>').text('-- Select One --').attr('value', ''));
}

function refreshElement(element) {
	$('#' + element)
			.addClass('bounce animated')
			.one(
					'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
					function() {
						$(this).removeClass('bounce animated');
					});
}


//Claim Radio Button Event
$('.clsCalcRadio').change(function() {
    var elem = $(this).closest("tr");
    var rowIndex = $(elem).attr("data-rowIdx");
    var clsLumpSum = "clsInputLumpsum"+rowIndex;
    var clsCalc = "clsInputCalcEst"+rowIndex;
    if (this.value == 'lumpsum') {
	    $("."+clsCalc).val("");
        $("."+clsLumpSum).prop("disabled", false);
        $("."+clsCalc).prop("disabled", true);
    }
    else if (this.value == 'calcest') {
    	$("."+clsLumpSum).val("");
        $("."+clsLumpSum).prop("disabled", true);
        $("."+clsCalc).prop("disabled", false);
    }
});

//Initial Active of Calcuation Estimate
function funcActiveRadioButton(){
	var tableBodyChildElem = $("#tblBodyInfoCalcDetails").find("tr");
	for(var i=0;i<tableBodyChildElem.length;i++){
		var rowElem = tableBodyChildElem[i];
		var rowIndex = $(rowElem).attr("data-rowIdx");
		if($("#clsLumpSum"+rowIndex).hasClass("active")){
			$("#clsLumpSum"+rowIndex).trigger("click");
		}
		else if($("#clsCalc"+rowIndex).hasClass("active")){
			$("#clsCalc"+rowIndex).trigger("click");
		}
	}
}

function searchFound(psType){
	var psKey = "";
	if(psType == "claim"){
		psKey = $("#headSearchValue").val();
	}
	$.ajax({
		dataType:"json",
		url:"ajax/searchFound.json?searchType="+psType+"&searchKey="+psKey,
		success:function(mapValue){
			if(mapValue != null){
				if(mapValue["found"] == "false"){
					callToastr("error","Claims entry not available");
					return false;
				}
				else{
					return true;
				}
			}
		},
	});
}

function showModel(modelName) {
	$('#' + modelName).modal({
		show : true
	});
}

function enableValidation(formName) {
	$('#' + formName).parsley('validate');
}

function sdAjaxError() {
	alert("We're sorry. An error has occurred.");
}

function emptyOptions(elementName) {
	$('#' + elementName).empty();
	$('#' + elementName).append(
			$('<option>').text('-- Select One --').attr('value', ''));
}

function populateMapKeyOptions(elementName, mapData) {
	for ( var key in mapData) {
		$('#' + elementName).append(
				$('<option>').text(mapData[key][1]).attr('value', mapData[key][0]));
	}
}

function refreshElement(element) {
	$('#' + element)
			.addClass('bounce animated')
			.one(
					'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
					function() {
						$(this).removeClass('bounce animated');
					});
}
function initDeleteModel() {
    $('.confirmAalamDelete').click(function (event) {
   	 var lsUrl = $(this).attr("data-href");
   	 if(lsUrl != null && lsUrl != undefined && lsUrl.trim() != ""){
   		 var lsTitle = $(this).attr("data-title");
   		 lsTitle = (lsTitle != null && lsTitle != undefined && lsTitle.trim() != "") ? lsTitle : "Are you sure?";
   		 var lsMessage = $(this).attr("data-message");
   		 lsMessage = (lsMessage != null && lsMessage != undefined && lsMessage.trim() != "") ? lsMessage : "Please confirm you wish to continue";
            swal({
                title: lsTitle,
                text: lsMessage,
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "No",
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes",
                closeOnConfirm: false
            }, function (isConfirm) {
            	if(isConfirm){
            		location.href=lsUrl;	
            	}
            });  
   	 }
});
};


