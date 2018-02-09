function addAppItem(appListId) {
  $('#appItemModalBody').load('addAppItem.htm?appListId=' + appListId, function(result) {
    $('#appItemModal').modal({
      show : true
    });
    $('#0').parsley('validate');
    //initBootstrapSwitch("appItemDetailForm");
  });
}
function editAppItem(appItemId) {
  $('#appItemModalBody').load('appItem.htm?appItemId=' + appItemId, function(result) {
	   $('#appItemModal').modal({
	      show : true
	    });
	    $('#appItemDetailForm').parsley('validate');
	    //initBootstrapSwitch("appItemDetailForm");
	  });
}
//App Sub Items
function editAppSubItem(appSubItemId) {
	  $('#appSubItemModalBody').load('appSubItem.htm?appSubItemId=' + appSubItemId, function(result) {
	    $('#appSubItemModal').modal({
	      show : true
	    });
	    $('#appSubItemDetailForm').parsley('validate');
	    initBootstrapSwitch("appSubItemDetailForm");
	  });
	}
	function addAppSubItem(appListId, appItemId) {
	  $('#appSubItemModalBody').load('addAppSubItem.htm?appListId=' + appListId + '&appItemId=' + appItemId,
	      function(result) {
	        $('#appSubItemModal').modal({
	          show : true
	        });
	        $('#appSubItemDetailForm').parsley('validate');
	        initBootstrapSwitch("appSubItemDetailForm");
	      });
	}