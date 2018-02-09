$(document).ready(function(){
	setTimeout(function(){
		if(!isNewRole){
			populateUserRoleId();
			if(appRoleId != null && appRoleId != undefined){
				setTimeout(function(){
					$("#userRole").val(appRoleId);
				},500);
			}
		}
	},100);
});