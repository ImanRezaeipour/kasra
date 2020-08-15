var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
var LastSelectedRow = "";
var LastSelectedRowClass = "";
//        =========================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//        =================================Message=================================================

function EndRequestHandler(sender, args) {

    if ($("#" + MasterObj + "txtValidate").val() == "0") {
        alert($("#" + MasterObj + "txtAlert").val());
    }
    else {

        window.returnValue = "1";
        window.close();
    }
    $("#" + MasterObj + "txtSubmit").val("");
    $("#" + MasterObj + "txtAlert").val("");
    LastSelectedRow = "";
    LastSelectedRowClass = "";
}
/////////////////////////////////////////
function OnClickBtnEdit() {

    if (LastSelectedRow == "")
        alert("به منظور ويرايش یک سطر را انتخاب کنید")
    else {
        var strUrl = "CodeCategoryPage_new.aspx?ID=" + $(LastSelectedRow).attr("ID")
                + "&PageID=" + $(LastSelectedRow).attr("PageID")
                + "&Title=" + $(LastSelectedRow).attr("Title")
                + "&CategoryID=" + $(LastSelectedRow).attr("CategoryID")
                + "&Name=" + $(LastSelectedRow).attr("Name")
                + "&State=" + $(LastSelectedRow).attr("State")
                + "&Description=" + $(LastSelectedRow).attr("Description")
                + "&SessionID=" + $("#" + MasterObj + "txtSessionID").val()
        var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 700px;center: Yes;help: no;status: no")
        if (returnValue == "1")
            OnClickBtnFilter()

    }
}
//======================================================دابل کلیک =========================================
function OndbClickGrd() {
    OnClickBtnEdit()
}
///////////////////////////////////////////////////////////////////////////
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        LastSelectedRow.className = LastSelectedRowClass;
    }
    LastSelectedRowClass = SelectedRow.className;
    LastSelectedRow = SelectedRow;
    SelectedRow.className = "CssSelectedItemStyle";
}

////////////////////////////////////////////New///////////////////////
function OnClickBtnNew() {
    var strUrl = "CodeCategoryPage_new.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 700px;center: Yes;help: no;status: no")
    if (returnValue == "1")
        OnClickBtnFilter()
}
////////////////////////////////////////////Filter///////////////////////
function OnClickBtnFilter() {
    $("#" + MasterObj + "txtSubmit").val("Filter")
    $("#" + MasterObj + "BtnSubmit").click()

}
////////////////////////////////////////////Delete///////////////////////
function OnClickBtnDelete() {
    if (LastSelectedRow != "") {
        if (confirm("آيا براي حذف مطمئن هستيد؟")) {
            $("#" + MasterObj + "txtCodeCategoryPageID").val($(LastSelectedRow).attr("ID"));
            $("#" + MasterObj + 'txtSubmit').val("Delete")
            $("#" + MasterObj + 'BtnSubmit').click()
        }
    }
    else
        alert('به منظور حذف یک سطر را انتخاب کنید')
}
//////////////////////////////////////CreateCategory///////////////////////////
function OnClickBtnCodeCategory() {
    var strUrl = "CodeCategory.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 700px;center: Yes;help: no;status: no")
    if (returnValue == "1")
        OnClickBtnFilter();
} //////////////////////////////////////CodeGroup//////////////////////////////
function OnClickBtnCategoryPage() {
    var strUrl = "DifinitionGroupCode.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:400px;dialogWidth: 700px;center: Yes;help: no;status: no")
    if (returnValue == "1")
        OnClickBtnFilter();
}
/////////////////////////////////////////////GroupCategory///////////////////////////
function OnClickBtnCodeGroupCategory() {
    var strUrl = "CodeGroupCategory.aspx?SessionID=" + $("#" + MasterObj + "txtSessionID").val() + "&CompanyFinatialPeriodID=" + $("#" + MasterObj + "txtGetCompanyFinatialPeriodID").val()
    var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight:300px;dialogWidth: 700px;center: Yes;help: no;status: no")
    if (returnValue == "1")
        OnClickBtnFilter();
}