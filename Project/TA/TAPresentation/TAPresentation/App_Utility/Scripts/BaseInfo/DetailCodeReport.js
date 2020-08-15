
var LastSelectedRow = null;
var isUpdate = false;
var LastSelectedRowClass = "";
var Ogrid = document.getElementById("GrdCodeReport");
//-------------------------------------Ajax------------------------------------------------------
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function EndRequestHandler(sender, args) {

    if ($get(MasterObj + "txtAlert").value != "") {
        SetMsg($get(MasterObj + "txtAlert").value);
        $get(MasterObj + "txtAlert").value = "";
    }
    $get(MasterObj + "txtSubmit").value = "";
    var Ogrid = document.getElementById("GrdCodeReport");
    for (var i = 1; i < Ogrid.rows.length; ++i) {
        if (Ogrid.rows[i].RowID == 1)
            Ogrid.rows[i].style.display = "none";
        else
            Ogrid.rows[i].style.display = "inline";
    }
}
for (var i = 1; i < Ogrid.rows.length; ++i) {
    if (Ogrid.rows[i].RowID == 1)
        Ogrid.rows[i].style.display = "none";
    else
        Ogrid.rows[i].style.display = "inline";
}

//-------------------------------------------------------------------------------------------
function OnClickCell0(obj) {
    var Ogrid = document.getElementById("GrdCodeReport");
    var SelectedRow = obj.parentElement;
    if (SelectedRow.RowID == 0) {
        var CategoryGroupID = SelectedRow.CategoryGroupID;

        var Url = document.getElementById("Url").href;
        if (SelectedRow.cells[0].firstChild.src == Url)
            SelectedRow.cells[0].firstChild.src = "../../App_Utility/Images/Icons/btnNodes.gif";
        else
            SelectedRow.cells[0].firstChild.src = Url;

        var i = SelectedRow.rowIndex + 1;
        var Flag = true; //                }
        while (i < Ogrid.rows.length && Flag) {
            if (Ogrid.rows[i].RowID != 0) {
                Ogrid.rows[i].style.display = Ogrid.rows[i].style.display == "inline" ? "none" : "inline";
            }
            else
                Flag = false;
            ++i;
        }
    }
}
//--------------------------------------------------------------------------------
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
//--------------------------------------------------------------------------------