var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//        ============================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)
//        =================================Message====================================================

function EndRequestHandler(sender, args) {

    if ($("#" + MasterObj + "txtValidate").val() == "0") {
        alert($("#" + MasterObj + "txtAlert").val());
    }
    else {
        window.returnValue = "1";

    }
    $("#" + MasterObj + "txtSubmit").val("")
    $("#" + MasterObj + "txtAlert").val("")
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
///////////////////////////////////////////////////////////////////////////
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
    $("#" + MasterObj + "txtID").val($(LastSelectedRow).attr("ID"));
    $("#" + MasterObj + "TxtName").val($(LastSelectedRow).attr("Name"));
    $("#" + MasterObj + "TxtAcronym").val($(LastSelectedRow).attr("Acronym"));
}
//-----------------------------------save-----------------------------------
function OnClickBtnSave() {
    if (ChkNotIsEmpty()) {
        $("#" + MasterObj + "txtSubmit").val("Modify");
        $("#" + MasterObj + "BtnSubmit").click();
    }
    window.close();
}
// =============================== چک کردن خالی نبودن آبجکت ها ==================================   
function ChkNotIsEmpty() {

    if ($("#" + MasterObj + "TxtName").val() == 0) {
        alert("لطفا نام دسته بندی را وارد کنید ");
        return false;
    }
    else if ($("#" + MasterObj + "TxtAcronym").val() == 0) {
        alert("لطفا نام  مخفف را وارد کنید ");
        return false;
    }
    return true;
}
// =====================================================================
function OnClickBtnNew() {
    $("#" + MasterObj + "TxtName").val("");
    $("#" + MasterObj + "TxtAcronym").val("");
}
//=======================================delete=========================
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
    window.close();
}