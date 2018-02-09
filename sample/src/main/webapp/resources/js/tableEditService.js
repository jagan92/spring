$(function(){
	TableServiceParts.init();
});

var TableServiceParts = function () {

    var handleTable = function () {

        function restoreRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);

            for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                oTable.fnUpdate(aData[i], nRow, i, false);
            }

            oTable.fnDraw();
        }

        function editRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var body = $(oTable).find('tbody');
            var rowBody = $(body).find('tr');
            var sNo = rowBody.length;
            var jqTds = $('>td', nRow);
            jqTds[0].innerHTML = '<span></span>';
            jqTds[1].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[1] + '">';
            jqTds[2].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[2] + '">';
            jqTds[3].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[3] + '">';
            jqTds[4].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[4] + '">';
            jqTds[5].innerHTML = '<a class="edit" href="">Save</a><a class="cancel padLeftCus" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            var jqSelects = $('select', nRow);
            oTable.fnUpdate("", nRow, 0, false);
            oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
//            oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
//            oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 3, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 4, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a><a class="delete padLeftCus" href="">Delete</a>', nRow, 5, false);
            //oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
          //Update Sub Total
            var tempTableBody = $('#tbl_service_parts').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[3]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtservice_subtot_unit").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[4]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtservice_subtot_amt").val(adjSubTotal);
            		}
            	}
            }
        }

        function cancelEditRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 4, false);
            oTable.fnDraw();
        }

        var table = $('#tbl_service_parts');

        var oTable = table.dataTable({

//            "columnDefs": [{ // set default column settings
//                'orderable': true,
//                'targets': [0]
//            }, {
//                "searchable": false,
//                "targets": [0]
//            }],
//            "order": [
//                [0, "asc"]
//            ] // set first column as a default sort by asc
        });

//        var tableWrapper = $("#tbl_part_li_wrapper");
//
//        tableWrapper.find(".dataTables_length select").select2({
//            showSearchInput: false //hide search box with special css class
//        }); // initialize select2 dropdown

        var nEditing = null;
        var nNew = false;

        $('#tbl_service_parts_add').click(function (e) {
            e.preventDefault();

            if (nNew && nEditing) {
                if (confirm("Previose row not saved. Do you want to save it ?")) {
                    saveRow(oTable, nEditing); // save
                    $(nEditing).find("td:first").html("Untitled");
                    nEditing = null;
                    nNew = false;

                } else {
                    oTable.fnDeleteRow(nEditing); // cancel
                    nEditing = null;
                    nNew = false;
                    
                    return;
                }
            }

            var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
            var nRow = oTable.fnGetNodes(aiNew[0]);
            editRow(oTable, nRow);
            nEditing = nRow;
            nNew = true;
        });

        table.on('click', '.delete', function (e) {
            e.preventDefault();

            if (confirm("Are you sure to delete this row ?") == false) {
                return;
            }

            var nCol = $(this).parent('td');
            var elmDetID = $(nCol).attr('data-elmid');
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            if(elmDetID != undefined && elmDetID != null && elmDetID != ""){
            	elmDetID = elmDetID.trim();
            	$.ajax({
            		dataType:"json",
            		url:"ajax/deleteServicePart.json?detailID="+elmDetID,
            		success:function(mapValue){
                        //alert("Deleted! Do not forget to do some ajax to sync with backend :)");
                        callToastr("success","Deleted Successfully");
            		},
            	});
            }

        });

        table.on('click', '.cancel', function (e) {
            e.preventDefault();
            if (nNew) {
                oTable.fnDeleteRow(nEditing);
                nEditing = null;
                nNew = false;
            } else {
                restoreRow(oTable, nEditing);
                nEditing = null;
            }
        });

        table.on('click', '.edit', function (e) {
            e.preventDefault();

            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                restoreRow(oTable, nEditing);
                editRow(oTable, nRow);
                nEditing = nRow;
            } else if (nEditing == nRow && this.innerHTML == "Save") {
                /* Editing this row and want to save it */
                saveRow(oTable, nEditing);
                nEditing = null;
                //alert("Updated! Do not forget to do some ajax to sync with backend :)");
                //callToastr("success","Updated!! ");
            } else {
                /* No edit in progress - let's start one */
                editRow(oTable, nRow);
                nEditing = nRow;
            }
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            handleTable();
        }

    };

}();