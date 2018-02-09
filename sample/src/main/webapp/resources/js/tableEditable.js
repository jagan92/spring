$(function(){
	TableEditable.init();
	TableEditableNettItem.init();
	TableEditableSNettItem.init();
	TableEditableLabour.init();
	TableEditableMiscellaneous.init();
})

var TableEditable = function () {

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
            //jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
            if(aData[3] == "Yes"){
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No">No</option><option value="Yes" selected>Yes</option></select>';
            }
            else{
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No" selected>No</option><option value="Yes">Yes</option></select>';
            }
            if(aData[4] == "Deformed"){
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged">Damaged</option><option value="Deformed" selected>Deformed</option></select>';
            }
            else{
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged" selected>Damaged</option><option value="Deformed">Deformed</option></select>';
            }
            jqTds[4].innerHTML = '';
            jqTds[4].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[4] + '">';
            jqTds[5].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[5] + '">';
            jqTds[6].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[6] + '">';
            jqTds[7].innerHTML = '<a class="edit" href="">Save</a><a class="cancel padLeftCus" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            var jqSelects = $('select', nRow);
            oTable.fnUpdate("", nRow, 0, false);
            oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
            oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
            /*oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);*/
            oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[4].value, nRow, 6, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a><a class="delete padLeftCus" href="">Delete</a>', nRow, 7, false);
            //oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
            //Update Sub Total
            var tempTableBody = $('#tbl_part_li').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[5]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtPart_li_subtot_est").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[6]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtPart_li_subtot_adj").val(adjSubTotal);
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

        var table = $('#tbl_part_li');

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

        $('#tbl_part_li_add').click(function (e) {
            e.preventDefault();
            console.log(e);
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

            var aiNew = oTable.fnAddData(['', '', '', '', '', '','','']);
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

//            var nRow = $(this).parents('tr')[0];
//            oTable.fnDeleteRow(nRow);
//            alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            var nCol = $(this).parent('td');
            var elmDetID = $(nCol).attr('data-elmid');
            if(elmDetID != undefined && elmDetID != null && elmDetID != ""){
            	elmDetID = elmDetID.trim();
            	$.ajax({
            		dataType:"json",
            		url:"ajax/deleteClaimDetails.json?detailID="+elmDetID,
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

//Parts-NettItems
var TableEditableNettItem = function () {

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
            //jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
            if(aData[3] == "Yes"){
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No">No</option><option value="Yes" selected>Yes</option></select>';
            }
            else{
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No" selected>No</option><option value="Yes">Yes</option></select>';
            }
            if(aData[4] == "Deformed"){
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged">Damaged</option><option value="Deformed" selected>Deformed</option></select>';
            }
            else{
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged" selected>Damaged</option><option value="Deformed">Deformed</option></select>';
            }
            jqTds[4].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[4] + '">';
            jqTds[5].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[5] + '">';
            jqTds[6].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[6] + '">';
            jqTds[7].innerHTML = '<a class="edit" href="">Save</a><a class="cancel padLeftCus" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            var jqSelects = $('select', nRow);
            oTable.fnUpdate("", nRow, 0, false);
            oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
            oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
            /*oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);*/
            oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[4].value, nRow, 6, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a><a class="delete padLeftCus" href="">Delete</a>', nRow, 7, false);
            //oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
            //Update Sub Total
            var tempTableBody = $('#tbl_part_nl').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[5]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtPart_nl_subtot_est").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[6]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtPart_nl_subtot_adj").val(adjSubTotal);
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

        var table = $('#tbl_part_nl');

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

        $('#tbl_part_nl_add').click(function (e) {
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

            var aiNew = oTable.fnAddData(['', '', '', '', '', '','','']);
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

//            var nRow = $(this).parents('tr')[0];
//            oTable.fnDeleteRow(nRow);
//            alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            var nCol = $(this).parent('td');
            var elmDetID = $(nCol).attr('data-elmid');
            if(elmDetID != undefined && elmDetID != null && elmDetID != ""){
            	elmDetID = elmDetID.trim();
            	$.ajax({
            		dataType:"json",
            		url:"ajax/deleteClaimDetails.json?detailID="+elmDetID,
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

//Parts-NettItems
var TableEditableSNettItem = function () {

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
            //jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
            if(aData[3] == "Yes"){
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No">No</option><option value="Yes" selected>Yes</option></select>';
            }
            else{
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No" selected>No</option><option value="Yes">Yes</option></select>';
            }
            if(aData[4] == "Deformed"){
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged">Damaged</option><option value="Deformed" selected>Deformed</option></select>';
            }
            else{
            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged" selected>Damaged</option><option value="Deformed">Deformed</option></select>';
            }
            jqTds[4].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[4] + '">';
            jqTds[5].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[5] + '">';
            jqTds[6].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[6] + '">';
            jqTds[7].innerHTML = '<a class="edit" href="">Save</a><a class="cancel padLeftCus" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            var jqSelects = $('select', nRow);
            oTable.fnUpdate("", nRow, 0, false);
            oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
            oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
            /*oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);*/
            oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 5, false);
            oTable.fnUpdate(jqInputs[4].value, nRow, 6, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a><a class="delete padLeftCus" href="">Delete</a>', nRow, 7, false);
            //oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
          //Update Sub Total
            var tempTableBody = $('#tbl_part_snl').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[5]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtPart_snl_subtot_est").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[6]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtPart_snl_subtot_adj").val(adjSubTotal);
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

        var table = $('#tbl_part_snl');

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

        $('#tbl_part_snl_add').click(function (e) {
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

            var aiNew = oTable.fnAddData(['', '', '', '', '', '','','']);
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

//            var nRow = $(this).parents('tr')[0];
//            oTable.fnDeleteRow(nRow);
//            alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            var nCol = $(this).parent('td');
            var elmDetID = $(nCol).attr('data-elmid');
            if(elmDetID != undefined && elmDetID != null && elmDetID != ""){
            	elmDetID = elmDetID.trim();
            	$.ajax({
            		dataType:"json",
            		url:"ajax/deleteClaimDetails.json?detailID="+elmDetID,
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

//Labour
var TableEditableLabour = function () {

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
            //jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
            if(aData[3] == "Yes"){
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No">No</option><option value="Yes" selected>Yes</option></select>';
            }
            else{
            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No" selected>No</option><option value="Yes">Yes</option></select>';
            }
//            if(aData[4] == "Deformed"){
//            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged">Damaged</option><option value="Deformed" selected>Deformed</option></select>';
//            }
//            else{
//            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged" selected>Damaged</option><option value="Deformed">Deformed</option></select>';
//            }
            jqTds[4].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[4] + '">';
            jqTds[5].innerHTML = '<input type="text" class="form-control input-sm" value="' + aData[5] + '">';
            jqTds[6].innerHTML = '<a class="edit" href="">Save</a><a class="cancel padLeftCus" href="">Cancel</a>';
        }

        function saveRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            var jqSelects = $('select', nRow);
            oTable.fnUpdate("", nRow, 0, false);
            oTable.fnUpdate(jqInputs[0].value, nRow, 1, false);
            oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
            oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
            //oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[2].value, nRow, 4, false);
            oTable.fnUpdate(jqInputs[3].value, nRow, 5, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a><a class="delete padLeftCus" href="">Delete</a>', nRow, 6, false);
            //oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 5, false);
            oTable.fnDraw();
            
          //Update Sub Total
            var tempTableBody = $('#tbl_labour').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[4]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtlab_subtot_est").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[5]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtlab_subtot_adj").val(adjSubTotal);
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

        var table = $('#tbl_labour');

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

        $('#tbl_labour_add').click(function (e) {
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

            var aiNew = oTable.fnAddData(['', '', '', '', '', '','']);
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

//            var nRow = $(this).parents('tr')[0];
//            oTable.fnDeleteRow(nRow);
//            alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            var nCol = $(this).parent('td');
            var elmDetID = $(nCol).attr('data-elmid');
            if(elmDetID != undefined && elmDetID != null && elmDetID != ""){
            	elmDetID = elmDetID.trim();
            	$.ajax({
            		dataType:"json",
            		url:"ajax/deleteClaimDetails.json?detailID="+elmDetID,
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

//Miscellaneous
var TableEditableMiscellaneous = function () {

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
            //jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
//            if(aData[3] == "Yes"){
//            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No">No</option><option value="Yes" selected>Yes</option></select>';
//            }
//            else{
//            	jqTds[3].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[3] + '"><option value="No" selected>No</option><option value="Yes">Yes</option></select>';
//            }
//            if(aData[4] == "Deformed"){
//            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged">Damaged</option><option value="Deformed" selected>Deformed</option></select>';
//            }
//            else{
//            	jqTds[4].innerHTML = '<select type="text" class="form-control input-sm" value="' + aData[4] + '"><option value="Damaged" selected>Damaged</option><option value="Deformed">Deformed</option></select>';
//            }
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
            var tempTableBody = $('#tbl_miscellaneous').find('tbody');
            var tempTableBodyRow = $(tempTableBody).find('tr');
            var subTotal = 0, adjSubTotal = 0;
            for(var i = 0; i< tempTableBodyRow.length; i++){
            	var a = $($(tempTableBodyRow[i]).find('td')[3]).text();
            	if(a != null && a != undefined){
            		a = a.trim();
            		if(a != ""){
            			subTotal = (parseFloat(a) != "NaN") ? parseFloat(a) + subTotal : subTotal;
            			$("#txtmis_subtot_est").val(subTotal);
            		}
            	}
            	
            	var b = $($(tempTableBodyRow[i]).find('td')[4]).text();
            	if(b != null && b != undefined){
            		b = b.trim();
            		if(b != ""){
            			adjSubTotal = (parseFloat(b) != "NaN") ? parseFloat(b) + adjSubTotal : adjSubTotal ;
            			adjSubTotal = (adjSubTotal != "NaN") ? adjSubTotal : 0; 
            			$("#txtmis_subtot_adj").val(adjSubTotal);
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

        var table = $('#tbl_miscellaneous');

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

        $('#tbl_miscellaneous_add').click(function (e) {
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
            		url:"ajax/deleteClaimDetails.json?detailID="+elmDetID,
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