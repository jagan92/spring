function editOrderStatus(orderId) {
  $('#orderStatusModelBody').load('orderStatus.htm?orderId=' + orderId, function(result) {
	   $('#orderStatusModel').modal({
	      show : true
	    });
	    $('#orderStatusForm').parsley('validate');	 
	    setTimeout(function(){
	    	initSelect2();
	    },100);
  });
}