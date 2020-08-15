var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
// =================================Message===========================================================

function EndRequestHandler(sender, args) {
    if ($("#" + MasterObj + "txtSubmit").val() == "New") {
        if ($("#" + MasterObj + "txtValidate").val() == "0") {
            alert($("#" + MasterObj + "txtAlert").val());
        }
        else {
            window.returnValue = "1";
            window.close();
        }
    }
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
/////////////////////////////////////////Edit//////////////////
function OnClickBtnEdit() {
    if (LastSelectedRow == "")
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
    else {
        var strUrl = "CodeGroupCategory_new.aspx?CategoryID=" + $(LastSelectedRow).attr("CategoryID")
                 + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
                 + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()

        var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:500px;dialogWidth: 700px;center: Yes;help: no;status: no")
        if (returnValue == "1")
            OnClickBtnFilter()
    }

}
//==============================================دابل کلیک ===============================
function OndbClickGrd() {
    OnClickBtnEdit()
}
///////////////////////////////////////////OnClickGrd////////////////////////////////
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}
////////////////////////////////////////////Filter///////////////////////
function OnClickBtnFilter() {
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()
}
////////////////////////////////////////////New///////////////////////
function OnClickBtnNew() {
    $("#" + MasterObj + "txtSubmit").val("New")
    var strUrl = "CodeGroupCategory_new.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:500px;dialogWidth: 700px;center: Yes;help: no;status: no")
    if (returnValue == "1") {
        OnClickBtnFilter()
    }
}
////////////////////////////////////////////Delete///////////////////////
function OnClickBtnDelete() {
    if (LastSelectedRow != "") {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
            $("#" + MasterObj + "txtID").val($(LastSelectedRow).attr("ID"));
            $("#" + MasterObj + 'txtSubmit').val("Delete")
            $("#" + MasterObj + 'BtnSubmit').click()
        }
    }
    else
        alert('به منظور حذف یک سطر را انتخاب کنید')
}