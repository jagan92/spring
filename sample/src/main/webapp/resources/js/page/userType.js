function addUser(){
	$('#userTypeBody').load(
			'userType.htm',
			function(result) {
				showModel('userType');
				enableValidation('userTypeForm')
			});
}

function editUser(UserId) {
	$('#userTypeBody').load(
			'userType.htm?UserId=' + UserId,
			function(result) {
				showModel('userType');
				enableValidation('userTypeForm')
							});
}
