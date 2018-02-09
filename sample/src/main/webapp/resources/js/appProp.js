
function initToastr() {
	toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"newestOnTop" : false,
			"progressBar" : false,
			"positionClass" : "toast-top-center",// toast-top-right / toast-top-left / toast-bottom-right / toast-bottom-left
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

function initToastrTopCenter() {
	toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"newestOnTop" : false,
			"progressBar" : false,
			"positionClass" : "toast-top-center",// toast-top-right / toast-top-left / toast-bottom-right / toast-bottom-left
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

	
function callToastr(psType, psMessage, psTitle){
	if(!psTitle) {
		psTitle = "";
	}
	if(psMessage){
		if(psType == "info"){
			toastr.info(psMessage, psTitle);
		}
		else if(psType == "warning"){
			toastr.warning(psMessage, psTitle);
		}
		else if(psType == "success"){
			toastr.success(psMessage, psTitle);
		}
		else if(psType == "error"){
			toastr.error(psMessage, psTitle);
		}
	}
}