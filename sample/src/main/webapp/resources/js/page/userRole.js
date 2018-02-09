function populateUserRole() {
	var userType = $('#userType').val();
	$.ajax({
		contentType : "application/json",
		dataType : "json",
		url : "ajax/loadDataByUserType.json?userType=" + userType,
		success : function(mapData) {
			emptyOptions('userRole');
			var sortedroles = sortProperties(mapData);
			populateMapKeyOptions('userRole', sortedroles);
			
		}
	});
}

function populateUserRoleId() {
	var userType = $('#userType').val();
	$.ajax({
		contentType : "application/json",
		dataType : "json",
		url : "ajax/loadDataByUserTypeId.json?userType=" + userType,
		success : function(mapData) {
			emptyOptions('userRole');
			var sortedroles = sortProperties(mapData);
			populateMapKeyOptions('userRole', sortedroles);
			
		}
	});
}

function populateTenant() {
	
	$.ajax({
		contentType : "application/json",
		dataType : "json",
		url : "ajax/loadTenantByUserType.json",
		success : function(mapData) {
			emptyOptions('tenantName');
			var sortedroles = sortProperties(mapData);
			populateMapKeyOptions('tenantName', sortedroles);
			
		}
	});
}




function sortProperties(obj) {
	// convert object into array
	var sortable = [];
	for ( var key in obj)
		if (obj.hasOwnProperty(key))
			sortable.push([ key, obj[key] ]); // each item is an array in
	// format [key, value]

	// sort items by value
	sortable.sort(function(a, b) {
		var x = a[1].toLowerCase(), y = b[1].toLowerCase();
		return x < y ? -1 : x > y ? 1 : 0;
	});
	return sortable; // array in format [ [ key1, val1 ], [ key2, val2 ], ...
	// ]
}