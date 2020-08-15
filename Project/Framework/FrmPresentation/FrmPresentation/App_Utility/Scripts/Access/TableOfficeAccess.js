var MasterObj = "ctl00_ContentPlaceHolder1_";
var LastSelectedRow = null;
var LastSelectedRowClass = "";
document.body.scroll = "no";
var str1 = ""
//=====================================================================================================
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler)

//====================================================================================================
function EndRequestHandler(sender, args) {
    LastSelectedRow = ""
    LastSelectedRowClass = "";
}

//===============================================Paging================================================
function OnBlurtxtCurPage(obj) {
    if (obj.value != 0 && obj.value.replace(" ", "") != "") {
        document.getElementById(MasterObj + "txtCurPage").value = obj.value
        $("#" + MasterObj + "txtSubmit").val("Const")
        $("#" + MasterObj + "BtnSubmit").click()
    }
}
//--------------------------------------------------------------------------------------------
function OnClickBtnNext() {
    $("#" + MasterObj + "txtSubmit").val("BtnNext")
    $("#" + MasterObj + "BtnSubmit").click()

}
//--------------------------------------------------------------------------------------------
function OnClickBtnLast() {
    $("#" + MasterObj + "txtSubmit").val("BtnLast")
    $("#" + MasterObj + "BtnSubmit").click()
}
//--------------------------------------------------------------------------------------------
function OnClickBtnPrv() {
    $("#" + MasterObj + "txtSubmit").val("BtnPrev")
    $("#" + MasterObj + "BtnSubmit").click()
}
//===============================================================================================
function OnClickBtnFirst() {
    $("#" + MasterObj + "txtSubmit").val("BtnFirst")
    $("#" + MasterObj + "BtnSubmit").click()
}
//===============================================================================================
function OnClickBtnFilter() {
    $get(MasterObj + "txtPersonID").value = $get(MasterObj + "CmbPerson_txtCode").value
    $get(MasterObj + "txtSubmit").value = "Filter";
    $get(MasterObj + "BtnSubmit").click();
}
//=================================================نمایش همه ==============================================
function OnClickBtnShowAll() {
    $get(MasterObj + "CmbPerson_txtPCode").value = ""
    $get(MasterObj + "CmbPerson_txtCode").value = ""
    $get(MasterObj + "CmbPerson_txtName").value = ""
    OnClickBtnFilter()
}
//===============================================================================================
function OnClickGrd(SelectedRow) {
    if (LastSelectedRow != null) {
        $(LastSelectedRow).attr('className', LastSelectedRowClass);
    }
    LastSelectedRowClass = $(SelectedRow).attr('className');
    LastSelectedRow = SelectedRow;
    $(SelectedRow).attr('className', 'CssSelectedItemStyle');
}
//=======================================================ویرایش ========================================  
function OnClickBtnEdit() {

    if (LastSelectedRow == "" || LastSelectedRow == null)
        alert("به منظور اصلاح دسترسیها یک سطر را انتخاب کنید")
    else {
        var strUrl = "EditTableOfficeAccess.aspx?ID= " + $(LastSelectedRow).find("td:eq(" + 0 + ")").text()
                   + "&SessionID=" + $get(MasterObj + "txtSessionID").value
                   + "&txtGetCompanyFinatialPeriodID=" + $get(MasterObj + "txtGetCompanyFinatialPeriodID").value;
        var returnValue = window.showModalDialog(encodeURI(strUrl), window, "dialogHeight: 600px;dialogWidth: 1000px;center: Yes;help: no;status: no;resizable:1")
         
        //        if (returnValue == "1") {
        //            $("#" + MasterObj + "txtSubmit").val("Const")
        //            $("#" + MasterObj + "BtnSubmit").click()
        //        }
    }
}

//======================================================دابل کلیک =========================================
function OndbClickGrd() {
    OnClickBtnEdit()
}